Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26D6C982DE
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4959.1789710436205211084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OgfpZmiY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gWlVXQRG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0b30e0355-dd1e2c5c-21dd-4d70-8b8c-504de66be98f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789710435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dpvty/mT4uOGDmM+4UvZhdo3AxSNpEQuLR6im59Tgj0=;
	b=OgfpZmiYyveYggdLUHYQaCGfaA+VvBj409d03SgZ5GpnxxJ8rgtlil4MUL5be7Qv
	uSJv9H6TRvk4K2OUe64ftl3WlQN5CiBPUN2GtckTLAMM22ils5oWcQY6Id6inVoDTaJ
	kzp0C56EKmG3yoPhMYQh83LThfSO39sAAiPJyAR4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789710435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dpvty/mT4uOGDmM+4UvZhdo3AxSNpEQuLR6im59Tgj0=;
	b=gWlVXQRGVDKmeCaYRa4BZtNT0Gwy6PC4h58bi+F4stIYG8vRbRM1tPllp/Z2FMX9
	SVNQtDdT0neEGtuk46ryRtQV3IzxIEB1KjUF/+aHKDacZbIaTJvLyLZIpO9LTpxTI68
	2WKNQcyT9sSLQBlK5+kNkFCAdfJn8JPmk/gfnWBA=
Content-Type: multipart/mixed; boundary="===============4308458457084645814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.16 SUCCEEDED
Message-ID: <010101a0b30e0355-dd1e2c5c-21dd-4d70-8b8c-504de66be98f-000000@us-west-2.amazonses.com>
Date: Fri, 18 Sep 2026 05:47:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246185

--===============4308458457084645814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.13-0.12.16.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c332ffdeeb066a88b3d055b15c54cad502a4031c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 18 Sep 2026 05:35:54 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.13 -> 0.12.16

---
 .../python/python3-uv-build-crates.inc        | 66 +++++++------------
 ...0.12.13.bb => python3-uv-build_0.12.16.bb} |  2 +-
 2 files changed, 25 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.13.bb => python3-uv-build_0.12.16.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 02e8f9a8ab..486d993c32 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -4,7 +4,6 @@
 SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/aho-corasick/1.1.4 \
-    crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/ambient-authority/0.0.2 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
@@ -43,7 +42,6 @@ SRC_URI += " \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.4 \
-    crate://crates.io/const-oid/0.10.2 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
     crate://crates.io/crc32fast/1.5.0 \
@@ -78,21 +76,19 @@ SRC_URI += " \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
     crate://crates.io/fs-set-times/0.20.3 \
-    crate://crates.io/futures/0.3.33 \
-    crate://crates.io/futures-channel/0.3.33 \
-    crate://crates.io/futures-core/0.3.33 \
-    crate://crates.io/futures-executor/0.3.33 \
-    crate://crates.io/futures-io/0.3.33 \
+    crate://crates.io/futures/0.3.34 \
+    crate://crates.io/futures-channel/0.3.34 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-executor/0.3.34 \
+    crate://crates.io/futures-io/0.3.34 \
     crate://crates.io/futures-lite/2.6.1 \
-    crate://crates.io/futures-macro/0.3.33 \
-    crate://crates.io/futures-sink/0.3.33 \
-    crate://crates.io/futures-task/0.3.33 \
-    crate://crates.io/futures-util/0.3.33 \
+    crate://crates.io/futures-macro/0.3.34 \
+    crate://crates.io/futures-sink/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.20 \
-    crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
@@ -167,7 +163,6 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
-    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -209,6 +204,7 @@ SRC_URI += " \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
+    crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
@@ -222,8 +218,8 @@ SRC_URI += " \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
-    crate://crates.io/thiserror/2.0.19 \
-    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
@@ -231,7 +227,6 @@ SRC_URI += " \
     crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
-    crate://crates.io/tokio-util/0.7.19 \
     crate://crates.io/toml/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
@@ -248,7 +243,6 @@ SRC_URI += " \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
@@ -260,7 +254,6 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -301,9 +294,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/winx/0.36.4 \
-    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
-    crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
     crate://crates.io/zerocopy/0.8.56 \
@@ -322,7 +313,6 @@ SRC_URI += " \
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
-SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[ambient-authority-0.0.2.sha256sum] = "e9d4ee0d472d1cd2e28c97dfa124b3d8d992e10eb0a035f33f5d12e3a177ba3b"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
@@ -361,7 +351,6 @@ SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba9
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
-SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
@@ -396,21 +385,19 @@ SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac1917768
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
 SRC_URI[fs-set-times-0.20.3.sha256sum] = "94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a"
-SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
-SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
-SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
-SRC_URI[futures-executor-0.3.33.sha256sum] = "6754879cc9f2c66f88c6e5c35344bb0bdb0708b0352b1201815667c7eabc7458"
-SRC_URI[futures-io-0.3.33.sha256sum] = "4577ecaa3c4f96589d473f679a71b596316f6641bc350038b962a5daf0085d7a"
+SRC_URI[futures-0.3.34.sha256sum] = "9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3"
+SRC_URI[futures-channel-0.3.34.sha256sum] = "b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-executor-0.3.34.sha256sum] = "031b47cf1a3c6cc8bc2fc76cd437f521619387907d469316e7c0bc278f1f5432"
+SRC_URI[futures-io-0.3.34.sha256sum] = "53c0fa8157de1303bfffdaa1cc2a673bfffb60102f76b0ef4441659124373fed"
 SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
-SRC_URI[futures-macro-0.3.33.sha256sum] = "2d6d3cde68c518367be28956066ddfef33813991b77a55005a69dae04bf3b10b"
-SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8ca209b4510f7f94242c647e307"
-SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
-SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
+SRC_URI[futures-macro-0.3.34.sha256sum] = "9fb9654ba8355388abeb8dcb4fc62f511300867002afc858860463bdd9fe0c44"
+SRC_URI[futures-sink-0.3.34.sha256sum] = "1944426bf7d03f1d14f708785e4b33efd750b36d48a157b836b3efc15ede8e1d"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
-SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
@@ -485,7 +472,6 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -527,6 +513,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
+SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
@@ -540,8 +527,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab2
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
-SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
-SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
@@ -549,7 +536,6 @@ SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df
 SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
-SRC_URI[tokio-util-0.7.19.sha256sum] = "494815d09bf52b5548659851081238f0ca39ff638363907596da739561c62c52"
 SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] = "6975367e4d2ef766d86af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
