Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56EAC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7567.1786689404208326049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FO0kBxR1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tOwkNYoh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ffefcb9a1-fe08a729-df21-4d3f-ba8a-ba8c32559c76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UpKNWiC9LqkPUjoAj1hZmslKlINtzk8vKtOFCSwd6+g=;
	b=FO0kBxR1pZRYY4Pgw4EBYAEOSDfRrxtyDfw7oacTGw/fiAPdTpYnGRN3UYRWlpH1
	DVEB7zkzxlPCJ8kjpxAw6V9aecvIi+MDoOotl5OamxROnsK3J21XmeBtyNQI+ZU0Nvg
	gsvxl+1yKDTXub5oYKR2tqUpxenl8XPGbj7U/r8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UpKNWiC9LqkPUjoAj1hZmslKlINtzk8vKtOFCSwd6+g=;
	b=tOwkNYohV1cjGQ+yQGa0vH52GII1s+te9GGllIFrGAeAIGoHCcxFoJ6ptCSnZj2Y
	yvffxl2hOJ0mxxP8rUFsnSWwxAnCHAFk3nESjvT3+ZmNUoH2Ug9vdGjp+inl0Vfv6/A
	1qaNWTrytNBrmWtWJTfhgXU595SVxxPzQdrD7uA8=
Content-Type: multipart/mixed; boundary="===============6294920408160836651=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.4 FAILED
Message-ID: <0101019ffefcb9a1-fe08a729-df21-4d3f-ba8a-ba8c32559c76-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243412

--===============6294920408160836651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.3-0.12.4.patch
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
From a884d25bea90c675de728d13ec87070b80702ef3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 14 Aug 2026 05:35:57 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.3 -> 0.12.4

---
 .../python/python3-uv-build-crates.inc        | 72 +++++++++++++++----
 ...d_0.12.3.bb => python3-uv-build_0.12.4.bb} |  2 +-
 2 files changed, 61 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.3.bb => python3-uv-build_0.12.4.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index c7ab4f76ff..8d76d041f3 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -5,12 +5,14 @@ SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/aho-corasick/1.1.4 \
     crate://crates.io/allocator-api2/0.2.21 \
+    crate://crates.io/ambient-authority/0.0.2 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
+    crate://crates.io/archive-trait/0.0.13 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.6.4 \
@@ -30,11 +32,13 @@ SRC_URI += " \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.1 \
+    crate://crates.io/cap-primitives/4.0.2 \
+    crate://crates.io/cap-std/4.0.2 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.4 \
-    crate://crates.io/clap_builder/4.6.2 \
+    crate://crates.io/clap/4.6.5 \
+    crate://crates.io/clap_builder/4.6.5 \
     crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
@@ -73,6 +77,7 @@ SRC_URI += " \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
+    crate://crates.io/fs-set-times/0.20.3 \
     crate://crates.io/futures/0.3.33 \
     crate://crates.io/futures-channel/0.3.33 \
     crate://crates.io/futures-core/0.3.33 \
@@ -104,6 +109,10 @@ SRC_URI += " \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/insta/1.48.0 \
+    crate://crates.io/io-extras/0.19.0 \
+    crate://crates.io/io-lifetimes/2.0.4 \
+    crate://crates.io/io-lifetimes/3.0.1 \
+    crate://crates.io/ipnet/2.12.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
@@ -116,13 +125,14 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
+    crate://crates.io/maybe-owned/0.3.4 \
     crate://crates.io/memchr/2.8.3 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
@@ -170,11 +180,12 @@ SRC_URI += " \
     crate://crates.io/rkyv_derive/0.8.17 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix-linux-procfs/0.1.1 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schemars/1.2.1 \
-    crate://crates.io/schemars_derive/1.2.1 \
+    crate://crates.io/schemars/1.2.2 \
+    crate://crates.io/schemars_derive/1.2.2 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
@@ -182,7 +193,7 @@ SRC_URI += " \
     crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
-    crate://crates.io/serde_derive_internals/0.29.1 \
+    crate://crates.io/serde_derive_internals/0.30.0 \
     crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
@@ -203,6 +214,8 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.118 \
     crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/tar-codec/0.0.13 \
+    crate://crates.io/tar-framing/0.0.13 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
@@ -262,18 +275,29 @@ SRC_URI += " \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
     crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
+    crate://crates.io/winx/0.36.4 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
@@ -293,12 +317,14 @@ SRC_URI += " \
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
+SRC_URI[ambient-authority-0.0.2.sha256sum] = "e9d4ee0d472d1cd2e28c97dfa124b3d8d992e10eb0a035f33f5d12e3a177ba3b"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
+SRC_URI[archive-trait-0.0.13.sha256sum] = "dc23b595ad4092163eaf9c0c7532dd5b6d82274c21560c97dc03fa4e4f09e645"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.6.4.sha256sum] = "b18457efd137254e016bbde5e1d88df61c4e1a5ae2223746e56123bac6af2463"
@@ -318,11 +344,13 @@ SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
+SRC_URI[cap-primitives-4.0.2.sha256sum] = "cdadbd7c002d3a484b35243669abdae85a0ebaded5a61117169dc3400f9a7ff0"
+SRC_URI[cap-std-4.0.2.sha256sum] = "7281235d6e96d3544ca18bba9049be92f4190f8d923e3caef1b5f66cfa752608"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.4.sha256sum] = "d91e0c145792ef73a6ad36d27c75ac09f1832222a3c209689d90f534685ee5b7"
-SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
+SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
+SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
 SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
@@ -361,6 +389,7 @@ SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cb
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
+SRC_URI[fs-set-times-0.20.3.sha256sum] = "94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a"
 SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
 SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
 SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
@@ -392,6 +421,10 @@ SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9e
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
+SRC_URI[io-extras-0.19.0.sha256sum] = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
+SRC_URI[io-lifetimes-2.0.4.sha256sum] = "06432fb54d3be7964ecd3649233cddf80db2832f47fec34c01f65b3d9d774983"
+SRC_URI[io-lifetimes-3.0.1.sha256sum] = "2f0fb0570afe1fed943c5c3d4102d5358592d8625fda6a0007fdbe65a92fba96"
+SRC_URI[ipnet-2.12.0.sha256sum] = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
@@ -404,13 +437,14 @@ SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf41
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
+SRC_URI[maybe-owned-0.3.4.sha256sum] = "4facc753ae494aeb6e3c22f839b158aebd4f9270f55cd3c79906c45476c47ab4"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
@@ -458,11 +492,12 @@ SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908
 SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schemars-1.2.1.sha256sum] = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
-SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d81715d0420f8bc77a18c6260b307f"
+SRC_URI[schemars-1.2.2.sha256sum] = "687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a"
+SRC_URI[schemars_derive-1.2.2.sha256sum] = "d98c67716b46af2f0b8cf752abc930f6f9aecfbf671ecfb531db8a31dbe4e2ba"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
@@ -470,7 +505,7 @@ SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
-SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
+SRC_URI[serde_derive_internals-0.30.0.sha256sum] = "f852137cce035d6a4df67ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
 SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
@@ -491,6 +526,8 @@ SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[tar-codec-0.0.13.sha256sum] = "f718b1f470b8ff575d12c85c33bdc8b33743009669c7a5e1923b6583235a2258"
+SRC_URI[tar-framing-0.0.13.sha256sum] = "5aca504a58616b04eb381819c4ddfdf87b6d35f6699090e68d8b40954fb42da7"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
@@ -550,18 +587,29 @@ SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
+SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.3.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.3.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.4.bb
index e8444ec020..f14c4da66b 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.3.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "b6f51ed4411a35f008c9ef6e28016ac8f167f5c14fb2d0e453a9a97246b14206"
+SRC_URI[sha256sum] = "38298f1bfc8ea7eeaead0f4746f6310f8887e06db90a63d339043c19ea90fd40"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============6294920408160836651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.3.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.3.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.4.dist-info

--===============6294920408160836651==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.3-0.12.4.patch"

