Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5336.1793687202716750930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kEh/LmF7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bZxRTsJb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1a016a8ec-22b6970f-702b-49cb-891a-f4c27306d57b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r0OVm9/ujXDC9TUlxYdAvwiuXb32209eDVdswfI5ZmI=;
	b=kEh/LmF79tIdOmLhau8oBOBYXgHrRT+GzxQqHkcZ2b7A95mjJLAust6zdxM+htxP
	bg5QmW0WxTQff3M2xMXQpb5s3Rc0JVkW1/oUHd4hxWWeH4FsLBk7jXFy1CNXiJKP520
	CkZHdMclfWM5yB1Pbe7M64XMMm1TTyPAoPuj2iJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r0OVm9/ujXDC9TUlxYdAvwiuXb32209eDVdswfI5ZmI=;
	b=bZxRTsJbBJYQD0uUxUr+kXKUpFfqtRJ2OtZRkT05cEsZBFoitmGbtSWYx0GsI+Hk
	FjIaJlrKMU+7sMQ6cs9/IAtvyn2aclLjKVcFqnUhkfUW4YUfYZ7zc6XI0g+QovbX/Uq
	I6QBSEMopmt2/EZUq/Ujzxdj2tkwR8o95gb6KzV4=
Content-Type: multipart/mixed; boundary="===============6206311575626002961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.7 SUCCEEDED
Message-ID: <010101a1a016a8ec-22b6970f-702b-49cb-891a-f4c27306d57b-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249237

--===============6206311575626002961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.5-0.13.7.patch
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
From c4aa02103adc2df4e1d46b16c8b52bc23ddc68ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 05:54:15 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.5 -> 0.13.7

---
 .../python/python3-uv-build-crates.inc        | 42 ++++++++++---------
 ...d_0.13.5.bb => python3-uv-build_0.13.7.bb} |  2 +-
 2 files changed, 23 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.5.bb => python3-uv-build_0.13.7.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index a5746f7693..d668493bd0 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -18,10 +18,11 @@ SRC_URI += " \
     crate://crates.io/astral-tokio-tar/0.7.0 \
     crate://crates.io/astral-version-ranges/0.2.3 \
     crate://crates.io/astral_async_zip/0.0.22 \
-    crate://crates.io/async-compression/0.4.48 \
+    crate://crates.io/async-compression/0.4.50 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
+    crate://crates.io/base64/0.23.1 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/block-buffer/0.10.4 \
@@ -103,7 +104,7 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/insta/1.48.0 \
+    crate://crates.io/insta/1.49.0 \
     crate://crates.io/io-extras/0.19.0 \
     crate://crates.io/io-lifetimes/2.0.4 \
     crate://crates.io/io-lifetimes/3.0.1 \
@@ -115,7 +116,7 @@ SRC_URI += " \
     crate://crates.io/jiff-core/0.1.0 \
     crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/js-sys/0.3.91 \
-    crate://crates.io/junction/2.0.0 \
+    crate://crates.io/junction/2.1.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/libc/0.2.189 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -192,10 +193,10 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.1 \
+    crate://crates.io/smallvec/1.16.2 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
-    crate://crates.io/spdx/0.13.5 \
+    crate://crates.io/spdx/0.13.6 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
@@ -208,8 +209,8 @@ SRC_URI += " \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.4 \
-    crate://crates.io/thiserror/2.0.20 \
-    crate://crates.io/thiserror-impl/2.0.20 \
+    crate://crates.io/thiserror/2.0.21 \
+    crate://crates.io/thiserror-impl/2.0.21 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
@@ -237,7 +238,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.26.1 \
+    crate://crates.io/uuid/1.27.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -286,8 +287,8 @@ SRC_URI += " \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
-    crate://crates.io/zerocopy/0.8.57 \
-    crate://crates.io/zerocopy-derive/0.8.57 \
+    crate://crates.io/zerocopy/0.8.63 \
+    crate://crates.io/zerocopy-derive/0.8.63 \
     crate://crates.io/zerofrom/0.1.6 \
     crate://crates.io/zerofrom-derive/0.1.6 \
     crate://crates.io/zerotrie/0.2.3 \
@@ -313,10 +314,11 @@ SRC_URI[astral-mail-headers-0.0.1.sha256sum] = "dc019ecca82cfc91ffa31ab4ffe705aa
 SRC_URI[astral-tokio-tar-0.7.0.sha256sum] = "6f2e989b33246fe9240d39accf4dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
 SRC_URI[astral-version-ranges-0.2.3.sha256sum] = "b315acc4dc7f0d3ccdd557a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
 SRC_URI[astral_async_zip-0.0.22.sha256sum] = "0f8508d09c6bc6abd42767d1d43c7702891691484875ce94f7997da1301d95e9"
