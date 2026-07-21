Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F1CC4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 05:21:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16169.1784611287016171823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 22:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qFr1C2aS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4e7qJqSF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f831f2c75-5fa605ce-8675-4d96-82a9-f25001b46979-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784611286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ukmfCJ76fCz8rzjAtS7k6Qfdpdlcr0/JPsjaPese/V4=;
	b=qFr1C2aSRxYZ0RRgbI20vITFyNQRjy/jKqRoJdLRamcyKhJtKEX8ZwpQdnSzn/ok
	L1UKCILjvc83LEcigF5/IJjR32CDjCiGgSlll1ojwP0/igNfhsPqQFqM76GuYd4vCT2
	hV1K2tZbMsVmEQcaQynGlvWKdZ4fgMeVkU17ozHs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784611286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ukmfCJ76fCz8rzjAtS7k6Qfdpdlcr0/JPsjaPese/V4=;
	b=4e7qJqSFY6n5v09H4gu6xCi6gY8+kWwXWQTqEayZTWIJWH/B+uQ7XDyMQlDpmvYF
	Mk8HUQl1rF+C2hwYYFhCVS+/VQapYI0B9j2Td6DCL1DhcHhAVdiBPHNMMfXXIdcRuRl
	ee6Xq1gMo86lt1YE394vltIgHkqjvcE3xMHK0QyE=
Content-Type: multipart/mixed; boundary="===============1084343270391800420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.30 SUCCEEDED
Message-ID: <0101019f831f2c75-5fa605ce-8675-4d96-82a9-f25001b46979-000000@us-west-2.amazonses.com>
Date: Tue, 21 Jul 2026 05:21:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.21-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241502

--===============1084343270391800420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.29-0.11.30.patch
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
From 5a555b6c1d24bcefbc29fc49c4fb3f900f181e19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 21 Jul 2026 05:21:22 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.29 -> 0.11.30

---
 .../python/python3-uv-build-crates.inc        | 36 +++++++++++--------
 ...0.11.29.bb => python3-uv-build_0.11.30.bb} |  2 +-
 2 files changed, 23 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.29.bb => python3-uv-build_0.11.30.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index f1de38878c..ad7060c3ba 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -28,7 +28,7 @@ SRC_URI += " \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
-    crate://crates.io/bytes/1.12.0 \
+    crate://crates.io/bytes/1.12.1 \
     crate://crates.io/bzip2/0.5.2 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
@@ -81,6 +81,7 @@ SRC_URI += " \
     crate://crates.io/futures-task/0.3.32 \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
@@ -103,8 +104,8 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.31 \
-    crate://crates.io/jiff-static/0.2.31 \
+    crate://crates.io/jiff/0.2.32 \
+    crate://crates.io/jiff-static/0.2.32 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
@@ -120,7 +121,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.2 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -153,14 +154,15 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/quoted_printable/0.5.1 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.30 \
-    crate://crates.io/regex/1.12.4 \
-    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex/1.13.0 \
+    crate://crates.io/regex-automata/0.4.15 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.17 \
@@ -235,12 +237,13 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.4 \
+    crate://crates.io/uuid/1.23.5 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -270,6 +273,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/1.0.3 \
+    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/xz2/0.1.7 \
@@ -313,7 +317,7 @@ SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf3
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
-SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
+SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
@@ -366,6 +370,7 @@ SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac08984
 SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
@@ -388,8 +393,8 @@ SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.31.sha256sum] = "ccfe6121cbe750cf81efa362d85c0bde7ea298ec43092d3a193baca59cdbd634"
-SRC_URI[jiff-static-0.2.31.sha256sum] = "e165e897f662d428f3cd3828a919dbe067c2d42bb1031eede74ef9d27ecdedd2"
+SRC_URI[jiff-0.2.32.sha256sum] = "961d16382652bfdd8c6f68b223b26a8c93e0d475c672f414411db31c6c5c900e"
+SRC_URI[jiff-static-0.2.32.sha256sum] = "d0879bd39df99c4c5e2c6615ccc026391a423dde10532c573e6086eb94a802cc"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
@@ -405,7 +410,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -438,14 +443,15 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
-SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
-SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-1.13.0.sha256sum] = "2a0e75113e14dc5acb068cd0786884f214f1312650a3d36d269f5c4f3cdee8a2"
+SRC_URI[regex-automata-0.4.15.sha256sum] = "1f388202e4b80542a0921078cc23b6333bcf1409c1e3f86404cae4766a6131db"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
@@ -520,12 +526,13 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
+SRC_URI[uuid-1.23.5.sha256sum] = "ea5fab0d6c3c01ae70085a09cb03d4c7a1d6314e2b3e075392783396d724ca0a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -555,6 +562,7 @@ SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de3
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.30.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.30.bb
index 202e7f1834..86ee132c5f 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.30.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "7dd16d50366f410ae494a27be20b45206feeac37d99dc53abfa1a04410069b78"
+SRC_URI[sha256sum] = "6b97502300880ce57aaad16ec0863bc03c0b9fc90e4df1475af0812489acd2ac"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============1084343270391800420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.30.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.30.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.30.dist-info