RnJvbSBhODg0ZDI1YmVhOTBjNjc1ZGU3MjhkMTNlYzg3MDcwYjgwNzAyZWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTQgQXVnIDIwMjYgMDU6MzU6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMyAtPiAwLjEyLjQKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgNzIgKysrKysrKysrKysrKysr
LS0tLQogLi4uZF8wLjEyLjMuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjQuYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjEy
LjMuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjQuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwppbmRleCBjN2FiNGY3NmZmLi44ZDc2ZDA0MWYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAtNSwx
MiArNSwxNCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FkbGVyMi8y
LjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYWhvLWNvcmFzaWNrLzEuMS40IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9hbGxvY2F0b3ItYXBpMi8wLjIuMjEgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FtYmllbnQtYXV0aG9yaXR5LzAuMC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9h
bnN0cmVhbS8xLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS8xLjAuMTQgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtcGFyc2UvMS4wLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Fuc3R5bGUtcXVlcnkvMS4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fu
c3R5bGUtd2luY29uLzMuMC4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEuMC4x
MDQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FyY2hpdmUtdHJhaXQvMC4wLjEzIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9hcmNzdHIvMS4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fy
cmF5dmVjLzAuNy44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdG9raW8tdGFyLzAu
Ni40IFwKQEAgLTMwLDExICszMiwxMyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2J5dGVjaGVjay8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZWNoZWNr
X2Rlcml2ZS8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZXMvMS4xMi4xIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9jYXAtcHJpbWl0aXZlcy80LjAuMiBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vY2FwLXN0ZC80LjAuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjU3
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4wLjQgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2NoYXJzZXQvMC4xLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXAvNC42LjQg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfYnVpbGRlci80LjYuMiBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2xhcC80LjYuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9idWls
ZGVyLzQuNi41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2Rlcml2ZS80LjYuNCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9sZXgvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NvbG9yY2hvaWNlLzEuMC41IFwKQEAgLTczLDYgKzc3LDcgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9mb2xkaGFzaC8wLjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZm9ybV91cmxlbmNvZGVkLzEuMi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mcy1l
cnIvMy4zLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZzLXNldC10aW1lcy8wLjIwLjMgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMvMC4zLjMzIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9mdXR1cmVzLWNoYW5uZWwvMC4zLjMzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1
cmVzLWNvcmUvMC4zLjMzIFwKQEAgLTEwNCw2ICsxMDksMTAgQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9pbmRleG1hcC8yLjE0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2luZG9jLzIuMC43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0YS8xLjQ4LjAgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lvLWV4dHJhcy8wLjE5LjAgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2lvLWxpZmV0aW1lcy8yLjAuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW8tbGlm
ZXRpbWVzLzMuMC4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9pcG5ldC8yLjEyLjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3BvbHlmaWxsLzEuNzAuMiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
aXRvYS8xLjAuMTcgXApAQCAtMTE2LDEzICsxMjUsMTQgQEAgU1JDX1VSSSArPSAiIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9q
dW5jdGlvbi8yLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGF6eV9zdGF0aWMvMS41LjAg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE4NiBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGliYy8wLjIuMTg5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saW51eC1yYXctc3lz
LzAuMTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGl0ZW1hcC8wLjguMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vbG9ja19hcGkvMC40LjE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9s
b2cvMC40LjI5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYWlscGFyc2UvMC4xNi4xIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9tYXRjaGVycy8wLjIuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbWF5YmUtb3duZWQvMC4zLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbWNoci8yLjgu
MyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaXpfb3hpZGUvMC44LjkgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL21pby8xLjIuMCBcCkBAIC0xNzAsMTEgKzE4MCwxMiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZfZGVyaXZlLzAuOC4xNyBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcnVzdGMtaGFzaC8yLjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cnVzdGl4LzEuMS40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0aXgtbGludXgtcHJvY2Zz
LzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0dmVyc2lvbi8xLjAuMjIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3J5dS8xLjAuMjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Nh
bWUtZmlsZS8xLjAuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NoZW1hcnMvMS4yLjEgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NjaGVtYXJzX2Rlcml2ZS8xLjIuMSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc2NoZW1hcnMvMS4yLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NjaGVt
YXJzX2Rlcml2ZS8xLjIuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NvcGVndWFyZC8xLjIu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VhaGFzaC80LjEuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc2VsZi1yZXBsYWNlLzEuNS4wIFwKQEAgLTE4Miw3ICsxOTMsNyBAQCBTUkNfVVJJ
ICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlLXVudGFnZ2VkLzAuMS45IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9jb3JlLzEuMC4yMjkgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NlcmRlX2Rlcml2ZS8xLjAuMjI5IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJk
ZV9kZXJpdmVfaW50ZXJuYWxzLzAuMjkuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVf
ZGVyaXZlX2ludGVybmFscy8wLjMwLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2pz
b24vMS4wLjE1MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfc3Bhbm5lZC8xLjEuMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hhMi8wLjEwLjkgXApAQCAtMjAzLDYgKzIxNCw4IEBA
IFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC4xMTggXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8zLjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3lu
c3RydWN0dXJlLzAuMTMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWNvZGVjLzAuMC4x
MyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWZyYW1pbmcvMC4wLjEzIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby90ZW1wLWVudi8wLjMuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVt
cGZpbGUvMy4yNy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXJtaW5hbF9zaXplLzAuNC40
IFwKQEAgLTI2MiwxOCArMjc1LDI5IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2luZG93cy1yZXN1bHQvMC4zLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3Mtc3RyaW5ncy8wLjQuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1zeXMvMC41
Mi4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXN5cy8wLjYwLjIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmRvd3Mtc3lzLzAuNjEuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2luZG93cy10YXJnZXRzLzAuNTIuNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93
cy10YXJnZXRzLzAuNTMuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy10aHJlYWRp
bmcvMC4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZt
LzAuNTIuNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxsdm0v
MC41My4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjUy
LjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNTMuMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudS8wLjUyLjYgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC41My4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5kb3dzX2k2ODZfZ251bGx2bS8wLjUyLjYgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3NfaTY4Nl9nbnVsbHZtLzAuNTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2luZG93c19pNjg2X21zdmMvMC41Mi42IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dz
X2k2ODZfbXN2Yy8wLjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0
X2dudS8wLjUyLjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudS8w
LjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC41
Mi42IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnVsbHZtLzAuNTMu
MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjUyLjYgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC41My4xIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93aW5ub3cvMS4wLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dp
bngvMC4zNi40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUvMC42LjIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3hhdHRyLzEuNi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby95
b2tlLzAuOC4xIFwKQEAgLTI5MywxMiArMzE3LDE0IEBAIFNSQ19VUkkgKz0gIiBcCiBTUkNfVVJJ
W2FkbGVyMi0yLjAuMS5zaGEyNTZzdW1dID0gIjMyMDExOTU3OWZjYWQ5YzIxODg0ZjVjNDg2MWQx
NjE3NGQwZTA2MjUwNjI1MjY2ZjUwZmU2ODk4MzQwYWJlZmEiCiBTUkNfVVJJW2Foby1jb3Jhc2lj
ay0xLjEuNC5zaGEyNTZzdW1dID0gImRkZDMxYTEzMDQyN2MyNzUxOGRmMjY2OTQzYTUzMDhlZDky
ZDRiMjI2Y2M2MzlmNWE4ZjEwMDI4MTYxNzQzMDEiCiBTUkNfVVJJW2FsbG9jYXRvci1hcGkyLTAu
Mi4yMS5zaGEyNTZzdW1dID0gIjY4M2Q3OTEwZTc0MzUxOGIwZTM0ZjExODZmOTI0OTRiZWNhY2Iw
NDdjN2I2YmY2MTZjOTY3NzIxODBmZWY5MjMiCitTUkNfVVJJW2FtYmllbnQtYXV0aG9yaXR5LTAu
MC4yLnNoYTI1NnN1bV0gPSAiZTlkNGVlMGQ0NzJkMWNkMmUyOGM5N2RmYTEyNGIzZDhkOTkyZTEw
ZWIwYTAzNWYzM2Y1ZDEyZTNhMTc3YmEzYiIKIFNSQ19VUklbYW5zdHJlYW0tMS4wLjAuc2hhMjU2
c3VtXSA9ICI4MjRhMjEyZmFmOTZlOWFjYWNkYmQwOWZlYmQzNDQzOGY4ZjcxMWZiODRlMDlhODkx
NjAxM2NkNzgxNWNhMjhkIgogU1JDX1VSSVthbnN0eWxlLTEuMC4xNC5zaGEyNTZzdW1dID0gIjk0
MGIzYTBjYTYwM2QxZWFkZTUwYTQ4NDZhMmFmZmZkNWVmNTdhOWZlYWMyYzBlMmVjMmUxNGY5ZWFk
NzYwMDAiCiBTUkNfVVJJW2Fuc3R5bGUtcGFyc2UtMS4wLjAuc2hhMjU2c3VtXSA9ICI1MmNlN2Yz
OGIyNDIzMTlmN2NhYmFhNjgxMzA1NTQ2NzA2M2VjZGM5ZDM1NWJiYjRjZTBjNjg5MDhjZDgxMzBl
IgogU1JDX1VSSVthbnN0eWxlLXF1ZXJ5LTEuMS41LnNoYTI1NnN1bV0gPSAiNDBjNDhmNzJmZDUz
Y2QyODkxMDRmYzY0MDk5YWJjYTczZGI0MTY2YWQ4NmVhMGI0MzQxYWJlNjVhZjgzZGFkYyIKIFNS
Q19VUklbYW5zdHlsZS13aW5jb24tMy4wLjExLnNoYTI1NnN1bV0gPSAiMjkxZTZhMjUwZmY4NmNk
NGE4MjAxMTJmYjg4OTg4MDhhMzY2ZDhmOWY1OGNlMTZkMWY1MzgzNTNhZDU1NzQ3ZCIKIFNSQ19V
UklbYW55aG93LTEuMC4xMDQuc2hhMjU2c3VtXSA9ICIzMzBhNWVkMDdmYTU0ZTQ3MDJjOWQ2YzQx
NzRmNzQ0MjdmYzBlZjZlMjE0YmJkNjc3YWU1MGE1MDk5OTQ2NDcwIgorU1JDX1VSSVthcmNoaXZl
LXRyYWl0LTAuMC4xMy5zaGEyNTZzdW1dID0gImRjMjNiNTk1YWQ0MDkyMTYzZWFmOWMwYzc1MzJk
ZDViNmQ4MjI3NGMyMTU2MGM5N2RjMDNmYTRlNGYwOWU2NDUiCiBTUkNfVVJJW2FyY3N0ci0xLjIu
MC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4NzczMmUyOTIxMTc1ZjI2YzM1
MGI0NTYzODQxZDA5NThjMjFkNTdlNmQiCiBTUkNfVVJJW2FycmF5dmVjLTAuNy44LnNoYTI1NnN1
bV0gPSAiZDNmYjY3YTZlMDhhY2YyNGZkZWNjYmFjMmNiNmFjNDMwNTgyNWJkMWYxMTc0NjJlMGU2
ZjJmMTkzMzQ1YWQ1NiIKIFNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjYuNC5zaGEyNTZzdW1d
ID0gImIxODQ1N2VmZDEzNzI1NGUwMTZiYmRlNWUxZDg4ZGY2MWM0ZTFhNWFlMjIyMzc0NmU1NjEy
M2JhYzZhZjI0NjMiCkBAIC0zMTgsMTEgKzM0NCwxMyBAQCBTUkNfVVJJW2J1bXBhbG8tMy4yMC4y
LnNoYTI1NnN1bV0gPSAiNWQyMDc4OTg2OGY0YjAxYjJmMmNhZWM5ZjVjNGUwMjEzYjQxZTNlNTcw
MgogU1JDX1VSSVtieXRlY2hlY2stMC44LjIuc2hhMjU2c3VtXSA9ICIwY2FhMzNhMmMwZWRjYTA0
MTlkMTVhYzcyM2RmZjAzZjE5NTZmNzk3ODMyOWIxZTNiNWZkYWFhZWQ5ZDNjYThiIgogU1JDX1VS
SVtieXRlY2hlY2tfZGVyaXZlLTAuOC4yLnNoYTI1NnN1bV0gPSAiODkzODVlODJiNWQxODIxZDIy
MTllMGIwOTVlZmEyY2MxZjI0NmNiZjk5MDgwZjNiZTQ2YTFhODVjMGQzOTJkOSIKIFNSQ19VUklb
Ynl0ZXMtMS4xMi4xLnNoYTI1NnN1bV0gPSAiZmM2NTJhNDhjMzUyYWVmM2VhM2FlZDMyMDgwNTAx
Y2YzZWY2ZWQ1ZGE3ODYwMmEwMjBjOTkxNzc1YjBhZmYwNCIKK1NSQ19VUklbY2FwLXByaW1pdGl2
ZXMtNC4wLjIuc2hhMjU2c3VtXSA9ICJjZGFkYmQ3YzAwMmQzYTQ4NGIzNTI0MzY2OWFiZGFlODVh
MGViYWRlZDVhNjExMTcxNjlkYzM0MDBmOWE3ZmYwIgorU1JDX1VSSVtjYXAtc3RkLTQuMC4yLnNo
YTI1NnN1bV0gPSAiNzI4MTIzNWQ2ZTk2ZDM1NDRjYTE4YmJhOTA0OWJlOTJmNDE5MGY4ZDkyM2Uz
Y2FlZjFiNWY2NmNmYTc1MjYwOCIKIFNSQ19VUklbY2MtMS4yLjU3LnNoYTI1NnN1bV0gPSAiN2Ew
ZGQxY2EzODQ5MzJmZjM2NDFjODcxOGEwMjc2OWYxNjk4ZTc1NjNkYzY5NzRmZmQwMzM0NjExNjMx
MDQyMyIKIFNSQ19VUklbY2ZnLWlmLTEuMC40LnNoYTI1NnN1bV0gPSAiOTMzMGY4YjJmZjEzZjM0
NTQwYjQ0ZTk0NmVmMzUxMTE4MjU3MjdiMzhkMzMyODZlZjk4NjE0MjYxNTEyMTgwMSIKIFNSQ19V
UklbY2hhcnNldC0wLjEuNS5zaGEyNTZzdW1dID0gImYxZjkyN2IwN2M3NGJhODRjN2U1ZmU0ZGIy
YmFlYjNlOTk2YWIyNjg4OTkyZTM5YWM2OGNlMzIyMGE2NzdjN2UiCi1TUkNfVVJJW2NsYXAtNC42
LjQuc2hhMjU2c3VtXSA9ICJkOTFlMGMxNDU3OTJlZjczYTZhZDM2ZDI3Yzc1YWMwOWYxODMyMjIy
YTNjMjA5Njg5ZDkwZjUzNDY4NWVlNWI3IgotU1JDX1VSSVtjbGFwX2J1aWxkZXItNC42LjIuc2hh
MjU2c3VtXSA9ICJmMDk2MjhhZmRjYzUzOGI1N2YzYzYzNDFlOWM4ZTk5NzBmMThlNGE0ODE2OTBh
NjQ5NzRkNzAyM2JkMzM1NDhiIgorU1JDX1VSSVtjbGFwLTQuNi41LnNoYTI1NnN1bV0gPSAiMzAx
YjU2NjU4NTk4ZTQ4ZjM2NDg2NDdhYzZmYzg4N2JlN2U3MTA4ZWRkZmE0ZTliNjNmY2YzZWM1OGMw
Y2FkZiIKK1NSQ19VUklbY2xhcF9idWlsZGVyLTQuNi41LnNoYTI1NnN1bV0gPSAiOTRhNjU0MDNk
MWExYmQyOGY3ZGM2OGViODUwNmU4ODc0ODA4ZWU1ZWVjYjU5Mjk4ZGU1ODhlMmUxNDA3YTA3OCIK
IFNSQ19VUklbY2xhcF9kZXJpdmUtNC42LjQuc2hhMjU2c3VtXSA9ICJkMDEyZDJiOWQ2NWFjYTdm
MThmNGQ5ODc4YTA0NWJjMTc4OTliYmE5NTE1NjFiYTVlYzNjMmJhMWVlZDlhMDYxIgogU1JDX1VS
SVtjbGFwX2xleC0xLjEuMC5zaGEyNTZzdW1dID0gImM4ZDRhM2JiOGIxZTBjMTA1MDQ5OWQxODE1
ZjVhYjE2ZDA0ZjA5NTliMjMzMDg1ZmIzMTY1M2ZiZmM5ZDk4ZjkiCiBTUkNfVVJJW2NvbG9yY2hv
aWNlLTEuMC41LnNoYTI1NnN1bV0gPSAiMWQwNzU1MGM5MDM2YmYyYWUwYzY4NGM0Mjk3ZDUwM2Y4
MzgyODdjODNjNTM2ODZkMDUzNzBkMGUxMzlhZTU3MCIKQEAgLTM2MSw2ICszODksNyBAQCBTUkNf
VVJJW2ZvbGRoYXNoLTAuMS41LnNoYTI1NnN1bV0gPSAiZDljNGY1ZGFjNWUxNWMyNGViOTk5YzI2
MTgxYTZjYTQwYjM5ZmU5NDZjYgogU1JDX1VSSVtmb2xkaGFzaC0wLjIuMC5zaGEyNTZzdW1dID0g
Ijc3Y2UyNGNiNTgyMjhmYmI4YWEwNDE0MjViYjEwNTA4NTBhYzE5MTc3Njg2ZWE2ZTBmNDFhNzA0
MTZmNTZmZGIiCiBTUkNfVVJJW2Zvcm1fdXJsZW5jb2RlZC0xLjIuMi5zaGEyNTZzdW1dID0gImNi
NGNiMjQ1MDM4NTE2ZjVmODUyNzc4NzVjZGFhNGY3ZDJjOWEwZmEwNDY4ZGUwNmVkMTkwMTYzYjE1
ODFmY2YiCiBTUkNfVVJJW2ZzLWVyci0zLjMuMS5zaGEyNTZzdW1dID0gImI5MWFhNDQ4Y2E1MGQ3
ZTc5NDMzYmRmM2VlOGQ5OTIxNTQzMGQyZWMwMmFkZTVhZWZhYjJhMDczYTE4MjJlOGEiCitTUkNf
VVJJW2ZzLXNldC10aW1lcy0wLjIwLjMuc2hhMjU2c3VtXSA9ICI5NGU3MDk5ZjYzMTNlY2FjYmUx
MjU2ZThmZjlkNjE3Yjc1ZDFiY2IxNmE2ZmRkZWY5NDg2NmQyMjVhMDFhMTRhIgogU1JDX1VSSVtm
dXR1cmVzLTAuMy4zMy5zaGEyNTZzdW1dID0gImE4OGNmMWY4MjlkOTQ1ZjU0OGNmOGZlYzMyYzYx
YjFmMjAyYjZkOTNiNDU4NDg2MDJmYzAyYWY0YjEyYWQyMTgiCiBTUkNfVVJJW2Z1dHVyZXMtY2hh
bm5lbC0wLjMuMzMuc2hhMjU2c3VtXSA9ICIyNjI1OTBmNGZlNmFmZWIwYmM4M2JlMWRhYTY0ZTUy
NjU3ZmUxODU2OTBhOTU4YWY3ZjNhZDBlOTIwODVjNWFlIgogU1JDX1VSSVtmdXR1cmVzLWNvcmUt
MC4zLjMzLnNoYTI1NnN1bV0gPSAiMmNkNTBjNDczYzgwZjZkN2MzNjcwYTc1MjM1NGI4ZTU2OWIx
YTdjYmZkYzA0MTllYzg4ZTVlZGFkODVlMGRjNyIKQEAgLTM5Miw2ICs0MjEsMTAgQEAgU1JDX1VS
SVtpZG5hX2FkYXB0ZXItMS4yLjEuc2hhMjU2c3VtXSA9ICIzYWNhZTk2MDk1NDBhYTMxOGQxYmM1
ODg0NTUyMjVmYjIwODViOWUKIFNSQ19VUklbaW5kZXhtYXAtMi4xNC4wLnNoYTI1NnN1bV0gPSAi
ZDQ2NmU5NDU0ZjA4ZTRhOTExZTE0ODA2YzI0ZTE2ZmJhMWI0YzEyMWQxZWE0NzQzOTZmMzk2MDY5
Y2Y5NDlkOSIKIFNSQ19VUklbaW5kb2MtMi4wLjcuc2hhMjU2c3VtXSA9ICI3OWNmNWM5M2Y5MzIy
OGNmOGVmYjNiYTM2MjUzNWZiMTExOTlhYzU0OGEwOWNlMTE3YzliMWFkYzMwMzBkNzA2IgogU1JD
X1VSSVtpbnN0YS0xLjQ4LjAuc2hhMjU2c3VtXSA9ICI4NmYwZjhmZWU4YzkyNjQxNWM1OGQ2YWU0
M2EwODUyM2EyNmZhY2NiMjMyM2Y1ZTZiNjQ0ZmU3ZGQ0ZWY2YjgyIgorU1JDX1VSSVtpby1leHRy
YXMtMC4xOS4wLnNoYTI1NnN1bV0gPSAiMjBmZDZkZTRjY2ZjYzE4N2UzOGJjMjFjZmE1NDNjYjVh
MzAyY2I4NmE4YjExNGViN2YwYmYwZGM5ZjhhYzAwZiIKK1NSQ19VUklbaW8tbGlmZXRpbWVzLTIu
MC40LnNoYTI1NnN1bV0gPSAiMDY0MzJmYjU0ZDNiZTc5NjRlY2QzNjQ5MjMzY2RkZjgwZGIyODMy
ZjQ3ZmVjMzRjMDFmNjViM2Q5ZDc3NDk4MyIKK1NSQ19VUklbaW8tbGlmZXRpbWVzLTMuMC4xLnNo
YTI1NnN1bV0gPSAiMmYwZmIwNTcwYWZlMWZlZDk0M2M1YzNkNDEwMmQ1MzU4NTkyZDg2MjVmZGE2
YTAwMDdmZGJlNjVhOTJmYmE5NiIKK1NSQ19VUklbaXBuZXQtMi4xMi4wLnNoYTI1NnN1bV0gPSAi
ZDk4ZjZmZWQxZmRlM2Y4YzIxYmM0MGExYWJiODhkZDc1ZTY3OTI0ZjljZmZjM2VmOTU2MDdiYWQ4
MDE3ZjhlMiIKIFNSQ19VUklbaXNfdGVybWluYWxfcG9seWZpbGwtMS43MC4yLnNoYTI1NnN1bV0g
PSAiYTZjYjEzOGJiNzlhMTQ2YzFiZDQ2MDAwNTYyM2UxNDJlZjAxODFlM2QwMjE5Y2I0OTNlMDJm
N2QwOGEzNTY5NSIKIFNSQ19VUklbaXRlcnRvb2xzLTAuMTQuMC5zaGEyNTZzdW1dID0gIjJiMTky
Yzc4MjAzN2ZhZGQ5Y2ZhNzU1NDgzMTA0ODhhYWJkYmYzZDJkYTczODg1YjMxYmQwYWJkMDMzNTEy
ODUiCiBTUkNfVVJJW2l0b2EtMS4wLjE3LnNoYTI1NnN1bV0gPSAiOTJlY2M2NjE4MTgxZGVmMDQ1
NzM5MmNjZDBlZTUxMTk4ZTA2NWUwMTZkMWQ1MjdhN2FjMWI2ZGM3YzFmMDlkMiIKQEAgLTQwNCwx
MyArNDM3LDE0IEBAIFNSQ19VUklbam9ic2VydmVyLTAuMS4zNS5zaGEyNTZzdW1dID0gIjFjMDBh
Y2JkMjllYWJhZDRhMjM5MmZhMGU5MjFjODc0OTM0ZGJiZjQxCiBTUkNfVVJJW2pzLXN5cy0wLjMu
OTEuc2hhMjU2c3VtXSA9ICJiNDk3MTViNzA3M2YzODViYTRiYzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2
MTQ2ZWZiNjZiNzgxZjEzMWYwZmIzOTljIgogU1JDX1VSSVtqdW5jdGlvbi0yLjAuMC5zaGEyNTZz
dW1dID0gIjE2MGYyZWFkZTA5N2YzMDI2M2I1NDhhYWU1ZGViMTJhZDM0OWM5MDliYWE3MTBmYTI0
YjkyYzkwOTBiMmUwMDYiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4wLnNoYTI1NnN1bV0gPSAi
YmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2ODVlMWYyOTgwNjgz
MTZlNjZmZSIKLVNSQ19VUklbbGliYy0wLjIuMTg2LnNoYTI1NnN1bV0gPSAiNjhhYjkxMDE3ZmUx
NmM2MjI0ODY4NDBlNGM4M2M5YTM3YWZlZmY5NzhiZDIzOWI1MjkzZDYxZWNlNTg3ZGU2NiIKK1NS
Q19VUklbbGliYy0wLjIuMTg5LnNoYTI1NnN1bV0gPSAiM2VhZjNlZGUzZmVlNmRiMWE0YzJlZTA5
MWJmOGE4YjRkY2NkYzZkMTdmNjU2ZmIwNzg5NmVlNzI4Njc2MTJmMiIKIFNSQ19VUklbbGludXgt
cmF3LXN5cy0wLjEyLjEuc2hhMjU2c3VtXSA9ICIzMmE2Njk0OWUwMzBkYTAwZThjN2Q0NDM0YjI1
MTY3MGE5MTU1NmY0MTQ0OTQxZDM3NDUyNzY5YzI1ZDU4YTUzIgogU1JDX1VSSVtsaXRlbWFwLTAu
OC4xLnNoYTI1NnN1bV0gPSAiNjM3MzYwN2E1OWYwYmU3M2EzOWI2ZmU0NTZiODE5MmZjYzM1ODVm
NjAyYWYyMDc1MTYwMGU5NzRkZDQ1NWU3NyIKIFNSQ19VUklbbG9ja19hcGktMC40LjE0LnNoYTI1
NnN1bV0gPSAiMjI0Mzk5ZTc0Yjg3YjVmMzU1NzUxMWQ5OGRmZjhiMTQwODliM2RhZGFmY2FiNmJi
OTNlYWI2N2QzYWFjZTk2NSIKIFNSQ19VUklbbG9nLTAuNC4yOS5zaGEyNTZzdW1dID0gIjVlNTAz
MmUyNDAxOTA0NWM3NjJkM2MwZjI4ZjViNmI4YmJmMzg1NjNhNjU5MDgzODliZjc5Nzg3NTg5MjA4
OTciCiBTUkNfVVJJW21haWxwYXJzZS0wLjE2LjEuc2hhMjU2c3VtXSA9ICI2MDgxOWE5N2RkY2I4
MzFhNTYxNGViM2IwMTc0ZjM2MjBlNzkzZTk3ZTA5MTk1YTM5NWJmYTk0OGZkNjhlZDJmIgogU1JD
X1VSSVttYXRjaGVycy0wLjIuMC5zaGEyNTZzdW1dID0gImQxNTI1YTJhMjhjN2Y0ZmEwZmM5OGJi
OTFhZTc1NWQxZTJkMTUwNTA3OWUwNTUzOWUzNWJjODc2YjVkNjVhZTkiCitTUkNfVVJJW21heWJl
LW93bmVkLTAuMy40LnNoYTI1NnN1bV0gPSAiNGZhY2M3NTNhZTQ5NGFlYjZlM2MyMmY4MzliMTU4
YWViZDRmOTI3MGY1NWNkM2M3OTkwNmM0NTQ3NmM0N2FiNCIKIFNSQ19VUklbbWVtY2hyLTIuOC4z
LnNoYTI1NnN1bV0gPSAiY2Y4YmFmMWM1NWU2MmZmY2FjZTdhOWYwNmY0YmQ5Y2QzZjBjNGJlYjAy
MmQzYjM2NzI1NmI5MWI4NzUxM2Q5OCIKIFNSQ19VUklbbWluaXpfb3hpZGUtMC44Ljkuc2hhMjU2
c3VtXSA9ICIxZmE3NmEyYzg2ZjcwNGJkYjIyMmQ2Njk2NWZiM2Q2MzI2OWNlMzg1MThiODNjYjA1
NzVmY2E4NTVlYmI2MzE2IgogU1JDX1VSSVttaW8tMS4yLjAuc2hhMjU2c3VtXSA9ICI1MGI3ZTVi
MjdhYTAyYTc0YmFjOGMzZjIzZjQ0OGY4ZDg3ZmYxMWY5MmQzYWFjMWE2ZWQzNjllZTA4Y2M1NmMx
IgpAQCAtNDU4LDExICs0OTIsMTIgQEAgU1JDX1VSSVtya3l2LTAuOC4xNy5zaGEyNTZzdW1dID0g
IjgxNWNjOGEzNzE1OWE0NjMwNjQ4MjUyNDZjYWRiMDc5NjFlMjVjZDk4ODU5MDgKIFNSQ19VUklb
cmt5dl9kZXJpdmUtMC44LjE3LnNoYTI1NnN1bV0gPSAiYzBlZDFhNzhhMWIxOWQxODRiMGRhYTYy
OWRkOWEwMjQ1NzMxNzNlYzdkNDg1YjI4N2NiMzY5ZmIzNjA3Y2MxYyIKIFNSQ19VUklbcnVzdGMt
aGFzaC0yLjEuMy5zaGEyNTZzdW1dID0gIjZiMWU3ZjlhNDI4NTcxYmUyZGM1YmMwNTA1YzEzZmI2
YmY5MzY4MjJiODk0ZWM4N2FiZjhhMDhhNGU1MTc0MmQiCiBTUkNfVVJJW3J1c3RpeC0xLjEuNC5z
aGEyNTZzdW1dID0gImI2ZmU0NTY1Yjk1MThiODNlZjRmOTFiYjQ3Y2UyOTYyMGNhODI4YmQzMmNi
N2U0MDhmMDA2MmU5OTMwYmExOTAiCitTUkNfVVJJW3J1c3RpeC1saW51eC1wcm9jZnMtMC4xLjEu
c2hhMjU2c3VtXSA9ICIyZmM4NGJmN2U5YWExNmM0ZjJjNzU4ZjI3NDEyZGM5ODQxMzQxZTE2YWE2
ODJkOWM3YWMzMDhmZTNlZTEyMDU2IgogU1JDX1VSSVtydXN0dmVyc2lvbi0xLjAuMjIuc2hhMjU2
c3VtXSA9ICJiMzljZGVmMGZhODAwZmM0NDUyNWM4NGNjYjU0YTAyOTk2MWE4MjE1Zjk2MTk3NTM2
MzVhOWMwZDI1MzhkNDZkIgogU1JDX1VSSVtyeXUtMS4wLjIzLnNoYTI1NnN1bV0gPSAiOTc3NGJh
NGE3NGRlNWY3YjFjMTQ1MWVkNmNkNTI4NWEzMmVkZGI1Y2NjYjhjYzY1NWE0ZTUwMDA5ZTA2NDc3
ZiIKIFNSQ19VUklbc2FtZS1maWxlLTEuMC42LnNoYTI1NnN1bV0gPSAiOTNmYzFkYzNhYWE5YmZl
ZDk1ZTAyZTZlYWRhYmI0YmFmN2UzMDc4YjBiZDFiNGQ3YjZiMGI2ODM3ODkwMDUwMiIKLVNSQ19V
Uklbc2NoZW1hcnMtMS4yLjEuc2hhMjU2c3VtXSA9ICJhMmI0MmYzNmFhMWNkMDExOTQ1NjE1Yjky
MjIyZjZiZjczYzU5OWExMDJhMzAwMzM0Y2Q3ZjhkYmVlYzcyNmNjIgotU1JDX1VSSVtzY2hlbWFy
c19kZXJpdmUtMS4yLjEuc2hhMjU2c3VtXSA9ICI3ZDExNWI1MGY0YWFlZWEwN2U3OWMxOTEyZjY0
NWM3NTEzZDgxNzE1ZDA0MjBmOGJjNzdhMThjNjI2MGIzMDdmIgorU1JDX1VSSVtzY2hlbWFycy0x
LjIuMi5zaGEyNTZzdW1dID0gIjY4NzI3NGQyOTNiNmNkYzZlNzNlMGZlZTUyMGJmMjA0OTY1MDA5
MGQ3MTY0Zjg3NjcyZDIxMmEzYzUzMGNmNGEiCitTUkNfVVJJW3NjaGVtYXJzX2Rlcml2ZS0xLjIu
Mi5zaGEyNTZzdW1dID0gImQ5OGM2NzcxNmI0NmFmMmYwYjhjZjc1MmFiYzkzMGY2ZjlhZWNmYmY2
NzFlY2ZiNTMxZGI4YTMxZGJlNGUyYmEiCiBTUkNfVVJJW3Njb3BlZ3VhcmQtMS4yLjAuc2hhMjU2
c3VtXSA9ICI5NDE0M2YzNzcyNTEwOWY5MmMyNjJlZDJjZjVlNTliY2U3NDk4YzAxYmNjMTUwMmQ3
YjlhZmU0MzlhNGU5ZjQ5IgogU1JDX1VSSVtzZWFoYXNoLTQuMS4wLnNoYTI1NnN1bV0gPSAiMWMx
MDdiNmY0NzgwODU0YzhiMTI2ZTIyOGVhODg2OWY0ZDdiNzEyNjBmOTYyZmVmYjU3Yjk5NmI4OTU5
YmE2YiIKIFNSQ19VUklbc2VsZi1yZXBsYWNlLTEuNS4wLnNoYTI1NnN1bV0gPSAiMDNlYzgxNWI1
ZWFiNDIwYWI4OTNmNjMzOTM4NzhkODljOTBmZGQ5NGMwYmNjNDRjMDdhYmI4YWQ5NTU1MmZiNyIK
QEAgLTQ3MCw3ICs1MDUsNyBAQCBTUkNfVVJJW3NlcmRlLTEuMC4yMjkuc2hhMjU2c3VtXSA9ICI0
MTQ4NTkwYWZlYmFkYTM4NjY4OGYxODc3M2RhNjE3NzkyYmYyZWYwM2ZmYwogU1JDX1VSSVtzZXJk
ZS11bnRhZ2dlZC0wLjEuOS5zaGEyNTZzdW1dID0gImY5ZmFmNDhhNGEyZDI2OTNiZTI0YzYyODlk
YmUyNjU1Mjc3NmViNzczNzA3NGU2NzIyODkxZmFkYmU2YzUwNTgiCiBTUkNfVVJJW3NlcmRlX2Nv
cmUtMS4wLjIyOS5zaGEyNTZzdW1dID0gIjY3ZGNhMmM5YzUxZTU4YTQ3OTFhNGIxZWQ1ODMwOGIz
OWM2NDIyNGQzNDlhOTM1YWI1MDM5YWEzNjA5NDJhNDgiCiBTUkNfVVJJW3NlcmRlX2Rlcml2ZS0x
LjAuMjI5LnNoYTI1NnN1bV0gPSAiZTdhNWQ3MTI2M2E1YTdkNDdiNDFmNmIzZjA2YmEyNzZmMTBj
YzE4YjA5MzFmMTc5OWY3MTA1NzhlMjMwOTM0OCIKLVNSQ19VUklbc2VyZGVfZGVyaXZlX2ludGVy
bmFscy0wLjI5LjEuc2hhMjU2c3VtXSA9ICIxOGQyNmEyMGE5NjliOWUzZmRmMmZjMmQ5ZjIxZWRh
NmM0MGUyZGU4NGM5NDA4YmI1ZDNiMDVkNDk5YWFlNzExIgorU1JDX1VSSVtzZXJkZV9kZXJpdmVf
aW50ZXJuYWxzLTAuMzAuMC5zaGEyNTZzdW1dID0gImY4NTIxMzdjY2UwMzVkNmE0ZGY2N2NjY2U1
MDVmZjZiM2U5ZmQzYTEwZTNlNTJiMjRkYzcxZTY1MGJiMWE5YmQiCiBTUkNfVVJJW3NlcmRlX2pz
b24tMS4wLjE1MS5zaGEyNTZzdW1dID0gImM4NDFiNTVlY2RhZTA5OGM4MGRjYWU5Y2Y3NjdmNmY4
YTBjMmNkYjM0MTZiYmVmNzIxODFkZjRkMGZlNzNmMTQiCiBTUkNfVVJJW3NlcmRlX3NwYW5uZWQt
MS4xLjEuc2hhMjU2c3VtXSA9ICI2NjYyYjU4Nzk1MTFlMDZlODk5OWE4YTIzNWQ4NDgxMTNlOTQy
YzkxMjRmMjExNTExYjE2NDY2ZWUyOTk1ZjI2IgogU1JDX1VSSVtzaGEyLTAuMTAuOS5zaGEyNTZz
dW1dID0gImE3NTA3ZDgxOTc2OWQwMWEzNjVhYjcwNzc5NGE0MDg0MzkyYzgyNGY1NGE3YTZhNzg2
MmY4YzNkMDg5MmIyODMiCkBAIC00OTEsNiArNTI2LDggQEAgU1JDX1VSSVtzdHJzaW0tMC4xMS4x
LnNoYTI1NnN1bV0gPSAiN2RhOGI1NzM2ODQ1ZDlmMmZjYjgzN2VhNWQ5ZTI2Mjg1NjRiM2IwNDNh
NzAKIFNSQ19VUklbc3luLTIuMC4xMTguc2hhMjU2c3VtXSA9ICIxYjlhZTU3ZjkwNDIxM2ViYjY0
OWNlNjg5NWI4YTY2YzY2ZjAyMDNiOTMxOTcxOGY2OWE1NjEyYTA2NWIxNDIyIgogU1JDX1VSSVtz
eW4tMy4wLjMuc2hhMjU2c3VtXSA9ICI1M2U5YmFlNTg4NDlmNjRkZmE0ZjVkNWFlMzcyYzgzNDFm
NzMwNWY4MmEzODY4NzA5MjY5MzQzNjI4YjY1OWEzIgogU1JDX1VSSVtzeW5zdHJ1Y3R1cmUtMC4x
My4yLnNoYTI1NnN1bV0gPSAiNzI4YTcwZjNkYmFmNWJhYjdmMGM0YjFhYzhkN2FlNWVhNjBhNGI1
NTQ5YzhhNTkxNDM2MWM5OTE0N2E3MDlkMiIKK1NSQ19VUklbdGFyLWNvZGVjLTAuMC4xMy5zaGEy
NTZzdW1dID0gImY3MThiMWY0NzBiOGZmNTc1ZDEyYzg1YzMzYmRjOGIzMzc0MzAwOTY2OWM3YTVl
MTkyM2I2NTgzMjM1YTIyNTgiCitTUkNfVVJJW3Rhci1mcmFtaW5nLTAuMC4xMy5zaGEyNTZzdW1d
ID0gIjVhY2E1MDRhNTg2MTZiMDRlYjM4MTgxOWM0ZGRmZGY4N2I2ZDM1ZjY2OTkwOTBlNjhkOGI0
MDk1NGZiNDJkYTciCiBTUkNfVVJJW3RlbXAtZW52LTAuMy42LnNoYTI1NnN1bV0gPSAiOTYzNzQ4
NTUwNjhmNDc0MDJjMzEyMWM2ZWVkODhkMjljYjFkZThmM2FiMjcwOTBlMjczZTQyMGJkYWJjZjA1
MCIKIFNSQ19VUklbdGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1
MzJlZmNkZWJlZWY4Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNSQ19V
UklbdGVybWluYWxfc2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3NWIxODU4
MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCkBAIC01NTAsMTgg
KzU4NywyOSBAQCBTUkNfVVJJW3dpbmRvd3MtbnVtZXJpY3MtMC4yLjAuc2hhMjU2c3VtXSA9ICI5
MTUwYWY2ODA2NmM0YzVjMDdkZGMwY2UzMDQyMTU1NDc3MQogU1JDX1VSSVt3aW5kb3dzLXJlc3Vs
dC0wLjMuNC5zaGEyNTZzdW1dID0gIjU2ZjQyYmQzMzJjYzZjOGVhYzVhZjExM2ZjMGMxZmQ2YThm
ZDJhYTA4YTAxMTkzNTg2ODZlNTE2MGQwNTg2YzYiCiBTUkNfVVJJW3dpbmRvd3Mtc3RyaW5ncy0w
LjQuMi5zaGEyNTZzdW1dID0gIjU2ZTZjOTNmM2EwYzNiMzYxNzZjYjEzMjdhNDk1OGEwMzUzZDVk
MTY2YzJhMzVjYjI2OGFjZTE1ZTkxZDNiNTciCiBTUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNTIuMC5z
aGEyNTZzdW1dID0gIjI4MmJlNWYzNmE4Y2U3ODFmYWQ4YzhhZTE4ZmEzZjliZWZmNTdlYzFiNTJj
YjNkZTA3ODkyMDE0MjVkOWEzM2QiCitTUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNjAuMi5zaGEyNTZz
dW1dID0gImYyZjUwMGU0ZDI4MjM0ZjcyMDQwOTkwZWM5ZDM5ZTNhNmI5NTBmOWYyMmQzZGJhMTg0
MTZjMzU4ODI2MTJiY2IiCiBTUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNjEuMi5zaGEyNTZzdW1dID0g
ImFlMTM3MjI5YmNiZDZjZGYwZjdiODBhMzFkZjYxNzY2MTQ1MDc3ZGRmNDk0MTZhNzI4YjAyY2Iz
OTIxZmYzZmMiCiBTUkNfVVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI5
YjcyNGY3Mjc5NmUwMzZhYjkwYzEwMjFkNDc4MGQ0ZDNkNjQ4YWNhNTllNDkxZTZiOThlNzI1Yjg0
ZTk5OTczIgorU1JDX1VSSVt3aW5kb3dzLXRhcmdldHMtMC41My41LnNoYTI1NnN1bV0gPSAiNDk0
NWY5ZjU1MWI4OGUwZDY1ZjNkYjBiYzI1YzMzYjhhY2VhNGQ5ZTQxMTYzZWRmOTBkY2QwYjE5Zjkw
NjlmMyIKIFNSQ19VUklbd2luZG93cy10aHJlYWRpbmctMC4xLjAuc2hhMjU2c3VtXSA9ICJiNjY0
NjNhZDJlMGVhM2JiZjgwOGI3ZjFkMzcxMzExYzgwZTExNWMwYjcxZDYwZWZjMTQyY2FmYmNmYjA1
N2E2IgogU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjUyLjYuc2hhMjU2c3VtXSA9
ICIzMmE0NjIyMTgwZTdhMGVjMDQ0YmI1NTU0MDRjODAwYmM5ZmQ5ZWMyNjJlYzE0N2VkZDU5ODlj
Y2QwYzAyY2QzIgorU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjUzLjEuc2hhMjU2
c3VtXSA9ICJhOWQ4NDE2ZmE4YjQyZjVjOTQ3Zjg0ODJjNDNlN2Q4OWU3M2ExNzNjZWFkNTZkMDQ0
ZjZhNTYxMDRhNmQxYjUzIgogU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjUyLjYuc2hh
MjU2c3VtXSA9ICIwOWVjMmE3YmIxNTJlMjI1MmI1M2ZhNzgwMzE1MDAwNzg3OTU0OGJjNzA5YzAz
OWRmNzYyN2NhYmJkMDVkNDY5IgorU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjUzLjEu
c2hhMjU2c3VtXSA9ICJiOWQ3ODJlODA0YzJmNjMyZTM5NTcwOGU5OWE5NDI3NTkxMGViOTEwMGIy
MTE0NjUxZTA0NzQ0ZTliMTI1MDA2IgogU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNTIuNi5z
aGEyNTZzdW1dID0gIjhlOWI1YWQ1YWI4MDJlOTdlYjhlMjk1YWM2NzIwZTUwOWVlNGMyNDNmNjlk
NzgxMzk0MDE0ZWJmZThiYmZhMGIiCitTUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnUtMC41My4xLnNo
YTI1NnN1bV0gPSAiOTYwZTZkYTA2OWQ4MWUwOWJlY2IwY2E1N2E2NTIyMGRkZmYwMTZmZjJkNmFm
NmEyMjNjZjM3MmE1MDY1OTNhMyIKIFNSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41Mi42
LnNoYTI1NnN1bV0gPSAiMGVlZTUyZDM4YzA5MGIzY2FhNzZjNTYzYjg2YzNhNGJkNzFlZjFhODE5
Mjg3YzE5ZDU4NmQ3MzM0YWU4ZWQ2NiIKK1NSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41
My4xLnNoYTI1NnN1bV0gPSAiZmE3MzU5ZDEwMDQ4ZjY4YWI4YjA5ZmE3MWMzZGFjY2ZiMGU5YjU1
OWFlZDY0OGE4Zjk1NDY5YzI3MDU3MTgwYyIKIFNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41
Mi42LnNoYTI1NnN1bV0gPSAiMjQwOTQ4YmMwNWM1ZTdjNmRhYmJhMjhiZjg5ZDg5ZmZjZTNlMzAz
MDIyODA5ZTczZGVhZWZlNGY2ZWM1NmM2NiIKK1NSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41
My4xLnNoYTI1NnN1bV0gPSAiMWU3YWM3NTE3OWYxODIzMmZlOWMyODUxNjM1NjVhNTdlZjhkM2M4
OTI1NGEzMDY4NWI1N2Q4M2EzOGQzMjZjMiIKIFNSQ19VUklbd2luZG93c194ODZfNjRfZ251LTAu
NTIuNi5zaGEyNTZzdW1dID0gIjE0N2E1YzgwYWFiZmJmMGM3ZDkwMWNiNTg5NWQxZGUzMGVmMjkw
N2ViMjFmYmJhYjI5Y2E5NGM1YjA4YjFhNzgiCitTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0w
LjUzLjEuc2hhMjU2c3VtXSA9ICI5YzM4NDJjZGQ3NGE4NjVhODA2NmFiMzljOGE3YTQ3M2MwNzc4
YTNmMjkzNzBiNWZkNmI0YjlhYTdkZjRhNDk5IgogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVs
bHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5NmYyYjQ5ZjNk
ZThjMTQ3M2RlYjUxNmJkMzQ0MTA4NzJlZmY1MWVkMGQiCitTUkNfVVJJW3dpbmRvd3NfeDg2XzY0
X2dudWxsdm0tMC41My4xLnNoYTI1NnN1bV0gPSAiMGZmYTE3OWUyZDA3ZWVlOGFkOGY1NzQ5MzQz
NjU2NmM3Y2MzMGFjNTM2YTMzNzlmZGYwMDhmNDdmNmJiN2FlMSIKIFNSQ19VUklbd2luZG93c194
ODZfNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRhODRjNjQ2MjA0NzQ3ZDEyNzBh
MmE1NjYxZWE2NmVkMWNjZWQyNjMxZDU0NmZkZmIxNTU5NTlmOWVjIgorU1JDX1VSSVt3aW5kb3dz
X3g4Nl82NF9tc3ZjLTAuNTMuMS5zaGEyNTZzdW1dID0gImQ2YmJmZjVmMGFhZGE0MjdhMWU1YTZk
YTVmMWY5ODE1ODE4MmYyNjU1NmYzNDVhYzllMDRkMzZkMGViZWQ2NTAiCiBTUkNfVVJJW3dpbm5v
dy0xLjAuMy5zaGEyNTZzdW1dID0gIjA1OTJlMWM5ZDE1MWY4NTRlNmZkMzgyNTc0YzNhMDg1NTI1
MGUxZDliMmY5OWQ5MjgxYzZlNjM5MWFmMzUyZjEiCitTUkNfVVJJW3dpbngtMC4zNi40LnNoYTI1
NnN1bV0gPSAiM2YzZmQzNzZmNzE5NThiODYyZTdhZmIyMGNmZTVhMjI4MzBlMTk2MzQ2MmYzYTE3
ZjQ5ZDgyYTZjMWQxZjQyZCIKIFNSQ19VUklbd3JpdGVhYmxlLTAuNi4yLnNoYTI1NnN1bV0gPSAi
OWVkZGUwZGI0NzY5ZDJkYzY4NTc5ODkzZjIzMDZiMjZjNmVjZmJlMGVmNDk5YjAxM2Q3MzFiN2I5
MjQ3ZTBiOSIKIFNSQ19VUklbeGF0dHItMS42LjEuc2hhMjU2c3VtXSA9ICIzMmU0NWFkNDIwNmY2
ZDI0NzkwODUxNDdmMDJiYzJlZjgzNGFjODU4ODY2MjRhMjM1NzVhZTEzN2M4YWE4MTU2IgogU1JD
X1VSSVt5b2tlLTAuOC4xLnNoYTI1NnN1bV0gPSAiNzJkNmU1YzZhZmI4NGQ3Mzk0NGU1Y2VkYjA1
MmM0NjgwZDU2NTczMzcyMDE1NTVmOWYyYTE2Yjc0MDZkNDk1NCIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjMuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi40LmJiCnNpbWls
YXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11di1idWlsZF8wLjEyLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjQuYmIKaW5kZXggZTg0NDRlYzAyMC4uZjE0
YzRkYTY2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXV2LWJ1aWxkXzAuMTIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXYtYnVpbGRfMC4xMi40LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5
NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xp
Y2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBcCiAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNEO21kNT1l
ZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImI2ZjUxZWQ0NDExYTM1ZjAwOGM5ZWY2ZTI4MDE2YWM4ZjE2N2Y1YzE0ZmIyZDBlNDUzYTlhOTcy
NDZiMTQyMDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzgyOThmMWJmYzhlYTdlZWFlYWQwZjQ3
NDZmNjMxMGY4ODg3ZTA2ZGI5MGE2M2QzMzkwNDNjMTllYTkwZmQ0MCIKIAogcmVxdWlyZSAke0JQ
Tn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============6294920408160836651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.3.tar.gz;downloadfilename=uv_build-0.12.3.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.4 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://cr
 ates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.4 crate://crates.io/clap_builder/4.6.2 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displa
 ydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://cr
 ates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate
 ://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/p
 est/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate:
 //crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates
 .io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://
 crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/
 0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu
 /0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.4.tar.gz;downloadfilename=uv_build-0.12.4.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate:
 //crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.13 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.4 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.2 crate://crates.io/cap-std/4.0.2 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.i
 o/clap/4.6.5 crate://crates.io/clap_builder/4.6.5 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7
 .12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io
 /hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://cra
 tes.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6
  crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/
 0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab
 /0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.13 crate://crates.io/tar-framing/0.0.13 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_
 edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate
 ://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://
 crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij
 /1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.3.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.3" to "0.12.4"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4438288 to 4503824 (+1%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.3 [default] to 0.12.4 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.3.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.4.dist-info