@@ -566,7 +552,6 @@ SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc2
 SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
@@ -578,7 +563,6 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -619,9 +603,7 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
-SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
-SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
 SRC_URI[zerocopy-0.8.56.sha256sum] = "556764e583adb45a9f8d413c2a147fa7e8d821e48e12b14fd560b607998b75eb"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.16.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.16.bb
index 51e85d5a85..fe44b96435 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.16.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "46936ab24c8674be28df2784a9ca2878478a84a98e6ce3df5cb976102e99b8f1"
+SRC_URI[sha256sum] = "32ca6fb8d5223c51c72bb09d6f52b6730406ded06ad17711ea2fef8bff260c62"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============4308458457084645814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.16.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.16.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.16.dist-info

--===============4308458457084645814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.13.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate:
 //crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crat
 es.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://c
 rates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.
 48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4
 .7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1
  crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/se
 rde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.
 16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/
 1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-
 link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.
 53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.16.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/an
 style/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-
 if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io
 /enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.1
 7.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserv
 er/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crate
 s.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate:/
 /crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate:
 //crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-
 1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wa
 sm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/wind
 ows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate:/
 /crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4495657 to 4474081 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.13" to "0.12.16"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.16.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.16.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.13 [default] to 0.12.16 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.16.dist-info

--===============4308458457084645814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.13-0.12.16.patch"