--===============1084343270391800420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.29.tar.gz;downloadfilename=uv_build-0.11.29.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates
 .io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.
 0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 c
 rate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.31 crate://crates.io/jiff-static/0.2.31 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 cr
 ate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pe
 st_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates
 .io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/sm
 awk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://cra
 tes.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.4 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winap
 i-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.
 3 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.30.tar.gz;downloadfilename=uv_build-0.11.30.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate:
 //crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0
 .2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate:
 //crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate:
 //crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.32 crate://crates.io/jiff-static/0.2.32 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/mu
 nge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta
 _derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.0 crate://crates.io/regex-automata/0.4.15 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/
 serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://cra
 tes.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://
 crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.5 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4
 .2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://
 crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.29" to "0.11.30"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5360946 to 5356850 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.30.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.30.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.29 [default] to 0.11.30 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.29" to "0.11.30"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.30.dist-info

--===============1084343270391800420==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.29-0.11.30.patch"

RnJvbSA1YTU1NWI2YzFkMjRiY2VmYmMyOWZjNDljNGZiM2Y5MDBmMTgxZTE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjEgSnVsIDIwMjYgMDU6MjE6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuMjkgLT4gMC4xMS4zMAoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCAzNiArKysrKysrKysrKy0t
LS0tLS0tCiAuLi4wLjExLjI5LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4zMC5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMjkuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjMwLmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggZjFkZTM4ODc4Yy4uYWQ3MDYwYzNiYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTI4LDcgKzI4LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9idW1w
YWxvLzMuMjAuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZWNoZWNrLzAuOC4yIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlY2hlY2tfZGVyaXZlLzAuOC4yIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9ieXRlcy8xLjEyLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVzLzEu
MTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnppcDIvMC41LjIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2J6aXAyLXN5cy8wLjEuMTMrMS4wLjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NjLzEuMi41NyBcCkBAIC04MSw2ICs4MSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZnV0dXJlcy10YXNrLzAuMy4zMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZnV0dXJlcy11dGlsLzAuMy4zMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJh
eS8wLjE0LjcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjMuNCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZ2V0cmFuZG9tLzAuNC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9nbG9ic2V0LzAuNC4xOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvby10aW1lcnMvMC4z
LjAgXApAQCAtMTAzLDggKzEwNCw4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaXNfdGVybWluYWxfcG9seWZpbGwvMS43MC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pdGVydG9vbHMvMC4xNC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pdG9hLzEuMC4xNyBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi8wLjIuMzEgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2ppZmYtc3RhdGljLzAuMi4zMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi8wLjIu
MzIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtc3RhdGljLzAuMi4zMiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vamlmZi10emRiLzAuMS42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9q
aWZmLXR6ZGItcGxhdGZvcm0vMC4xLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pvYnNlcnZl
ci8wLjEuMzUgXApAQCAtMTIwLDcgKzEyMSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbHptYS1zeXMvMC4xLjIwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYWls
cGFyc2UvMC4xNi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYXRjaGVycy8wLjIuMCBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuOC4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9tZW1jaHIvMi44LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbml6X294aWRlLzAuOC45
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9taW8vMS4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL211bmdlLzAuNC43IFwKQEAgLTE1MywxNCArMTU0LDE1IEBAIFNSQ19VUkkgKz0gIiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGFfZGVyaXZlLzAuMy4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9xdW90ZS8xLjAuNDYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlZF9w
cmludGFibGUvMC41LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ItZWZpLzUuMy4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS82LjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cmFuY29yLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWRveF9zeXNjYWxsLzAuNS4x
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmLWNhc3QvMS4wLjI1IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9yZWYtY2FzdC1pbXBsLzEuMC4yNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cmVmbGluay1jb3B5LzAuMS4zMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMi40
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTQgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3JlZ2V4LzEuMTMuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVn
ZXgtYXV0b21hdGEvMC40LjE1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1zeW50YXgv
MC44LjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZW5kLzAuNS4zIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9ya3l2LzAuOC4xNyBcCkBAIC0yMzUsMTIgKzIzNywxMyBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybC8yLjUuOCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4cGFyc2Uv
MC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQvMS4yMy40IFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby91dWlkLzEuMjMuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmFsdWFibGUv
MC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZlcnNpb25fY2hlY2svMC45LjUgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dh
bGtkaXIvMi41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xMS4xK3dhc2ktc25h
cHNob3QtcHJldmlldzEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2lwMi8xLjAuNCt3YXNp
LTAuMi4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLzAuMi4xMTQgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1tYWNyby8wLjIuMTE0IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4tbWFjcm8tc3VwcG9ydC8wLjIuMTE0IFwKQEAg
LTI3MCw2ICsyNzMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dp
bmRvd3NfeDg2XzY0X2dudWxsdm0vMC41Mi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzX3g4Nl82NF9tc3ZjLzAuNTIuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lubm93LzEu
MC4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQtYmluZGdlbi8wLjU3LjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dyaXRlYWJsZS8wLjYuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
eGF0dHIvMS42LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3h6Mi8wLjEuNyBcCkBAIC0zMTMs
NyArMzE3LDcgQEAgU1JDX1VSSVtic3RyLTEuMTIuMS5zaGEyNTZzdW1dID0gIjYzMDQ0ZTFhZThl
NjlmM2I1YTkyYzczNmNhNjI2OWI4ZDEyZmE3ZWZlMzliZjMKIFNSQ19VUklbYnVtcGFsby0zLjIw
LjIuc2hhMjU2c3VtXSA9ICI1ZDIwNzg5ODY4ZjRiMDFiMmYyY2FlYzlmNWM0ZTAyMTNiNDFlM2U1
NzAyYTUwMTU3ZDY5OWFlMzFjZWQyZmNiIgogU1JDX1VSSVtieXRlY2hlY2stMC44LjIuc2hhMjU2
c3VtXSA9ICIwY2FhMzNhMmMwZWRjYTA0MTlkMTVhYzcyM2RmZjAzZjE5NTZmNzk3ODMyOWIxZTNi
NWZkYWFhZWQ5ZDNjYThiIgogU1JDX1VSSVtieXRlY2hlY2tfZGVyaXZlLTAuOC4yLnNoYTI1NnN1
bV0gPSAiODkzODVlODJiNWQxODIxZDIyMTllMGIwOTVlZmEyY2MxZjI0NmNiZjk5MDgwZjNiZTQ2
YTFhODVjMGQzOTJkOSIKLVNSQ19VUklbYnl0ZXMtMS4xMi4wLnNoYTI1NnN1bV0gPSAiOGFlM2Y1
ZDMxNTkyNDI3MDUzMDIwN2UyYTY4Mzk2YzNjYzU0N2Y2ZGNhM2ZiZGNhMzE3Y2ZiMWE1MWVkYjU5
MyIKK1NSQ19VUklbYnl0ZXMtMS4xMi4xLnNoYTI1NnN1bV0gPSAiZmM2NTJhNDhjMzUyYWVmM2Vh
M2FlZDMyMDgwNTAxY2YzZWY2ZWQ1ZGE3ODYwMmEwMjBjOTkxNzc1YjBhZmYwNCIKIFNSQ19VUklb
YnppcDItMC41LjIuc2hhMjU2c3VtXSA9ICI0OWVjZmIyMmQ5MDZmODAwZDRmZTgzM2I2MjgyY2Y0
ZGMxYzI5OGY1MDU3Y2EwYjU0NDVlNWMyMDk3MzVjYTQ3IgogU1JDX1VSSVtiemlwMi1zeXMtMC4x
LjEzKzEuMC44LnNoYTI1NnN1bV0gPSAiMjI1YmZmMzNiMjE0MTg3NGZlODBkNzFlMDdkNmVlYzRm
ODVjNWMyMTY0NTNkZDk2Mzg4MjQwZjk2ZTFhY2MxNCIKIFNSQ19VUklbY2MtMS4yLjU3LnNoYTI1
NnN1bV0gPSAiN2EwZGQxY2EzODQ5MzJmZjM2NDFjODcxOGEwMjc2OWYxNjk4ZTc1NjNkYzY5NzRm
ZmQwMzM0NjExNjMxMDQyMyIKQEAgLTM2Niw2ICszNzAsNyBAQCBTUkNfVVJJW2Z1dHVyZXMtc2lu
ay0wLjMuMzIuc2hhMjU2c3VtXSA9ICJjMzk3NTRlMTU3MzMxYjAxMzk3OGVjOTE5OTJiZGUxYWMw
ODk4NAogU1JDX1VSSVtmdXR1cmVzLXRhc2stMC4zLjMyLnNoYTI1NnN1bV0gPSAiMDM3NzExYjNk
NTljMzMwMDRkMzg1NmZiZGM4M2I5OWQ0ZmYzN2EyNDc2OGZhMWJlOWNlMzUzOGExY2RlNDM5MyIK
IFNSQ19VUklbZnV0dXJlcy11dGlsLTAuMy4zMi5zaGEyNTZzdW1dID0gIjM4OWNhNDEyOTZlNjE5
MGI0ODA1M2RlMDMyMWQwMmE3N2YzMmY4YTVkMjQ2MWRkMzg3NjJjMDU5MzgwNWM2ZDYiCiBTUkNf
VVJJW2dlbmVyaWMtYXJyYXktMC4xNC43LnNoYTI1NnN1bV0gPSAiODU2NDljYTUxZmQ3MjI3MmQ3
ODIxYWRhZjI3NGFkOTFjMjg4Mjc3NzEzZDljMTg4MjBkODQ5OWE3ZmY2OWU5YSIKK1NSQ19VUklb
Z2V0cmFuZG9tLTAuMy40LnNoYTI1NnN1bV0gPSAiODk5ZGVmNWMzN2M0ZmQ3YjI2NjQ2NDhjMjgx
MjBlY2VjMTM4ZTRkMzk1YjQ1OWU1Y2EzNGY5Y2NlMmRkNzdmZCIKIFNSQ19VUklbZ2V0cmFuZG9t
LTAuNC4zLnNoYTI1NnN1bV0gPSAiMzAwZTg4M2Q3NTZiMmU0ZWM5NGUwMjc5MWYzOWIwNGI1MjIy
NzYxMzg4NTJjZmM0MWQ5ZmI3ZTkwNDEwNjA5OSIKIFNSQ19VUklbZ2xvYnNldC0wLjQuMTguc2hh
MjU2c3VtXSA9ICI1MmRmYzE5MTUzYTQ4YmRlMGNiZDYzMDQ1MzYxNWM4MTUxYmNlM2E1YWRmYWM3
YTBhZWJmYmYwYTFlMWY1N2UzIgogU1JDX1VSSVtnbG9vLXRpbWVycy0wLjMuMC5zaGEyNTZzdW1d
ID0gImJiYjE0M2NmOTYwOTk4MDIwMzNlMGQ0ZjQ5NjNiMTlmZDJlMGI3MjhiY2YwNzZjZDljZjdm
NjYzNGYwOTI5OTQiCkBAIC0zODgsOCArMzkzLDggQEAgU1JDX1VSSVtpbnN0YS0xLjQ4LjAuc2hh
MjU2c3VtXSA9ICI4NmYwZjhmZWU4YzkyNjQxNWM1OGQ2YWU0M2EwODUyM2EyNmZhY2NiMjMyM2YK
IFNSQ19VUklbaXNfdGVybWluYWxfcG9seWZpbGwtMS43MC4yLnNoYTI1NnN1bV0gPSAiYTZjYjEz
OGJiNzlhMTQ2YzFiZDQ2MDAwNTYyM2UxNDJlZjAxODFlM2QwMjE5Y2I0OTNlMDJmN2QwOGEzNTY5
NSIKIFNSQ19VUklbaXRlcnRvb2xzLTAuMTQuMC5zaGEyNTZzdW1dID0gIjJiMTkyYzc4MjAzN2Zh
ZGQ5Y2ZhNzU1NDgzMTA0ODhhYWJkYmYzZDJkYTczODg1YjMxYmQwYWJkMDMzNTEyODUiCiBTUkNf
VVJJW2l0b2EtMS4wLjE3LnNoYTI1NnN1bV0gPSAiOTJlY2M2NjE4MTgxZGVmMDQ1NzM5MmNjZDBl
ZTUxMTk4ZTA2NWUwMTZkMWQ1MjdhN2FjMWI2ZGM3YzFmMDlkMiIKLVNSQ19VUklbamlmZi0wLjIu
MzEuc2hhMjU2c3VtXSA9ICJjY2ZlNjEyMWNiZTc1MGNmODFlZmEzNjJkODVjMGJkZTdlYTI5OGVj
NDMwOTJkM2ExOTNiYWNhNTljZGJkNjM0IgotU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIuMzEuc2hh
MjU2c3VtXSA9ICJlMTY1ZTg5N2Y2NjJkNDI4ZjNjZDM4MjhhOTE5ZGJlMDY3YzJkNDJiYjEwMzFl
ZWRlNzRlZjlkMjdlY2RlZGQyIgorU1JDX1VSSVtqaWZmLTAuMi4zMi5zaGEyNTZzdW1dID0gIjk2
MWQxNjM4MjY1MmJmZGQ4YzZmNjhiMjIzYjI2YThjOTNlMGQ0NzVjNjcyZjQxNDQxMWRiMzFjNmM1
YzkwMGUiCitTUkNfVVJJW2ppZmYtc3RhdGljLTAuMi4zMi5zaGEyNTZzdW1dID0gImQwODc5YmQz
OWRmOTljNGM1ZTJjNjYxNWNjYzAyNjM5MWE0MjNkZGUxMDUzMmM1NzNlNjA4NmViOTRhODAyY2Mi
CiBTUkNfVVJJW2ppZmYtdHpkYi0wLjEuNi5zaGEyNTZzdW1dID0gImM5MDBlZjg0ODI2ZjEzMzhh
NTU3Njk3ZGM4ZmM2MDFkZjljYTlhZjRhYzEzN2M3ZmI2MWQ0YzZmMmRmZDMwNzYiCiBTUkNfVVJJ
W2ppZmYtdHpkYi1wbGF0Zm9ybS0wLjEuMy5zaGEyNTZzdW1dID0gIjg3NWE1YTY5YWMyYmFiMWE4
OTE3MTFjZjVlY2NiZWMxY2UwMzQxZWE4MDU1NjBkY2Q5MGI3YTJlOTI1MTMyZTgiCiBTUkNfVVJJ
W2pvYnNlcnZlci0wLjEuMzUuc2hhMjU2c3VtXSA9ICIxYzAwYWNiZDI5ZWFiYWQ0YTIzOTJmYTBl
OTIxYzg3NDkzNGRiYmY0MTk0MzEyYWQyMGYwNGEwZWQ2N2EzY2IzIgpAQCAtNDA1LDcgKzQxMCw3
IEBAIFNSQ19VUklbbG9nLTAuNC4yOS5zaGEyNTZzdW1dID0gIjVlNTAzMmUyNDAxOTA0NWM3NjJk
M2MwZjI4ZjViNmI4YmJmMzg1NjNhNjU5MDgzCiBTUkNfVVJJW2x6bWEtc3lzLTAuMS4yMC5zaGEy
NTZzdW1dID0gIjVmZGEwNGFiMzc2NGU2Y2RlNzhiOTk3NGVlYzRmNzc5YWNhYmE3YzRlODRiMzZl
Y2EzY2Y3N2M1ODFiODVkMjciCiBTUkNfVVJJW21haWxwYXJzZS0wLjE2LjEuc2hhMjU2c3VtXSA9
ICI2MDgxOWE5N2RkY2I4MzFhNTYxNGViM2IwMTc0ZjM2MjBlNzkzZTk3ZTA5MTk1YTM5NWJmYTk0
OGZkNjhlZDJmIgogU1JDX1VSSVttYXRjaGVycy0wLjIuMC5zaGEyNTZzdW1dID0gImQxNTI1YTJh
MjhjN2Y0ZmEwZmM5OGJiOTFhZTc1NWQxZTJkMTUwNTA3OWUwNTUzOWUzNWJjODc2YjVkNjVhZTki
Ci1TUkNfVVJJW21lbWNoci0yLjguMi5zaGEyNTZzdW1dID0gIjg4OTA0NDM0YWJjMjkwMWYxOTdm
ZThjYzU1ZjA0NDVlN2RlZDkyMWRiYTU5MTFkYWQyZTJiMzliNDhlNjYzYzQiCitTUkNfVVJJW21l
bWNoci0yLjguMy5zaGEyNTZzdW1dID0gImNmOGJhZjFjNTVlNjJmZmNhY2U3YTlmMDZmNGJkOWNk
M2YwYzRiZWIwMjJkM2IzNjcyNTZiOTFiODc1MTNkOTgiCiBTUkNfVVJJW21pbml6X294aWRlLTAu
OC45LnNoYTI1NnN1bV0gPSAiMWZhNzZhMmM4NmY3MDRiZGIyMjJkNjY5NjVmYjNkNjMyNjljZTM4
NTE4YjgzY2IwNTc1ZmNhODU1ZWJiNjMxNiIKIFNSQ19VUklbbWlvLTEuMi4wLnNoYTI1NnN1bV0g
PSAiNTBiN2U1YjI3YWEwMmE3NGJhYzhjM2YyM2Y0NDhmOGQ4N2ZmMTFmOTJkM2FhYzFhNmVkMzY5
ZWUwOGNjNTZjMSIKIFNSQ19VUklbbXVuZ2UtMC40Ljcuc2hhMjU2c3VtXSA9ICI1ZTE3NDAxZjI1
OWViYTk1NmNhMTY0OTE0NjFiNmU4ZjcyOTEzYTBhMTE0ZTM5NzM2Y2U0MDQ0MTBmOTE1YTBjIgpA
QCAtNDM4LDE0ICs0NDMsMTUgQEAgU1JDX1VSSVtwdHJfbWV0YS0wLjMuMS5zaGEyNTZzdW1dID0g
IjBiOWEwY2Y5NWExMTk2YWY2MWQ0ZjFjYmRhYjk2NzE3OTUxNmQ5YTRhNDMKIFNSQ19VUklbcHRy
X21ldGFfZGVyaXZlLTAuMy4xLnNoYTI1NnN1bV0gPSAiNzM0Nzg2N2QwYTdlMTIwOGQ5M2I0Njc2
N2JlODNlMmI4Zjk3OGMzZGFkMzVmNzc1YWM4ZDg4NDc1NTFkNmZlMSIKIFNSQ19VUklbcXVvdGUt
MS4wLjQ2LnNoYTI1NnN1bV0gPSAiZGZiYzQ1N2QwYzdhMDc1OWE2MTQ1NTFiMTFhNjQwOWU1OTUx
ZjZjNzUzN2JlMWYxYjc2ODJiOWFlOTIzMDM2OCIKIFNSQ19VUklbcXVvdGVkX3ByaW50YWJsZS0w
LjUuMS5zaGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1YWVlZjUzNzUxNDRjMjYwNjJlMGRj
ZDU5MzlkZmNiYjBmNWRiNzZjYjhjMTdjNzMiCitTUkNfVVJJW3ItZWZpLTUuMy4wLnNoYTI1NnN1
bV0gPSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZk
YmQ3ZjM0Njc1NGIwZiIKIFNSQ19VUklbci1lZmktNi4wLjAuc2hhMjU2c3VtXSA9ICJmOGRjYzlj
N2Q1MmE4MTE2OTdkMjE1MWM3MDFlMGQwODk1NmY5MmIwZTI0MTM2Y2Y0Y2YyN2I1N2E2YTBkOWJm
IgogU1JDX1VSSVtyYW5jb3ItMC4xLjEuc2hhMjU2c3VtXSA9ICJhMDYzZWE3MjM4MTUyN2MyYTA1
NjFkYTljODAwMDBlZjgyMmJkZDdjMzI0MWIxY2MxYjEyMTAwZTNkZjA4MWVlIgogU1JDX1VSSVty
ZWRveF9zeXNjYWxsLTAuNS4xNS5zaGEyNTZzdW1dID0gIjdlOGFmMGRkZTA5NDAwNjAxMWU2YTc0
MGQ0ODc5MzE5NDM5NDg5ODEzYmQwYmNkYzdkODIxYmVhZWVmZjQ4ZWMiCiBTUkNfVVJJW3JlZi1j
YXN0LTEuMC4yNS5zaGEyNTZzdW1dID0gImYzNTQzMDBhZTY2Zjc2ZjFjODVjNWY4NDY5M2YwY2U4
MWQ3NDdlMmMzZjIxYTQ1ZmVmNDk2ZDg5Yzk2MGJmN2QiCiBTUkNfVVJJW3JlZi1jYXN0LWltcGwt
MS4wLjI1LnNoYTI1NnN1bV0gPSAiYjcxODYwMDZkY2IyMTkyMDk5MDA5M2YzMGUzZGVhNjNiN2Q2
ZTk3N2JmMTI1NmJlMjBjMzU2M2E1ZGIwNzBkYSIKIFNSQ19VUklbcmVmbGluay1jb3B5LTAuMS4z
MC5zaGEyNTZzdW1dID0gImQ5ZGQ3YWI0YWYwMzYzZDVjY2ZkMjgzOGQ3ODJhMjgxOTZjZjMyYTVj
YzJlNGZlM2M1ZGM4M2YyYmU1ODhiOGIiCi1TUkNfVVJJW3JlZ2V4LTEuMTIuNC5zaGEyNTZzdW1d
ID0gImYxMjkyYjc3NTlhZTFjYjllYzE5NTQ1MmQxMzkwYTA3NGYwY2Q4NTQxYWI3YTVhOGMzMWNk
NmRiNDVkNGE2YmEiCi1TUkNfVVJJW3JlZ2V4LWF1dG9tYXRhLTAuNC4xNC5zaGEyNTZzdW1dID0g
IjZlMWRkNDEyMmZjMTU5NWU4MTYyNjE4OTQ1NDc2ODkyZWVmY2E3Yjg4YzUyODIwZTc0YWY2MjYy
MjEzY2FlOGYiCitTUkNfVVJJW3JlZ2V4LTEuMTMuMC5zaGEyNTZzdW1dID0gIjJhMGU3NTExM2Ux
NGRjNWFjYjA2OGNkMDc4Njg4NGYyMTRmMTMxMjY1MGEzZDM2ZDI2OWY1YzRmM2NkZWU4YTIiCitT
UkNfVVJJW3JlZ2V4LWF1dG9tYXRhLTAuNC4xNS5zaGEyNTZzdW1dID0gIjFmMzg4MjAyZTRiODA1
NDJhMDkyMTA3OGNjMjNiNjMzM2JjZjE0MDljMWUzZjg2NDA0Y2FlNDc2NmE2MTMxZGIiCiBTUkNf
VVJJW3JlZ2V4LXN5bnRheC0wLjguMTEuc2hhMjU2c3VtXSA9ICJkNmY2ZmY5YTM3ODQ4NWIyOThh
NTI4NjY1NmRhNjY1YmE3NDQxM2QzNmRiMDk3OTYzMzI3NWQyZTcwODE0NWQ0IgogU1JDX1VSSVty
ZW5kLTAuNS4zLnNoYTI1NnN1bV0gPSAiY2FkYWRlZjMxN2MyZjIwNzU1YTY0ZDdmZGM0OGY5ZTcx
NzhlZTZiMGUxZjdmY2UzM2ZhNjBmMWQ2OGEyNzZlNiIKIFNSQ19VUklbcmt5di0wLjguMTcuc2hh
MjU2c3VtXSA9ICI4MTVjYzhhMzcxNTlhNDYzMDY0ODI1MjQ2Y2FkYjA3OTYxZTI1Y2Q5ODg1OTA4
NjA2ZjZkMDhhOThkOGY4ODc0IgpAQCAtNTIwLDEyICs1MjYsMTMgQEAgU1JDX1VSSVt1bnNjYW5u
eS0wLjEuMC5zaGEyNTZzdW1dID0gImU5ZGYyYWYwNjdhNzk1M2U5YzM4MzEzMjBmMzVjMWNjMDYw
MGMzMGQ0NGQKIFNSQ19VUklbdXJsLTIuNS44LnNoYTI1NnN1bV0gPSAiZmY2N2E4YTQzOTczNzNj
M2VmNjYwODEyYWNhYjMyNjgyMjIwMzUwMTBhYjg2ODBlYzQyMTVmMzhiYTNkMGVlZCIKIFNSQ19V
UklbdXRmOF9pdGVyLTEuMC40LnNoYTI1NnN1bV0gPSAiYjZjMTQwNjIwZTdmZmJiMjJjMmRlZTU5
Y2FmZTYwODRhNTliNWZmYzI3YTg4NTlhNWYwZDQ5NGI1ZDUyYjZiZSIKIFNSQ19VUklbdXRmOHBh
cnNlLTAuMi4yLnNoYTI1NnN1bV0gPSAiMDZhYmRlMzYxMTY1N2FkZjY2ZDM4M2YwMGIwOTNkN2Zh
ZWNjN2ZhNTcwNzFjY2UyNTc4NjYwYzlmMTAxMDgyMSIKLVNSQ19VUklbdXVpZC0xLjIzLjQuc2hh
MjU2c3VtXSA9ICJiZjgwYTcyODQ1Mjc1YWZlYTk5ZTdmMmI0MzQ3MjNkM2JjN2UzODQ3MGZjZDFj
N2VkMzlhNTk5YzczMzE5YTUzIgorU1JDX1VSSVt1dWlkLTEuMjMuNS5zaGEyNTZzdW1dID0gImVh
NWZhYjBkNmMzYzAxYWU3MDA4NWEwOWNiMDNkNGM3YTFkNjMxNGUyYjNlMDc1MzkyNzgzMzk2ZDcy
NGNhMGEiCiBTUkNfVVJJW3ZhbHVhYmxlLTAuMS4xLnNoYTI1NnN1bV0gPSAiYmE3M2VhOWNmMTZh
MjVkZjBjOGNhYTE2YzUxYWNiOTM3ZDU3MTJhODQyOWRiNzhhM2VlMjlkNWRjYWNkM2E2NSIKIFNS
Q19VUklbdmVyc2lvbl9jaGVjay0wLjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMzZDk3NWZjNmFk
OWY4NmM4ZjI4Mzg1M2FkMjZiZGQ1YjEwYjdmMTU0MmFhMmZhMTVlMjI4OTEwNWEiCiBTUkNfVVJJ
W3Z0ZS0wLjE0LjEuc2hhMjU2c3VtXSA9ICIyMzFmZGNkN2VmMzAzN2U4MzMwZDhlMTdlNjEwMTFh
MmMyNDQxMjZhY2MwYTk4MmY0MDQwYWMzZjlmMGJjMDc3IgogU1JDX1VSSVt3YWxrZGlyLTIuNS4w
LnNoYTI1NnN1bV0gPSAiMjk3OTA5NDY0MDRmOTFkOWM1ZDA2Zjk4NzRlZmRkZWExZGMwNmM1ZWZl
OTQ1NDFhN2Q2ODYzMTA4ZTNhNWU0YiIKIFNSQ19VUklbd2FzaS0wLjExLjErd2FzaS1zbmFwc2hv
dC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gImNjZjNlYzY1MWE4NDdlYjAxZGU3M2NjYWQxNWViN2Q5
OWY4MDQ4NWRlMDQzZWZiMmYzNzBjZDY1NGY0ZWE0NGIiCitTUkNfVVJJW3dhc2lwMi0xLjAuNCt3
YXNpLTAuMi4xMi5zaGEyNTZzdW1dID0gImI2N2VmYjM3ZTEwNmU1NWNlNzIyYTUxMGQ2YjVmOWMx
N2YwODNlNWZjNzlhZmMyYmFkZWIxMmNjMzEzZDk0ODciCiBTUkNfVVJJW3dhc20tYmluZGdlbi0w
LjIuMTE0LnNoYTI1NnN1bV0gPSAiNjUzMmY5YTVjMWVjZTM3OThjYjFjMmNmZGJhNjQwYjliM2Jh
ODg0ZjVkYjQ1OTczYTZmNDQyNTEwYTg3ZDM4ZSIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLW1hY3Jv
LTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIxOGEyZDUwZmNmMTA1ZmIzM2JiMTVmMDBlN2E3N2I3NzI5
NDVhMmVlNDVkY2Y0NTQ5NjFmZDg0M2U3NGMxOGU2IgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tbWFj
cm8tc3VwcG9ydC0wLjIuMTE0LnNoYTI1NnN1bV0gPSAiMDNjZTRjYWVhYWM1NDdjZGY3MTNkMjgw
ZWRhMjJhNzMwODI0ZGQxMWU2YjhjM2NhOWU0MjI0N2IyNWM2MzFlMyIKQEAgLTU1NSw2ICs1NjIs
NyBAQCBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjUyLjYuc2hhMjU2c3VtXSA9ICIxNDdh
NWM4MGFhYmZiZjBjN2Q5MDFjYjU4OTVkMWRlMwogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVs
bHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5NmYyYjQ5ZjNk
ZThjMTQ3M2RlYjUxNmJkMzQ0MTA4NzJlZmY1MWVkMGQiCiBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0
X21zdmMtMC41Mi42LnNoYTI1NnN1bV0gPSAiNTg5ZjZkYTg0YzY0NjIwNDc0N2QxMjcwYTJhNTY2
MWVhNjZlZDFjY2VkMjYzMWQ1NDZmZGZiMTU1OTU5ZjllYyIKIFNSQ19VUklbd2lubm93LTEuMC4z
LnNoYTI1NnN1bV0gPSAiMDU5MmUxYzlkMTUxZjg1NGU2ZmQzODI1NzRjM2EwODU1MjUwZTFkOWIy
Zjk5ZDkyODFjNmU2MzkxYWYzNTJmMSIKK1NSQ19VUklbd2l0LWJpbmRnZW4tMC41Ny4xLnNoYTI1
NnN1bV0gPSAiMWViZjk0NGU4N2E3YzI1MzIzM2FkNjc2NmUwODJlM2NkNzE0YjVkMDM4MTJhY2My
NGMzMThmNTQ5NjE0NTM2ZSIKIFNSQ19VUklbd3JpdGVhYmxlLTAuNi4yLnNoYTI1NnN1bV0gPSAi
OWVkZGUwZGI0NzY5ZDJkYzY4NTc5ODkzZjIzMDZiMjZjNmVjZmJlMGVmNDk5YjAxM2Q3MzFiN2I5
MjQ3ZTBiOSIKIFNSQ19VUklbeGF0dHItMS42LjEuc2hhMjU2c3VtXSA9ICIzMmU0NWFkNDIwNmY2
ZDI0NzkwODUxNDdmMDJiYzJlZjgzNGFjODU4ODY2MjRhMjM1NzVhZTEzN2M4YWE4MTU2IgogU1JD
X1VSSVt4ejItMC4xLjcuc2hhMjU2c3VtXSA9ICIzODhjNDRkYzA5ZDc2ZjE1MzY2MDJlYWQ2ZDMy
NWViNTMyZjVjMTIyZjE3NzgyYmQ1N2ZiNDdiYWVlYjc2N2UyIgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMjkuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4zMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMzAuYmIKaW5kZXggMjAyZTdmMTgzNC4u
ODZlZTEzMmM1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXV2LWJ1aWxkXzAuMTEuMjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMzAuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS1BUEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJk
ODk4Njk2OGY0MzI3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1
MDgvTGljZW5zZS1BcGFjaGU7bWQ1PWUyM2ZhZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1CU0Q7
bWQ1PWVmN2E2MDI3ZGM0YzIzODliOWFmYWQ3ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2RkMTZkNTAzNjZmNDEwYWU0OTRhMjdiZTIwYjQ1MjA2ZmVlYWMzN2Q5OWRjNTNhYmZh
MWEwNDQxMDA2OWI3OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2Yjk3NTAyMzAwODgwY2U1N2Fh
YWQxNmVjMDg2M2JjMDNjMGI5ZmM5MGU0ZGYxNDc1YWYwODEyNDg5YWNkMmFjIgogCiByZXF1aXJl
ICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDcuMQoK

--===============1084343270391800420==--