--===============6294920408160836651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-13b289d1d320aa56d64d772668f923621afbc4e6"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:13b289d1d320aa56d64d772668f923621afbc4e6"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 610 Local 451 Mirrors 0 Missed 159 Current 275 (73% match, 82% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 341 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 403 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 457 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 458 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 463 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 464 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 466 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 472 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-uv-build-0.12.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 477 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 505 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 506 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 508 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 510 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-uv-build-0.12.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 518 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 527 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 537 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 565 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 577 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 584 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 590 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 605 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 638 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 643 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 654 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 657 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 670 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 689 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 692 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 693 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 694 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 695 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 732 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 733 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 743 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 748 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 749 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 751 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 752 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 759 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 762 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 764 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 765 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 771 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 777 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 781 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 782 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 784 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 790 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 792 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 795 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 796 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 797 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 803 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 807 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 809 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 810 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 812 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 814 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 823 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 844 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 848 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 849 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 851 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 852 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 648 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 835 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: Running task 837 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: Running task 844 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: Running task 877 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: Running task 879 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: Running task 888 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_fetch)
NOTE: Running task 890 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 894 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: Running task 896 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running task 900 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: Running task 901 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 857 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 902 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 903 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: Running task 910 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: Running task 911 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: Running task 915 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_unpack)
NOTE: Running task 919 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: Running task 920 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_unpack)
NOTE: Running task 921 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: Running task 926 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 932 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: Running task 934 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 936 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: Running setscene task 859 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe expat-2.8.3-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running setscene task 860 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 861 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 938 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: Running task 939 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: Running task 941 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 862 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 863 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 942 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: Running task 944 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 946 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 947 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: Running task 948 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: Running task 950 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 951 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: Running task 987 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 989 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: Running task 993 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 994 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe expat-2.8.3-r0: task do_patch: Succeeded
NOTE: Running task 996 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_generate_toolchain_file)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: Running task 999 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: Running setscene task 870 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: Running task 1001 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: Running task 1009 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.96.1.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1021 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1026 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: Running task 1027 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 1032 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: Running task 1040 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1041 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: Running setscene task 871 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 873 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running setscene task 874 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 875 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: Running task 1053 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1055 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1058 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1062 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: Running task 1068 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 1074 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1075 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: Running task 1077 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 883 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 885 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: Running task 1093 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: Running task 1094 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: Running task 1095 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1097 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1103 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1115 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 1122 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 1123 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1136 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1193 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: Running task 1196 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: Running task 1199 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1200 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 1209 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1211 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1212 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1215 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1216 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1218 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: Running task 1219 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1220 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1221 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1222 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: Running task 1223 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: recipe expat-2.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1224 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe openssl-3.5.7-r0: task do_configure: Started
NOTE: Running task 1225 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1226 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1229 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: Running task 1236 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1237 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe expat-2.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1238 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1239 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe expat-2.8.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: Running task 1241 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1242 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 1243 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 1244 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe expat-2.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.3-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1246 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_compile)
NOTE: recipe expat-2.8.3-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1249 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1261 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1262 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1263 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1264 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe expat-2.8.3-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: Running task 1268 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1270 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1271 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1272 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1273 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: Running task 1274 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1275 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 1276 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1278 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1279 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1280 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_compile_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_configure: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1281 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1282 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1283 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_install: Started
NOTE: Running task 1284 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile)
NOTE: Running task 1285 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1286 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1289 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: Running task 1290 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1292 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1293 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: Running task 1296 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_fetch)
NOTE: recipe clang-cross-arm-git-r0: task do_fetch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1314 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.5.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1315 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_compile)
NOTE: recipe clang-cross-arm-git-r0: task do_unpack: Started
NOTE: recipe clang-cross-arm-git-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1320 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure)
NOTE: recipe clang-cross-arm-git-r0: task do_patch: Started
NOTE: recipe clang-cross-arm-git-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_compile: Started
NOTE: Running task 1328 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_configure: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1329 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Started
NOTE: Running task 1331 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install)
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1332 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile)
NOTE: recipe attr-2.6.0-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1333 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: Running task 1334 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1335 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe attr-2.6.0-r0: task do_install: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install_ptest_base)
NOTE: Running task 1337 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1339 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure)
NOTE: recipe acl-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1345 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_compile: Succeeded
NOTE: Running task 1346 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Succeeded
NOTE: Running task 1347 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1348 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1349 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1350 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install)
NOTE: recipe libcap-2.78-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1351 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: Running task 1352 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1353 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1354 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile)
NOTE: recipe xz-5.8.3-r0: task do_compile: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1355 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Succeeded
NOTE: Running task 1356 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_compile)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1357 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install_ptest_base)
NOTE: Running task 1358 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1359 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1361 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1368 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1369 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: Running task 1370 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1371 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1372 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_configure)
NOTE: recipe libffi-3.8.0-r0: task do_configure: Started
NOTE: recipe xz-5.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1373 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_preconfigure)
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_preconfigure: Started
NOTE: recipe llvm-project-source-22.1.8-22.1.8-r0: task do_preconfigure: Succeeded
NOTE: Running task 1396 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_configure: Started
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1397 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_install)
NOTE: recipe xz-5.8.3-r0: task do_install: Started
NOTE: recipe acl-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1398 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1399 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile)
NOTE: recipe acl-2.4.0-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1400 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Succeeded
NOTE: Running task 1401 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1402 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1403 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1405 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_install_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1406 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.3-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1441 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe clang-cross-arm-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1442 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Succeeded
NOTE: Running task 1443 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_install: Started
NOTE: recipe clang-cross-arm-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_configure)
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Started
NOTE: recipe clang-cross-arm-git-r0: task do_configure: Started
NOTE: recipe clang-cross-arm-git-r0: task do_configure: Succeeded
NOTE: Running task 1448 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1450 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe clang-cross-arm-git-r0: task do_compile: Started
NOTE: recipe clang-cross-arm-git-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1452 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_install)
NOTE: recipe clang-cross-arm-git-r0: task do_install: Started
NOTE: recipe clang-cross-arm-git-r0: task do_install: Succeeded
NOTE: Running task 1454 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure)
NOTE: recipe clang-cross-arm-git-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1456 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Started
NOTE: Running task 1468 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1469 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: Running task 1480 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe clang-cross-arm-git-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1482 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1496 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 1497 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1498 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1499 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1500 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: Running noexec task 1517 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_fetch)
NOTE: Running task 1518 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_generate_toolchain_file)
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 1519 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1520 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe compiler-rt-22.1.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: Running task 1523 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_install: Succeeded
NOTE: Running task 1524 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_install_ptest_base)
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1525 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe xz-5.8.3-r0: task do_install_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_configure)
NOTE: recipe libffi-3.8.0-r0: task do_configure: Succeeded
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1527 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: Running task 1528 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_compile)
NOTE: recipe compiler-rt-22.1.8-r0: task do_configure: Started
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1529 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1530 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1531 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1533 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 1534 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1535 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1536 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1537 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1538 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: Running task 1540 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 1552 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_fetch)
NOTE: Running task 1553 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_generate_toolchain_file)
NOTE: recipe libffi-3.8.0-r0: task do_install: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1554 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1555 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: Running noexec task 1557 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_fetch)
NOTE: Running task 1559 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb:do_recipe_qa)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: recipe python3-uv-build-0.12.4-r0: task do_recipe_qa: Started
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-uv-build-0.12.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1562 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb:do_fetch)
NOTE: Running task 1569 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe libffi-3.8.0-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1571 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe python3-uv-build-0.12.4-r0: task do_fetch: Started
NOTE: Running task 1572 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe python3-uv-build-0.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 1577 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1582 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1585 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_configure)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 1586 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1592 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe lzlib-1.16-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: Running task 1595 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1596 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe lzlib-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1598 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: recipe lzlib-1.16-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1601 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Succeeded
NOTE: Running noexec task 1603 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 1604 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1605 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1607 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1609 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb:do_unpack)
NOTE: recipe python3-uv-build-0.12.4-r0: task do_unpack: Started
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_unpack: Succeeded
NOTE: Running task 1610 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.96.1.bb:do_patch)
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_patch: Started
NOTE: recipe rust-source-1.96.1-1.96.1-r0: task do_patch: Succeeded
NOTE: Running task 1637 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1638 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1639 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Started
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1642 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1643 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1644 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1646 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: Running task 1647 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1650 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: Running task 1651 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: Running task 1652 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running task 1658 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_rust_gen_targets)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Succeeded
NOTE: Running task 1659 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 1660 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1664 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: Running task 1665 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1666 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: Running task 1667 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1668 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Started
NOTE: recipe xz-5.8.3-r0: task do_package: Started
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1672 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: Running task 1673 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe python3-uv-build-0.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 1674 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-uv-build_0.12.4.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe python3-uv-build-0.12.4-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe python3-uv-build-0.12.4-r0: task do_patch: Succeeded
NOTE: Running task 1681 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1683 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe expat-2.8.3-r0: task do_package: Started
NOTE: recipe libffi-3.8.0-r0: task do_package: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: Running task 1685 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot)
NOTE: recipe compiler-rt-22.1.8-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot unihash changed to f9def7c3b4f67f4ea3ad5b868056d445e865ce0f811d4479b836d285f977da57
NOTE: Setscene tasks completed
NOTE: Running task 1687 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe compiler-rt-22.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_install)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1689 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe compiler-rt-22.1.8-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 0d5ba7b63e38baab4d1b57b87545718eeb0914ad4c18c5a64a136bf27ce050bb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe expat-2.8.3-r0: task do_package: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_install: Succeeded
NOTE: Running setscene task 876 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1690 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata)
NOTE: Running task 1691 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.8.3-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1704 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package unihash changed to 22ed1779aaf66fb1328c2c7da59a5650c41830ffbb574be5b91740241a84fd13
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx became valid
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: Running task 1708 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_package: Started
NOTE: Running task 1710 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot unihash changed to ec851c9fba8f42defdf2ac6c53e1b2769d21b25d59d018aef26f0b13f87e46ae
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1711 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 885 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1713 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1715 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure)
NOTE: Running task 1731 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe sed-4.10-r0: task do_configure: Started
NOTE: recipe coreutils-9.11-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe libcxx-22.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1732 of 2193 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_configure)
NOTE: recipe libcxx-22.1.8-r0: task do_configure: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_package unihash changed to f4e93302ae516c6402738386bbcfb395027e2dd370fdf1100df5e90b49be6898
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata became valid
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to dc54ffadbcfc8914be982943db4299b74e399701dc9cb4f8adc5dd7b09274b72
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_configure: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_package: Succeeded
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_compile: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_configure: Succeeded
NOTE: recipe sed-4.10-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1732 tasks of which 1425 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814053433.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814053433.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.60883
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.60883
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============6294920408160836651==--