RnJvbSBjMzMyZmZkZWViMDY2YTg4YjNkMDU1YjE1YzU0Y2FkNTAyYTQwMzFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTggU2VwIDIwMjYgMDU6MzU6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMTMgLT4gMC4xMi4xNgoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA2NiArKysrKysrLS0tLS0t
LS0tLS0tCiAuLi4wLjEyLjEzLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMi4xNi5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTIuMTMuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjE2LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggMDJlOGY5YThhYi4uNDg2ZDk5M2MzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTQsNyArNCw2IEBACiBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FkbGVy
Mi8yLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYWhvLWNvcmFzaWNrLzEuMS40IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9hbGxvY2F0b3ItYXBpMi8wLjIuMjEgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2FtYmllbnQtYXV0aG9yaXR5LzAuMC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9hbnN0cmVhbS8xLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS8xLjAuMTQg
XApAQCAtNDMsNyArNDIsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NsYXBfbGV4LzEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb2xvcmNob2ljZS8xLjAu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29uc29sZS8wLjE2LjQgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NvbnN0LW9pZC8wLjEwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NwdWZl
YXR1cmVzLzAuMi4xNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3B1ZmVhdHVyZXMvMC4zLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyYzMyZmFzdC8xLjUuMCBcCkBAIC03OCwyMSArNzYs
MTkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mb3JtX3VybGVuY29k
ZWQvMS4yLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZzLWVyci8zLjMuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZnMtc2V0LXRpbWVzLzAuMjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZnV0dXJlcy8wLjMuMzMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtY2hhbm5l
bC8wLjMuMzMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtY29yZS8wLjMuMzMgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtZXhlY3V0b3IvMC4zLjMzIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9mdXR1cmVzLWlvLzAuMy4zMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZnV0dXJlcy8wLjMuMzQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtY2hhbm5lbC8w
LjMuMzQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtY29yZS8wLjMuMzQgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtZXhlY3V0b3IvMC4zLjM0IFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9mdXR1cmVzLWlvLzAuMy4zNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0
dXJlcy1saXRlLzIuNi4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLW1hY3JvLzAu
My4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1zaW5rLzAuMy4zMyBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy10YXNrLzAuMy4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZnV0dXJlcy11dGlsLzAuMy4zMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJl
cy1tYWNyby8wLjMuMzQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtc2luay8wLjMu
MzQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdGFzay8wLjMuMzQgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdXRpbC8wLjMuMzQgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2dlbmVyaWMtYXJyYXkvMC4xNC43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9nZXRyYW5k
b20vMC4zLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjQuMyBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvYnNldC8wLjQuMjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2dsb28tdGltZXJzLzAuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oYXNoYnJvd24vMC4x
NS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oYXNoYnJvd24vMC4xNy4xIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKQEAgLTE2Nyw3ICsxNjMsNiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B0cl9tZXRhX2Rlcml2ZS8wLjMuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjQ3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9x
dW90ZWRfcHJpbnRhYmxlLzAuNS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS81LjMu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vci1lZmkvNi4wLjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3JhbmNvci8wLjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2Fs
bC8wLjUuMTUgXApAQCAtMjA5LDYgKzIwNCw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc2xhYi8wLjQuMTIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVj
LzEuMTUuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hd2svMC4zLjIgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NvY2tldDIvMC42LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgv
MC4xMy41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFibGVfZGVyZWZfdHJhaXQvMS4yLjEg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0cmlwLWFuc2ktZXNjYXBlcy8wLjIuMSBcCkBAIC0y
MjIsOCArMjE4LDggQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZW1w
ZmlsZS8zLjI3LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rlcm1pbmFsX3NpemUvMC40LjQg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RleHR3cmFwLzAuMTYuMiBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGhpc2Vycm9yLzIuMC4xOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vy
cm9yLWltcGwvMi4wLjE5IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3IvMi4wLjIw
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3ItaW1wbC8yLjAuMjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3RocmVhZF9sb2NhbC8xLjEuOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdGlueXN0ci8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXZlYy8xLjExLjAg
XApAQCAtMjMxLDcgKzIyNyw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdG9raW8vMS41My4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby1tYWNyb3MvMi43
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLXN0cmVhbS8wLjEuMTkgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3Rva2lvLXV0aWwvMC43LjE5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by90b21sLzEuMS4zK3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZGF0
ZXRpbWUvMS4xLjErc3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9lZGl0
LzAuMjUuMTMrc3BlYy0xLjEuMCBcCkBAIC0yNDgsNyArMjQzLDYgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90eXBlbnVtLzEuMjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdWNkLXRyaWUvMC4xLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRl
bnQvMS4wLjI0IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWxpbmVicmVhay8wLjEu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS13aWR0aC8wLjIuMiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdW5zY2FubnkvMC4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Vy
bC8yLjUuOCBcCkBAIC0yNjAsNyArMjU0LDYgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby92dGUvMC4xNC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWxrZGlyLzIu
NS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpLzAuMTEuMSt3YXNpLXNuYXBzaG90LXBy
ZXZpZXcxIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpcDIvMS4wLjQrd2FzaS0wLjIuMTIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi8wLjIuMTE0IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4tbWFjcm8vMC4yLjExNCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1hY3JvLXN1cHBvcnQvMC4yLjExNCBcCkBAIC0zMDEsOSAr
Mjk0LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4
Nl82NF9tc3ZjLzAuNTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lubm93LzEuMC4zIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW54LzAuMzYuNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2l0LWJpbmRnZW4vMC41Ny4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUv
MC42LjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3hhdHRyLzEuNi4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby95b2tlLzAuOC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLWRlcml2
ZS8wLjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2NvcHkvMC44LjU2IFwKQEAgLTMy
Miw3ICszMTMsNiBAQCBTUkNfVVJJICs9ICIgXAogCiBTUkNfVVJJW2FkbGVyMi0yLjAuMS5zaGEy
NTZzdW1dID0gIjMyMDExOTU3OWZjYWQ5YzIxODg0ZjVjNDg2MWQxNjE3NGQwZTA2MjUwNjI1MjY2
ZjUwZmU2ODk4MzQwYWJlZmEiCiBTUkNfVVJJW2Foby1jb3Jhc2ljay0xLjEuNC5zaGEyNTZzdW1d
ID0gImRkZDMxYTEzMDQyN2MyNzUxOGRmMjY2OTQzYTUzMDhlZDkyZDRiMjI2Y2M2MzlmNWE4ZjEw
MDI4MTYxNzQzMDEiCi1TUkNfVVJJW2FsbG9jYXRvci1hcGkyLTAuMi4yMS5zaGEyNTZzdW1dID0g
IjY4M2Q3OTEwZTc0MzUxOGIwZTM0ZjExODZmOTI0OTRiZWNhY2IwNDdjN2I2YmY2MTZjOTY3NzIx
ODBmZWY5MjMiCiBTUkNfVVJJW2FtYmllbnQtYXV0aG9yaXR5LTAuMC4yLnNoYTI1NnN1bV0gPSAi
ZTlkNGVlMGQ0NzJkMWNkMmUyOGM5N2RmYTEyNGIzZDhkOTkyZTEwZWIwYTAzNWYzM2Y1ZDEyZTNh
MTc3YmEzYiIKIFNSQ19VUklbYW5zdHJlYW0tMS4wLjAuc2hhMjU2c3VtXSA9ICI4MjRhMjEyZmFm
OTZlOWFjYWNkYmQwOWZlYmQzNDQzOGY4ZjcxMWZiODRlMDlhODkxNjAxM2NkNzgxNWNhMjhkIgog
U1JDX1VSSVthbnN0eWxlLTEuMC4xNC5zaGEyNTZzdW1dID0gIjk0MGIzYTBjYTYwM2QxZWFkZTUw
YTQ4NDZhMmFmZmZkNWVmNTdhOWZlYWMyYzBlMmVjMmUxNGY5ZWFkNzYwMDAiCkBAIC0zNjEsNyAr
MzUxLDYgQEAgU1JDX1VSSVtjbGFwX2Rlcml2ZS00LjYuNC5zaGEyNTZzdW1dID0gImQwMTJkMmI5
ZDY1YWNhN2YxOGY0ZDk4NzhhMDQ1YmMxNzg5OWJiYTkKIFNSQ19VUklbY2xhcF9sZXgtMS4xLjAu
c2hhMjU2c3VtXSA9ICJjOGQ0YTNiYjhiMWUwYzEwNTA0OTlkMTgxNWY1YWIxNmQwNGYwOTU5YjIz
MzA4NWZiMzE2NTNmYmZjOWQ5OGY5IgogU1JDX1VSSVtjb2xvcmNob2ljZS0xLjAuNS5zaGEyNTZz
dW1dID0gIjFkMDc1NTBjOTAzNmJmMmFlMGM2ODRjNDI5N2Q1MDNmODM4Mjg3YzgzYzUzNjg2ZDA1
MzcwZDBlMTM5YWU1NzAiCiBTUkNfVVJJW2NvbnNvbGUtMC4xNi40LnNoYTI1NnN1bV0gPSAiNGZl
NWY0NjVhNGY2ZmVlODhmYWQ0MWI4NWQ5OTBmODRjODM1MzM1ZTg1YjVkOWU2ZTYzZTBkMDZkMjhj
YmE3YyIKLVNSQ19VUklbY29uc3Qtb2lkLTAuMTAuMi5zaGEyNTZzdW1dID0gImE2ZWY1MTdmMDky
NmRkMjRhMTU4MjQ5MmM3OTFiNmE0ODE4YTRkOTRlNzg5YTMzNDg5NGFhMTViMGQxMmY1NWMiCiBT
UkNfVVJJW2NwdWZlYXR1cmVzLTAuMi4xNy5zaGEyNTZzdW1dID0gIjU5ZWQ1ODM4ZWViYjI2YTJi
YjJlNThmNmQ1YjUzMTY5ODlhZTlkMDhiYWIxMGUwZTZkMTAzZTY1NmQxYjAyODAiCiBTUkNfVVJJ
W2NwdWZlYXR1cmVzLTAuMy4wLnNoYTI1NnN1bV0gPSAiOGIyYTQxMzkzZjY2ZjE2YjA4MjNiYjc5
MDk0ZDU0YWM1ZmJkMzRhYjI5MmRkYWZiOWEwNDU2YWM5Zjg3ZDIwMSIKIFNSQ19VUklbY3JjMzJm
YXN0LTEuNS4wLnNoYTI1NnN1bV0gPSAiOTQ4MWMxYzkwY2JmMmFjOTUzZjA3YzhkNGE1OGFhMzk0
NWM0MjViNzE4NWM5MTU0ZDY3YTY1ZTQyMzBkYTUxMSIKQEAgLTM5NiwyMSArMzg1LDE5IEBAIFNS
Q19VUklbZm9sZGhhc2gtMC4yLjAuc2hhMjU2c3VtXSA9ICI3N2NlMjRjYjU4MjI4ZmJiOGFhMDQx
NDI1YmIxMDUwODUwYWMxOTE3NzY4CiBTUkNfVVJJW2Zvcm1fdXJsZW5jb2RlZC0xLjIuMi5zaGEy
NTZzdW1dID0gImNiNGNiMjQ1MDM4NTE2ZjVmODUyNzc4NzVjZGFhNGY3ZDJjOWEwZmEwNDY4ZGUw
NmVkMTkwMTYzYjE1ODFmY2YiCiBTUkNfVVJJW2ZzLWVyci0zLjMuMS5zaGEyNTZzdW1dID0gImI5
MWFhNDQ4Y2E1MGQ3ZTc5NDMzYmRmM2VlOGQ5OTIxNTQzMGQyZWMwMmFkZTVhZWZhYjJhMDczYTE4
MjJlOGEiCiBTUkNfVVJJW2ZzLXNldC10aW1lcy0wLjIwLjMuc2hhMjU2c3VtXSA9ICI5NGU3MDk5
ZjYzMTNlY2FjYmUxMjU2ZThmZjlkNjE3Yjc1ZDFiY2IxNmE2ZmRkZWY5NDg2NmQyMjVhMDFhMTRh
IgotU1JDX1VSSVtmdXR1cmVzLTAuMy4zMy5zaGEyNTZzdW1dID0gImE4OGNmMWY4MjlkOTQ1ZjU0
OGNmOGZlYzMyYzYxYjFmMjAyYjZkOTNiNDU4NDg2MDJmYzAyYWY0YjEyYWQyMTgiCi1TUkNfVVJJ
W2Z1dHVyZXMtY2hhbm5lbC0wLjMuMzMuc2hhMjU2c3VtXSA9ICIyNjI1OTBmNGZlNmFmZWIwYmM4
M2JlMWRhYTY0ZTUyNjU3ZmUxODU2OTBhOTU4YWY3ZjNhZDBlOTIwODVjNWFlIgotU1JDX1VSSVtm
dXR1cmVzLWNvcmUtMC4zLjMzLnNoYTI1NnN1bV0gPSAiMmNkNTBjNDczYzgwZjZkN2MzNjcwYTc1
MjM1NGI4ZTU2OWIxYTdjYmZkYzA0MTllYzg4ZTVlZGFkODVlMGRjNyIKLVNSQ19VUklbZnV0dXJl
cy1leGVjdXRvci0wLjMuMzMuc2hhMjU2c3VtXSA9ICI2NzU0ODc5Y2M5ZjJjNjZmODhjNmU1YzM1
MzQ0YmIwYmRiMDcwOGIwMzUyYjEyMDE4MTU2NjdjN2VhYmM3NDU4IgotU1JDX1VSSVtmdXR1cmVz
LWlvLTAuMy4zMy5zaGEyNTZzdW1dID0gIjQ1NzdlY2FhM2M0Zjk2NTg5ZDQ3M2Y2NzlhNzFiNTk2
MzE2ZjY2NDFiYzM1MDAzOGI5NjJhNWRhZjAwODVkN2EiCitTUkNfVVJJW2Z1dHVyZXMtMC4zLjM0
LnNoYTI1NnN1bV0gPSAiOWEzMWQyYTNmYmFhZWIyYWYyMzY4YmJkZDkwNGFhOGU4MTJkM2MwNGEx
ZWUxMGQzMTcxZjUyZDU1NmU1ZDBhMyIKK1NSQ19VUklbZnV0dXJlcy1jaGFubmVsLTAuMy4zNC5z
aGEyNTZzdW1dID0gImIxZjllM2Q2OWQzOWU0ODYyZmZlZDAzZWQwNzFhNzZmOWExM2JhMWQ5MTA5
ZDM1NWIwZjBhYTZiMTVlMzkzYzQiCitTUkNfVVJJW2Z1dHVyZXMtY29yZS0wLjMuMzQuc2hhMjU2
c3VtXSA9ICI5MmQ2OTllNTIyMjQyZTY5ZTMwMDNiOTRlY2MxZjk2MGYzYTVlMDE1YWE3YzVkNzQ4
NmU2NWFkMDFkZDk0ZjVlIgorU1JDX1VSSVtmdXR1cmVzLWV4ZWN1dG9yLTAuMy4zNC5zaGEyNTZz
dW1dID0gIjAzMWI0N2NmMWEzYzZjYzhiYzJmYzc2Y2Q0MzdmNTIxNjE5Mzg3OTA3ZDQ2OTMxNmU3
YzBiYzI3OGYxZjU0MzIiCitTUkNfVVJJW2Z1dHVyZXMtaW8tMC4zLjM0LnNoYTI1NnN1bV0gPSAi
NTNjMGZhODE1N2RlMTMwM2JmZmZkYWExY2MyYTY3M2JmZmZiNjAxMDJmNzZiMGVmNDQ0MTY1OTEy
NDM3M2ZlZCIKIFNSQ19VUklbZnV0dXJlcy1saXRlLTIuNi4xLnNoYTI1NnN1bV0gPSAiZjc4ZTEw
NjA5ZmUwZTBiM2Y0MTU3ZmZhYjE4NzYzMTliNWIwZGIxMDJhMmM2MGRjNDYyNjMwNmRjNDZiNDRh
ZCIKLVNSQ19VUklbZnV0dXJlcy1tYWNyby0wLjMuMzMuc2hhMjU2c3VtXSA9ICIyZDZkM2NkZTY4
YzUxODM2N2JlMjg5NTYwNjZkZGZlZjMzODEzOTkxYjc3YTU1MDA1YTY5ZGFlMDRiZjNiMTBiIgot
U1JDX1VSSVtmdXR1cmVzLXNpbmstMC4zLjMzLnNoYTI1NnN1bV0gPSAiZTM0NDE4YWM0OTlkNjMw
NWMyZmI1YWQwZWQyZjZhYzk5OGM1ZjhjYTIwOWI0NTEwZjdmOTQyNDJjNjQ3ZTMwNyIKLVNSQ19V
UklbZnV0dXJlcy10YXNrLTAuMy4zMy5zaGEyNTZzdW1dID0gImIyMzFlZDI4ODMxZWZiNGE2MWEw
ODU4MGM0YmMyMzNlYzU2YmMwMDlmNGNkOGY1MmRhMmMzY2I5N2RmMGMxMDkiCi1TUkNfVVJJW2Z1
dHVyZXMtdXRpbC0wLjMuMzMuc2hhMjU2c3VtXSA9ICJhNzdhOTBhMjU2ZmNlMzRkYTY2NDE1Mjcx
ZTMwZjk0ZWU5MWM1N2IwNGI4YTJjMDQyZDljZjMyMjAxNzlkZWFhIgorU1JDX1VSSVtmdXR1cmVz
LW1hY3JvLTAuMy4zNC5zaGEyNTZzdW1dID0gIjlmYjk2NTRiYTgzNTUzODhhYmViOGRjYjRmYzYy
ZjUxMTMwMDg2NzAwMmFmYzg1ODg2MDQ2M2JkZDlmZTBjNDQiCitTUkNfVVJJW2Z1dHVyZXMtc2lu
ay0wLjMuMzQuc2hhMjU2c3VtXSA9ICIxOTQ0NDI2YmY3ZDAzZjFkMTRmNzA4Nzg1ZTRiMzNlZmQ3
NTBiMzZkNDhhMTU3YjgzNmIzZWZjMTVlZGU4ZTFkIgorU1JDX1VSSVtmdXR1cmVzLXRhc2stMC4z
LjM0LnNoYTI1NnN1bV0gPSAiY2Q0MTdkZTNkMWQwMTVmYzNiZmQyYjFlYTQ2ZGZjN2JhYjcyZWY4
NmYxY2M3Y2M5Yzc4ZTcyOGIzNGE2ZDFmZCIKK1NSQ19VUklbZnV0dXJlcy11dGlsLTAuMy4zNC5z
aGEyNTZzdW1dID0gIjBkNTBhOTI0NjdmOGJhNWRkNmUzZWU1ZDRiZDA0ZDczYWIyZTRlMWM0NDQ3
NGEwNjc0ODIxZGZjZTE0Yjc5YmMiCiBTUkNfVVJJW2dlbmVyaWMtYXJyYXktMC4xNC43LnNoYTI1
NnN1bV0gPSAiODU2NDljYTUxZmQ3MjI3MmQ3ODIxYWRhZjI3NGFkOTFjMjg4Mjc3NzEzZDljMTg4
MjBkODQ5OWE3ZmY2OWU5YSIKLVNSQ19VUklbZ2V0cmFuZG9tLTAuMy40LnNoYTI1NnN1bV0gPSAi
ODk5ZGVmNWMzN2M0ZmQ3YjI2NjQ2NDhjMjgxMjBlY2VjMTM4ZTRkMzk1YjQ1OWU1Y2EzNGY5Y2Nl
MmRkNzdmZCIKIFNSQ19VUklbZ2V0cmFuZG9tLTAuNC4zLnNoYTI1NnN1bV0gPSAiMzAwZTg4M2Q3
NTZiMmU0ZWM5NGUwMjc5MWYzOWIwNGI1MjIyNzYxMzg4NTJjZmM0MWQ5ZmI3ZTkwNDEwNjA5OSIK
IFNSQ19VUklbZ2xvYnNldC0wLjQuMjAuc2hhMjU2c3VtXSA9ICIwN2MzNGE5NDEwNDY1YjQ1YmQ5
Nzg3NDQzYmM3MzcwZjM3NzM1YmFkMDRiMGYwY2Q1N2ZmMWEzMTg2Yzk4OTg4IgotU1JDX1VSSVtn
bG9vLXRpbWVycy0wLjMuMC5zaGEyNTZzdW1dID0gImJiYjE0M2NmOTYwOTk4MDIwMzNlMGQ0ZjQ5
NjNiMTlmZDJlMGI3MjhiY2YwNzZjZDljZjdmNjYzNGYwOTI5OTQiCiBTUkNfVVJJW2hhc2hicm93
bi0wLjE1LjUuc2hhMjU2c3VtXSA9ICI5MjI5Y2ZlNTNkZmQ2OWYwNjA5YTQ5ZjY1NDYxYmQ5MzAw
MWVhMWVmODg5Y2Q1NTI5ZGQxNzY1OTNmNTMzOGExIgogU1JDX1VSSVtoYXNoYnJvd24tMC4xNy4x
LnNoYTI1NnN1bV0gPSAiZWQ1OTA5YjZlODlhMmRiNDQ1NmU1NGNkNWY2NzM3OTFkN2VjYTY3MzIy
MDJiYmYyYTljYzUwNGZlMmY5Yjg0YSIKIFNSQ19VUklbaGVjay0wLjUuMC5zaGEyNTZzdW1dID0g
IjIzMDRlMDA5ODNmODdmZmIzOGI1NWI0NDRiNWUzYjYwYTg4NGI1ZDMwYzBmY2E3ZDgyZmUzMzQ0
OWJiZTU1ZWEiCkBAIC00ODUsNyArNDcyLDYgQEAgU1JDX1VSSVtwdHJfbWV0YS0wLjMuMS5zaGEy
NTZzdW1dID0gIjBiOWEwY2Y5NWExMTk2YWY2MWQ0ZjFjYmRhYjk2NzE3OTUxNmQ5YTRhNDMKIFNS
Q19VUklbcHRyX21ldGFfZGVyaXZlLTAuMy4xLnNoYTI1NnN1bV0gPSAiNzM0Nzg2N2QwYTdlMTIw
OGQ5M2I0Njc2N2JlODNlMmI4Zjk3OGMzZGFkMzVmNzc1YWM4ZDg4NDc1NTFkNmZlMSIKIFNSQ19V
UklbcXVvdGUtMS4wLjQ3LnNoYTI1NnN1bV0gPSAiMWZiZjRkYjE0MmE0NzNhOGQ4MGMyNmJiZjE4
NDU0ZWQ0NThiZjhkMjZjODIxOWMzMzFkYWVjZmRiZDA3OTAwMSIKIFNSQ19VUklbcXVvdGVkX3By
aW50YWJsZS0wLjUuMS5zaGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1YWVlZjUzNzUxNDRj
MjYwNjJlMGRjZDU5MzlkZmNiYjBmNWRiNzZjYjhjMTdjNzMiCi1TUkNfVVJJW3ItZWZpLTUuMy4w
LnNoYTI1NnN1bV0gPSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4
Mzg0N2JkZmZkYmQ3ZjM0Njc1NGIwZiIKIFNSQ19VUklbci1lZmktNi4wLjAuc2hhMjU2c3VtXSA9
ICJmOGRjYzljN2Q1MmE4MTE2OTdkMjE1MWM3MDFlMGQwODk1NmY5MmIwZTI0MTM2Y2Y0Y2YyN2I1
N2E2YTBkOWJmIgogU1JDX1VSSVtyYW5jb3ItMC4xLjEuc2hhMjU2c3VtXSA9ICJhMDYzZWE3MjM4
MTUyN2MyYTA1NjFkYTljODAwMDBlZjgyMmJkZDdjMzI0MWIxY2MxYjEyMTAwZTNkZjA4MWVlIgog
U1JDX1VSSVtyZWRveF9zeXNjYWxsLTAuNS4xNS5zaGEyNTZzdW1dID0gIjdlOGFmMGRkZTA5NDAw
NjAxMWU2YTc0MGQ0ODc5MzE5NDM5NDg5ODEzYmQwYmNkYzdkODIxYmVhZWVmZjQ4ZWMiCkBAIC01
MjcsNiArNTEzLDcgQEAgU1JDX1VSSVtzaW1pbGFyLTIuNy4wLnNoYTI1NnN1bV0gPSAiYmJiYjVk
OTY1OTE0MTY0NmFlNjQ3YjQyZmUwOTRkYWY2YzYxOTJkMTYyMDgKIFNSQ19VUklbc2xhYi0wLjQu
MTIuc2hhMjU2c3VtXSA9ICIwYzc5MGRlMjMxMjRmOWFiNDQ1NDRkN2FjMDVkNjA0NDBhZGM1ODY0
NzljZTUwMWMxZDZkN2RhM2NkOGM5Y2Y1IgogU1JDX1VSSVtzbWFsbHZlYy0xLjE1LjIuc2hhMjU2
c3VtXSA9ICI4ZWQ2YTYzZjAyYzg1MzljOTFhODY4NWE4NmY0MDk5NjYxYmEzZGEwMTc5MzJmNmVi
YmVhNmRlM2YwZmE3YzkwIgogU1JDX1VSSVtzbWF3ay0wLjMuMi5zaGEyNTZzdW1dID0gImI3YzM4
OGMxYjVlOTM3NTZkMGM3NDA5NjVjNDFlODgyMmY4NjY2MjFkNDFhY2JkZjYzMzZhNmExNjhmODg0
MGMiCitTUkNfVVJJW3NvY2tldDItMC42LjMuc2hhMjU2c3VtXSA9ICIzYTc2NmUxMTEwNzg4YzM2
ZjRmYTFjMmI3MWIzODdhNzgxNWFhNjVmODhjZTAyMjk4NDE4MjY2MzNkOTM3MjNlIgogU1JDX1VS
SVtzcGR4LTAuMTMuNS5zaGEyNTZzdW1dID0gIjA4MTY3MGMyMzNkZmJlZDU1NjkwY2MwY2QzODQy
NGUwZTI0YWMxYjI2NzNkMGI0MDhiM2Y3YjY4NDczOGRmYTkiCiBTUkNfVVJJW3N0YWJsZV9kZXJl
Zl90cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFmOTFkZjcxYmZhMTJh
ZDM3ZDdhZjEwOTJhZTczNmYzYTZjZDBlMzdiYzc4MTA1OTYiCiBTUkNfVVJJW3N0cmlwLWFuc2kt
ZXNjYXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4ZTdlNzk2OWFiYjNmMWI3YzJhODEx
MjI1ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUiCkBAIC01NDAsOCArNTI3LDggQEAg
U1JDX1VSSVt0ZW1wLWVudi0wLjMuNi5zaGEyNTZzdW1dID0gIjk2Mzc0ODU1MDY4ZjQ3NDAyYzMx
MjFjNmVlZDg4ZDI5Y2IxZGU4ZjNhYjIKIFNSQ19VUklbdGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1
bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2
ZjY5ZTliYzg1NzRiZCIKIFNSQ19VUklbdGVybWluYWxfc2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0g
IjIzMGExYjgyMWNjYmQ3NWIxODU4MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4
NzcxYTg4NzQiCiBTUkNfVVJJW3RleHR3cmFwLTAuMTYuMi5zaGEyNTZzdW1dID0gImMxMzU0NzYx
NWE0NGRjOWM0NTJhOGE1MzQ2MzhhY2RmMDcxMjBkNGI2ODQ3YzgxNzg3MDVkYTA2MzA2YTMwNTci
Ci1TUkNfVVJJW3RoaXNlcnJvci0yLjAuMTkuc2hhMjU2c3VtXSA9ICIwOWE0MzU5ODg0MGUzM2Q1
YjAzMzFmMzhjNWUzMGQxM2JiMTFjMTEyMTBhNGI1OGYwZDliMThhNWE1ZWVmY2Q5IgotU1JDX1VS
SVt0aGlzZXJyb3ItaW1wbC0yLjAuMTkuc2hhMjU2c3VtXSA9ICI0M2NiZmUwY2Y3NjEwNGQ0MmE1
NzQ4MDI4NDQxODdlODRhMzA1ZTUzMWVkNTQ0NTVmMTFmYmRlMGYxMDU0MWNkIgorU1JDX1VSSVt0
aGlzZXJyb3ItMi4wLjIwLnNoYTI1NnN1bV0gPSAiZWM4NjIzNWY1ZmNjMmE3MzY1MDMxMDc1NmQy
YWM1YjEzOGE1NzgwYmJiZGZhZTNlZWNjZWM5OTJjNDM1YmE0ZiIKK1NSQ19VUklbdGhpc2Vycm9y
LWltcGwtMi4wLjIwLnNoYTI1NnN1bV0gPSAiYmMwNGNkM2UxMjM2ZGQ0YTk4YWZjYTQ1NjlmMmRl
YjNmMTIwZTU0MjJhNDAyM2JlMmNiNjgzZjg0ODYyOTJhZiIKIFNSQ19VUklbdGhyZWFkX2xvY2Fs
LTEuMS45LnNoYTI1NnN1bV0gPSAiZjYwMjQ2YTQ5NDRmMjRmNmUwMThhYTE3Y2RlZmZiNzgxOGI3
NjM1Njk2NWQwM2IwN2Q2YTk4ODZlODk2MjE4NSIKIFNSQ19VUklbdGlueXN0ci0wLjguMi5zaGEy
NTZzdW1dID0gIjQyZDNlOWM0NWMwOWRlMTVkMDZkZDhhY2Y1ZjRlMGUzOTllODU5MjdiN2YwMDcx
MTAyNGViN2FlMTBmYTQ4NjkiCiBTUkNfVVJJW3Rpbnl2ZWMtMS4xMS4wLnNoYTI1NnN1bV0gPSAi
M2U2MWU2NzA1M2QyNWE0ZTgyYzg0NGU4NDI0MDM5ZDk3NDU3ODFiM2ZjNGYzMmI4ZDU1ZWQ1MGY1
ZjY2N2VmMyIKQEAgLTU0OSw3ICs1MzYsNiBAQCBTUkNfVVJJW3Rpbnl2ZWNfbWFjcm9zLTAuMS4x
LnNoYTI1NnN1bV0gPSAiMWYzY2NiYWMzMTFmZWEwNWY4NmY2MTkwNGI0NjJiNTVmYjNkZgogU1JD
X1VSSVt0b2tpby0xLjUzLjEuc2hhMjU2c3VtXSA9ICIyMDJjYWVhODcxYjY5NjY4MjUwZDI0MjA3
MDg0OWViNDk1YmUxNzhlZDY5N2EzZTk4YWViY2U1YmM4MWEwYmVkIgogU1JDX1VSSVt0b2tpby1t
YWNyb3MtMi43LjAuc2hhMjU2c3VtXSA9ICIzODVhNmNiNzFhYjlhYjc5MGM1ZmU4ZDY3ZjE2NDVl
NmM0NTBhN2NlMDA2YTMzZGUwM2RhYTk1NmNmNzBhNDk2IgogU1JDX1VSSVt0b2tpby1zdHJlYW0t
MC4xLjE5LnNoYTI1NnN1bV0gPSAiYTNkMDZmMGIwODJiYTU3YzI2Yjc5NDA3MzcyZTU3Y2YyYTFl
MjgxMjRmNzhlOTQ3OWZlODAzMjJjZjUzNDIwYiIKLVNSQ19VUklbdG9raW8tdXRpbC0wLjcuMTku
c2hhMjU2c3VtXSA9ICI0OTQ4MTVkMDliZjUyYjU1NDg2NTk4NTEwODEyMzhmMGNhMzlmZjYzODM2
MzkwNzU5NmRhNzM5NTYxYzYyYzUyIgogU1JDX1VSSVt0b21sLTEuMS4zK3NwZWMtMS4xLjAuc2hh
MjU2c3VtXSA9ICI1M2M5NmVjZGZhOTQxYzhmYzRmY2FlZDE0Zjk5YWRhOGViZWQ1MDJlZWY1MzMw
MTUwOTVhMDdlMzMwMWQ0YzNjIgogU1JDX1VSSVt0b21sX2RhdGV0aW1lLTEuMS4xK3NwZWMtMS4x
LjAuc2hhMjU2c3VtXSA9ICIzMTY1ZjY1ZjYyZTI4ZTAxMTVhMDBiMmViZGQzN2ViNmYzYjY0MTg1
NWY5ZDYzNmQzY2Q0MTAzNzY3MTU5YWQ3IgogU1JDX1VSSVt0b21sX2VkaXQtMC4yNS4xMytzcGVj
LTEuMS4wLnNoYTI1NnN1bV0gPSAiNjk3NTM2N2U0ZDJlZjc2NmQ4NmFmMDFmZmFkMTRiNjIyZmVj
YzhkNDM1N2E5OThmYmM0ZGViNmU5YmFjYWY5YiIKQEAgLTU2Niw3ICs1NTIsNiBAQCBTUkNfVVJJ
W3R5cGVpZC0xLjAuMy5zaGEyNTZzdW1dID0gImJjN2Q2MjMyNTg2MDIzMjBkNWM1NWQxYmMyMjc5
M2I1N2RhZmYwZWM3ZWZjMgogU1JDX1VSSVt0eXBlbnVtLTEuMjAuMS5zaGEyNTZzdW1dID0gImI2
ZjVlODcwYmU2YzNiMzcxYjc3ZmUwZWUwYmFmYjg1OWZhNDk2NGI0NDA0YzI3ZGUxZDM4MDA0M2M0
ZGRhMjAiCiBTUkNfVVJJW3VjZC10cmllLTAuMS43LnNoYTI1NnN1bV0gPSAiMjg5NmQ5NWMwMmE4
MGM2ZDZhNWQ2ZTk1M2Q0NzlmNWRkZjJkZmRiNmEyNDQ0NDEwMTBlMzczYWMwZmI4ODk3MSIKIFNS
Q19VUklbdW5pY29kZS1pZGVudC0xLjAuMjQuc2hhMjU2c3VtXSA9ICJlNmU0MzEzY2Q1ZmNkM2Rh
ZDVjYWZhMTc5NzAyZTJiMjQ0Zjc2MDk5MWY0NTM5N2QxNGQ0ZWJmMzgyNDdkYTc1IgotU1JDX1VS
SVt1bmljb2RlLWxpbmVicmVhay0wLjEuNS5zaGEyNTZzdW1dID0gIjNiMDljODNjM2MyOWQzNzUw
NmEzZTI2MGMwOGMwMzc0M2E2YmI2NmE5Y2Q0MzJjNjkzNGFiNTAxYTE5MDU3MWYiCiBTUkNfVVJJ
W3VuaWNvZGUtd2lkdGgtMC4yLjIuc2hhMjU2c3VtXSA9ICJiNGFjMDQ4ZDcxZWRlN2VlNzZkNTg1
NTE3YWRkNDVkYTUzMDY2MGVmNDM5MGU0OWIwOTg3MzNjNmU4OTdmMjU0IgogU1JDX1VSSVt1bnNj
YW5ueS0wLjEuMC5zaGEyNTZzdW1dID0gImU5ZGYyYWYwNjdhNzk1M2U5YzM4MzEzMjBmMzVjMWNj
MDYwMGMzMGQ0NGQ5ZjdhMTJiMDFkYjFjZDg4ZDZiNDciCiBTUkNfVVJJW3VybC0yLjUuOC5zaGEy
NTZzdW1dID0gImZmNjdhOGE0Mzk3MzczYzNlZjY2MDgxMmFjYWIzMjY4MjIyMDM1MDEwYWI4Njgw
ZWM0MjE1ZjM4YmEzZDBlZWQiCkBAIC01NzgsNyArNTYzLDYgQEAgU1JDX1VSSVt2ZXJzaW9uX2No
ZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQy
NmJkZDUKIFNSQ19VUklbdnRlLTAuMTQuMS5zaGEyNTZzdW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgz
MzBkOGUxN2U2MTAxMWEyYzI0NDEyNmFjYzBhOTgyZjQwNDBhYzNmOWYwYmMwNzciCiBTUkNfVVJJ
W3dhbGtkaXItMi41LjAuc2hhMjU2c3VtXSA9ICIyOTc5MDk0NjQwNGY5MWQ5YzVkMDZmOTg3NGVm
ZGRlYTFkYzA2YzVlZmU5NDU0MWE3ZDY4NjMxMDhlM2E1ZTRiIgogU1JDX1VSSVt3YXNpLTAuMTEu
MSt3YXNpLXNuYXBzaG90LXByZXZpZXcxLnNoYTI1NnN1bV0gPSAiY2NmM2VjNjUxYTg0N2ViMDFk
ZTczY2NhZDE1ZWI3ZDk5ZjgwNDg1ZGUwNDNlZmIyZjM3MGNkNjU0ZjRlYTQ0YiIKLVNSQ19VUklb
d2FzaXAyLTEuMC40K3dhc2ktMC4yLjEyLnNoYTI1NnN1bV0gPSAiYjY3ZWZiMzdlMTA2ZTU1Y2U3
MjJhNTEwZDZiNWY5YzE3ZjA4M2U1ZmM3OWFmYzJiYWRlYjEyY2MzMTNkOTQ4NyIKIFNSQ19VUklb
d2FzbS1iaW5kZ2VuLTAuMi4xMTQuc2hhMjU2c3VtXSA9ICI2NTMyZjlhNWMxZWNlMzc5OGNiMWMy
Y2ZkYmE2NDBiOWIzYmE4ODRmNWRiNDU5NzNhNmY0NDI1MTBhODdkMzhlIgogU1JDX1VSSVt3YXNt
LWJpbmRnZW4tbWFjcm8tMC4yLjExNC5zaGEyNTZzdW1dID0gIjE4YTJkNTBmY2YxMDVmYjMzYmIx
NWYwMGU3YTc3Yjc3Mjk0NWEyZWU0NWRjZjQ1NDk2MWZkODQzZTc0YzE4ZTYiCiBTUkNfVVJJW3dh
c20tYmluZGdlbi1tYWNyby1zdXBwb3J0LTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIwM2NlNGNhZWFh
YzU0N2NkZjcxM2QyODBlZGEyMmE3MzA4MjRkZDExZTZiOGMzY2E5ZTQyMjQ3YjI1YzYzMWUzIgpA
QCAtNjE5LDkgKzYwMyw3IEBAIFNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjUyLjYuc2hh
MjU2c3VtXSA9ICI1ODlmNmRhODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYxCiBTUkNfVVJJW3dpbmRv
d3NfeDg2XzY0X21zdmMtMC41My4xLnNoYTI1NnN1bV0gPSAiZDZiYmZmNWYwYWFkYTQyN2ExZTVh
NmRhNWYxZjk4MTU4MTgyZjI2NTU2ZjM0NWFjOWUwNGQzNmQwZWJlZDY1MCIKIFNSQ19VUklbd2lu
bm93LTEuMC4zLnNoYTI1NnN1bV0gPSAiMDU5MmUxYzlkMTUxZjg1NGU2ZmQzODI1NzRjM2EwODU1
MjUwZTFkOWIyZjk5ZDkyODFjNmU2MzkxYWYzNTJmMSIKIFNSQ19VUklbd2lueC0wLjM2LjQuc2hh
MjU2c3VtXSA9ICIzZjNmZDM3NmY3MTk1OGI4NjJlN2FmYjIwY2ZlNWEyMjgzMGUxOTYzNDYyZjNh
MTdmNDlkODJhNmMxZDFmNDJkIgotU1JDX1VSSVt3aXQtYmluZGdlbi0wLjU3LjEuc2hhMjU2c3Vt
XSA9ICIxZWJmOTQ0ZTg3YTdjMjUzMjMzYWQ2NzY2ZTA4MmUzY2Q3MTRiNWQwMzgxMmFjYzI0YzMx
OGY1NDk2MTQ1MzZlIgogU1JDX1VSSVt3cml0ZWFibGUtMC42LjIuc2hhMjU2c3VtXSA9ICI5ZWRk
ZTBkYjQ3NjlkMmRjNjg1Nzk4OTNmMjMwNmIyNmM2ZWNmYmUwZWY0OTliMDEzZDczMWI3YjkyNDdl
MGI5IgotU1JDX1VSSVt4YXR0ci0xLjYuMS5zaGEyNTZzdW1dID0gIjMyZTQ1YWQ0MjA2ZjZkMjQ3
OTA4NTE0N2YwMmJjMmVmODM0YWM4NTg4NjYyNGEyMzU3NWFlMTM3YzhhYTgxNTYiCiBTUkNfVVJJ
W3lva2UtMC44LjEuc2hhMjU2c3VtXSA9ICI3MmQ2ZTVjNmFmYjg0ZDczOTQ0ZTVjZWRiMDUyYzQ2
ODBkNTY1NzMzNzIwMTU1NWY5ZjJhMTZiNzQwNmQ0OTU0IgogU1JDX1VSSVt5b2tlLWRlcml2ZS0w
LjguMS5zaGEyNTZzdW1dID0gImI2NTkwNTI4NzRlYjY5OGVmZTViOWU4Y2YzODIyMDQ2NzhhMDA4
NmViZjQ2OTgyYjc5ZDZjYTMxODI5MjdlNWQiCiBTUkNfVVJJW3plcm9jb3B5LTAuOC41Ni5zaGEy
NTZzdW1dID0gIjU1Njc2NGU1ODNhZGI0NWE5ZjhkNDEzYzJhMTQ3ZmE3ZThkODIxZTQ4ZTEyYjE0
ZmQ1NjBiNjA3OTk4Yjc1ZWIiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8w
LjEyLjEzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dXYtYnVpbGRfMC4xMi4xNi5iYgppbmRleCA1MWU4NWQ1YTg1Li5mZTQ0Yjk2NDM1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4x
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMi4xNi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTtt
ZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4
OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NjkzNmFiMjRjODY3
NGJlMjhkZjI3ODRhOWNhMjg3ODQ3OGE4NGE5OGU2Y2UzZGY1Y2I5NzYxMDJlOTliOGYxIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjMyY2E2ZmI4ZDUyMjNjNTFjNzJiYjA5ZDZmNTJiNjczMDQwNmRl
ZDA2YWQxNzcxMWVhMmZlZjhiZmYyNjBjNjIiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMK
IAotLSAKMi40Ny4xCgo=

--===============4308458457084645814==--

