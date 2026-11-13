Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5983.1794551761092240887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jsT+OK/p;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0orBJaRI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1d39ec4cf-1c401f94-0b3b-4353-bd28-b810c0e19e49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794551760;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QGoUIuBrrr0AyIBk+5l9mV+CprE116Z/RLe9Z6UTmR4=;
	b=jsT+OK/psrPsUEmYWj1JIuT5Uuj3AVQfYU3QgOKAMFeslxWT06AYJ/95yj06768h
	bH1YLSBpPw7iEebybwu7oy9hCi2Nu/zMySG1Djvhwn1moHEpRErANMjSaFIIFWV5+H1
	aIalj8vSgSO8PGdkADaOJmT9AAErkDvp4WBnGUkE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794551760;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QGoUIuBrrr0AyIBk+5l9mV+CprE116Z/RLe9Z6UTmR4=;
	b=0orBJaRIVHx9lWs/Oak3tNp7kkS2A24lLFe6esG+vRUq+5J/OO3Hw89y9t7PwE63
	l+kZ3gt1wlcfV0ahwFbeR9BNgNPWbAdUluPAv0EVK9DULHo0XsVcqBAMfRgBsp+be/X
	7FX588rFJ4Z0GY09IR+FvkSbTAZ3FEF1N3Fy3Lpg=
Content-Type: multipart/mixed; boundary="===============3279596120172795714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.8 SUCCEEDED
Message-ID: <010101a1d39ec4cf-1c401f94-0b3b-4353-bd28-b810c0e19e49-000000@us-west-2.amazonses.com>
Date: Fri, 13 Nov 2026 06:36:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.13-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250147

--===============3279596120172795714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.7-0.13.8.patch
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
From b11ea7d6332f989d3371cd2b94c2d9c41446752d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 13 Nov 2026 05:54:00 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.7 -> 0.13.8

---
 .../python/python3-uv-build-crates.inc        | 44 +++++++++----------
 ...d_0.13.7.bb => python3-uv-build_0.13.8.bb} |  2 +-
 2 files changed, 23 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.7.bb => python3-uv-build_0.13.8.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index d668493bd0..5354010b43 100644
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
@@ -112,9 +112,9 @@ SRC_URI += " \
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
@@ -408,9 +408,9 @@ SRC_URI[ipnet-2.12.0.sha256sum] = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc
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
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
index 8974550c86..68ad48b1b8 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.7.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c561c4fa00f64efd348bdbe3a01ade41bc9af99ba57d807cc7b2abdf73571366"
+SRC_URI[sha256sum] = "038c16dc60d63c336cb5364000e11068c79dd0142682fbd4ae3e5470c11fddc5"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============3279596120172795714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.7-0.13.8.patch"

