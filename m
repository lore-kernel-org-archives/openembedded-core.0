Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5B2CD98E1
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87356.1781337025171910634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ECLow6OS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Avy3PBut;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ebff5e7d1-4399a3f6-55e3-4da1-a321-c0a2d380c05f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337024;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oDxCAokuxEVRnKy1BdMp6pmFwTaGdfAzVlM9eWEgO9c=;
	b=ECLow6OS6uSM3qUoms0PlAuZcaitArF9deBXQK+MYUaHmkrrySs/Unq5XYw13SGL
	FnTy2NdUGJcnfwxeI3AM3TZDk/XkAO7TG9JuyvhkIukourN2Oqy57h72t+A8i+y2+DN
	xSGhomPwh/hln2n6crloqQ/tuTVOgqL4PIi1jbGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337024;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oDxCAokuxEVRnKy1BdMp6pmFwTaGdfAzVlM9eWEgO9c=;
	b=Avy3PButmYAXPaLaBAyKCSV1GqR83z6Sg3zlFIUQDR0jyvtZyNiL5Dt84UNdGfL3
	Jl6OhA4esfSNykGsNfRhN5K8Wj+YbYzrgoSR1iOu0WjAHpXwaZ+1i6OxM+ABZ67zpLt
	VcBkX78NTrsYC8o87hC5LpPmiohXJzxR/Fe52FK8=
Content-Type: multipart/mixed; boundary="===============1228473402055242597=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.14.0 SUCCEEDED
Message-ID: <0101019ebff5e7d1-4399a3f6-55e3-4da1-a321-c0a2d380c05f-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238656

--===============1228473402055242597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.13.3-1.14.0.patch
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
From 309c789e9863fc006806d10d2ad2ac1ebcded9e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:18:23 +0000
Subject: [PATCH] python3-maturin: upgrade 1.13.3 -> 1.14.0

---
 .../python/python3-maturin-crates.inc                | 12 ++++++------
 ...3-maturin_1.13.3.bb => python3-maturin_1.14.0.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.13.3.bb => python3-maturin_1.14.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 9ff5122d7c..3500c19460 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -205,10 +205,10 @@ SRC_URI += " \
     crate://crates.io/object/0.38.1 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/openssl/0.10.79 \
+    crate://crates.io/openssl/0.10.80 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.2.1 \
-    crate://crates.io/openssl-sys/0.9.115 \
+    crate://crates.io/openssl-sys/0.9.116 \
     crate://crates.io/option-ext/0.2.0 \
     crate://crates.io/ordered-float/5.3.0 \
     crate://crates.io/os_pipe/1.2.3 \
@@ -322,7 +322,7 @@ SRC_URI += " \
     crate://crates.io/subtle/2.6.1 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar/0.4.45 \
+    crate://crates.io/tar/0.4.46 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
@@ -680,10 +680,10 @@ SRC_URI[object-0.37.3.sha256sum] = "ff76201f031d8863c38aa7f905eca4f53abbfa15f609
 SRC_URI[object-0.38.1.sha256sum] = "271638cd5fa9cca89c4c304675ca658efc4e64a66c716b7cfe1afb4b9611dbbc"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[openssl-0.10.79.sha256sum] = "bf0b434746ee2832f4f0baf10137e1cabb18cbe6912c69e2e33263c45250f542"
+SRC_URI[openssl-0.10.80.sha256sum] = "a45fa2aa886c42762255da344f0a0d313e254066c46aad76f300c3d3da62d967"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.2.1.sha256sum] = "7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe"
-SRC_URI[openssl-sys-0.9.115.sha256sum] = "158fe5b292746440aa6e7a7e690e55aeb72d41505e2804c23c6973ad0e9c9781"
+SRC_URI[openssl-sys-0.9.116.sha256sum] = "f28a22dc7140cda5f096e5e7724a6962ca81a7f8bfd2979f9b18c11af56318c4"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
 SRC_URI[ordered-float-5.3.0.sha256sum] = "b7d950ca161dc355eaf28f82b11345ed76c6e1f6eb1f4f4479e0323b9e2fbd0e"
 SRC_URI[os_pipe-1.2.3.sha256sum] = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
