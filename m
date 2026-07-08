Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAA4C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2334.1783489333270123974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gwOAiX03;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4M3Yoltd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f403f83fa-6c1af2b4-79a3-40b9-b695-ac7e7ae159fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2dV7D/NdvccuCtaNERb81v/3AWqKCI0xvf1opxUNwGk=;
	b=gwOAiX03lCJ4vrMB3AwzJnI73LImMEp1vhLePFPN+KAiKotf9ulPjQYtFu3Vt9bL
	j+5h8JuZ85B0qIvnxYuVC7IgaMZWL6/PPT1loNQrajdIGGjzrcYBJaKImuEJIWa+ry6
	OU5ioWR4RnDK+9Y4lgUeyypkyZBAk6bCx+dEIUdw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2dV7D/NdvccuCtaNERb81v/3AWqKCI0xvf1opxUNwGk=;
	b=4M3Yoltdb/R3udN/t1U0GtPf6GYHniSORhbWpgvw9GWeCD2b0tT6KQdkBvyTm5A5
	YJt8SwpcmM59faIpLYvpRtzkVu+V2qSvhIm2JK3Q39nEKX7gUtit02MycOmDz8BgJAS
	jML+hrJo76gscI0NBbatqcOB1KLg4pJ6yLOxA6Xc=
Content-Type: multipart/mixed; boundary="===============8908461387530011111=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.28 SUCCEEDED
Message-ID: <0101019f403f83fa-6c1af2b4-79a3-40b9-b695-ac7e7ae159fb-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240432

--===============8908461387530011111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.26-0.11.28.patch
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
From c9a65e3e184199ad72b6f66cd6c3095a09d1b170 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:21:57 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.26 -> 0.11.28

---
 .../python/python3-uv-build-crates.inc           | 16 ++++++++--------
 ...ld_0.11.26.bb => python3-uv-build_0.11.28.bb} |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.26.bb => python3-uv-build_0.11.28.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 5f8b1b1183..97225725c2 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -10,12 +10,12 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.103 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.7 \
     crate://crates.io/astral-tokio-tar/0.6.3 \
     crate://crates.io/astral-version-ranges/0.2.0 \
-    crate://crates.io/astral_async_zip/0.0.18 \
+    crate://crates.io/astral_async_zip/0.0.20 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
@@ -155,7 +155,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
-    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/quote/1.0.46 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rancor/0.1.1 \
@@ -241,7 +241,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.3 \
+    crate://crates.io/uuid/1.23.4 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -313,12 +313,12 @@ SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.7.sha256sum] = "f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe"
 SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
 SRC_URI[astral-version-ranges-0.2.0.sha256sum] = "086f936efdefab117f5a72367fb3d68c4fded8ba5a7008e3c63365eecf723822"
-SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
+SRC_URI[astral_async_zip-0.0.20.sha256sum] = "bd939d79959c3f49a648a1d7857d63cc62548725a6b060b8dbf0ea5c92470b63"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
@@ -458,7 +458,7 @@ SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d709
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
@@ -544,7 +544,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.3.sha256sum] = "144d6b123cef80b301b8f72a9e2ca4370ddec21950d0a103dd22c437006d2db7"
+SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
index 5256edaeae..08ab097482 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "4ec58a93d29967a07b8de466b7fe35e0e0cb0ca2bcab8b61d80403b5a9b7a34b"
+SRC_URI[sha256sum] = "daba66fd25a9a82caa23949686e967cbb69fd056177e991650643186057adaef"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============8908461387530011111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info