-SRC_URI[async-compression-0.4.48.sha256sum] = "fb61aea1a7def73ee7c350a184f0e70b32c182344e2e75bf70c9b621b83417fd"
+SRC_URI[async-compression-0.4.50.sha256sum] = "ee19bd99b43e3691acbad4e840420a4881cea6c0b66a208125a824f8fd53f5a1"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[base64-0.23.1.sha256sum] = "ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
@@ -398,7 +400,7 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
+SRC_URI[insta-1.49.0.sha256sum] = "b67d3d2e287e4b86c10b3f3b641033d1f89b74bdb39d05f34952e2b9a6fe21cd"
 SRC_URI[io-extras-0.19.0.sha256sum] = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
 SRC_URI[io-lifetimes-2.0.4.sha256sum] = "06432fb54d3be7964ecd3649233cddf80db2832f47fec34c01f65b3d9d774983"
 SRC_URI[io-lifetimes-3.0.1.sha256sum] = "2f0fb0570afe1fed943c5c3d4102d5358592d8625fda6a0007fdbe65a92fba96"
@@ -410,7 +412,7 @@ SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e6
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
 SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
-SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
+SRC_URI[junction-2.1.0.sha256sum] = "cde48f36530cbd91b65f050101e6c056d6eb743cea2a8f0f19beef69c6742ff8"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
@@ -487,10 +489,10 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.1.sha256sum] = "ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891"
+SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
-SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
+SRC_URI[spdx-0.13.6.sha256sum] = "646c5a367da914e3babcb9cd8e91c37ccaac42325b8f86f036513ad103f2a716"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
@@ -503,8 +505,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab2
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.4.sha256sum] = "6ecfad6c3abc80a577f2b91c1e412ee57e7a060d430b553c1b0c940974ebcd49"
-SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
-SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
+SRC_URI[thiserror-2.0.21.sha256sum] = "09e52cb86a36cede5cb101bf8908837b3e4c6e5e59fe7fd85c23fb56200d189e"
+SRC_URI[thiserror-impl-2.0.21.sha256sum] = "fe5197923287db20a58125f0bc85c062f7f2c892de97b18c356f9efb14b28524"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
@@ -532,7 +534,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.26.1.sha256sum] = "2ef6dac1e96601b4fb3acccccff2139741fcb757cb9a36089bf5be91cfb285ce"
+SRC_URI[uuid-1.27.0.sha256sum] = "97277d36b9c3ace13e58fa6e753f8b0bbbf302a18dd193240d70f9e29681059a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
@@ -581,8 +583,8 @@ SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
-SRC_URI[zerocopy-0.8.57.sha256sum] = "d35102a9f36d089ccae9e4c6802bc118be4487b80aaffc0ab4e0cf5ce92d2873"
-SRC_URI[zerocopy-derive-0.8.57.sha256sum] = "146c01f5ab44258da43cf276c74a2763db2ff3969c9c652c3f2de07041d0b2bc"
+SRC_URI[zerocopy-0.8.63.sha256sum] = "e5fe1f8f1b06191a00962174c61aa5005e0bb391a6d80d07e24d115c01a92ed8"
+SRC_URI[zerocopy-derive-0.8.63.sha256sum] = "863ad3ac83293fb4d740aedbfdc9240dd8d1a50c1099acd76ce80ce7c7230c7f"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
 SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
index 8b05c79a25..8974550c86 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c95a3d092cb8880b37f35013f9f7339f3867bc422abed36776255f34e22bc62c"
+SRC_URI[sha256sum] = "c561c4fa00f64efd348bdbe3a01ade41bc9af99ba57d807cc7b2abdf73571366"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============6206311575626002961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.5.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.15 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.48 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 cra
 te://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/di
 gest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/f
 utures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 c
 rate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.37 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.37 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3
 .2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/
 0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.
 1 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.15 crate://crates.io/tar-framing/0.0.15 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15+spec-1.1.0 crate://crates.io/to
 ml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.26.1 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-b
 indgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.
 53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.57 crate://crates.io/zerocopy-derive/0.8.57 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21" to "https://files.pythonhosted.org/packages/source/u/uv_build/u
 v_build-0.13.7.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.15 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.50 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/base64/0.23.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1
  crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io
 /dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 c
 rate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.49.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.37 cr
 ate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.37 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_gener
 ator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc
 -hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.6 cr
 ate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.15 crate://crates.io/tar-framing/0.0.15 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/trac
 ing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.27.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crat
 e://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1
  crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.5" to "0.13.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.5 [default] to 0.13.7 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.5" to "0.13.7"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info

--===============6206311575626002961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info

--===============6206311575626002961==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.5-0.13.7.patch"

