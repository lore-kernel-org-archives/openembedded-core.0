Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6635.1794980486302345603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 21:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XcEychSQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ds3+hkcG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1ed2c97f9-b5937fa4-3311-4378-80ea-d48a1e9f1109-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794980485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NfIg2QA/J5yLj1rKwLW0hLPp+3R8balbmvA1M/T5hdc=;
	b=XcEychSQjEA6xxV+ZkhWTYXSEuDS8cDLmy/S3a+pi8zpY3+zIeLv0ChTVHahG0/N
	Gx7u0gPWy1oX6bBqY5rpVDt/YDkJl2IZSaB36g1CN0CRbXx7WV5Wx6RYPOTASmfaTA7
	SKI9suGCglcYerxvYz3ak+k6nyl/A30S+R5CRxI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794980485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NfIg2QA/J5yLj1rKwLW0hLPp+3R8balbmvA1M/T5hdc=;
	b=ds3+hkcG0doaVwFQWh1wyEUMPALoGKfDzGM4qhLTjaKfoAwPTcQ4AKpD39D1Y6xd
	qy99htaEAIicgwrmejUIfcpxzENn9xml8WS/3PVZ3GG1rE7P/Z8dp4uhYHHiaj4BiQe
	mF8qQihj8bYKnRptXIixYBoRqUNQrqXJkj+Ep4yo=
Content-Type: multipart/mixed; boundary="===============6491345694240044242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.9 SUCCEEDED
Message-ID: <010101a1ed2c97f9-b5937fa4-3311-4378-80ea-d48a1e9f1109-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 05:41:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 05:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250513

--===============6491345694240044242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.7-0.13.9.patch
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
From b541939efcff76b1481a0d1216c88eb3d6ba810d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Nov 2026 05:33:28 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.7 -> 0.13.9

---
 .../python/python3-uv-build-crates.inc        | 48 +++++++++----------
 ...d_0.13.7.bb => python3-uv-build_0.13.9.bb} |  2 +-
 2 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.7.bb => python3-uv-build_0.13.9.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index d668493bd0..23d47241d8 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -11,11 +11,11 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/archive-trait/0.0.15 \
+    crate://crates.io/archive-trait/0.0.16 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-mail-headers/0.0.1 \
-    crate://crates.io/astral-tokio-tar/0.7.0 \
+    crate://crates.io/astral-tokio-tar/0.7.1 \
     crate://crates.io/astral-version-ranges/0.2.3 \
     crate://crates.io/astral_async_zip/0.0.22 \
     crate://crates.io/async-compression/0.4.50 \
@@ -59,7 +59,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.18.0 \
+    crate://crates.io/either/1.19.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.8 \
@@ -103,7 +103,7 @@ SRC_URI += " \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.2 \
-    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/indoc/2.0.8 \
     crate://crates.io/insta/1.49.0 \
     crate://crates.io/io-extras/0.19.0 \
     crate://crates.io/io-lifetimes/2.0.4 \
@@ -112,13 +112,13 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.37 \
+    crate://crates.io/jiff/0.2.38 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.37 \
+    crate://crates.io/jiff-static/0.2.38 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.1.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -203,8 +203,8 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.118 \
     crate://crates.io/syn/3.0.6 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar-codec/0.0.15 \
-    crate://crates.io/tar-framing/0.0.15 \
+    crate://crates.io/tar-codec/0.0.16 \
+    crate://crates.io/tar-framing/0.0.16 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
@@ -215,14 +215,14 @@ SRC_URI += " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.53.1 \
+    crate://crates.io/tokio/1.53.2 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
     crate://crates.io/toml/1.1.6+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.15+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
-    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.3+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
     crate://crates.io/tracing-core/0.1.36 \
@@ -238,7 +238,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.27.0 \
+    crate://crates.io/uuid/1.28.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -307,11 +307,11 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
-SRC_URI[archive-trait-0.0.15.sha256sum] = "999bf88cc483664cab77700ca2fdfb0415a73412abe284ef5bc2319d00938e00"
+SRC_URI[archive-trait-0.0.16.sha256sum] = "0b5040ca935c09888e7dfb04383b4d62fa3571e25bc66b6f345b591e97958524"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-mail-headers-0.0.1.sha256sum] = "dc019ecca82cfc91ffa31ab4ffe705aaa706399840a7152926b7eee736da410a"
-SRC_URI[astral-tokio-tar-0.7.0.sha256sum] = "6f2e989b33246fe9240d39accf4dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
+SRC_URI[astral-tokio-tar-0.7.1.sha256sum] = "821ed36daf7c40d00a7b62759f9833fb279fb7c87dd989ec0a4d626dcd8d1dca"
 SRC_URI[astral-version-ranges-0.2.3.sha256sum] = "b315acc4dc7f0d3ccdd557a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
 SRC_URI[astral_async_zip-0.0.22.sha256sum] = "0f8508d09c6bc6abd42767d1d43c7702891691484875ce94f7997da1301d95e9"
 SRC_URI[async-compression-0.4.50.sha256sum] = "ee19bd99b43e3691acbad4e840420a4881cea6c0b66a208125a824f8fd53f5a1"
@@ -355,7 +355,7 @@ SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf8270
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
+SRC_URI[either-1.19.0.sha256sum] = "0e9c71c2167ca323c882b99918929403426e2373ea17242ff5653e0d5e1058be"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22"
@@ -399,7 +399,7 @@ SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dd
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
-SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[indoc-2.0.8.sha256sum] = "a37b2691796cffeb8a8cd305ac66e65841559f147f4e63231d0eafa4db5384d1"
 SRC_URI[insta-1.49.0.sha256sum] = "b67d3d2e287e4b86c10b3f3b641033d1f89b74bdb39d05f34952e2b9a6fe21cd"
 SRC_URI[io-extras-0.19.0.sha256sum] = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
 SRC_URI[io-lifetimes-2.0.4.sha256sum] = "06432fb54d3be7964ecd3649233cddf80db2832f47fec34c01f65b3d9d774983"
