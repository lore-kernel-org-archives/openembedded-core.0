Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12848.1793079635689730206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 22:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WAL+2ld7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bgGOYHlo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a17bdfebd7-87ea13b3-9e66-4c37-81fa-6169f676fd35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793079635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fmGjpOrrsqAZB0Tv80VpZY+LZZwnuFkZKPaLlqfJlD8=;
	b=WAL+2ld7CiWIXcSHqjGMdBC6/IzB4snj1XHwGCGKJGMnxlq6C58TAACPvpDOus+C
	4ZcZzf2soV2ljSeI6qWjQuxkB8hAs9XIJ0EB9Lis2l9Xgf8+S+PaKMGdOzMJuiAmU5n
	nc+EhPonKkOw1o2nOHsoJHS9zdmLmTjyLMAn2TMY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793079635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fmGjpOrrsqAZB0Tv80VpZY+LZZwnuFkZKPaLlqfJlD8=;
	b=bgGOYHlossFbP6a6AxPv88x8sxmRkr37jgPgJh6uzfobQlxJNjHuAHWTNqRcwY9G
	+jmAkeUjWtmznYxA9D54miBRVsAfV+bm/PgmaBtS8u/+q6nqdioA30jB/TLEgzqfwfY
	B5VqhdnEtb2sgP0ULqI2PX58szLqUV81WobHm1EI=
Content-Type: multipart/mixed; boundary="===============4840485404881596865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.6 SUCCEEDED
Message-ID: <010101a17bdfebd7-87ea13b3-9e66-4c37-81fa-6169f676fd35-000000@us-west-2.amazonses.com>
Date: Tue, 27 Oct 2026 05:40:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.27-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 05:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248708

--===============4840485404881596865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.5-0.13.6.patch
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
From 167a6f7b82ed3277b9ae0d3f10cd1b275869e3e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 27 Oct 2026 05:40:28 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.5 -> 0.13.6

---
 .../python/python3-uv-build-crates.inc        | 24 +++++++++----------
 ...d_0.13.5.bb => python3-uv-build_0.13.6.bb} |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.5.bb => python3-uv-build_0.13.6.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index a5746f7693..309e4526b4 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -115,7 +115,7 @@ SRC_URI += " \
     crate://crates.io/jiff-core/0.1.0 \
     crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/js-sys/0.3.91 \
-    crate://crates.io/junction/2.0.0 \
+    crate://crates.io/junction/2.1.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/libc/0.2.189 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -192,7 +192,7 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.1 \
+    crate://crates.io/smallvec/1.16.2 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
@@ -208,8 +208,8 @@ SRC_URI += " \
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
@@ -286,8 +286,8 @@ SRC_URI += " \
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
@@ -410,7 +410,7 @@ SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e6
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
 SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
-SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
+SRC_URI[junction-2.1.0.sha256sum] = "cde48f36530cbd91b65f050101e6c056d6eb743cea2a8f0f19beef69c6742ff8"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
@@ -487,7 +487,7 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.1.sha256sum] = "ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891"
+SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
@@ -503,8 +503,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab2
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
@@ -581,8 +581,8 @@ SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a
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
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.6.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.6.bb
index 8b05c79a25..60ba9440b9 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.5.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c95a3d092cb8880b37f35013f9f7339f3867bc422abed36776255f34e22bc62c"
+SRC_URI[sha256sum] = "8a03355d73117d136dbf6a34e20429755598a73d752dc6ae3aa5894942b6fd4b"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============4840485404881596865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.5" to "0.13.6"
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
 v_build-0.13.6.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.15 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.48 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.
 2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/d
 yn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0
 .14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.37 crate://crates.io/jiff-core/0.1.0 
 crate://crates.io/jiff-static/0.2.37 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pes
 t_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/ru
 stix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_tra
 it/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.15 crate://crates.io/tar-framing/0.0.15 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tra
 cing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.26.1 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collection
 s/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_
 msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.5" to "0.13.6"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.5 [default] to 0.13.6 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.6.dist-info

--===============4840485404881596865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.5-0.13.6.patch"