--===============8908461387530011111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.26.tar.gz;downloadfilename=uv_build-0.11.26.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.7 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.0 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates
 .io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.
 0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 c
 rate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.29 crate://crates.io/jiff-static/0.2.29 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 cr
 ate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/
 2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crat
 es.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.
 io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates
 .io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.3 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1
  crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crate
 s.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerove
 c/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.28.tar.gz;downloadfilename=uv_build-0.11.28.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.7 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.0 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.
 22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate:
 //crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.3
 2 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/it
 oa/1.0.17 crate://crates.io/jiff/0.2.29 crate://crates.io/jiff-static/0.2.29 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/park
 ing_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.1
 5 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 c
 rate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tok
 io-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.4 crate://crates.io/valuable/0
 .1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://cr
 ates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://cr
 ates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5348658 to 5360946 (+0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.26" to "0.11.28"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.26 [default] to 0.11.28 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info

--===============8908461387530011111==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.26-0.11.28.patch"

RnJvbSBjOWE2NWUzZTE4NDE5OWFkNzJiNmY2NmNkNmMzMDk1YTA5ZDFiMTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNToyMTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMS4yNiAtPiAwLjExLjI4CgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICAgICB8IDE2ICsrKysrKysrLS0t
LS0tLS0KIC4uLmxkXzAuMTEuMjYuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI4LmJifSB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMjYuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI4LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggNWY4YjFiMTE4My4uOTcyMjU3MjVjMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTEwLDEyICsxMCwxMiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fu
c3R5bGUtcGFyc2UvMS4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtcXVlcnkv
MS4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtd2luY29uLzMuMC4xMSBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEuMC4xMDIgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2FueWhvdy8xLjAuMTAzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNzdHIvMS4yLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FycmF5dmVjLzAuNy43IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9hc3RyYWwtdG9raW8tdGFyLzAuNi4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9h
c3RyYWwtdmVyc2lvbi1yYW5nZXMvMC4yLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJh
bF9hc3luY196aXAvMC4wLjE4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWxfYXN5bmNf
emlwLzAuMC4yMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN5bmMtY29tcHJlc3Npb24vMC40
LjE5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuNS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9iYWNrb24vMS42LjAgXApAQCAtMTU1LDcgKzE1NSw3IEBAIFNSQ19VUkkgKz0g
IiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjEwNiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGEvMC4zLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B0
cl9tZXRhX2Rlcml2ZS8wLjMuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjQ1
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuNDYgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3F1b3RlZF9wcmludGFibGUvMC41LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3It
ZWZpLzUuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYW5jb3IvMC4xLjEgXApAQCAtMjQx
LDcgKzI0MSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJsLzIu
NS44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4X2l0ZXIvMS4wLjQgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3V0ZjhwYXJzZS8wLjIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVp
ZC8xLjIzLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQvMS4yMy40IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby92YWx1YWJsZS8wLjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmVy
c2lvbl9jaGVjay8wLjkuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdnRlLzAuMTQuMSBcCkBA
IC0zMTMsMTIgKzMxMywxMiBAQCBTUkNfVVJJW2Fuc3R5bGUtMS4wLjE0LnNoYTI1NnN1bV0gPSAi
OTQwYjNhMGNhNjAzZDFlYWRlNTBhNDg0NmEyYWZmZmQ1ZWY1N2E5ZmVhYwogU1JDX1VSSVthbnN0
eWxlLXBhcnNlLTEuMC4wLnNoYTI1NnN1bV0gPSAiNTJjZTdmMzhiMjQyMzE5ZjdjYWJhYTY4MTMw
NTU0NjcwNjNlY2RjOWQzNTViYmI0Y2UwYzY4OTA4Y2Q4MTMwZSIKIFNSQ19VUklbYW5zdHlsZS1x
dWVyeS0xLjEuNS5zaGEyNTZzdW1dID0gIjQwYzQ4ZjcyZmQ1M2NkMjg5MTA0ZmM2NDA5OWFiY2E3
M2RiNDE2NmFkODZlYTBiNDM0MWFiZTY1YWY4M2RhZGMiCiBTUkNfVVJJW2Fuc3R5bGUtd2luY29u
LTMuMC4xMS5zaGEyNTZzdW1dID0gIjI5MWU2YTI1MGZmODZjZDRhODIwMTEyZmI4ODk4ODA4YTM2
NmQ4ZjlmNThjZTE2ZDFmNTM4MzUzYWQ1NTc0N2QiCi1TUkNfVVJJW2FueWhvdy0xLjAuMTAyLnNo
YTI1NnN1bV0gPSAiN2YyMDJkZjg2NDg0Yzg2OGRiYWQ3ZWFhNTU3ZWY3ODVkNWM2NjI5NWU0MWI0
NjBlZjkyMmVjYTA3MjNiODQyYyIKK1NSQ19VUklbYW55aG93LTEuMC4xMDMuc2hhMjU2c3VtXSA9
ICIyYTQzODVlMmUzNGViMzVkNmIzZWZlNzk4YjllYjg4MDk2OTI1ZDg3NzI2YzA3OTg3MDliZjU2
ZDllZDg0YWYzIgogU1JDX1VSSVthcmNzdHItMS4yLjAuc2hhMjU2c3VtXSA9ICIwMzkxOGMzZGJk
NzcwMWE4NWM2Yjk4ODc3MzJlMjkyMTE3NWYyNmMzNTBiNDU2Mzg0MWQwOTU4YzIxZDU3ZTZkIgog
U1JDX1VSSVthcnJheXZlYy0wLjcuNy5zaGEyNTZzdW1dID0gImYwMjg4Mjg4NGQzZTFiYzUyNGZi
MTJjNzlmMTA3ZjZhZDBlMWNmZDQ5OGM1MzZmZmI0OTQzMDE3NDA5OTVkZmUiCiBTUkNfVVJJW2Fz
dHJhbC10b2tpby10YXItMC42LjMuc2hhMjU2c3VtXSA9ICIwODY0OGZlZjM1M2FiMzlhOWQyNmY5
MDlhZDUzZmM0ZjA3MWJlNGM5MTg1M2I3ODUyM2Y1Y2MzZDllNWViZmZkIgogU1JDX1VSSVthc3Ry
YWwtdmVyc2lvbi1yYW5nZXMtMC4yLjAuc2hhMjU2c3VtXSA9ICIwODZmOTM2ZWZkZWZhYjExN2Y1
YTcyMzY3ZmIzZDY4YzRmZGVkOGJhNWE3MDA4ZTNjNjMzNjVlZWNmNzIzODIyIgotU1JDX1VSSVth
c3RyYWxfYXN5bmNfemlwLTAuMC4xOC5zaGEyNTZzdW1dID0gImMxNWZjNWI1OTFmMTlkZmJiYmNl
NzM2NjE1OTA4ZDc0ZjFkOTI1MmJiMzRiMjMxODczY2I5OTVmMmE5OTdmZmIiCitTUkNfVVJJW2Fz
dHJhbF9hc3luY196aXAtMC4wLjIwLnNoYTI1NnN1bV0gPSAiYmQ5MzlkNzk5NTljM2Y0OWE2NDhh
MWQ3ODU3ZDYzY2M2MjU0ODcyNWE2YjA2MGI4ZGJmMGVhNWM5MjQ3MGI2MyIKIFNSQ19VUklbYXN5
bmMtY29tcHJlc3Npb24tMC40LjE5LnNoYTI1NnN1bV0gPSAiMDY1NzVlNmE5NjczNTgwZjUyNjYx
YzkyMTA3YmFhYmZmYmY0MWUyMTQxMzczNDQxY2JjZGM0N2NiNzMzMDAzYyIKIFNSQ19VUklbYXV0
b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4ZTI4ZmIwMDE0YTJj
MDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3MmU3ZTgiCiBTUkNfVVJJW2JhY2tvbi0xLjYuMC5z
aGEyNTZzdW1dID0gImNmZmIwZTkzMTg3NWI2NjZmYzRmY2IyMGZlZTUyZTliYmQxZWY4MzZmZDll
OWUwNGVjMjE1NTVmOWY4NWY3ZWYiCkBAIC00NTgsNyArNDU4LDcgQEAgU1JDX1VSSVtwcm9jLW1h
Y3JvLWVycm9yMi0yLjAuMS5zaGEyNTZzdW1dID0gIjExZWMwNWM1MmJlMGEwN2IwODA2MWY3ZGQw
MDNlN2Q3MDkKIFNSQ19VUklbcHJvYy1tYWNybzItMS4wLjEwNi5zaGEyNTZzdW1dID0gIjhmZDAw
ZjBiYjJlOTBkODFkMTA0NGMyYjMyNjE3ZjY4ZmNiOWZhM2JiNzY0MGMyM2U5Yzc0OGU1M2ZiMzA5
MzQiCiBTUkNfVVJJW3B0cl9tZXRhLTAuMy4xLnNoYTI1NnN1bV0gPSAiMGI5YTBjZjk1YTExOTZh
ZjYxZDRmMWNiZGFiOTY3MTc5NTE2ZDlhNGE0MzEyYWYxZjMxOTQ4ZjhmNjIyNGE3OSIKIFNSQ19V
UklbcHRyX21ldGFfZGVyaXZlLTAuMy4xLnNoYTI1NnN1bV0gPSAiNzM0Nzg2N2QwYTdlMTIwOGQ5
M2I0Njc2N2JlODNlMmI4Zjk3OGMzZGFkMzVmNzc1YWM4ZDg4NDc1NTFkNmZlMSIKLVNSQ19VUklb
cXVvdGUtMS4wLjQ1LnNoYTI1NnN1bV0gPSAiNDFmMjYxOTk2NjA1MDY4OTM4MmQyYjQ0ZjY2NGY0
YmM1OTNlMTI5Nzg1YTM2ZDZlZTM3NmRkZjM3MjU5YjkyNCIKK1NSQ19VUklbcXVvdGUtMS4wLjQ2
LnNoYTI1NnN1bV0gPSAiZGZiYzQ1N2QwYzdhMDc1OWE2MTQ1NTFiMTFhNjQwOWU1OTUxZjZjNzUz
N2JlMWYxYjc2ODJiOWFlOTIzMDM2OCIKIFNSQ19VUklbcXVvdGVkX3ByaW50YWJsZS0wLjUuMS5z
aGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1YWVlZjUzNzUxNDRjMjYwNjJlMGRjZDU5Mzlk
ZmNiYjBmNWRiNzZjYjhjMTdjNzMiCiBTUkNfVVJJW3ItZWZpLTUuMy4wLnNoYTI1NnN1bV0gPSAi
NjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3ZjM0
Njc1NGIwZiIKIFNSQ19VUklbcmFuY29yLTAuMS4xLnNoYTI1NnN1bV0gPSAiYTA2M2VhNzIzODE1
MjdjMmEwNTYxZGE5YzgwMDAwZWY4MjJiZGQ3YzMyNDFiMWNjMWIxMjEwMGUzZGYwODFlZSIKQEAg
LTU0NCw3ICs1NDQsNyBAQCBTUkNfVVJJW3Vuc2Nhbm55LTAuMS4wLnNoYTI1NnN1bV0gPSAiZTlk
ZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMwZDQ0ZAogU1JDX1VSSVt1cmwtMi41
Ljguc2hhMjU2c3VtXSA9ICJmZjY3YThhNDM5NzM3M2MzZWY2NjA4MTJhY2FiMzI2ODIyMjAzNTAx
MGFiODY4MGVjNDIxNWYzOGJhM2QwZWVkIgogU1JDX1VSSVt1dGY4X2l0ZXItMS4wLjQuc2hhMjU2
c3VtXSA9ICJiNmMxNDA2MjBlN2ZmYmIyMmMyZGVlNTljYWZlNjA4NGE1OWI1ZmZjMjdhODg1OWE1
ZjBkNDk0YjVkNTJiNmJlIgogU1JDX1VSSVt1dGY4cGFyc2UtMC4yLjIuc2hhMjU2c3VtXSA9ICIw
NmFiZGUzNjExNjU3YWRmNjZkMzgzZjAwYjA5M2Q3ZmFlY2M3ZmE1NzA3MWNjZTI1Nzg2NjBjOWYx
MDEwODIxIgotU1JDX1VSSVt1dWlkLTEuMjMuMy5zaGEyNTZzdW1dID0gIjE0NGQ2YjEyM2NlZjgw
YjMwMWI4ZjcyYTllMmNhNDM3MGRkZWMyMTk1MGQwYTEwM2RkMjJjNDM3MDA2ZDJkYjciCitTUkNf
VVJJW3V1aWQtMS4yMy40LnNoYTI1NnN1bV0gPSAiYmY4MGE3Mjg0NTI3NWFmZWE5OWU3ZjJiNDM0
NzIzZDNiYzdlMzg0NzBmY2QxYzdlZDM5YTU5OWM3MzMxOWE1MyIKIFNSQ19VUklbdmFsdWFibGUt
MC4xLjEuc2hhMjU2c3VtXSA9ICJiYTczZWE5Y2YxNmEyNWRmMGM4Y2FhMTZjNTFhY2I5MzdkNTcx
MmE4NDI5ZGI3OGEzZWUyOWQ1ZGNhY2QzYTY1IgogU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41
LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDViMTBi
N2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKIFNSQ19VUklbdnRlLTAuMTQuMS5zaGEyNTZzdW1dID0g
IjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0NDEyNmFjYzBhOTgyZjQwNDBhYzNm
OWYwYmMwNzciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXYtYnVpbGRfMC4xMS4yNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy11di1idWlsZF8wLjExLjI4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjI2LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMS4yOC5iYgppbmRleCA1MjU2ZWRhZWFlLi4wOGFiMDk3NDgyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yOC5i
YgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQ
QUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFk
ZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
Y3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdl
NjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZWM1OGE5M2QyOTk2N2EwN2I4ZGU0
NjZiN2ZlMzVlMGUwY2IwY2EyYmNhYjhiNjFkODA0MDNiNWE5YjdhMzRiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImRhYmE2NmZkMjVhOWE4MmNhYTIzOTQ5Njg2ZTk2N2NiYjY5ZmQwNTYxNzdlOTkx
NjUwNjQzMTg2MDU3YWRhZWYiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40
Ny4xCgo=

--===============8908461387530011111==--