@@ -408,13 +408,13 @@ SRC_URI[ipnet-2.12.0.sha256sum] = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb"
+SRC_URI[jiff-0.2.38.sha256sum] = "b2b005715dcbeb0089a3c0dab99f2ff1cc3b2525323552703d648585d342a383"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
+SRC_URI[jiff-static-0.2.38.sha256sum] = "2cc9817253cf7c7ee4684451bd327e88d6f3658014e54a29198625590650695c"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.1.0.sha256sum] = "cde48f36530cbd91b65f050101e6c056d6eb743cea2a8f0f19beef69c6742ff8"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -499,8 +499,8 @@ SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-codec-0.0.15.sha256sum] = "b9dad615e50d181afea4bafea23dacb8e33ed52dde06503813570634b932d467"
-SRC_URI[tar-framing-0.0.15.sha256sum] = "563e8181b47c9cdcce569eae3ad431eec71543d6269dd60c7bd2350f70bcd233"
+SRC_URI[tar-codec-0.0.16.sha256sum] = "6875ba507bbec6022500f46477159a03f07ebdffdb4ea043254974531df1dac2"
+SRC_URI[tar-framing-0.0.16.sha256sum] = "49727b1a300514960d425d0e741a7da3e693170f3db39de3180fdbbc07e542c5"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
@@ -511,14 +511,14 @@ SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b7635
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
+SRC_URI[tokio-1.53.2.sha256sum] = "e95f91fcc7a621e8b030f6aa23c71fe9838ae2fb4d8118b75602a328f5144044"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
 SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.15+spec-1.1.0.sha256sum] = "1340ea94a5856333492c9064b02c778b191dd2c853778d9609debdcdfea3a614"
 SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] = "baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c"
-SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
+SRC_URI[toml_writer-1.1.3+spec-1.1.0.sha256sum] = "06bdbd8cfc056b8d2e2e85f29b56a3bdbecb527cef81eb39e3e7b98af4652770"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
 SRC_URI[tracing-core-0.1.36.sha256sum] = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
@@ -534,7 +534,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.27.0.sha256sum] = "97277d36b9c3ace13e58fa6e753f8b0bbbf302a18dd193240d70f9e29681059a"
+SRC_URI[uuid-1.28.0.sha256sum] = "7cc1186384beb7dd8eedea376413fd654937285ea6c9cfbb928dc3043ea4b606"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.9.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.9.bb
index 8974550c86..69cc6fb284 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c561c4fa00f64efd348bdbe3a01ade41bc9af99ba57d807cc7b2abdf73571366"
+SRC_URI[sha256sum] = "3ae0466d17e38b82ed52d5201b5f265bbd782403b2e5a62cff244072af61a9fd"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============6491345694240044242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.7.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.15 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.50 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/base64/0.23.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://c
 rates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-p
 arser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-
 macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.49.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.
 io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.37 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.37 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate:
 //crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-synta
 x/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 
 crate://crates.io/smallvec/1.16.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.6 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.15 crate://crates.io/tar-framing/0.0.15 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15
 +spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.27.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/
 0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate
 ://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21" to "https://files.pythonhosted.
 org/packages/source/u/uv_build/uv_build-0.13.9.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.16 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.1 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.50 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/base64/0.23.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.
 14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/di
 splaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.19.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate:/
 /crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.8 crate://crates.io/insta/1.49.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 
 crate://crates.io/jiff/0.2.38 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.38 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.191 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.
 8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_deriv
 e/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 
 crate://crates.io/spdx/0.13.6 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.16 crate://crates.io/tar-framing/0.0.16 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.2 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.3+s
 pec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.28.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate
 ://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crate
 s.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.7" to "0.13.9"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.9.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.7 [default] to 0.13.9 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 3822864 to 3843376 (+1%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.7" to "0.13.9"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.9.dist-info

--===============6491345694240044242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.7-0.13.9.patch"