RnJvbSBjNGFhMDIxMDNhZGMyZGY0ZTFkNDZiMTZjOGI1MmJjMjNkZGM2OGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNTo1NDoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMy41IC0+IDAuMTMuNwoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA0MiArKysrKysrKysrLS0tLS0t
LS0tCiAuLi5kXzAuMTMuNS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTMuNy5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAuMTMu
NS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTMuNy5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5j
CmluZGV4IGE1NzQ2Zjc2OTMuLmQ2Njg0OTNiZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCkBAIC0xOCwx
MCArMTgsMTEgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwt
dG9raW8tdGFyLzAuNy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVyc2lvbi1y
YW5nZXMvMC4yLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4w
LjIyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuNDggXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzeW5jLWNvbXByZXNzaW9uLzAuNC41MCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFj
a29uLzEuNi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4yMi4xIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4yMy4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9i
aXRmbGFncy8xLjMuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi4xMy4yIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9ibG9jay1idWZmZXIvMC4xMC40IFwKQEAgLTEwMyw3ICsx
MDQsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lkbmFfYWRhcHRl
ci8xLjIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kZXhtYXAvMi4xNC4yIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5z
dGEvMS40OC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0YS8xLjQ5LjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2lvLWV4dHJhcy8wLjE5LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2lvLWxpZmV0aW1lcy8yLjAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW8tbGlmZXRpbWVz
LzMuMC4xIFwKQEAgLTExNSw3ICsxMTYsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2ppZmYtY29yZS8wLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1z
dGF0aWMvMC4yLjM3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9qdW5jdGlvbi8yLjAuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vanVuY3Rpb24vMi4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xhenlfc3RhdGljLzEu
NS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xODkgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2xpbnV4LXJhdy1zeXMvMC4xMi4xIFwKQEAgLTE5MiwxMCArMTkzLDEwIEBAIFNS
Q19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZHV0ZjgvMC4xLjUgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3NpbWlsYXIvMi43LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3NsYWIvMC40LjEyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE2LjEgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTYuMiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vc21hd2svMC4zLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NvY2tldDIvMC42LjMg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgvMC4xMy41IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9zcGR4LzAuMTMuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3RhYmxlX2RlcmVmX3Ry
YWl0LzEuMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdHJpcC1hbnNpLWVzY2FwZXMvMC4y
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0cnNpbS8wLjExLjEgXApAQCAtMjA4LDggKzIw
OSw4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcGZpbGUvMy4y
Ny4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXJtaW5hbF9zaXplLzAuNC40IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby90ZXh0d3JhcC8wLjE2LjQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3RoaXNlcnJvci8yLjAuMjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RoaXNlcnJvci1pbXBs
LzIuMC4yMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLzIuMC4yMSBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLWltcGwvMi4wLjIxIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90aHJlYWRfbG9jYWwvMS4xLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rpbnlz
dHIvMC44LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rpbnl2ZWMvMS4xMS4wIFwKQEAgLTIz
Nyw3ICsyMzgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybC8y
LjUuOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby91dGY4cGFyc2UvMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1
aWQvMS4yNi4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91dWlkLzEuMjcuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdmFsdWFibGUvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Zl
cnNpb25fY2hlY2svMC45LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEgXApA
QCAtMjg2LDggKzI4Nyw4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d3JpdGVhYmxlLzAuNi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLzAuOC4xIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLWRlcml2ZS8wLjguMSBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vemVyb2NvcHkvMC44LjU3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS1k
ZXJpdmUvMC44LjU3IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS8wLjguNjMgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9jb3B5LWRlcml2ZS8wLjguNjMgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3plcm9mcm9tLzAuMS42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJv
ZnJvbS1kZXJpdmUvMC4xLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm90cmllLzAuMi4z
IFwKQEAgLTMxMywxMCArMzE0LDExIEBAIFNSQ19VUklbYXN0cmFsLW1haWwtaGVhZGVycy0wLjAu
MS5zaGEyNTZzdW1dID0gImRjMDE5ZWNjYTgyY2ZjOTFmZmEzMWFiNGZmZTcwNWFhCiBTUkNfVVJJ
W2FzdHJhbC10b2tpby10YXItMC43LjAuc2hhMjU2c3VtXSA9ICI2ZjJlOTg5YjMzMjQ2ZmU5MjQw
ZDM5YWNjZjRkZDlhMDFlMGI2YzFmM2NlOWRkMDk1ZTBhNDdmYTAyNTA1NTIzIgogU1JDX1VSSVth
c3RyYWwtdmVyc2lvbi1yYW5nZXMtMC4yLjMuc2hhMjU2c3VtXSA9ICJiMzE1YWNjNGRjN2YwZDNj
Y2RkNTU3YTAxYjZhODlmYTJkODk2ZTk5YTQ1MGI5OGU4MjlmYzgxNTJmMGIyZjk4IgogU1JDX1VS
SVthc3RyYWxfYXN5bmNfemlwLTAuMC4yMi5zaGEyNTZzdW1dID0gIjBmODUwOGQwOWM2YmM2YWJk
NDI3NjdkMWQ0M2M3NzAyODkxNjkxNDg0ODc1Y2U5NGY3OTk3ZGExMzAxZDk1ZTkiCi1TUkNfVVJJ
W2FzeW5jLWNvbXByZXNzaW9uLTAuNC40OC5zaGEyNTZzdW1dID0gImZiNjFhZWExYTdkZWY3M2Vl
N2MzNTBhMTg0ZjBlNzBiMzJjMTgyMzQ0ZTJlNzViZjcwYzliNjIxYjgzNDE3ZmQiCitTUkNfVVJJ
W2FzeW5jLWNvbXByZXNzaW9uLTAuNC41MC5zaGEyNTZzdW1dID0gImVlMTliZDk5YjQzZTM2OTFh
Y2JhZDRlODQwNDIwYTQ4ODFjZWE2YzBiNjZhMjA4MTI1YTgyNGY4ZmQ1M2Y1YTEiCiBTUkNfVVJJ
W2F1dG9jZmctMS41LjAuc2hhMjU2c3VtXSA9ICJjMDg2MDZmOGMzY2JmNGNlNmVjOGUyOGZiMDAx
NGEyYzA4NjcwOGZlOTU0ZWFhODg1Mzg0YTYxNjUxNzJlN2U4IgogU1JDX1VSSVtiYWNrb24tMS42
LjAuc2hhMjU2c3VtXSA9ICJjZmZiMGU5MzE4NzViNjY2ZmM0ZmNiMjBmZWU1MmU5YmJkMWVmODM2
ZmQ5ZTllMDRlYzIxNTU1ZjlmODVmN2VmIgogU1JDX1VSSVtiYXNlNjQtMC4yMi4xLnNoYTI1NnN1
bV0gPSAiNzJiMzI1NGYxNjI1MWE4MzgxYWExMmU0MGUzYzRkMmYwMTk5ZjhjNjUwOGZiZWNiOWQ5
MWY1NzVlMGZiYjhjNiIKK1NSQ19VUklbYmFzZTY0LTAuMjMuMS5zaGEyNTZzdW1dID0gImFjMDdj
ZGVjZjk5MDUxZDlhNTIzOGI4MGYzNWFmMzJjZGViYTViMzM2ZTU1ZDk1N2IzMThiNTAxMzdlMThk
YTUiCiBTUkNfVVJJW2JpdGZsYWdzLTEuMy4yLnNoYTI1NnN1bV0gPSAiYmVmMzhkNDUxNjNjMmYx
ZGRlMDk0YTdkZmQzM2NjZjU5NWM5MjkwNWM4ZjhmNGZkYzE4ZDA2ZmIxMDM3NzE4YSIKIFNSQ19V
UklbYml0ZmxhZ3MtMi4xMy4yLnNoYTI1NnN1bV0gPSAiM2RlZDQwNTdjMjU4YmExOTllMmQyNjM4
NmQzYWYzNzgwOTU3ZWNhZWU2YzRlZjQwNDFjNmI0YjhiOTdjMGIwNiIKIFNSQ19VUklbYmxvY2st
YnVmZmVyLTAuMTAuNC5zaGEyNTZzdW1dID0gIjMwNzhjNzYyOWI2MmQzZjA0Mzk1MTdmYTM5NDk5
NmFjYWNjNWNiYzkxYzVhMjBkOGM2NThlNzdhYmQ1MDNhNzEiCkBAIC0zOTgsNyArNDAwLDcgQEAg
U1JDX1VSSVtpZG5hLTEuMS4wLnNoYTI1NnN1bV0gPSAiM2IwODc1ZjIzY2FhMDM4OTg5OTRmNmRk
YzUwMTg4NmE0NWM3ZDNkNjJkMDRkMmQKIFNSQ19VUklbaWRuYV9hZGFwdGVyLTEuMi4xLnNoYTI1
NnN1bV0gPSAiM2FjYWU5NjA5NTQwYWEzMThkMWJjNTg4NDU1MjI1ZmIyMDg1YjllZDBjNGY2YmQw
ZDlkNWJjZDg2ZjFhMDM0NCIKIFNSQ19VUklbaW5kZXhtYXAtMi4xNC4yLnNoYTI1NnN1bV0gPSAi
Y2M0ZTE5MGY1ZDI2Y2E3MDUxNjQyNjI5ZGEyYzUyZmMwM2JkZTg1YTAzMTk3Yzk5NDA4ZGNkMjkx
NzM0Yzg1NSIKIFNSQ19VUklbaW5kb2MtMi4wLjcuc2hhMjU2c3VtXSA9ICI3OWNmNWM5M2Y5MzIy
OGNmOGVmYjNiYTM2MjUzNWZiMTExOTlhYzU0OGEwOWNlMTE3YzliMWFkYzMwMzBkNzA2IgotU1JD
X1VSSVtpbnN0YS0xLjQ4LjAuc2hhMjU2c3VtXSA9ICI4NmYwZjhmZWU4YzkyNjQxNWM1OGQ2YWU0
M2EwODUyM2EyNmZhY2NiMjMyM2Y1ZTZiNjQ0ZmU3ZGQ0ZWY2YjgyIgorU1JDX1VSSVtpbnN0YS0x
LjQ5LjAuc2hhMjU2c3VtXSA9ICJiNjdkM2QyZTI4N2U0Yjg2YzEwYjNmM2I2NDEwMzNkMWY4OWI3
NGJkYjM5ZDA1ZjM0OTUyZTJiOWE2ZmUyMWNkIgogU1JDX1VSSVtpby1leHRyYXMtMC4xOS4wLnNo
YTI1NnN1bV0gPSAiMjBmZDZkZTRjY2ZjYzE4N2UzOGJjMjFjZmE1NDNjYjVhMzAyY2I4NmE4YjEx
NGViN2YwYmYwZGM5ZjhhYzAwZiIKIFNSQ19VUklbaW8tbGlmZXRpbWVzLTIuMC40LnNoYTI1NnN1
bV0gPSAiMDY0MzJmYjU0ZDNiZTc5NjRlY2QzNjQ5MjMzY2RkZjgwZGIyODMyZjQ3ZmVjMzRjMDFm
NjViM2Q5ZDc3NDk4MyIKIFNSQ19VUklbaW8tbGlmZXRpbWVzLTMuMC4xLnNoYTI1NnN1bV0gPSAi
MmYwZmIwNTcwYWZlMWZlZDk0M2M1YzNkNDEwMmQ1MzU4NTkyZDg2MjVmZGE2YTAwMDdmZGJlNjVh
OTJmYmE5NiIKQEAgLTQxMCw3ICs0MTIsNyBAQCBTUkNfVVJJW2ppZmYtMC4yLjM3LnNoYTI1NnN1
bV0gPSAiMGFiMWJhZjcyZjA4Nzk2ZGUwMjYwNjA5NTE1MTMwNjk5Yjg5MGFjMjVmMzBlNgogU1JD
X1VSSVtqaWZmLWNvcmUtMC4xLjAuc2hhMjU2c3VtXSA9ICI3ZmVjYTg4NDM5ZWZlNTNkYTM3NTQ1
MDBjMTg1MWRlZGYzY2IzNmM1MjRkZDVjZjgyMjVjYzA3OTRkZTk1ZDA5IgogU1JDX1VSSVtqaWZm
LXN0YXRpYy0wLjIuMzcuc2hhMjU2c3VtXSA9ICIzNzgyNjhhMTExNmFkNjdhZTYyMjg3MDExMThh
YzlmNDkxZDc4ZmRhMzhhNDBhMWYxYTllMTM0OGRlNmY3MjEyIgogU1JDX1VSSVtqcy1zeXMtMC4z
LjkxLnNoYTI1NnN1bV0gPSAiYjQ5NzE1YjcwNzNmMzg1YmE0YmM1MjhlNTc0N2QwMmU2NmNiMzlj
NjE0NmVmYjY2Yjc4MWYxMzFmMGZiMzk5YyIKLVNSQ19VUklbanVuY3Rpb24tMi4wLjAuc2hhMjU2
c3VtXSA9ICIxNjBmMmVhZGUwOTdmMzAyNjNiNTQ4YWFlNWRlYjEyYWQzNDljOTA5YmFhNzEwZmEy
NGI5MmM5MDkwYjJlMDA2IgorU1JDX1VSSVtqdW5jdGlvbi0yLjEuMC5zaGEyNTZzdW1dID0gImNk
ZTQ4ZjM2NTMwY2JkOTFiNjVmMDUwMTAxZTZjMDU2ZDZlYjc0M2NlYTJhOGYwZjE5YmVlZjY5YzY3
NDJmZjgiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4wLnNoYTI1NnN1bV0gPSAiYmJkMmJjYjRj
OTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2ODVlMWYyOTgwNjgzMTZlNjZmZSIK
IFNSQ19VUklbbGliYy0wLjIuMTg5LnNoYTI1NnN1bV0gPSAiM2VhZjNlZGUzZmVlNmRiMWE0YzJl
ZTA5MWJmOGE4YjRkY2NkYzZkMTdmNjU2ZmIwNzg5NmVlNzI4Njc2MTJmMiIKIFNSQ19VUklbbGlu
dXgtcmF3LXN5cy0wLjEyLjEuc2hhMjU2c3VtXSA9ICIzMmE2Njk0OWUwMzBkYTAwZThjN2Q0NDM0
YjI1MTY3MGE5MTU1NmY0MTQ0OTQxZDM3NDUyNzY5YzI1ZDU4YTUzIgpAQCAtNDg3LDEwICs0ODks
MTAgQEAgU1JDX1VSSVtzaW1kLWFkbGVyMzItMC4zLjguc2hhMjU2c3VtXSA9ICJlMzIwYTZjNWFk
MzFkMjcxYWQ1MjNkY2YzYWQxM2UyNzY3YWQ4YjEKIFNSQ19VUklbc2ltZHV0ZjgtMC4xLjUuc2hh
MjU2c3VtXSA9ICJlM2E5ZmUzNGUzZTdhNTAzMTYwNjAzNTFmMzcxODdhM2Y1NDZiY2U5NTQ5NjE1
Njc1NGI2MDFhNWZhNzFiNzZlIgogU1JDX1VSSVtzaW1pbGFyLTIuNy4wLnNoYTI1NnN1bV0gPSAi
YmJiYjVkOTY1OTE0MTY0NmFlNjQ3YjQyZmUwOTRkYWY2YzYxOTJkMTYyMDg3MGI0NDlkOTU1N2Y3
NDhiMmRhYSIKIFNSQ19VUklbc2xhYi0wLjQuMTIuc2hhMjU2c3VtXSA9ICIwYzc5MGRlMjMxMjRm
OWFiNDQ1NDRkN2FjMDVkNjA0NDBhZGM1ODY0NzljZTUwMWMxZDZkN2RhM2NkOGM5Y2Y1IgotU1JD
X1VSSVtzbWFsbHZlYy0xLjE2LjEuc2hhMjU2c3VtXSA9ICJiYTQ2NzA1NmYxYjU0N2VkNTIwNzc5
MTExNjFmYzg2OTg1YmVjYmM2MGU4ZTE4NTdjOGExNDRkYWIwZGVmODkxIgorU1JDX1VSSVtzbWFs
bHZlYy0xLjE2LjIuc2hhMjU2c3VtXSA9ICJmOTM5NWYwZjBlZWU4NDlhOWI3MDdiMmYwNmJiOTJh
NmE0MjIwOTBlMjEyM2JiMmVmOGU4N2EwZTYxODkyYThlIgogU1JDX1VSSVtzbWF3ay0wLjMuMi5z
aGEyNTZzdW1dID0gImI3YzM4OGMxYjVlOTM3NTZkMGM3NDA5NjVjNDFlODgyMmY4NjY2MjFkNDFh
Y2JkZjYzMzZhNmExNjhmODg0MGMiCiBTUkNfVVJJW3NvY2tldDItMC42LjMuc2hhMjU2c3VtXSA9
ICIzYTc2NmUxMTEwNzg4YzM2ZjRmYTFjMmI3MWIzODdhNzgxNWFhNjVmODhjZTAyMjk4NDE4MjY2
MzNkOTM3MjNlIgotU1JDX1VSSVtzcGR4LTAuMTMuNS5zaGEyNTZzdW1dID0gIjA4MTY3MGMyMzNk
ZmJlZDU1NjkwY2MwY2QzODQyNGUwZTI0YWMxYjI2NzNkMGI0MDhiM2Y3YjY4NDczOGRmYTkiCitT
UkNfVVJJW3NwZHgtMC4xMy42LnNoYTI1NnN1bV0gPSAiNjQ2YzVhMzY3ZGE5MTRlM2JhYmNiOWNk
OGU5MWMzN2NjYWFjNDIzMjViOGY4NmYwMzY1MTNhZDEwM2YyYTcxNiIKIFNSQ19VUklbc3RhYmxl
X2RlcmVmX3RyYWl0LTEuMi4xLnNoYTI1NnN1bV0gPSAiNmNlMmJlOGRjMjU0NTVlMWY5MWRmNzFi
ZmExMmFkMzdkN2FmMTA5MmFlNzM2ZjNhNmNkMGUzN2JjNzgxMDU5NiIKIFNSQ19VUklbc3RyaXAt
YW5zaS1lc2NhcGVzLTAuMi4xLnNoYTI1NnN1bV0gPSAiMmE4ZjgwMzhlN2U3OTY5YWJiM2YxYjdj
MmE4MTEyMjVlOTI5NmRhMjA4NTM5ZTBmNzljNTI1MWQ2Y2FjMDAyNSIKIFNSQ19VUklbc3Ryc2lt
LTAuMTEuMS5zaGEyNTZzdW1dID0gIjdkYThiNTczNjg0NWQ5ZjJmY2I4MzdlYTVkOWUyNjI4NTY0
YjNiMDQzYTcwOTQ4YTNmMGI3Nzg4MzhjNWZiNGYiCkBAIC01MDMsOCArNTA1LDggQEAgU1JDX1VS
SVt0ZW1wLWVudi0wLjMuNi5zaGEyNTZzdW1dID0gIjk2Mzc0ODU1MDY4ZjQ3NDAyYzMxMjFjNmVl
ZDg4ZDI5Y2IxZGU4ZjNhYjIKIFNSQ19VUklbdGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAi
MzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTli
Yzg1NzRiZCIKIFNSQ19VUklbdGVybWluYWxfc2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGEx
YjgyMWNjYmQ3NWIxODU4MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4
NzQiCiBTUkNfVVJJW3RleHR3cmFwLTAuMTYuNC5zaGEyNTZzdW1dID0gIjZlY2ZhZDZjM2FiYzgw
YTU3N2YyYjkxYzFlNDEyZWU1N2U3YTA2MGQ0MzBiNTUzYzFiMGM5NDA5NzRlYmNkNDkiCi1TUkNf
VVJJW3RoaXNlcnJvci0yLjAuMjAuc2hhMjU2c3VtXSA9ICJlYzg2MjM1ZjVmY2MyYTczNjUwMzEw
NzU2ZDJhYzViMTM4YTU3ODBiYmJkZmFlM2VlY2NlYzk5MmM0MzViYTRmIgotU1JDX1VSSVt0aGlz
ZXJyb3ItaW1wbC0yLjAuMjAuc2hhMjU2c3VtXSA9ICJiYzA0Y2QzZTEyMzZkZDRhOThhZmNhNDU2
OWYyZGViM2YxMjBlNTQyMmE0MDIzYmUyY2I2ODNmODQ4NjI5MmFmIgorU1JDX1VSSVt0aGlzZXJy
b3ItMi4wLjIxLnNoYTI1NnN1bV0gPSAiMDllNTJjYjg2YTM2Y2VkZTVjYjEwMWJmODkwODgzN2Iz
ZTRjNmU1ZTU5ZmU3ZmQ4NWMyM2ZiNTYyMDBkMTg5ZSIKK1NSQ19VUklbdGhpc2Vycm9yLWltcGwt
Mi4wLjIxLnNoYTI1NnN1bV0gPSAiZmU1MTk3OTIzMjg3ZGIyMGE1ODEyNWYwYmM4NWMwNjJmN2Yy
Yzg5MmRlOTdiMThjMzU2ZjllZmIxNGIyODUyNCIKIFNSQ19VUklbdGhyZWFkX2xvY2FsLTEuMS45
LnNoYTI1NnN1bV0gPSAiZjYwMjQ2YTQ5NDRmMjRmNmUwMThhYTE3Y2RlZmZiNzgxOGI3NjM1Njk2
NWQwM2IwN2Q2YTk4ODZlODk2MjE4NSIKIFNSQ19VUklbdGlueXN0ci0wLjguMi5zaGEyNTZzdW1d
ID0gIjQyZDNlOWM0NWMwOWRlMTVkMDZkZDhhY2Y1ZjRlMGUzOTllODU5MjdiN2YwMDcxMTAyNGVi
N2FlMTBmYTQ4NjkiCiBTUkNfVVJJW3Rpbnl2ZWMtMS4xMS4wLnNoYTI1NnN1bV0gPSAiM2U2MWU2
NzA1M2QyNWE0ZTgyYzg0NGU4NDI0MDM5ZDk3NDU3ODFiM2ZjNGYzMmI4ZDU1ZWQ1MGY1ZjY2N2Vm
MyIKQEAgLTUzMiw3ICs1MzQsNyBAQCBTUkNfVVJJW3Vuc2Nhbm55LTAuMS4wLnNoYTI1NnN1bV0g
PSAiZTlkZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMwZDQ0ZAogU1JDX1VSSVt1
cmwtMi41Ljguc2hhMjU2c3VtXSA9ICJmZjY3YThhNDM5NzM3M2MzZWY2NjA4MTJhY2FiMzI2ODIy
MjAzNTAxMGFiODY4MGVjNDIxNWYzOGJhM2QwZWVkIgogU1JDX1VSSVt1dGY4X2l0ZXItMS4wLjQu
c2hhMjU2c3VtXSA9ICJiNmMxNDA2MjBlN2ZmYmIyMmMyZGVlNTljYWZlNjA4NGE1OWI1ZmZjMjdh
ODg1OWE1ZjBkNDk0YjVkNTJiNmJlIgogU1JDX1VSSVt1dGY4cGFyc2UtMC4yLjIuc2hhMjU2c3Vt
XSA9ICIwNmFiZGUzNjExNjU3YWRmNjZkMzgzZjAwYjA5M2Q3ZmFlY2M3ZmE1NzA3MWNjZTI1Nzg2
NjBjOWYxMDEwODIxIgotU1JDX1VSSVt1dWlkLTEuMjYuMS5zaGEyNTZzdW1dID0gIjJlZjZkYWMx
ZTk2NjAxYjRmYjNhY2NjY2NmZjIxMzk3NDFmY2I3NTdjYjlhMzYwODliZjViZTkxY2ZiMjg1Y2Ui
CitTUkNfVVJJW3V1aWQtMS4yNy4wLnNoYTI1NnN1bV0gPSAiOTcyNzdkMzZiOWMzYWNlMTNlNThm
YTZlNzUzZjhiMGJiYmYzMDJhMThkZDE5MzI0MGQ3MGY5ZTI5NjgxMDU5YSIKIFNSQ19VUklbdmFs
dWFibGUtMC4xLjEuc2hhMjU2c3VtXSA9ICJiYTczZWE5Y2YxNmEyNWRmMGM4Y2FhMTZjNTFhY2I5
MzdkNTcxMmE4NDI5ZGI3OGEzZWUyOWQ1ZGNhY2QzYTY1IgogU1JDX1VSSVt2ZXJzaW9uX2NoZWNr
LTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJk
ZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKIFNSQ19VUklbdnRlLTAuMTQuMS5zaGEyNTZz
dW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0NDEyNmFjYzBhOTgyZjQw
NDBhYzNmOWYwYmMwNzciCkBAIC01ODEsOCArNTgzLDggQEAgU1JDX1VSSVt3aW54LTAuMzYuNC5z
aGEyNTZzdW1dID0gIjNmM2ZkMzc2ZjcxOTU4Yjg2MmU3YWZiMjBjZmU1YTIyODMwZTE5NjM0NjJm
M2EKIFNSQ19VUklbd3JpdGVhYmxlLTAuNi4yLnNoYTI1NnN1bV0gPSAiOWVkZGUwZGI0NzY5ZDJk
YzY4NTc5ODkzZjIzMDZiMjZjNmVjZmJlMGVmNDk5YjAxM2Q3MzFiN2I5MjQ3ZTBiOSIKIFNSQ19V
UklbeW9rZS0wLjguMS5zaGEyNTZzdW1dID0gIjcyZDZlNWM2YWZiODRkNzM5NDRlNWNlZGIwNTJj
NDY4MGQ1NjU3MzM3MjAxNTU1ZjlmMmExNmI3NDA2ZDQ5NTQiCiBTUkNfVVJJW3lva2UtZGVyaXZl
LTAuOC4xLnNoYTI1NnN1bV0gPSAiYjY1OTA1Mjg3NGViNjk4ZWZlNWI5ZThjZjM4MjIwNDY3OGEw
MDg2ZWJmNDY5ODJiNzlkNmNhMzE4MjkyN2U1ZCIKLVNSQ19VUklbemVyb2NvcHktMC44LjU3LnNo
YTI1NnN1bV0gPSAiZDM1MTAyYTlmMzZkMDg5Y2NhZTllNGM2ODAyYmMxMThiZTQ0ODdiODBhYWZm
YzBhYjRlMGNmNWNlOTJkMjg3MyIKLVNSQ19VUklbemVyb2NvcHktZGVyaXZlLTAuOC41Ny5zaGEy
NTZzdW1dID0gIjE0NmMwMWY1YWI0NDI1OGRhNDNjZjI3NmM3NGEyNzYzZGIyZmYzOTY5YzljNjUy
YzNmMmRlMDcwNDFkMGIyYmMiCitTUkNfVVJJW3plcm9jb3B5LTAuOC42My5zaGEyNTZzdW1dID0g
ImU1ZmUxZjhmMWIwNjE5MWEwMDk2MjE3NGM2MWFhNTAwNWUwYmIzOTFhNmQ4MGQwN2UyNGQxMTVj
MDFhOTJlZDgiCitTUkNfVVJJW3plcm9jb3B5LWRlcml2ZS0wLjguNjMuc2hhMjU2c3VtXSA9ICI4
NjNhZDNhYzgzMjkzZmI0ZDc0MGFlZGJmZGM5MjQwZGQ4ZDFhNTBjMTA5OWFjZDc2Y2U4MGNlN2M3
MjMwYzdmIgogU1JDX1VSSVt6ZXJvZnJvbS0wLjEuNi5zaGEyNTZzdW1dID0gIjUwY2M0MmUwMzMz
ZTA1NjYwYzM1ODdmM2JmOWQwNDc4Njg4ZTE1ZDg3MGZhYjMzNDY0NTFjZTdmOGM5ZmJlYTUiCiBT
UkNfVVJJW3plcm9mcm9tLWRlcml2ZS0wLjEuNi5zaGEyNTZzdW1dID0gImQ3MWU1ZDZlMDZhYjA5
MGM2N2I1ZTQ0OTkzZWMxNmI3MmRjYmFhYmM1MjZkYjg4M2EzNjAwNTc2NzhiNDg1MDIiCiBTUkNf
VVJJW3plcm90cmllLTAuMi4zLnNoYTI1NnN1bV0gPSAiMmE1OWMxN2E1NTYyZDUwN2U0YjU0OTYw
ZTg1NjllYmVlMzNiZWU4OTBjNzBhYTNmZTdiOTdlODVhOWZkNzg1MSIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjUuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy43LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11di1idWlsZF8wLjEzLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjcuYmIKaW5kZXggOGIwNWM3OWEyNS4u
ODk3NDU1MGM4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXV2LWJ1aWxkXzAuMTMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXYtYnVpbGRfMC4xMy43LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5
ODY5NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4
L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNEO21k
NT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImM5NWEzZDA5MmNiODg4MGIzN2YzNTAxM2Y5ZjczMzlmMzg2N2JjNDIyYWJlZDM2Nzc2MjU1
ZjM0ZTIyYmM2MmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzU2MWM0ZmEwMGY2NGVmZDM0OGJk
YmUzYTAxYWRlNDFiYzlhZjk5YmE1N2Q4MDdjYzdiMmFiZGY3MzU3MTM2NiIKIAogcmVxdWlyZSAk
e0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============6206311575626002961==--