@@ -797,7 +797,7 @@ SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880e
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-0.4.45.sha256sum] = "22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973"
+SRC_URI[tar-0.4.46.sha256sum] = "3f6221d9a6003c78398e3b239969f352578258df48c8eb051caadae0015bc840"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.13.3.bb b/meta/recipes-devtools/python/python3-maturin_1.14.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.13.3.bb
rename to meta/recipes-devtools/python/python3-maturin_1.14.0.bb
index 9f214b9fb0..6a8a071508 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.13.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.14.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "771e1e9e71a278e56db01552e0d1acfd1464259f9575b6e72842f893cd299079"
+SRC_URI[sha256sum] = "f7f82a6aca4a6c402bf00b99200be199d4874d04b9b9e74e825726a3478bba7f"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============1228473402055242597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.13.3.tar.gz;downloadfilename=maturin-1.13.3.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arwen/0.0.5 crate://crates.io/arwen-codesign/0.0.1-alpha.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.0 crate://crates.io/borrow-or-share/0.2.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3
 .20.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.44 crate://crates.io/cargo-cyclonedx/0.5.9 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.7.6 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.22.0 crate://crates.io/cargo-zigbuild/0.22.2 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 crate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.60 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.14.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_complete/4.6.2 crate://crates.io/clap_complete_command/0.6.1 crate://crates
 .io/clap_complete_nushell/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.16.3 crate://crates.io/const-oid/0.10.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.1 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.1 crate://crates.io/cyclonedx-bom/0.8.1 cr
 ate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.8.0 crate://crates.io/deranged/0.5.8 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.2 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.11 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.4.1 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.4.1 crate://crates.io/fnv/1.0.7 cr
 ate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.2 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-s
 erde/1.1.1 crate://crates.io/hybrid-array/0.4.10 crate://crates.io/icu_collections/2.2.0 crate://crates.io/icu_locale_core/2.2.0 crate://crates.io/icu_normalizer/2.2.0 crate://crates.io/icu_normalizer_data/2.2.0 crate://crates.io/icu_properties/2.2.0 crate://crates.io/icu_properties_data/2.2.0 crate://crates.io/icu_provider/2.2.0 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.14.0 crate://crates.io/indicatif/0.18.4 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.1 crate://crates.io/jni-sys/0.4.1 crate://crates.io/jni-sys-macros/0.4.1 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.95 crate://crates.io/keyr
 ing/3.6.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.3 crate://crates.io/libc/0.2.185 crate://crates.io/libmimalloc-sys/0.1.46 crate://crates.io/libredox/0.1.16 crate://crates.io/linux-keyutils/0.2.5 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.2 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.10 crate://crates.io/memo-map/0.3.3 crate://crates.io/mimalloc/0.1.49 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.19.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.10.0 crate://crates.io/native-tls/0.2.18 crate://crates.io/nix/0.31.2 crate://cr
 ates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.1 crate://crates.io/num-traits/0.2.19 crate://crates.io/object/0.37.3 crate://crates.io/object/0.38.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.79 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.115 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/5.3.0 crate://crates.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/1.0.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generator/0.11.3 crat
 e://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.33 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.1.0 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.5 crate://crates.io/powerfmt/0.2.0 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyo3-introspection/0.28.3 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.8 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.2 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.8.6 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscal
 l/0.7.4 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.4 crate://crates.io/rustls/0.23.38 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.13 crate://crates.io/rustversion/1.0.22 crate://crates.io/ruzstd/0.8.2 crate
 ://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.29 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.7.0 crate://crates.io/security-framework-sys/2.17.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/serial_test/3.4.0 crate://crates.io/serial_test_derive/3.4.0 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/si
 md-adler32/0.3.9 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/1.2.1 crate://crates.io/snapbox-macros/1.1.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.28.0 crate://crates.io/strum_macros/0.28.0 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.45 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io
 /time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.3 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.12+spec-1.1.0 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/trycmd/1.2.0 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typenum/1.20.0 crate://crates.io/unicase/2.9.0 crate://crates.io/unic
 ode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-segmentation/1.13.2 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unit-prefix/0.5.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.3.0 crate://crates.io/ureq-proto/0.6.0 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf8-zero/0.8.1 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate://crates.io/validator/0.19.0 crate://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.3 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.3+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bin
 dgen/0.2.118 crate://crates.io/wasm-bindgen-macro/0.2.118 crate://crates.io/wasm-bindgen-macro-support/0.2.118 crate://crates.io/wasm-bindgen-shared/0.2.118 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.7 crate://crates.io/webpki-roots/1.0.7 crate://crates.io/which/8.0.2 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/window
 s-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1
  crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/winnow/1.0.1 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.3 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.9.0 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.2 crate://crates.io/yoke-deri
 ve/0.8.2 crate://crates.io/zerofrom/0.1.7 crate://crates.io/zerofrom-derive/0.1.7 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.4 crate://crates.io/zerovec/0.11.6 crate://crates.io/zerovec-derive/0.11.3 crate://crates.io/zip/7.2.0 crate://crates.io/zip/8.5.1 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.14.0.tar.gz;downloadfilename=maturin-1.14.0.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arwen/0.0.5 c
 rate://crates.io/arwen-codesign/0.0.1-alpha.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.0 crate://crates.io/borrow-or-share/0.2.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.44 crate://crates.io/cargo-cyclonedx/0.5.9 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.7.6 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.22.0 crate://crates.io/cargo-zigbuild/0.22.2 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 cr
 ate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.60 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.14.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_complete/4.6.2 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.16.3 crate://crates.io/const-oid/0.10.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.1 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 
 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.1 crate://crates.io/cyclonedx-bom/0.8.1 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.8.0 crate://crates.io/deranged/0.5.8 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.2 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.11 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.
 0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.4.1 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.4.1 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.2 cr
 ate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/hybrid-array/0.4.10 crate://crates.io/icu_collections/2.2.0 crate://crates.io/icu_locale_core/2.2.0 crate://crates.io/icu_normalizer/2.2.0 crate://crates.io/icu_normalizer_data/2.2.0 crate://crates.io/icu_properties/2.2.0 crate://crates.io/icu_properties_data/2.2.0 crate://crates.io/icu_provider/2.2.0 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.14.0 crate://crates.io/indicatif/0.18.4 crate://crates.io/indoc/2.0.7 crate://crates.io/in
 sta/1.47.2 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.1 crate://crates.io/jni-sys/0.4.1 crate://crates.io/jni-sys-macros/0.4.1 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.95 crate://crates.io/keyring/3.6.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.3 crate://crates.io/libc/0.2.185 crate://crates.io/libmimalloc-sys/0.1.46 crate://crates.io/libredox/0.1.16 crate://crates.io/linux-keyutils/0.2.5 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.2 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailpa
 rse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.10 crate://crates.io/memo-map/0.3.3 crate://crates.io/mimalloc/0.1.49 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.19.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.10.0 crate://crates.io/native-tls/0.2.18 crate://crates.io/nix/0.31.2 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.1 crate://crates.io/num-traits/0.2.19 crate://crates.io/object/0.37.3 crate://crates.io/object/0.38.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.80 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.116 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/5.3.0 crate://crat
 es.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/1.0.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.33 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.1.0 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.5 crate://crates.io/powerfmt/0.2.0 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyo3-introspection/0.
 28.3 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.8 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.2 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.8.6 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscall/0.7.4 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustc_ver
 sion/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.4 crate://crates.io/rustls/0.23.38 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.13 crate://crates.io/rustversion/1.0.22 crate://crates.io/ruzstd/0.8.2 crate://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.29 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.7.0 crate://crates.io/security-framework-sys/2.17.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://
 crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/serial_test/3.4.0 crate://crates.io/serial_test_derive/3.4.0 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.9 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/1.2.1 crate://crates.io/snapbox-macros/1.1.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.28.0 crate://crates.io/strum_macros/0.28.0 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.
 2 crate://crates.io/tar/0.4.46 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.3 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.12+spec-1.1.0 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate:
 //crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/trycmd/1.2.0 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typenum/1.20.0 crate://crates.io/unicase/2.9.0 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-segmentation/1.13.2 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unit-prefix/0.5.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.3.0 crate://crates.io/ureq-proto/0.6.0 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf8-zero/0.8.1 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate://crates.io/validator/0.19.0 crate
 ://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.3 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.3+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.118 crate://crates.io/wasm-bindgen-macro/0.2.118 crate://crates.io/wasm-bindgen-macro-support/0.2.118 crate://crates.io/wasm-bindgen-shared/0.2.118 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.7 crate://crates.io/webpki-roots/1.0.7 crate://crates.io/which/8.0.2 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/w
 inapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windo
 ws_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/winnow/1.0.1 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/wit-bindgen-cor
 e/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.3 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.9.0 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.2 crate://crates.io/yoke-derive/0.8.2 crate://crates.io/zerofrom/0.1.7 crate://crates.io/zerofrom-derive/0.1.7 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.4 crate://crates.io/zerovec/0.11.6 crate://crates.io/zerovec-derive/0.11.3 crate://crates.io/zip/7.2.0 crate://crates.io/zip/8.5.1 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-maturin: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6513536 to 6523160 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.13.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/maturin-1.13.3.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PV changed from "1.13.3" to "1.14.0"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 15344023 to 15364701 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.13.3 [default] to 1.14.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.13.3.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info