RnJvbSBiNTQxOTM5ZWZjZmY3NmIxNDgxYTBkMTIxNmM4OGViM2Q2YmE4MTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggTm92IDIwMjYgMDU6MzM6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTMuNyAtPiAwLjEzLjkKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgNDggKysrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjEzLjcuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjkuYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjEz
LjcuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjkuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwppbmRleCBkNjY4NDkzYmQwLi4yM2Q0NzI0MWQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAtMTEs
MTEgKzExLDExIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHls
ZS1xdWVyeS8xLjEuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS13aW5jb24vMy4w
LjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnlob3cvMS4wLjEwNCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYXJjaGl2ZS10cmFpdC8wLjAuMTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2FyY2hpdmUtdHJhaXQvMC4wLjE2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNzdHIvMS4y
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FycmF5dmVjLzAuNy44IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9hc3RyYWwtbWFpbC1oZWFkZXJzLzAuMC4xIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9hc3RyYWwtdG9raW8tdGFyLzAuNy4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3Ry
YWwtdG9raW8tdGFyLzAuNy4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVyc2lv
bi1yYW5nZXMvMC4yLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAv
MC4wLjIyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuNTAg
XApAQCAtNTksNyArNTksNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Rpc3BsYXlkb2MvMC4yLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2R1bmNlLzEuMC41IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9keW4tY2xvbmUvMS4wLjIwIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9laXRoZXIvMS4xOC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9laXRoZXIvMS4x
OS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGVfdW5pY29kZS8xLjAuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2RpbmdfcnMvMC44LjM1IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9lbmNvZGluZ19yc19pby8wLjEuOCBcCkBAIC0xMDMsNyArMTAzLDcgQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pZG5hLzEuMS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9pZG5hX2FkYXB0ZXIvMS4yLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZGV4
bWFwLzIuMTQuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kb2MvMi4wLjcgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0
YS8xLjQ5LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lvLWV4dHJhcy8wLjE5LjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2lvLWxpZmV0aW1lcy8yLjAuNCBcCkBAIC0xMTIsMTMgKzExMiwx
MyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3Bv
bHlmaWxsLzEuNzAuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRvYS8xLjAuMTcgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2ppZmYvMC4yLjM3IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4zOCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1jb3JlLzAuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9qaWZmLXN0YXRpYy8wLjIuMzcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtc3Rh
dGljLzAuMi4zOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vanMtc3lzLzAuMy45MSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vanVuY3Rpb24vMi4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2xhenlfc3RhdGljLzEuNS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xODkg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE5MSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGludXgtcmF3LXN5cy8wLjEyLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpdGVt
YXAvMC44LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvY2tfYXBpLzAuNC4xNCBcCkBAIC0y
MDMsOCArMjAzLDggQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4v
Mi4wLjExOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzMuMC42IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zeW5zdHJ1Y3R1cmUvMC4xMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90
YXItY29kZWMvMC4wLjE1IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90YXItZnJhbWluZy8wLjAu
MTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci1jb2RlYy8wLjAuMTYgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3Rhci1mcmFtaW5nLzAuMC4xNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dGVtcC1lbnYvMC4zLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RlbXBmaWxlLzMuMjcuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVybWluYWxfc2l6ZS8wLjQuNCBcCkBAIC0yMTUsMTQg
KzIxNSwxNCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbnlzdHIv
MC44LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rpbnl2ZWMvMS4xMS4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby90aW55dmVjX21hY3Jvcy8wLjEuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdG9raW8vMS41My4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby8xLjUzLjIgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLW1hY3Jvcy8yLjcuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdG9raW8tc3RyZWFtLzAuMS4xOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9t
bC8xLjEuNitzcGVjLTEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2RhdGV0aW1l
LzEuMS4xK3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZWRpdC8wLjI1
LjE1K3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfcGFyc2VyLzEuMS41
K3NwZWMtMS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfd3JpdGVyLzEuMS4yK3Nw
ZWMtMS4xLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfd3JpdGVyLzEuMS4zK3NwZWMt
MS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmcvMC4xLjQ0IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby90cmFjaW5nLWF0dHJpYnV0ZXMvMC4xLjMxIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90cmFjaW5nLWNvcmUvMC4xLjM2IFwKQEAgLTIzOCw3ICsyMzgsNyBAQCBTUkNfVVJJ
ICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybC8yLjUuOCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4cGFy
c2UvMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQvMS4yNy4wIFwKKyAgICBjcmF0
ZTovL2NyYXRlcy5pby91dWlkLzEuMjguMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmFsdWFi
bGUvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZlcnNpb25fY2hlY2svMC45LjUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEgXApAQCAtMzA3LDExICszMDcsMTEgQEAg
U1JDX1VSSVthbnN0eWxlLXBhcnNlLTEuMC4wLnNoYTI1NnN1bV0gPSAiNTJjZTdmMzhiMjQyMzE5
ZjdjYWJhYTY4MTMwNTU0NjcwNjNlY2QKIFNSQ19VUklbYW5zdHlsZS1xdWVyeS0xLjEuNS5zaGEy
NTZzdW1dID0gIjQwYzQ4ZjcyZmQ1M2NkMjg5MTA0ZmM2NDA5OWFiY2E3M2RiNDE2NmFkODZlYTBi
NDM0MWFiZTY1YWY4M2RhZGMiCiBTUkNfVVJJW2Fuc3R5bGUtd2luY29uLTMuMC4xMS5zaGEyNTZz
dW1dID0gIjI5MWU2YTI1MGZmODZjZDRhODIwMTEyZmI4ODk4ODA4YTM2NmQ4ZjlmNThjZTE2ZDFm
NTM4MzUzYWQ1NTc0N2QiCiBTUkNfVVJJW2FueWhvdy0xLjAuMTA0LnNoYTI1NnN1bV0gPSAiMzMw
YTVlZDA3ZmE1NGU0NzAyYzlkNmM0MTc0Zjc0NDI3ZmMwZWY2ZTIxNGJiZDY3N2FlNTBhNTA5OTk0
NjQ3MCIKLVNSQ19VUklbYXJjaGl2ZS10cmFpdC0wLjAuMTUuc2hhMjU2c3VtXSA9ICI5OTliZjg4
Y2M0ODM2NjRjYWI3NzcwMGNhMmZkZmIwNDE1YTczNDEyYWJlMjg0ZWY1YmMyMzE5ZDAwOTM4ZTAw
IgorU1JDX1VSSVthcmNoaXZlLXRyYWl0LTAuMC4xNi5zaGEyNTZzdW1dID0gIjBiNTA0MGNhOTM1
YzA5ODg4ZTdkZmIwNDM4M2I0ZDYyZmEzNTcxZTI1YmM2NmI2ZjM0NWI1OTFlOTc5NTg1MjQiCiBT
UkNfVVJJW2FyY3N0ci0xLjIuMC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4
NzczMmUyOTIxMTc1ZjI2YzM1MGI0NTYzODQxZDA5NThjMjFkNTdlNmQiCiBTUkNfVVJJW2FycmF5
dmVjLTAuNy44LnNoYTI1NnN1bV0gPSAiZDNmYjY3YTZlMDhhY2YyNGZkZWNjYmFjMmNiNmFjNDMw
NTgyNWJkMWYxMTc0NjJlMGU2ZjJmMTkzMzQ1YWQ1NiIKIFNSQ19VUklbYXN0cmFsLW1haWwtaGVh
ZGVycy0wLjAuMS5zaGEyNTZzdW1dID0gImRjMDE5ZWNjYTgyY2ZjOTFmZmEzMWFiNGZmZTcwNWFh
YTcwNjM5OTg0MGE3MTUyOTI2YjdlZWU3MzZkYTQxMGEiCi1TUkNfVVJJW2FzdHJhbC10b2tpby10
YXItMC43LjAuc2hhMjU2c3VtXSA9ICI2ZjJlOTg5YjMzMjQ2ZmU5MjQwZDM5YWNjZjRkZDlhMDFl
MGI2YzFmM2NlOWRkMDk1ZTBhNDdmYTAyNTA1NTIzIgorU1JDX1VSSVthc3RyYWwtdG9raW8tdGFy
LTAuNy4xLnNoYTI1NnN1bV0gPSAiODIxZWQzNmRhZjdjNDBkMDBhN2I2Mjc1OWY5ODMzZmIyNzlm
YjdjODdkZDk4OWVjMGE0ZDYyNmRjZDhkMWRjYSIKIFNSQ19VUklbYXN0cmFsLXZlcnNpb24tcmFu
Z2VzLTAuMi4zLnNoYTI1NnN1bV0gPSAiYjMxNWFjYzRkYzdmMGQzY2NkZDU1N2EwMWI2YTg5ZmEy
ZDg5NmU5OWE0NTBiOThlODI5ZmM4MTUyZjBiMmY5OCIKIFNSQ19VUklbYXN0cmFsX2FzeW5jX3pp
cC0wLjAuMjIuc2hhMjU2c3VtXSA9ICIwZjg1MDhkMDljNmJjNmFiZDQyNzY3ZDFkNDNjNzcwMjg5
MTY5MTQ4NDg3NWNlOTRmNzk5N2RhMTMwMWQ5NWU5IgogU1JDX1VSSVthc3luYy1jb21wcmVzc2lv
bi0wLjQuNTAuc2hhMjU2c3VtXSA9ICJlZTE5YmQ5OWI0M2UzNjkxYWNiYWQ0ZTg0MDQyMGE0ODgx
Y2VhNmMwYjY2YTIwODEyNWE4MjRmOGZkNTNmNWExIgpAQCAtMzU1LDcgKzM1NSw3IEBAIFNSQ19V
UklbZGlnZXN0LTAuMTEuMy5zaGEyNTZzdW1dID0gImYxZGQ2ZGJiNTg0MTkzNzk0MDc4MTg2NmZh
MTI4MWExZmY3YmQzYmY4MjcwCiBTUkNfVVJJW2Rpc3BsYXlkb2MtMC4yLjUuc2hhMjU2c3VtXSA9
ICI5NzM2OWNiYmMwNDFiYzM2Njk0OWJjNzRkMzQ2NThkNmNkYTU2MjEwMzk3MzFjNjMxMDUyMTg5
MmEzYTIwYWUwIgogU1JDX1VSSVtkdW5jZS0xLjAuNS5zaGEyNTZzdW1dID0gIjkyNzczNTA0ZDU4
YzA5M2Y2ZGUyNDU5YWY0YWYzM2ZhYTUxOGMxMzQ1MWViOGYyYjU2OThlZDNkMzZlN2M4MTMiCiBT
UkNfVVJJW2R5bi1jbG9uZS0xLjAuMjAuc2hhMjU2c3VtXSA9ICJkMDg4MWVhMTgxYjFkZjczZmY3
N2ZmYWFmOWM3NTQ0ZWNjMTFlODJmYmE5YjVmMjdiMjYyYTNjNzNhMzMyNTU1IgotU1JDX1VSSVtl
aXRoZXItMS4xOC4wLnNoYTI1NnN1bV0gPSAiMjUyYWZiOWFlNWVhYTY4M2JhYmRjNmEwNjhiM2Y1
NzI2ZWIxOWUwNTA3MGM3MzFmOWIyYTIzYTdjM2U4ZWQzNCIKK1NSQ19VUklbZWl0aGVyLTEuMTku
MC5zaGEyNTZzdW1dID0gIjBlOWM3MWMyMTY3Y2EzMjNjODgyYjk5OTE4OTI5NDAzNDI2ZTIzNzNl
YTE3MjQyZmY1NjUzZTBkNWUxMDU4YmUiCiBTUkNfVVJJW2VuY29kZV91bmljb2RlLTEuMC4wLnNo
YTI1NnN1bV0gPSAiMzRhYTczNjQ2ZmZiMDA2YjhmNTE0N2YzZGMxODJiZDRiY2IxOTAyMjdjZTg2
MWZjNGE0ODQ0YmY4ZTNjYjJjMCIKIFNSQ19VUklbZW5jb2RpbmdfcnMtMC44LjM1LnNoYTI1NnN1
bV0gPSAiNzUwMzBmM2M0ZjQ1ZGFmZDc1ODZkZDY3ODA5NjVhOGM3ZThlMjg1YTVlY2I4NjcxM2U2
M2E3OWM1YjI3NjZmMyIKIFNSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4xLjguc2hhMjU2c3VtXSA9
ICJmYmEzZmU4NDcwNDVlY2ZmNzk0YjljMTM4MjkzYTgwZGI5MTQ2NzhjNDUzYWQ2M2ZiZjBjNmE5
ZWI2ZTAwYjIyIgpAQCAtMzk5LDcgKzM5OSw3IEBAIFNSQ19VUklbaWN1X3Byb3ZpZGVyLTIuMS4x
LnNoYTI1NnN1bV0gPSAiODU5NjJjZjBjZTAyZTFlMGE2MjljYzM0ZTdjYTNlMzczY2UyMGRkCiBT
UkNfVVJJW2lkbmEtMS4xLjAuc2hhMjU2c3VtXSA9ICIzYjA4NzVmMjNjYWEwMzg5ODk5NGY2ZGRj
NTAxODg2YTQ1YzdkM2Q2MmQwNGQyZDkwNzg4ZDQ3YmUxYjFlNGRlIgogU1JDX1VSSVtpZG5hX2Fk
YXB0ZXItMS4yLjEuc2hhMjU2c3VtXSA9ICIzYWNhZTk2MDk1NDBhYTMxOGQxYmM1ODg0NTUyMjVm
YjIwODViOWVkMGM0ZjZiZDBkOWQ1YmNkODZmMWEwMzQ0IgogU1JDX1VSSVtpbmRleG1hcC0yLjE0
LjIuc2hhMjU2c3VtXSA9ICJjYzRlMTkwZjVkMjZjYTcwNTE2NDI2MjlkYTJjNTJmYzAzYmRlODVh
MDMxOTdjOTk0MDhkY2QyOTE3MzRjODU1IgotU1JDX1VSSVtpbmRvYy0yLjAuNy5zaGEyNTZzdW1d
ID0gIjc5Y2Y1YzkzZjkzMjI4Y2Y4ZWZiM2JhMzYyNTM1ZmIxMTE5OWFjNTQ4YTA5Y2UxMTdjOWIx
YWRjMzAzMGQ3MDYiCitTUkNfVVJJW2luZG9jLTIuMC44LnNoYTI1NnN1bV0gPSAiYTM3YjI2OTE3
OTZjZmZlYjhhOGNkMzA1YWM2NmU2NTg0MTU1OWYxNDdmNGU2MzIzMWQwZWFmYTRkYjUzODRkMSIK
IFNSQ19VUklbaW5zdGEtMS40OS4wLnNoYTI1NnN1bV0gPSAiYjY3ZDNkMmUyODdlNGI4NmMxMGIz
ZjNiNjQxMDMzZDFmODliNzRiZGIzOWQwNWYzNDk1MmUyYjlhNmZlMjFjZCIKIFNSQ19VUklbaW8t
ZXh0cmFzLTAuMTkuMC5zaGEyNTZzdW1dID0gIjIwZmQ2ZGU0Y2NmY2MxODdlMzhiYzIxY2ZhNTQz
Y2I1YTMwMmNiODZhOGIxMTRlYjdmMGJmMGRjOWY4YWMwMGYiCiBTUkNfVVJJW2lvLWxpZmV0aW1l
cy0yLjAuNC5zaGEyNTZzdW1dID0gIjA2NDMyZmI1NGQzYmU3OTY0ZWNkMzY0OTIzM2NkZGY4MGRi
MjgzMmY0N2ZlYzM0YzAxZjY1YjNkOWQ3NzQ5ODMiCkBAIC00MDgsMTMgKzQwOCwxMyBAQCBTUkNf
VVJJW2lwbmV0LTIuMTIuMC5zaGEyNTZzdW1dID0gImQ5OGY2ZmVkMWZkZTNmOGMyMWJjNDBhMWFi
Yjg4ZGQ3NWU2NzkyNGY5Y2ZmYwogU1JDX1VSSVtpc190ZXJtaW5hbF9wb2x5ZmlsbC0xLjcwLjIu
c2hhMjU2c3VtXSA9ICJhNmNiMTM4YmI3OWExNDZjMWJkNDYwMDA1NjIzZTE0MmVmMDE4MWUzZDAy
MTljYjQ5M2UwMmY3ZDA4YTM1Njk1IgogU1JDX1VSSVtpdGVydG9vbHMtMC4xNC4wLnNoYTI1NnN1
bV0gPSAiMmIxOTJjNzgyMDM3ZmFkZDljZmE3NTU0ODMxMDQ4OGFhYmRiZjNkMmRhNzM4ODViMzFi
ZDBhYmQwMzM1MTI4NSIKIFNSQ19VUklbaXRvYS0xLjAuMTcuc2hhMjU2c3VtXSA9ICI5MmVjYzY2
MTgxODFkZWYwNDU3MzkyY2NkMGVlNTExOThlMDY1ZTAxNmQxZDUyN2E3YWMxYjZkYzdjMWYwOWQy
IgotU1JDX1VSSVtqaWZmLTAuMi4zNy5zaGEyNTZzdW1dID0gIjBhYjFiYWY3MmYwODc5NmRlMDI2
MDYwOTUxNTEzMDY5OWI4OTBhYzI1ZjMwZTYxMGFkODk0YmM1ODU2Y2FmZGIiCitTUkNfVVJJW2pp
ZmYtMC4yLjM4LnNoYTI1NnN1bV0gPSAiYjJiMDA1NzE1ZGNiZWIwMDg5YTNjMGRhYjk5ZjJmZjFj
YzNiMjUyNTMyMzU1MjcwM2Q2NDg1ODVkMzQyYTM4MyIKIFNSQ19VUklbamlmZi1jb3JlLTAuMS4w
LnNoYTI1NnN1bV0gPSAiN2ZlY2E4ODQzOWVmZTUzZGEzNzU0NTAwYzE4NTFkZWRmM2NiMzZjNTI0
ZGQ1Y2Y4MjI1Y2MwNzk0ZGU5NWQwOSIKLVNSQ19VUklbamlmZi1zdGF0aWMtMC4yLjM3LnNoYTI1
NnN1bV0gPSAiMzc4MjY4YTExMTZhZDY3YWU2MjI4NzAxMTE4YWM5ZjQ5MWQ3OGZkYTM4YTQwYTFm
MWE5ZTEzNDhkZTZmNzIxMiIKK1NSQ19VUklbamlmZi1zdGF0aWMtMC4yLjM4LnNoYTI1NnN1bV0g
PSAiMmNjOTgxNzI1M2NmN2M3ZWU0Njg0NDUxYmQzMjdlODhkNmYzNjU4MDE0ZTU0YTI5MTk4NjI1
NTkwNjUwNjk1YyIKIFNSQ19VUklbanMtc3lzLTAuMy45MS5zaGEyNTZzdW1dID0gImI0OTcxNWI3
MDczZjM4NWJhNGJjNTI4ZTU3NDdkMDJlNjZjYjM5YzYxNDZlZmI2NmI3ODFmMTMxZjBmYjM5OWMi
CiBTUkNfVVJJW2p1bmN0aW9uLTIuMS4wLnNoYTI1NnN1bV0gPSAiY2RlNDhmMzY1MzBjYmQ5MWI2
NWYwNTAxMDFlNmMwNTZkNmViNzQzY2VhMmE4ZjBmMTliZWVmNjljNjc0MmZmOCIKIFNSQ19VUklb
bGF6eV9zdGF0aWMtMS41LjAuc2hhMjU2c3VtXSA9ICJiYmQyYmNiNGM5NjNmMmRkYWUwNmEyZWZj
N2U5ZjM1OTEzMTI0NzNjNTBjNjY4NWUxZjI5ODA2ODMxNmU2NmZlIgotU1JDX1VSSVtsaWJjLTAu
Mi4xODkuc2hhMjU2c3VtXSA9ICIzZWFmM2VkZTNmZWU2ZGIxYTRjMmVlMDkxYmY4YThiNGRjY2Rj
NmQxN2Y2NTZmYjA3ODk2ZWU3Mjg2NzYxMmYyIgorU1JDX1VSSVtsaWJjLTAuMi4xOTEuc2hhMjU2
c3VtXSA9ICI2NWNkODdjOWE2ZDYwNTM2NTgwYjMxNmFkOTg1NzI2MTA0NzMwYTUxNTFjOTk4NDVm
MjQ5MDQyOGVmOTEyNDBhIgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZzdW1d
ID0gIjMyYTY2OTQ5ZTAzMGRhMDBlOGM3ZDQ0MzRiMjUxNjcwYTkxNTU2ZjQxNDQ5NDFkMzc0NTI3
NjljMjVkNThhNTMiCiBTUkNfVVJJW2xpdGVtYXAtMC44LjEuc2hhMjU2c3VtXSA9ICI2MzczNjA3
YTU5ZjBiZTczYTM5YjZmZTQ1NmI4MTkyZmNjMzU4NWY2MDJhZjIwNzUxNjAwZTk3NGRkNDU1ZTc3
IgogU1JDX1VSSVtsb2NrX2FwaS0wLjQuMTQuc2hhMjU2c3VtXSA9ICIyMjQzOTllNzRiODdiNWYz
NTU3NTExZDk4ZGZmOGIxNDA4OWIzZGFkYWZjYWI2YmI5M2VhYjY3ZDNhYWNlOTY1IgpAQCAtNDk5
LDggKzQ5OSw4IEBAIFNSQ19VUklbc3Ryc2ltLTAuMTEuMS5zaGEyNTZzdW1dID0gIjdkYThiNTcz
Njg0NWQ5ZjJmY2I4MzdlYTVkOWUyNjI4NTY0YjNiMDQzYTcwCiBTUkNfVVJJW3N5bi0yLjAuMTE4
LnNoYTI1NnN1bV0gPSAiMWI5YWU1N2Y5MDQyMTNlYmI2NDljZTY4OTViOGE2NmM2NmYwMjAzYjkz
MTk3MThmNjlhNTYxMmEwNjViMTQyMiIKIFNSQ19VUklbc3luLTMuMC42LnNoYTI1NnN1bV0gPSAi
ODU5M2U4ZTcyMTU5ZWQyMjU3ZDA4M2M3YTQ1NGE4NWNiZjg1NGYzN2EwOTY2ZDhkNDgzYWZmOGM4
YTNlYmNlZSIKIFNSQ19VUklbc3luc3RydWN0dXJlLTAuMTMuMi5zaGEyNTZzdW1dID0gIjcyOGE3
MGYzZGJhZjViYWI3ZjBjNGIxYWM4ZDdhZTVlYTYwYTRiNTU0OWM4YTU5MTQzNjFjOTkxNDdhNzA5
ZDIiCi1TUkNfVVJJW3Rhci1jb2RlYy0wLjAuMTUuc2hhMjU2c3VtXSA9ICJiOWRhZDYxNWU1MGQx
ODFhZmVhNGJhZmVhMjNkYWNiOGUzM2VkNTJkZGUwNjUwMzgxMzU3MDYzNGI5MzJkNDY3IgotU1JD
X1VSSVt0YXItZnJhbWluZy0wLjAuMTUuc2hhMjU2c3VtXSA9ICI1NjNlODE4MWI0N2M5Y2RjY2U1
NjllYWUzYWQ0MzFlZWM3MTU0M2Q2MjY5ZGQ2MGM3YmQyMzUwZjcwYmNkMjMzIgorU1JDX1VSSVt0
YXItY29kZWMtMC4wLjE2LnNoYTI1NnN1bV0gPSAiNjg3NWJhNTA3YmJlYzYwMjI1MDBmNDY0Nzcx
NTlhMDNmMDdlYmRmZmRiNGVhMDQzMjU0OTc0NTMxZGYxZGFjMiIKK1NSQ19VUklbdGFyLWZyYW1p
bmctMC4wLjE2LnNoYTI1NnN1bV0gPSAiNDk3MjdiMWEzMDA1MTQ5NjBkNDI1ZDBlNzQxYTdkYTNl
NjkzMTcwZjNkYjM5ZGUzMTgwZmRiYmMwN2U1NDJjNSIKIFNSQ19VUklbdGVtcC1lbnYtMC4zLjYu
c2hhMjU2c3VtXSA9ICI5NjM3NDg1NTA2OGY0NzQwMmMzMTIxYzZlZWQ4OGQyOWNiMWRlOGYzYWIy
NzA5MGUyNzNlNDIwYmRhYmNmMDUwIgogU1JDX1VSSVt0ZW1wZmlsZS0zLjI3LjAuc2hhMjU2c3Vt
XSA9ICIzMjQ5N2U5YTRjN2IzODUzMmVmY2RlYmVlZjg3OTcwN2FhOWY3OTQyOTZhNGYwMjQ0ZjZm
NjllOWJjODU3NGJkIgogU1JDX1VSSVt0ZXJtaW5hbF9zaXplLTAuNC40LnNoYTI1NnN1bV0gPSAi
MjMwYTFiODIxY2NiZDc1YjE4NTgyMGExZjFmZjdiMTRkMjFkYTFlNDQyZTIyYzA4NjNlYTVmMDg3
NzFhODg3NCIKQEAgLTUxMSwxNCArNTExLDE0IEBAIFNSQ19VUklbdGhyZWFkX2xvY2FsLTEuMS45
LnNoYTI1NnN1bV0gPSAiZjYwMjQ2YTQ5NDRmMjRmNmUwMThhYTE3Y2RlZmZiNzgxOGI3NjM1CiBT
UkNfVVJJW3RpbnlzdHItMC44LjIuc2hhMjU2c3VtXSA9ICI0MmQzZTljNDVjMDlkZTE1ZDA2ZGQ4
YWNmNWY0ZTBlMzk5ZTg1OTI3YjdmMDA3MTEwMjRlYjdhZTEwZmE0ODY5IgogU1JDX1VSSVt0aW55
dmVjLTEuMTEuMC5zaGEyNTZzdW1dID0gIjNlNjFlNjcwNTNkMjVhNGU4MmM4NDRlODQyNDAzOWQ5
NzQ1NzgxYjNmYzRmMzJiOGQ1NWVkNTBmNWY2NjdlZjMiCiBTUkNfVVJJW3Rpbnl2ZWNfbWFjcm9z
LTAuMS4xLnNoYTI1NnN1bV0gPSAiMWYzY2NiYWMzMTFmZWEwNWY4NmY2MTkwNGI0NjJiNTVmYjNk
Zjg4MzdhMzY2ZGZjNjAxYTAxNjFkMDUzMmYyMCIKLVNSQ19VUklbdG9raW8tMS41My4xLnNoYTI1
NnN1bV0gPSAiMjAyY2FlYTg3MWI2OTY2ODI1MGQyNDIwNzA4NDllYjQ5NWJlMTc4ZWQ2OTdhM2U5
OGFlYmNlNWJjODFhMGJlZCIKK1NSQ19VUklbdG9raW8tMS41My4yLnNoYTI1NnN1bV0gPSAiZTk1
ZjkxZmNjN2E2MjFlOGIwMzBmNmFhMjNjNzFmZTk4MzhhZTJmYjRkODExOGI3NTYwMmEzMjhmNTE0
NDA0NCIKIFNSQ19VUklbdG9raW8tbWFjcm9zLTIuNy4wLnNoYTI1NnN1bV0gPSAiMzg1YTZjYjcx
YWI5YWI3OTBjNWZlOGQ2N2YxNjQ1ZTZjNDUwYTdjZTAwNmEzM2RlMDNkYWE5NTZjZjcwYTQ5NiIK
IFNSQ19VUklbdG9raW8tc3RyZWFtLTAuMS4xOS5zaGEyNTZzdW1dID0gImEzZDA2ZjBiMDgyYmE1
N2MyNmI3OTQwNzM3MmU1N2NmMmExZTI4MTI0Zjc4ZTk0NzlmZTgwMzIyY2Y1MzQyMGIiCiBTUkNf
VVJJW3RvbWwtMS4xLjYrc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gIjkyMDYwMjU0M2YwOTExYWI3
MWRhMTJjNTBkNTk3MDFkYTU0YzE5NmQxYTJiZjVjYjRiNzU2NjdmMTM3YTQwNmEiCiBTUkNfVVJJ
W3RvbWxfZGF0ZXRpbWUtMS4xLjErc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gIjMxNjVmNjVmNjJl
MjhlMDExNWEwMGIyZWJkZDM3ZWI2ZjNiNjQxODU1ZjlkNjM2ZDNjZDQxMDM3NjcxNTlhZDciCiBT
UkNfVVJJW3RvbWxfZWRpdC0wLjI1LjE1K3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICIxMzQwZWE5
NGE1ODU2MzMzNDkyYzkwNjRiMDJjNzc4YjE5MWRkMmM4NTM3NzhkOTYwOWRlYmRjZGZlYTNhNjE0
IgogU1JDX1VSSVt0b21sX3BhcnNlci0xLjEuNStzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiYmFh
NjkzYTgwMzJkN2UxY2FkYTdkMDA0MWU5NjEyNmRmMjQzMTc5ZmYwNjE0NTY3ODNhYzdmMTJiZGE0
NzQ0YyIKLVNSQ19VUklbdG9tbF93cml0ZXItMS4xLjIrc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0g
IjdkNTYzNTNhMmE2NjVhZDBmNDFhNDIxMTg3MTgwYWFiNzQ2YzhjMzI1NjIwNjE3YWQ4ODNhOTlh
MWNiZTY2ZDIiCitTUkNfVVJJW3RvbWxfd3JpdGVyLTEuMS4zK3NwZWMtMS4xLjAuc2hhMjU2c3Vt
XSA9ICIwNmJkYmQ4Y2ZjMDU2YjhkMmUyZTg1ZjI5YjU2YTNiZGJlY2I1MjdjZWY4MWViMzllM2U3
Yjk4YWY0NjUyNzcwIgogU1JDX1VSSVt0cmFjaW5nLTAuMS40NC5zaGEyNTZzdW1dID0gIjYzZTcx
NjYyZmE0YjJhMmMzYTI2ZjU3MGYwMzdlYjk1YmIxZjg1Mzk3ZjNjZDgwNzZjYWVkMmYwMjZhNmQx
MDAiCiBTUkNfVVJJW3RyYWNpbmctYXR0cmlidXRlcy0wLjEuMzEuc2hhMjU2c3VtXSA9ICI3NDkw
Y2ZhNWVjOTYzNzQ2NTY4NzQwNjUxYWM2NzgxZjcwMWM5YzVlYTI1N2M1OGUwNTdmM2JhOGNmNjll
OGRhIgogU1JDX1VSSVt0cmFjaW5nLWNvcmUtMC4xLjM2LnNoYTI1NnN1bV0gPSAiZGI5N2NhZjlk
OTA2ZmJkZTU1NWRkNjJmYTk1ZGRiYTllZWNmZDE0Y2IzODhlNGY0OTFhNjZkNzRjZDVmYjc5YSIK
QEAgLTUzNCw3ICs1MzQsNyBAQCBTUkNfVVJJW3Vuc2Nhbm55LTAuMS4wLnNoYTI1NnN1bV0gPSAi
ZTlkZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMwZDQ0ZAogU1JDX1VSSVt1cmwt
Mi41Ljguc2hhMjU2c3VtXSA9ICJmZjY3YThhNDM5NzM3M2MzZWY2NjA4MTJhY2FiMzI2ODIyMjAz
NTAxMGFiODY4MGVjNDIxNWYzOGJhM2QwZWVkIgogU1JDX1VSSVt1dGY4X2l0ZXItMS4wLjQuc2hh
MjU2c3VtXSA9ICJiNmMxNDA2MjBlN2ZmYmIyMmMyZGVlNTljYWZlNjA4NGE1OWI1ZmZjMjdhODg1
OWE1ZjBkNDk0YjVkNTJiNmJlIgogU1JDX1VSSVt1dGY4cGFyc2UtMC4yLjIuc2hhMjU2c3VtXSA9
ICIwNmFiZGUzNjExNjU3YWRmNjZkMzgzZjAwYjA5M2Q3ZmFlY2M3ZmE1NzA3MWNjZTI1Nzg2NjBj
OWYxMDEwODIxIgotU1JDX1VSSVt1dWlkLTEuMjcuMC5zaGEyNTZzdW1dID0gIjk3Mjc3ZDM2Yjlj
M2FjZTEzZTU4ZmE2ZTc1M2Y4YjBiYmJmMzAyYTE4ZGQxOTMyNDBkNzBmOWUyOTY4MTA1OWEiCitT
UkNfVVJJW3V1aWQtMS4yOC4wLnNoYTI1NnN1bV0gPSAiN2NjMTE4NjM4NGJlYjdkZDhlZWRlYTM3
NjQxM2ZkNjU0OTM3Mjg1ZWE2YzljZmJiOTI4ZGMzMDQzZWE0YjYwNiIKIFNSQ19VUklbdmFsdWFi
bGUtMC4xLjEuc2hhMjU2c3VtXSA9ICJiYTczZWE5Y2YxNmEyNWRmMGM4Y2FhMTZjNTFhY2I5Mzdk
NTcxMmE4NDI5ZGI3OGEzZWUyOWQ1ZGNhY2QzYTY1IgogU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAu
OS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDVi
MTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKIFNSQ19VUklbdnRlLTAuMTQuMS5zaGEyNTZzdW1d
ID0gIjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0NDEyNmFjYzBhOTgyZjQwNDBh
YzNmOWYwYmMwNzciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXYtYnVpbGRfMC4xMy43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXV2LWJ1aWxkXzAuMTMuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy43LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMy45LmJiCmluZGV4IDg5NzQ1NTBjODYuLjY5Y2M2ZmIyODQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjcuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTMuOS5iYgpA
QCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNI
RTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZj
ZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3Jh
dGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkw
Mjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNTYxYzRmYTAwZjY0ZWZkMzQ4YmRiZTNh
MDFhZGU0MWJjOWFmOTliYTU3ZDgwN2NjN2IyYWJkZjczNTcxMzY2IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjNhZTA0NjZkMTdlMzhiODJlZDUyZDUyMDFiNWYyNjViYmQ3ODI0MDNiMmU1YTYyY2Zm
MjQ0MDcyYWY2MWE5ZmQiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4x
Cgo=

--===============6491345694240044242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.9.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.9.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.9.dist-info

--===============6491345694240044242==--