RnJvbSAxNjdhNmY3YjgyZWQzMjc3YjlhZTBkM2YxMGNkMWIyNzU4NjllM2UxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjcgT2N0IDIwMjYgMDU6NDA6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTMuNSAtPiAwLjEzLjYKCi0tLQogLi4uL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMgICAgICAgIHwgMjQgKysrKysrKysrLS0tLS0t
LS0tLQogLi4uZF8wLjEzLjUuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjYuYmJ9IHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjEz
LjUuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YwppbmRleCBhNTc0NmY3NjkzLi4zMDllNDUyNmI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAtMTE1
LDcgKzExNSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1j
b3JlLzAuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8wLjIuMzcgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pzLXN5cy8wLjMuOTEgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2p1bmN0aW9uLzIuMC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qdW5jdGlvbi8yLjEu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGF6eV9zdGF0aWMvMS41LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE4OSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGludXgt
cmF3LXN5cy8wLjEyLjEgXApAQCAtMTkyLDcgKzE5Miw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZHV0ZjgvMC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3NpbWlsYXIvMi43LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NsYWIvMC40LjEyIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE2LjEgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NtYWxsdmVjLzEuMTYuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hd2svMC4zLjIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NvY2tldDIvMC42LjMgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NwZHgvMC4xMy41IFwKQEAgLTIwOCw4ICsyMDgsOCBAQCBTUkNfVVJJICs9ICIgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RlbXBmaWxlLzMuMjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdGVybWluYWxfc2l6ZS8wLjQuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGV4dHdy
YXAvMC4xNi40IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3IvMi4wLjIwIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3ItaW1wbC8yLjAuMjAgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3RoaXNlcnJvci8yLjAuMjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RoaXNl
cnJvci1pbXBsLzIuMC4yMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhyZWFkX2xvY2FsLzEu
MS45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW55c3RyLzAuOC4yIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90aW55dmVjLzEuMTEuMCBcCkBAIC0yODYsOCArMjg2LDggQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUvMC42LjIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3lva2UvMC44LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UtZGVy
aXZlLzAuOC4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS8wLjguNTcgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3plcm9jb3B5LWRlcml2ZS8wLjguNTcgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3plcm9jb3B5LzAuOC42MyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2Nv
cHktZGVyaXZlLzAuOC42MyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2Zyb20vMC4xLjYg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9mcm9tLWRlcml2ZS8wLjEuNiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vemVyb3RyaWUvMC4yLjMgXApAQCAtNDEwLDcgKzQxMCw3IEBAIFNSQ19V
UklbamlmZi0wLjIuMzcuc2hhMjU2c3VtXSA9ICIwYWIxYmFmNzJmMDg3OTZkZTAyNjA2MDk1MTUx
MzA2OTliODkwYWMyNWYzMGU2CiBTUkNfVVJJW2ppZmYtY29yZS0wLjEuMC5zaGEyNTZzdW1dID0g
IjdmZWNhODg0MzllZmU1M2RhMzc1NDUwMGMxODUxZGVkZjNjYjM2YzUyNGRkNWNmODIyNWNjMDc5
NGRlOTVkMDkiCiBTUkNfVVJJW2ppZmYtc3RhdGljLTAuMi4zNy5zaGEyNTZzdW1dID0gIjM3ODI2
OGExMTE2YWQ2N2FlNjIyODcwMTExOGFjOWY0OTFkNzhmZGEzOGE0MGExZjFhOWUxMzQ4ZGU2Zjcy
MTIiCiBTUkNfVVJJW2pzLXN5cy0wLjMuOTEuc2hhMjU2c3VtXSA9ICJiNDk3MTViNzA3M2YzODVi
YTRiYzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2MTQ2ZWZiNjZiNzgxZjEzMWYwZmIzOTljIgotU1JDX1VS
SVtqdW5jdGlvbi0yLjAuMC5zaGEyNTZzdW1dID0gIjE2MGYyZWFkZTA5N2YzMDI2M2I1NDhhYWU1
ZGViMTJhZDM0OWM5MDliYWE3MTBmYTI0YjkyYzkwOTBiMmUwMDYiCitTUkNfVVJJW2p1bmN0aW9u
LTIuMS4wLnNoYTI1NnN1bV0gPSAiY2RlNDhmMzY1MzBjYmQ5MWI2NWYwNTAxMDFlNmMwNTZkNmVi
NzQzY2VhMmE4ZjBmMTliZWVmNjljNjc0MmZmOCIKIFNSQ19VUklbbGF6eV9zdGF0aWMtMS41LjAu
c2hhMjU2c3VtXSA9ICJiYmQyYmNiNGM5NjNmMmRkYWUwNmEyZWZjN2U5ZjM1OTEzMTI0NzNjNTBj
NjY4NWUxZjI5ODA2ODMxNmU2NmZlIgogU1JDX1VSSVtsaWJjLTAuMi4xODkuc2hhMjU2c3VtXSA9
ICIzZWFmM2VkZTNmZWU2ZGIxYTRjMmVlMDkxYmY4YThiNGRjY2RjNmQxN2Y2NTZmYjA3ODk2ZWU3
Mjg2NzYxMmYyIgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZzdW1dID0gIjMy
YTY2OTQ5ZTAzMGRhMDBlOGM3ZDQ0MzRiMjUxNjcwYTkxNTU2ZjQxNDQ5NDFkMzc0NTI3NjljMjVk
NThhNTMiCkBAIC00ODcsNyArNDg3LDcgQEAgU1JDX1VSSVtzaW1kLWFkbGVyMzItMC4zLjguc2hh
MjU2c3VtXSA9ICJlMzIwYTZjNWFkMzFkMjcxYWQ1MjNkY2YzYWQxM2UyNzY3YWQ4YjEKIFNSQ19V
Uklbc2ltZHV0ZjgtMC4xLjUuc2hhMjU2c3VtXSA9ICJlM2E5ZmUzNGUzZTdhNTAzMTYwNjAzNTFm
MzcxODdhM2Y1NDZiY2U5NTQ5NjE1Njc1NGI2MDFhNWZhNzFiNzZlIgogU1JDX1VSSVtzaW1pbGFy
LTIuNy4wLnNoYTI1NnN1bV0gPSAiYmJiYjVkOTY1OTE0MTY0NmFlNjQ3YjQyZmUwOTRkYWY2YzYx
OTJkMTYyMDg3MGI0NDlkOTU1N2Y3NDhiMmRhYSIKIFNSQ19VUklbc2xhYi0wLjQuMTIuc2hhMjU2
c3VtXSA9ICIwYzc5MGRlMjMxMjRmOWFiNDQ1NDRkN2FjMDVkNjA0NDBhZGM1ODY0NzljZTUwMWMx
ZDZkN2RhM2NkOGM5Y2Y1IgotU1JDX1VSSVtzbWFsbHZlYy0xLjE2LjEuc2hhMjU2c3VtXSA9ICJi
YTQ2NzA1NmYxYjU0N2VkNTIwNzc5MTExNjFmYzg2OTg1YmVjYmM2MGU4ZTE4NTdjOGExNDRkYWIw
ZGVmODkxIgorU1JDX1VSSVtzbWFsbHZlYy0xLjE2LjIuc2hhMjU2c3VtXSA9ICJmOTM5NWYwZjBl
ZWU4NDlhOWI3MDdiMmYwNmJiOTJhNmE0MjIwOTBlMjEyM2JiMmVmOGU4N2EwZTYxODkyYThlIgog
U1JDX1VSSVtzbWF3ay0wLjMuMi5zaGEyNTZzdW1dID0gImI3YzM4OGMxYjVlOTM3NTZkMGM3NDA5
NjVjNDFlODgyMmY4NjY2MjFkNDFhY2JkZjYzMzZhNmExNjhmODg0MGMiCiBTUkNfVVJJW3NvY2tl
dDItMC42LjMuc2hhMjU2c3VtXSA9ICIzYTc2NmUxMTEwNzg4YzM2ZjRmYTFjMmI3MWIzODdhNzgx
NWFhNjVmODhjZTAyMjk4NDE4MjY2MzNkOTM3MjNlIgogU1JDX1VSSVtzcGR4LTAuMTMuNS5zaGEy
NTZzdW1dID0gIjA4MTY3MGMyMzNkZmJlZDU1NjkwY2MwY2QzODQyNGUwZTI0YWMxYjI2NzNkMGI0
MDhiM2Y3YjY4NDczOGRmYTkiCkBAIC01MDMsOCArNTAzLDggQEAgU1JDX1VSSVt0ZW1wLWVudi0w
LjMuNi5zaGEyNTZzdW1dID0gIjk2Mzc0ODU1MDY4ZjQ3NDAyYzMxMjFjNmVlZDg4ZDI5Y2IxZGU4
ZjNhYjIKIFNSQ19VUklbdGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0Yzdi
Mzg1MzJlZmNkZWJlZWY4Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNS
Q19VUklbdGVybWluYWxfc2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3NWIx
ODU4MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCiBTUkNfVVJJ
W3RleHR3cmFwLTAuMTYuNC5zaGEyNTZzdW1dID0gIjZlY2ZhZDZjM2FiYzgwYTU3N2YyYjkxYzFl
NDEyZWU1N2U3YTA2MGQ0MzBiNTUzYzFiMGM5NDA5NzRlYmNkNDkiCi1TUkNfVVJJW3RoaXNlcnJv
ci0yLjAuMjAuc2hhMjU2c3VtXSA9ICJlYzg2MjM1ZjVmY2MyYTczNjUwMzEwNzU2ZDJhYzViMTM4
YTU3ODBiYmJkZmFlM2VlY2NlYzk5MmM0MzViYTRmIgotU1JDX1VSSVt0aGlzZXJyb3ItaW1wbC0y
LjAuMjAuc2hhMjU2c3VtXSA9ICJiYzA0Y2QzZTEyMzZkZDRhOThhZmNhNDU2OWYyZGViM2YxMjBl
NTQyMmE0MDIzYmUyY2I2ODNmODQ4NjI5MmFmIgorU1JDX1VSSVt0aGlzZXJyb3ItMi4wLjIxLnNo
YTI1NnN1bV0gPSAiMDllNTJjYjg2YTM2Y2VkZTVjYjEwMWJmODkwODgzN2IzZTRjNmU1ZTU5ZmU3
ZmQ4NWMyM2ZiNTYyMDBkMTg5ZSIKK1NSQ19VUklbdGhpc2Vycm9yLWltcGwtMi4wLjIxLnNoYTI1
NnN1bV0gPSAiZmU1MTk3OTIzMjg3ZGIyMGE1ODEyNWYwYmM4NWMwNjJmN2YyYzg5MmRlOTdiMThj
MzU2ZjllZmIxNGIyODUyNCIKIFNSQ19VUklbdGhyZWFkX2xvY2FsLTEuMS45LnNoYTI1NnN1bV0g
PSAiZjYwMjQ2YTQ5NDRmMjRmNmUwMThhYTE3Y2RlZmZiNzgxOGI3NjM1Njk2NWQwM2IwN2Q2YTk4
ODZlODk2MjE4NSIKIFNSQ19VUklbdGlueXN0ci0wLjguMi5zaGEyNTZzdW1dID0gIjQyZDNlOWM0
NWMwOWRlMTVkMDZkZDhhY2Y1ZjRlMGUzOTllODU5MjdiN2YwMDcxMTAyNGViN2FlMTBmYTQ4Njki
CiBTUkNfVVJJW3Rpbnl2ZWMtMS4xMS4wLnNoYTI1NnN1bV0gPSAiM2U2MWU2NzA1M2QyNWE0ZTgy
Yzg0NGU4NDI0MDM5ZDk3NDU3ODFiM2ZjNGYzMmI4ZDU1ZWQ1MGY1ZjY2N2VmMyIKQEAgLTU4MSw4
ICs1ODEsOCBAQCBTUkNfVVJJW3dpbngtMC4zNi40LnNoYTI1NnN1bV0gPSAiM2YzZmQzNzZmNzE5
NThiODYyZTdhZmIyMGNmZTVhMjI4MzBlMTk2MzQ2MmYzYQogU1JDX1VSSVt3cml0ZWFibGUtMC42
LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBkYjQ3NjlkMmRjNjg1Nzk4OTNmMjMwNmIyNmM2ZWNmYmUw
ZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5IgogU1JDX1VSSVt5b2tlLTAuOC4xLnNoYTI1NnN1bV0g
PSAiNzJkNmU1YzZhZmI4NGQ3Mzk0NGU1Y2VkYjA1MmM0NjgwZDU2NTczMzcyMDE1NTVmOWYyYTE2
Yjc0MDZkNDk1NCIKIFNSQ19VUklbeW9rZS1kZXJpdmUtMC44LjEuc2hhMjU2c3VtXSA9ICJiNjU5
MDUyODc0ZWI2OThlZmU1YjllOGNmMzgyMjA0Njc4YTAwODZlYmY0Njk4MmI3OWQ2Y2EzMTgyOTI3
ZTVkIgotU1JDX1VSSVt6ZXJvY29weS0wLjguNTcuc2hhMjU2c3VtXSA9ICJkMzUxMDJhOWYzNmQw
ODljY2FlOWU0YzY4MDJiYzExOGJlNDQ4N2I4MGFhZmZjMGFiNGUwY2Y1Y2U5MmQyODczIgotU1JD
X1VSSVt6ZXJvY29weS1kZXJpdmUtMC44LjU3LnNoYTI1NnN1bV0gPSAiMTQ2YzAxZjVhYjQ0MjU4
ZGE0M2NmMjc2Yzc0YTI3NjNkYjJmZjM5NjljOWM2NTJjM2YyZGUwNzA0MWQwYjJiYyIKK1NSQ19V
UklbemVyb2NvcHktMC44LjYzLnNoYTI1NnN1bV0gPSAiZTVmZTFmOGYxYjA2MTkxYTAwOTYyMTc0
YzYxYWE1MDA1ZTBiYjM5MWE2ZDgwZDA3ZTI0ZDExNWMwMWE5MmVkOCIKK1NSQ19VUklbemVyb2Nv
cHktZGVyaXZlLTAuOC42My5zaGEyNTZzdW1dID0gIjg2M2FkM2FjODMyOTNmYjRkNzQwYWVkYmZk
YzkyNDBkZDhkMWE1MGMxMDk5YWNkNzZjZTgwY2U3YzcyMzBjN2YiCiBTUkNfVVJJW3plcm9mcm9t
LTAuMS42LnNoYTI1NnN1bV0gPSAiNTBjYzQyZTAzMzNlMDU2NjBjMzU4N2YzYmY5ZDA0Nzg2ODhl
MTVkODcwZmFiMzM0NjQ1MWNlN2Y4YzlmYmVhNSIKIFNSQ19VUklbemVyb2Zyb20tZGVyaXZlLTAu
MS42LnNoYTI1NnN1bV0gPSAiZDcxZTVkNmUwNmFiMDkwYzY3YjVlNDQ5OTNlYzE2YjcyZGNiYWFi
YzUyNmRiODgzYTM2MDA1NzY3OGI0ODUwMiIKIFNSQ19VUklbemVyb3RyaWUtMC4yLjMuc2hhMjU2
c3VtXSA9ICIyYTU5YzE3YTU1NjJkNTA3ZTRiNTQ5NjBlODU2OWViZWUzM2JlZTg5MGM3MGFhM2Zl
N2I5N2U4NWE5ZmQ3ODUxIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTMuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11di1idWlsZF8wLjEzLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTMu
NS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1
aWxkXzAuMTMuNi5iYgppbmRleCA4YjA1Yzc5YTI1Li42MGJhOTQ0MGI5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy41LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjYu
YmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS1B
UEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1BcGFjaGU7bWQ1PWUyM2Zh
ZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1CU0Q7bWQ1PWVmN2E2MDI3ZGM0YzIzODliOWFmYWQ3
ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzk1YTNkMDkyY2I4ODgwYjM3ZjM1
MDEzZjlmNzMzOWYzODY3YmM0MjJhYmVkMzY3NzYyNTVmMzRlMjJiYzYyYyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI4YTAzMzU1ZDczMTE3ZDEzNmRiZjZhMzRlMjA0Mjk3NTU1OThhNzNkNzUyZGM2
YWUzYWE1ODk0OTQyYjZmZDRiIgogCiByZXF1aXJlICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIu
NDcuMQoK

--===============4840485404881596865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.5.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.13.6.dist-info

--===============4840485404881596865==--