--===============1228473402055242597==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.13.3-1.14.0.patch"

RnJvbSAzMDljNzg5ZTk4NjNmYzAwNjgwNmQxMGQyYWQyYWMxZWJjZGVkOWUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6MTg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hdHVyaW46IHVwZ3JhZGUgMS4xMy4zIC0+IDEuMTQuMAoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jICAgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0t
LS0tCiAuLi4zLW1hdHVyaW5fMS4xMy4zLmJiID0+IHB5dGhvbjMtbWF0dXJpbl8xLjE0LjAuYmJ9
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWF0dXJpbl8x
LjEzLjMuYmIgPT4gcHl0aG9uMy1tYXR1cmluXzEuMTQuMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVzLmlu
YwppbmRleCA5ZmY1MTIyZDdjLi4zNTAwYzE5NDYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKQEAgLTIwNSwx
MCArMjA1LDEwIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb2JqZWN0
LzAuMzguMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjEuNCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsX3BvbHlmaWxsLzEuNzAuMiBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vb3BlbnNzbC8wLjEwLjc5IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVu
c3NsLzAuMTAuODAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtbWFjcm9zLzAuMS4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLXByb2JlLzAuMi4xIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9vcGVuc3NsLXN5cy8wLjkuMTE1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9vcGVuc3NsLXN5cy8wLjkuMTE2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcHRpb24tZXh0
LzAuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcmRlcmVkLWZsb2F0LzUuMy4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9vc19waXBlLzEuMi4zIFwKQEAgLTMyMiw3ICszMjIsNyBAQCBT
UkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N1YnRsZS8yLjYuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC4xMTcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5
bnN0cnVjdHVyZS8wLjEzLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci8wLjQuNDUgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci8wLjQuNDYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3RhcmdldC1sZXhpY29uLzAuMTMuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcGZpbGUv
My4yNy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXJtY29sb3IvMS40LjEgXApAQCAtNjgw
LDEwICs2ODAsMTAgQEAgU1JDX1VSSVtvYmplY3QtMC4zNy4zLnNoYTI1NnN1bV0gPSAiZmY3NjIw
MWYwMzFkODg2M2MzOGFhN2Y5MDVlY2E0ZjUzYWJiZmExNWY2MDkKIFNSQ19VUklbb2JqZWN0LTAu
MzguMS5zaGEyNTZzdW1dID0gIjI3MTYzOGNkNWZhOWNjYTg5YzRjMzA0Njc1Y2E2NThlZmM0ZTY0
YTY2YzcxNmI3Y2ZlMWFmYjRiOTYxMWRiYmMiCiBTUkNfVVJJW29uY2VfY2VsbC0xLjIxLjQuc2hh
MjU2c3VtXSA9ICI5ZjdjM2U0YmViMzNmODVkNDVhZTNlM2ExNzkyMTg1NzA2YzhlMTZkMDQzMjM4
YzU5MzMzMWNjN2NkMzEzYjUwIgogU1JDX1VSSVtvbmNlX2NlbGxfcG9seWZpbGwtMS43MC4yLnNo
YTI1NnN1bV0gPSAiMzg0YjhhYjZkMzcyMTVmM2M1MzAxYTk1YTRhY2NiNWQ2NGFhNjA3ZjFmY2Iy
NmExMWI1MzAzODc4NDUxYjRmZSIKLVNSQ19VUklbb3BlbnNzbC0wLjEwLjc5LnNoYTI1NnN1bV0g
PSAiYmYwYjQzNDc0NmVlMjgzMmY0ZjBiYWYxMDEzN2UxY2FiYjE4Y2JlNjkxMmM2OWUyZTMzMjYz
YzQ1MjUwZjU0MiIKK1NSQ19VUklbb3BlbnNzbC0wLjEwLjgwLnNoYTI1NnN1bV0gPSAiYTQ1ZmEy
YWE4ODZjNDI3NjIyNTVkYTM0NGYwYTBkMzEzZTI1NDA2NmM0NmFhZDc2ZjMwMGMzZDNkYTYyZDk2
NyIKIFNSQ19VUklbb3BlbnNzbC1tYWNyb3MtMC4xLjEuc2hhMjU2c3VtXSA9ICJhOTQ4NjY2YjYz
N2EwZjQ2NWU4NTY0YzczZTg5ZDRkZGUwMGQ3MmQ0ZDQ3M2NjOTcyZjM5MGZjM2RjZWU3ZDljIgog
U1JDX1VSSVtvcGVuc3NsLXByb2JlLTAuMi4xLnNoYTI1NnN1bV0gPSAiN2M4N2RlZjRjMzJhYjg5
ZDg4MGVmZmM5ZTA5NzY1M2M4ZGE1ZDZlZjI4ZTZiNTM5ZDMxM2JhYWFjZmJhZmNiZSIKLVNSQ19V
Uklbb3BlbnNzbC1zeXMtMC45LjExNS5zaGEyNTZzdW1dID0gIjE1OGZlNWIyOTI3NDY0NDBhYTZl
N2E3ZTY5MGU1NWFlYjcyZDQxNTA1ZTI4MDRjMjNjNjk3M2FkMGU5Yzk3ODEiCitTUkNfVVJJW29w
ZW5zc2wtc3lzLTAuOS4xMTYuc2hhMjU2c3VtXSA9ICJmMjhhMjJkYzcxNDBjZGE1ZjA5NmU1ZTc3
MjRhNjk2MmNhODFhN2Y4YmZkMjk3OWY5YjE4YzExYWY1NjMxOGM0IgogU1JDX1VSSVtvcHRpb24t
ZXh0LTAuMi4wLnNoYTI1NnN1bV0gPSAiMDQ3NDRmNDllYWU5OWFiNzhlMGQ1YzBiNjAzYWIyMThm
NTE1ZWE4Y2ZlNWE0NTZkNzYyOWFkODgzYTNiNmU3ZCIKIFNSQ19VUklbb3JkZXJlZC1mbG9hdC01
LjMuMC5zaGEyNTZzdW1dID0gImI3ZDk1MGNhMTYxZGMzNTVlYWYyOGY4MmIxMTM0NWVkNzZjNmUx
ZjZlYjFmNGY0NDc5ZTAzMjNiOWUyZmJkMGUiCiBTUkNfVVJJW29zX3BpcGUtMS4yLjMuc2hhMjU2
c3VtXSA9ICI3ZDhmYWU4NGI0MzEzODRiNjg2MjdkMGY5YjNiMTI0NWZjZjlmNDZmNmMwZTNkYzkw
MmU5ZGNlNjRlZGQxOTY3IgpAQCAtNzk3LDcgKzc5Nyw3IEBAIFNSQ19VUklbc3RydW1fbWFjcm9z
LTAuMjguMC5zaGEyNTZzdW1dID0gImFiODVlZWEwMjcwZWUxNzU4N2VkNDE1NjA4OWUxMGI5ZTY4
ODBlCiBTUkNfVVJJW3N1YnRsZS0yLjYuMS5zaGEyNTZzdW1dID0gIjEzYzJiZGRlY2M1N2IzODRk
ZWUxODY1MjM1OGZiMjMxNzJmYWNiOGEyYzUxY2NjMTBkNzRjMTU3YmRlYTMyOTIiCiBTUkNfVVJJ
W3N5bi0yLjAuMTE3LnNoYTI1NnN1bV0gPSAiZTY2NWI4ODAzZTdiMWQyYTcyN2Y0MDIzNDU2YmJi
YmU3NGRhNjcwOTljNTg1MjU4YWYwYWQ5YzUwMTNiOWI5OSIKIFNSQ19VUklbc3luc3RydWN0dXJl
LTAuMTMuMi5zaGEyNTZzdW1dID0gIjcyOGE3MGYzZGJhZjViYWI3ZjBjNGIxYWM4ZDdhZTVlYTYw
YTRiNTU0OWM4YTU5MTQzNjFjOTkxNDdhNzA5ZDIiCi1TUkNfVVJJW3Rhci0wLjQuNDUuc2hhMjU2
c3VtXSA9ICIyMjY5MmE2NDc2YTIxZmE3NWZkZmMxMWQ0NTJmZGE0ODJhZjQwMmMwMDhjZGJhZjM0
NzY0MTRlMTIyMDQwOTczIgorU1JDX1VSSVt0YXItMC40LjQ2LnNoYTI1NnN1bV0gPSAiM2Y2MjIx
ZDlhNjAwM2M3ODM5OGUzYjIzOTk2OWYzNTI1NzgyNThkZjQ4YzhlYjA1MWNhYWRhZTAwMTViYzg0
MCIKIFNSQ19VUklbdGFyZ2V0LWxleGljb24tMC4xMy41LnNoYTI1NnN1bV0gPSAiYWRiNjkzNWE2
ZjVjMjAxNzBlZWNlYjFhMzgzNWE0OWUxMmUxOWQ3OTJmNmRkMzQ0Y2NjNzZhOTg1Y2E1YTZjYSIK
IFNSQ19VUklbdGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJl
ZmNkZWJlZWY4Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNSQ19VUklb
dGVybWNvbG9yLTEuNC4xLnNoYTI1NnN1bV0gPSAiMDY3OTRmOGY2YzVjODk4YjMyNzVhZWJlZmE2
YjhhMWNiMjRjZDJjNmM3OTM5N2FiMTU3NzQ4MzdhMGJjNTc1NSIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuMTMuMy5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuMTQuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbl8xLjEzLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluXzEuMTQuMC5iYgppbmRleCA5ZjIxNGI5ZmIwLi42YThhMDcx
NTA4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0
dXJpbl8xLjEzLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW1hdHVyaW5fMS4xNC4wLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIk1JVCB8IEFwYWNo
ZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLWFwYWNoZTttZDU9MTgz
NmVmYjJlYjc3OTk2NjY5NmY0NzNlZTg1NDA1NDIgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vbGljZW5zZS1taXQ7bWQ1PTg1ZmQzYjY3MDY5Y2ZmNzg0ZDk4ZWJmYzdkNWMwNzk3IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzcxZTFlOWU3MWEyNzhlNTZkYjAxNTUyZTBkMWFjZmQxNDY0
MjU5Zjk1NzViNmU3Mjg0MmY4OTNjZDI5OTA3OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmN2Y4
MmE2YWNhNGE2YzQwMmJmMDBiOTkyMDBiZTE5OWQ0ODc0ZDA0YjliOWU3NGU4MjU3MjZhMzQ3OGJi
YTdmIgogCiBTID0gIiR7VU5QQUNLRElSfS9tYXR1cmluLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============1228473402055242597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.13.3.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/maturin-1.13.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.13.3.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info

--===============1228473402055242597==--