RnJvbSBiMTFlYTdkNjMzMmY5ODlkMzM3MWNkMmI5NGMyZDljNDE0NDY3NTJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTMgTm92IDIwMjYgMDU6NTQ6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTMuNyAtPiAwLjEzLjgKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgNDQgKysrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjEzLjcuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjguYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjEz
LjcuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjguYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwppbmRleCBkNjY4NDkzYmQwLi41MzU0MDEwYjQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
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
IGNyYXRlOi8vY3JhdGVzLmlvL2lvLWxpZmV0aW1lcy8yLjAuNCBcCkBAIC0xMTIsOSArMTEyLDkg
QEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pc190ZXJtaW5hbF9wb2x5
ZmlsbC8xLjcwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0ZXJ0b29scy8wLjE0LjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0b2EvMS4wLjE3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9qaWZmLzAuMi4zNyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi8wLjIuMzggXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtY29yZS8wLjEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vamlmZi1zdGF0aWMvMC4yLjM3IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRp
Yy8wLjIuMzggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pzLXN5cy8wLjMuOTEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2p1bmN0aW9uLzIuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9s
YXp5X3N0YXRpYy8xLjUuMCBcCkBAIC0yMDMsOCArMjAzLDggQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjExOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c3luLzMuMC42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW5zdHJ1Y3R1cmUvMC4xMy4yIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby90YXItY29kZWMvMC4wLjE1IFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby90YXItZnJhbWluZy8wLjAuMTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci1j
b2RlYy8wLjAuMTYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci1mcmFtaW5nLzAuMC4xNiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcC1lbnYvMC4zLjYgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3RlbXBmaWxlLzMuMjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVybWluYWxf
c2l6ZS8wLjQuNCBcCkBAIC0yMTUsMTQgKzIxNSwxNCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3RpbnlzdHIvMC44LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rp
bnl2ZWMvMS4xMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW55dmVjX21hY3Jvcy8wLjEu
MSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8vMS41My4xIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby90b2tpby8xLjUzLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLW1hY3Jv
cy8yLjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8tc3RyZWFtLzAuMS4xOSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbC8xLjEuNitzcGVjLTEuMS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90b21sX2RhdGV0aW1lLzEuMS4xK3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3RvbWxfZWRpdC8wLjI1LjE1K3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3RvbWxfcGFyc2VyLzEuMS41K3NwZWMtMS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3RvbWxfd3JpdGVyLzEuMS4yK3NwZWMtMS4xLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3RvbWxfd3JpdGVyLzEuMS4zK3NwZWMtMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Ry
YWNpbmcvMC4xLjQ0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWF0dHJpYnV0ZXMv
MC4xLjMxIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWNvcmUvMC4xLjM2IFwKQEAg
LTIzOCw3ICsyMzgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Vy
bC8yLjUuOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby91dGY4cGFyc2UvMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3V1aWQvMS4yNy4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91dWlkLzEuMjguMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdmFsdWFibGUvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3ZlcnNpb25fY2hlY2svMC45LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEg
XApAQCAtMzA3LDExICszMDcsMTEgQEAgU1JDX1VSSVthbnN0eWxlLXBhcnNlLTEuMC4wLnNoYTI1
NnN1bV0gPSAiNTJjZTdmMzhiMjQyMzE5ZjdjYWJhYTY4MTMwNTU0NjcwNjNlY2QKIFNSQ19VUklb
YW5zdHlsZS1xdWVyeS0xLjEuNS5zaGEyNTZzdW1dID0gIjQwYzQ4ZjcyZmQ1M2NkMjg5MTA0ZmM2
NDA5OWFiY2E3M2RiNDE2NmFkODZlYTBiNDM0MWFiZTY1YWY4M2RhZGMiCiBTUkNfVVJJW2Fuc3R5
bGUtd2luY29uLTMuMC4xMS5zaGEyNTZzdW1dID0gIjI5MWU2YTI1MGZmODZjZDRhODIwMTEyZmI4
ODk4ODA4YTM2NmQ4ZjlmNThjZTE2ZDFmNTM4MzUzYWQ1NTc0N2QiCiBTUkNfVVJJW2FueWhvdy0x
LjAuMTA0LnNoYTI1NnN1bV0gPSAiMzMwYTVlZDA3ZmE1NGU0NzAyYzlkNmM0MTc0Zjc0NDI3ZmMw
ZWY2ZTIxNGJiZDY3N2FlNTBhNTA5OTk0NjQ3MCIKLVNSQ19VUklbYXJjaGl2ZS10cmFpdC0wLjAu
MTUuc2hhMjU2c3VtXSA9ICI5OTliZjg4Y2M0ODM2NjRjYWI3NzcwMGNhMmZkZmIwNDE1YTczNDEy
YWJlMjg0ZWY1YmMyMzE5ZDAwOTM4ZTAwIgorU1JDX1VSSVthcmNoaXZlLXRyYWl0LTAuMC4xNi5z
aGEyNTZzdW1dID0gIjBiNTA0MGNhOTM1YzA5ODg4ZTdkZmIwNDM4M2I0ZDYyZmEzNTcxZTI1YmM2
NmI2ZjM0NWI1OTFlOTc5NTg1MjQiCiBTUkNfVVJJW2FyY3N0ci0xLjIuMC5zaGEyNTZzdW1dID0g
IjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4NzczMmUyOTIxMTc1ZjI2YzM1MGI0NTYzODQxZDA5NThj
MjFkNTdlNmQiCiBTUkNfVVJJW2FycmF5dmVjLTAuNy44LnNoYTI1NnN1bV0gPSAiZDNmYjY3YTZl
MDhhY2YyNGZkZWNjYmFjMmNiNmFjNDMwNTgyNWJkMWYxMTc0NjJlMGU2ZjJmMTkzMzQ1YWQ1NiIK
IFNSQ19VUklbYXN0cmFsLW1haWwtaGVhZGVycy0wLjAuMS5zaGEyNTZzdW1dID0gImRjMDE5ZWNj
YTgyY2ZjOTFmZmEzMWFiNGZmZTcwNWFhYTcwNjM5OTg0MGE3MTUyOTI2YjdlZWU3MzZkYTQxMGEi
Ci1TUkNfVVJJW2FzdHJhbC10b2tpby10YXItMC43LjAuc2hhMjU2c3VtXSA9ICI2ZjJlOTg5YjMz
MjQ2ZmU5MjQwZDM5YWNjZjRkZDlhMDFlMGI2YzFmM2NlOWRkMDk1ZTBhNDdmYTAyNTA1NTIzIgor
U1JDX1VSSVthc3RyYWwtdG9raW8tdGFyLTAuNy4xLnNoYTI1NnN1bV0gPSAiODIxZWQzNmRhZjdj
NDBkMDBhN2I2Mjc1OWY5ODMzZmIyNzlmYjdjODdkZDk4OWVjMGE0ZDYyNmRjZDhkMWRjYSIKIFNS
Q19VUklbYXN0cmFsLXZlcnNpb24tcmFuZ2VzLTAuMi4zLnNoYTI1NnN1bV0gPSAiYjMxNWFjYzRk
YzdmMGQzY2NkZDU1N2EwMWI2YTg5ZmEyZDg5NmU5OWE0NTBiOThlODI5ZmM4MTUyZjBiMmY5OCIK
IFNSQ19VUklbYXN0cmFsX2FzeW5jX3ppcC0wLjAuMjIuc2hhMjU2c3VtXSA9ICIwZjg1MDhkMDlj
NmJjNmFiZDQyNzY3ZDFkNDNjNzcwMjg5MTY5MTQ4NDg3NWNlOTRmNzk5N2RhMTMwMWQ5NWU5Igog
U1JDX1VSSVthc3luYy1jb21wcmVzc2lvbi0wLjQuNTAuc2hhMjU2c3VtXSA9ICJlZTE5YmQ5OWI0
M2UzNjkxYWNiYWQ0ZTg0MDQyMGE0ODgxY2VhNmMwYjY2YTIwODEyNWE4MjRmOGZkNTNmNWExIgpA
QCAtMzU1LDcgKzM1NSw3IEBAIFNSQ19VUklbZGlnZXN0LTAuMTEuMy5zaGEyNTZzdW1dID0gImYx
ZGQ2ZGJiNTg0MTkzNzk0MDc4MTg2NmZhMTI4MWExZmY3YmQzYmY4MjcwCiBTUkNfVVJJW2Rpc3Bs
YXlkb2MtMC4yLjUuc2hhMjU2c3VtXSA9ICI5NzM2OWNiYmMwNDFiYzM2Njk0OWJjNzRkMzQ2NThk
NmNkYTU2MjEwMzk3MzFjNjMxMDUyMTg5MmEzYTIwYWUwIgogU1JDX1VSSVtkdW5jZS0xLjAuNS5z
aGEyNTZzdW1dID0gIjkyNzczNTA0ZDU4YzA5M2Y2ZGUyNDU5YWY0YWYzM2ZhYTUxOGMxMzQ1MWVi
OGYyYjU2OThlZDNkMzZlN2M4MTMiCiBTUkNfVVJJW2R5bi1jbG9uZS0xLjAuMjAuc2hhMjU2c3Vt
XSA9ICJkMDg4MWVhMTgxYjFkZjczZmY3N2ZmYWFmOWM3NTQ0ZWNjMTFlODJmYmE5YjVmMjdiMjYy
YTNjNzNhMzMyNTU1IgotU1JDX1VSSVtlaXRoZXItMS4xOC4wLnNoYTI1NnN1bV0gPSAiMjUyYWZi
OWFlNWVhYTY4M2JhYmRjNmEwNjhiM2Y1NzI2ZWIxOWUwNTA3MGM3MzFmOWIyYTIzYTdjM2U4ZWQz
NCIKK1NSQ19VUklbZWl0aGVyLTEuMTkuMC5zaGEyNTZzdW1dID0gIjBlOWM3MWMyMTY3Y2EzMjNj
ODgyYjk5OTE4OTI5NDAzNDI2ZTIzNzNlYTE3MjQyZmY1NjUzZTBkNWUxMDU4YmUiCiBTUkNfVVJJ
W2VuY29kZV91bmljb2RlLTEuMC4wLnNoYTI1NnN1bV0gPSAiMzRhYTczNjQ2ZmZiMDA2YjhmNTE0
N2YzZGMxODJiZDRiY2IxOTAyMjdjZTg2MWZjNGE0ODQ0YmY4ZTNjYjJjMCIKIFNSQ19VUklbZW5j
b2RpbmdfcnMtMC44LjM1LnNoYTI1NnN1bV0gPSAiNzUwMzBmM2M0ZjQ1ZGFmZDc1ODZkZDY3ODA5
NjVhOGM3ZThlMjg1YTVlY2I4NjcxM2U2M2E3OWM1YjI3NjZmMyIKIFNSQ19VUklbZW5jb2Rpbmdf
cnNfaW8tMC4xLjguc2hhMjU2c3VtXSA9ICJmYmEzZmU4NDcwNDVlY2ZmNzk0YjljMTM4MjkzYTgw
ZGI5MTQ2NzhjNDUzYWQ2M2ZiZjBjNmE5ZWI2ZTAwYjIyIgpAQCAtMzk5LDcgKzM5OSw3IEBAIFNS
Q19VUklbaWN1X3Byb3ZpZGVyLTIuMS4xLnNoYTI1NnN1bV0gPSAiODU5NjJjZjBjZTAyZTFlMGE2
MjljYzM0ZTdjYTNlMzczY2UyMGRkCiBTUkNfVVJJW2lkbmEtMS4xLjAuc2hhMjU2c3VtXSA9ICIz
YjA4NzVmMjNjYWEwMzg5ODk5NGY2ZGRjNTAxODg2YTQ1YzdkM2Q2MmQwNGQyZDkwNzg4ZDQ3YmUx
YjFlNGRlIgogU1JDX1VSSVtpZG5hX2FkYXB0ZXItMS4yLjEuc2hhMjU2c3VtXSA9ICIzYWNhZTk2
MDk1NDBhYTMxOGQxYmM1ODg0NTUyMjVmYjIwODViOWVkMGM0ZjZiZDBkOWQ1YmNkODZmMWEwMzQ0
IgogU1JDX1VSSVtpbmRleG1hcC0yLjE0LjIuc2hhMjU2c3VtXSA9ICJjYzRlMTkwZjVkMjZjYTcw
NTE2NDI2MjlkYTJjNTJmYzAzYmRlODVhMDMxOTdjOTk0MDhkY2QyOTE3MzRjODU1IgotU1JDX1VS
SVtpbmRvYy0yLjAuNy5zaGEyNTZzdW1dID0gIjc5Y2Y1YzkzZjkzMjI4Y2Y4ZWZiM2JhMzYyNTM1
ZmIxMTE5OWFjNTQ4YTA5Y2UxMTdjOWIxYWRjMzAzMGQ3MDYiCitTUkNfVVJJW2luZG9jLTIuMC44
LnNoYTI1NnN1bV0gPSAiYTM3YjI2OTE3OTZjZmZlYjhhOGNkMzA1YWM2NmU2NTg0MTU1OWYxNDdm
NGU2MzIzMWQwZWFmYTRkYjUzODRkMSIKIFNSQ19VUklbaW5zdGEtMS40OS4wLnNoYTI1NnN1bV0g
PSAiYjY3ZDNkMmUyODdlNGI4NmMxMGIzZjNiNjQxMDMzZDFmODliNzRiZGIzOWQwNWYzNDk1MmUy
YjlhNmZlMjFjZCIKIFNSQ19VUklbaW8tZXh0cmFzLTAuMTkuMC5zaGEyNTZzdW1dID0gIjIwZmQ2
ZGU0Y2NmY2MxODdlMzhiYzIxY2ZhNTQzY2I1YTMwMmNiODZhOGIxMTRlYjdmMGJmMGRjOWY4YWMw
MGYiCiBTUkNfVVJJW2lvLWxpZmV0aW1lcy0yLjAuNC5zaGEyNTZzdW1dID0gIjA2NDMyZmI1NGQz
YmU3OTY0ZWNkMzY0OTIzM2NkZGY4MGRiMjgzMmY0N2ZlYzM0YzAxZjY1YjNkOWQ3NzQ5ODMiCkBA
IC00MDgsOSArNDA4LDkgQEAgU1JDX1VSSVtpcG5ldC0yLjEyLjAuc2hhMjU2c3VtXSA9ICJkOThm
NmZlZDFmZGUzZjhjMjFiYzQwYTFhYmI4OGRkNzVlNjc5MjRmOWNmZmMKIFNSQ19VUklbaXNfdGVy
bWluYWxfcG9seWZpbGwtMS43MC4yLnNoYTI1NnN1bV0gPSAiYTZjYjEzOGJiNzlhMTQ2YzFiZDQ2
MDAwNTYyM2UxNDJlZjAxODFlM2QwMjE5Y2I0OTNlMDJmN2QwOGEzNTY5NSIKIFNSQ19VUklbaXRl
cnRvb2xzLTAuMTQuMC5zaGEyNTZzdW1dID0gIjJiMTkyYzc4MjAzN2ZhZGQ5Y2ZhNzU1NDgzMTA0
ODhhYWJkYmYzZDJkYTczODg1YjMxYmQwYWJkMDMzNTEyODUiCiBTUkNfVVJJW2l0b2EtMS4wLjE3
LnNoYTI1NnN1bV0gPSAiOTJlY2M2NjE4MTgxZGVmMDQ1NzM5MmNjZDBlZTUxMTk4ZTA2NWUwMTZk
MWQ1MjdhN2FjMWI2ZGM3YzFmMDlkMiIKLVNSQ19VUklbamlmZi0wLjIuMzcuc2hhMjU2c3VtXSA9
ICIwYWIxYmFmNzJmMDg3OTZkZTAyNjA2MDk1MTUxMzA2OTliODkwYWMyNWYzMGU2MTBhZDg5NGJj
NTg1NmNhZmRiIgorU1JDX1VSSVtqaWZmLTAuMi4zOC5zaGEyNTZzdW1dID0gImIyYjAwNTcxNWRj
YmViMDA4OWEzYzBkYWI5OWYyZmYxY2MzYjI1MjUzMjM1NTI3MDNkNjQ4NTg1ZDM0MmEzODMiCiBT
UkNfVVJJW2ppZmYtY29yZS0wLjEuMC5zaGEyNTZzdW1dID0gIjdmZWNhODg0MzllZmU1M2RhMzc1
NDUwMGMxODUxZGVkZjNjYjM2YzUyNGRkNWNmODIyNWNjMDc5NGRlOTVkMDkiCi1TUkNfVVJJW2pp
ZmYtc3RhdGljLTAuMi4zNy5zaGEyNTZzdW1dID0gIjM3ODI2OGExMTE2YWQ2N2FlNjIyODcwMTEx
OGFjOWY0OTFkNzhmZGEzOGE0MGExZjFhOWUxMzQ4ZGU2ZjcyMTIiCitTUkNfVVJJW2ppZmYtc3Rh
dGljLTAuMi4zOC5zaGEyNTZzdW1dID0gIjJjYzk4MTcyNTNjZjdjN2VlNDY4NDQ1MWJkMzI3ZTg4
ZDZmMzY1ODAxNGU1NGEyOTE5ODYyNTU5MDY1MDY5NWMiCiBTUkNfVVJJW2pzLXN5cy0wLjMuOTEu
c2hhMjU2c3VtXSA9ICJiNDk3MTViNzA3M2YzODViYTRiYzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2MTQ2
ZWZiNjZiNzgxZjEzMWYwZmIzOTljIgogU1JDX1VSSVtqdW5jdGlvbi0yLjEuMC5zaGEyNTZzdW1d
ID0gImNkZTQ4ZjM2NTMwY2JkOTFiNjVmMDUwMTAxZTZjMDU2ZDZlYjc0M2NlYTJhOGYwZjE5YmVl
ZjY5YzY3NDJmZjgiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4wLnNoYTI1NnN1bV0gPSAiYmJk
MmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2ODVlMWYyOTgwNjgzMTZl
NjZmZSIKQEAgLTQ5OSw4ICs0OTksOCBAQCBTUkNfVVJJW3N0cnNpbS0wLjExLjEuc2hhMjU2c3Vt
XSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3ZWE1ZDllMjYyODU2NGIzYjA0M2E3MAogU1JDX1VS
SVtzeW4tMi4wLjExOC5zaGEyNTZzdW1dID0gIjFiOWFlNTdmOTA0MjEzZWJiNjQ5Y2U2ODk1Yjhh
NjZjNjZmMDIwM2I5MzE5NzE4ZjY5YTU2MTJhMDY1YjE0MjIiCiBTUkNfVVJJW3N5bi0zLjAuNi5z
aGEyNTZzdW1dID0gIjg1OTNlOGU3MjE1OWVkMjI1N2QwODNjN2E0NTRhODVjYmY4NTRmMzdhMDk2
NmQ4ZDQ4M2FmZjhjOGEzZWJjZWUiCiBTUkNfVVJJW3N5bnN0cnVjdHVyZS0wLjEzLjIuc2hhMjU2
c3VtXSA9ICI3MjhhNzBmM2RiYWY1YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2MGE0YjU1NDljOGE1OTE0
MzYxYzk5MTQ3YTcwOWQyIgotU1JDX1VSSVt0YXItY29kZWMtMC4wLjE1LnNoYTI1NnN1bV0gPSAi
YjlkYWQ2MTVlNTBkMTgxYWZlYTRiYWZlYTIzZGFjYjhlMzNlZDUyZGRlMDY1MDM4MTM1NzA2MzRi
OTMyZDQ2NyIKLVNSQ19VUklbdGFyLWZyYW1pbmctMC4wLjE1LnNoYTI1NnN1bV0gPSAiNTYzZTgx
ODFiNDdjOWNkY2NlNTY5ZWFlM2FkNDMxZWVjNzE1NDNkNjI2OWRkNjBjN2JkMjM1MGY3MGJjZDIz
MyIKK1NSQ19VUklbdGFyLWNvZGVjLTAuMC4xNi5zaGEyNTZzdW1dID0gIjY4NzViYTUwN2JiZWM2
MDIyNTAwZjQ2NDc3MTU5YTAzZjA3ZWJkZmZkYjRlYTA0MzI1NDk3NDUzMWRmMWRhYzIiCitTUkNf
VVJJW3Rhci1mcmFtaW5nLTAuMC4xNi5zaGEyNTZzdW1dID0gIjQ5NzI3YjFhMzAwNTE0OTYwZDQy
NWQwZTc0MWE3ZGEzZTY5MzE3MGYzZGIzOWRlMzE4MGZkYmJjMDdlNTQyYzUiCiBTUkNfVVJJW3Rl
bXAtZW52LTAuMy42LnNoYTI1NnN1bV0gPSAiOTYzNzQ4NTUwNjhmNDc0MDJjMzEyMWM2ZWVkODhk
MjljYjFkZThmM2FiMjcwOTBlMjczZTQyMGJkYWJjZjA1MCIKIFNSQ19VUklbdGVtcGZpbGUtMy4y
Ny4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4Nzk3MDdhYTlmNzk0
Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNSQ19VUklbdGVybWluYWxfc2l6ZS0wLjQuNC5z
aGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3NWIxODU4MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUy
MmMwODYzZWE1ZjA4NzcxYTg4NzQiCkBAIC01MTEsMTQgKzUxMSwxNCBAQCBTUkNfVVJJW3RocmVh
ZF9sb2NhbC0xLjEuOS5zaGEyNTZzdW1dID0gImY2MDI0NmE0OTQ0ZjI0ZjZlMDE4YWExN2NkZWZm
Yjc4MThiNzYzNQogU1JDX1VSSVt0aW55c3RyLTAuOC4yLnNoYTI1NnN1bV0gPSAiNDJkM2U5YzQ1
YzA5ZGUxNWQwNmRkOGFjZjVmNGUwZTM5OWU4NTkyN2I3ZjAwNzExMDI0ZWI3YWUxMGZhNDg2OSIK
IFNSQ19VUklbdGlueXZlYy0xLjExLjAuc2hhMjU2c3VtXSA9ICIzZTYxZTY3MDUzZDI1YTRlODJj
ODQ0ZTg0MjQwMzlkOTc0NTc4MWIzZmM0ZjMyYjhkNTVlZDUwZjVmNjY3ZWYzIgogU1JDX1VSSVt0
aW55dmVjX21hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gIjFmM2NjYmFjMzExZmVhMDVmODZmNjE5
MDRiNDYyYjU1ZmIzZGY4ODM3YTM2NmRmYzYwMWEwMTYxZDA1MzJmMjAiCi1TUkNfVVJJW3Rva2lv
LTEuNTMuMS5zaGEyNTZzdW1dID0gIjIwMmNhZWE4NzFiNjk2NjgyNTBkMjQyMDcwODQ5ZWI0OTVi
ZTE3OGVkNjk3YTNlOThhZWJjZTViYzgxYTBiZWQiCitTUkNfVVJJW3Rva2lvLTEuNTMuMi5zaGEy
NTZzdW1dID0gImU5NWY5MWZjYzdhNjIxZThiMDMwZjZhYTIzYzcxZmU5ODM4YWUyZmI0ZDgxMThi
NzU2MDJhMzI4ZjUxNDQwNDQiCiBTUkNfVVJJW3Rva2lvLW1hY3Jvcy0yLjcuMC5zaGEyNTZzdW1d
ID0gIjM4NWE2Y2I3MWFiOWFiNzkwYzVmZThkNjdmMTY0NWU2YzQ1MGE3Y2UwMDZhMzNkZTAzZGFh
OTU2Y2Y3MGE0OTYiCiBTUkNfVVJJW3Rva2lvLXN0cmVhbS0wLjEuMTkuc2hhMjU2c3VtXSA9ICJh
M2QwNmYwYjA4MmJhNTdjMjZiNzk0MDczNzJlNTdjZjJhMWUyODEyNGY3OGU5NDc5ZmU4MDMyMmNm
NTM0MjBiIgogU1JDX1VSSVt0b21sLTEuMS42K3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICI5MjA2
MDI1NDNmMDkxMWFiNzFkYTEyYzUwZDU5NzAxZGE1NGMxOTZkMWEyYmY1Y2I0Yjc1NjY3ZjEzN2E0
MDZhIgogU1JDX1VSSVt0b21sX2RhdGV0aW1lLTEuMS4xK3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9
ICIzMTY1ZjY1ZjYyZTI4ZTAxMTVhMDBiMmViZGQzN2ViNmYzYjY0MTg1NWY5ZDYzNmQzY2Q0MTAz
NzY3MTU5YWQ3IgogU1JDX1VSSVt0b21sX2VkaXQtMC4yNS4xNStzcGVjLTEuMS4wLnNoYTI1NnN1
bV0gPSAiMTM0MGVhOTRhNTg1NjMzMzQ5MmM5MDY0YjAyYzc3OGIxOTFkZDJjODUzNzc4ZDk2MDlk
ZWJkY2RmZWEzYTYxNCIKIFNSQ19VUklbdG9tbF9wYXJzZXItMS4xLjUrc3BlYy0xLjEuMC5zaGEy
NTZzdW1dID0gImJhYTY5M2E4MDMyZDdlMWNhZGE3ZDAwNDFlOTYxMjZkZjI0MzE3OWZmMDYxNDU2
NzgzYWM3ZjEyYmRhNDc0NGMiCi1TUkNfVVJJW3RvbWxfd3JpdGVyLTEuMS4yK3NwZWMtMS4xLjAu
c2hhMjU2c3VtXSA9ICI3ZDU2MzUzYTJhNjY1YWQwZjQxYTQyMTE4NzE4MGFhYjc0NmM4YzMyNTYy
MDYxN2FkODgzYTk5YTFjYmU2NmQyIgorU1JDX1VSSVt0b21sX3dyaXRlci0xLjEuMytzcGVjLTEu
MS4wLnNoYTI1NnN1bV0gPSAiMDZiZGJkOGNmYzA1NmI4ZDJlMmU4NWYyOWI1NmEzYmRiZWNiNTI3
Y2VmODFlYjM5ZTNlN2I5OGFmNDY1Mjc3MCIKIFNSQ19VUklbdHJhY2luZy0wLjEuNDQuc2hhMjU2
c3VtXSA9ICI2M2U3MTY2MmZhNGIyYTJjM2EyNmY1NzBmMDM3ZWI5NWJiMWY4NTM5N2YzY2Q4MDc2
Y2FlZDJmMDI2YTZkMTAwIgogU1JDX1VSSVt0cmFjaW5nLWF0dHJpYnV0ZXMtMC4xLjMxLnNoYTI1
NnN1bV0gPSAiNzQ5MGNmYTVlYzk2Mzc0NjU2ODc0MDY1MWFjNjc4MWY3MDFjOWM1ZWEyNTdjNThl
MDU3ZjNiYThjZjY5ZThkYSIKIFNSQ19VUklbdHJhY2luZy1jb3JlLTAuMS4zNi5zaGEyNTZzdW1d
ID0gImRiOTdjYWY5ZDkwNmZiZGU1NTVkZDYyZmE5NWRkYmE5ZWVjZmQxNGNiMzg4ZTRmNDkxYTY2
ZDc0Y2Q1ZmI3OWEiCkBAIC01MzQsNyArNTM0LDcgQEAgU1JDX1VSSVt1bnNjYW5ueS0wLjEuMC5z
aGEyNTZzdW1dID0gImU5ZGYyYWYwNjdhNzk1M2U5YzM4MzEzMjBmMzVjMWNjMDYwMGMzMGQ0NGQK
IFNSQ19VUklbdXJsLTIuNS44LnNoYTI1NnN1bV0gPSAiZmY2N2E4YTQzOTczNzNjM2VmNjYwODEy
YWNhYjMyNjgyMjIwMzUwMTBhYjg2ODBlYzQyMTVmMzhiYTNkMGVlZCIKIFNSQ19VUklbdXRmOF9p
dGVyLTEuMC40LnNoYTI1NnN1bV0gPSAiYjZjMTQwNjIwZTdmZmJiMjJjMmRlZTU5Y2FmZTYwODRh
NTliNWZmYzI3YTg4NTlhNWYwZDQ5NGI1ZDUyYjZiZSIKIFNSQ19VUklbdXRmOHBhcnNlLTAuMi4y
LnNoYTI1NnN1bV0gPSAiMDZhYmRlMzYxMTY1N2FkZjY2ZDM4M2YwMGIwOTNkN2ZhZWNjN2ZhNTcw
NzFjY2UyNTc4NjYwYzlmMTAxMDgyMSIKLVNSQ19VUklbdXVpZC0xLjI3LjAuc2hhMjU2c3VtXSA9
ICI5NzI3N2QzNmI5YzNhY2UxM2U1OGZhNmU3NTNmOGIwYmJiZjMwMmExOGRkMTkzMjQwZDcwZjll
Mjk2ODEwNTlhIgorU1JDX1VSSVt1dWlkLTEuMjguMC5zaGEyNTZzdW1dID0gIjdjYzExODYzODRi
ZWI3ZGQ4ZWVkZWEzNzY0MTNmZDY1NDkzNzI4NWVhNmM5Y2ZiYjkyOGRjMzA0M2VhNGI2MDYiCiBT
UkNfVVJJW3ZhbHVhYmxlLTAuMS4xLnNoYTI1NnN1bV0gPSAiYmE3M2VhOWNmMTZhMjVkZjBjOGNh
YTE2YzUxYWNiOTM3ZDU3MTJhODQyOWRiNzhhM2VlMjlkNWRjYWNkM2E2NSIKIFNSQ19VUklbdmVy
c2lvbl9jaGVjay0wLjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMzZDk3NWZjNmFkOWY4NmM4ZjI4
Mzg1M2FkMjZiZGQ1YjEwYjdmMTU0MmFhMmZhMTVlMjI4OTEwNWEiCiBTUkNfVVJJW3Z0ZS0wLjE0
LjEuc2hhMjU2c3VtXSA9ICIyMzFmZGNkN2VmMzAzN2U4MzMwZDhlMTdlNjEwMTFhMmMyNDQxMjZh
Y2MwYTk4MmY0MDQwYWMzZjlmMGJjMDc3IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTMuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjguYmIKc2ltaWxhcml0eSBpbmRleCA5
MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1
aWxkXzAuMTMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXV2LWJ1aWxkXzAuMTMuOC5iYgppbmRleCA4OTc0NTUwYzg2Li42OGFkNDhiMWI4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4x
My43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWls
ZF8wLjEzLjguYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS1BUEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1BcGFjaGU7
bWQ1PWUyM2ZhZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1CU0Q7bWQ1PWVmN2E2MDI3ZGM0YzIz
ODliOWFmYWQ3ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzU2MWM0ZmEwMGY2
NGVmZDM0OGJkYmUzYTAxYWRlNDFiYzlhZjk5YmE1N2Q4MDdjYzdiMmFiZGY3MzU3MTM2NiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIwMzhjMTZkYzYwZDYzYzMzNmNiNTM2NDAwMGUxMTA2OGM3OWRk
MDE0MjY4MmZiZDRhZTNlNTQ3MGMxMWZkZGM1IgogCiByZXF1aXJlICR7QlBOfS1jcmF0ZXMuaW5j
CiAKLS0gCjIuNDcuMQoK

--===============3279596120172795714==
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
 org/packages/source/u/uv_build/uv_build-0.13.8.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.16 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.1 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.50 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/base64/0.23.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.
 14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/di
 splaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.19.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate:/
 /crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.8 crate://crates.io/insta/1.49.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 
 crate://crates.io/jiff/0.2.38 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.38 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.
 8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_deriv
 e/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 
 crate://crates.io/spdx/0.13.6 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.16 crate://crates.io/tar-framing/0.0.16 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.2 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.3+s
 pec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.28.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate
 ://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crate
 s.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.7" to "0.13.8"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.7 [default] to 0.13.8 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.8.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.8.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.7" to "0.13.8"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.8.dist-info

--===============3279596120172795714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.8.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.8.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.7.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.8.dist-info

--===============3279596120172795714==--
