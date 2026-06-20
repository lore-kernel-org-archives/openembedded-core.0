Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6E5CDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 05:56:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1564.1781935005877283960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 22:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qFVA3FZi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FCvZn00p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ee39a5e22-46de0eb8-e9a4-454f-9ab8-8d9872060887-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781935005;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4x5VvrnvhIxO1DMrpLXSwTF3eXUTm2K1m3E/spe18vE=;
	b=qFVA3FZiP0F0peaLNvcunNitLZvSHe0bwUf+mo9j0C6b0XJMWkIHJTltx08lNL7u
	QItU0c05ljvzM4i48nYM5bqE2Q7MCJs1pYmp8gIqJseG5DxcwLVAoVp5y5TtSCXlWnh
	sbm5sBtEdrUmHlr5LVm0yjbqXyRCPXM39iEwFzSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781935005;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4x5VvrnvhIxO1DMrpLXSwTF3eXUTm2K1m3E/spe18vE=;
	b=FCvZn00pg4ih3zPfuvrVBWpi2mvAI2M31R021JKrGkSA1gfY4uEh7WV4eS7MU7ZJ
	EZu80vyUhSCl4dvANznY1Y/RRpOYIoiqBmPxde6aDgx3jpXtKw2kFWeqjhxwQtWEDxL
	GEDMhqKeqsadexTrzhwMR4ViYiIpDZq5mH53RrME=
Content-Type: multipart/mixed; boundary="===============2509675789291512717=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.14.1 SUCCEEDED
Message-ID: <0101019ee39a5e22-46de0eb8-e9a4-454f-9ab8-8d9872060887-000000@us-west-2.amazonses.com>
Date: Sat, 20 Jun 2026 05:56:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 05:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239198

--===============2509675789291512717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.14.0-1.14.1.patch
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
From 663e0f379339d43479abbe2ced16929a8c60491f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 20 Jun 2026 05:40:19 +0000
Subject: [PATCH] python3-maturin: upgrade 1.14.0 -> 1.14.1

---
 .../python/python3-maturin-crates.inc            | 16 ++++++++--------
 ...turin_1.14.0.bb => python3-maturin_1.14.1.bb} |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.14.0.bb => python3-maturin_1.14.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 3500c19460..d8faf5e18d 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -34,11 +34,11 @@ SRC_URI += " \
     crate://crates.io/cargo-config2/0.1.44 \
     crate://crates.io/cargo-cyclonedx/0.5.9 \
     crate://crates.io/cargo-lock/10.1.0 \
-    crate://crates.io/cargo-options/0.7.6 \
+    crate://crates.io/cargo-options/0.8.1 \
     crate://crates.io/cargo-platform/0.1.9 \
     crate://crates.io/cargo-platform/0.3.2 \
-    crate://crates.io/cargo-xwin/0.22.0 \
-    crate://crates.io/cargo-zigbuild/0.22.2 \
+    crate://crates.io/cargo-xwin/0.23.0 \
+    crate://crates.io/cargo-zigbuild/0.23.0 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cargo_metadata/0.23.1 \
     crate://crates.io/cbindgen/0.29.2 \
@@ -238,7 +238,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/psm/0.1.30 \
     crate://crates.io/purl/0.1.6 \
-    crate://crates.io/pyo3-introspection/0.28.3 \
+    crate://crates.io/pyo3-introspection/0.29.0 \
     crate://crates.io/pyproject-toml/0.13.7 \
     crate://crates.io/python-pkginfo/0.6.8 \
     crate://crates.io/quote/1.0.45 \
@@ -509,11 +509,11 @@ SRC_URI[camino-1.2.2.sha256sum] = "e629a66d692cb9ff1a1c664e41771b3dcaf961985a977
 SRC_URI[cargo-config2-0.1.44.sha256sum] = "25ada53f7339c78084fb37d7e17f34e76537541c4fbb02fa3a2baa14b8faad37"
 SRC_URI[cargo-cyclonedx-0.5.9.sha256sum] = "5d162f67705f0f5038759d73bf546a083bf30e8677c2e944b416bca48d9d69a8"
 SRC_URI[cargo-lock-10.1.0.sha256sum] = "c06acb4f71407ba205a07cb453211e0e6a67b21904e47f6ba1f9589e38f2e454"
-SRC_URI[cargo-options-0.7.6.sha256sum] = "f89e1d6d6f65fe04d5e21be9de19d31a074e3b7e43aa39ee5b85f4cee16c3188"
+SRC_URI[cargo-options-0.8.1.sha256sum] = "b916a16b2a4b0ce91d46e42c51b7fc42e754220a4cc8bbfd1947efaafea99af7"
 SRC_URI[cargo-platform-0.1.9.sha256sum] = "e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea"
 SRC_URI[cargo-platform-0.3.2.sha256sum] = "87a0c0e6148f11f01f32650a2ea02d532b2ad4e81d8bd41e6e565b5adc5e6082"
-SRC_URI[cargo-xwin-0.22.0.sha256sum] = "c010a0e90e1dc09a90428c8768808bb4ad8cd7523e4df38719418e14579a9e37"
-SRC_URI[cargo-zigbuild-0.22.2.sha256sum] = "cd6351afb3f950c62e8d36f27d9089d65b91bf09eb1428eda58808557e8d15a9"
+SRC_URI[cargo-xwin-0.23.0.sha256sum] = "22a978d433c17ee532d4cb0a8ec9b7aeb121e658267ac1c637504583b12b2861"
+SRC_URI[cargo-zigbuild-0.23.0.sha256sum] = "68c7df45b9d9934aaed5987fbf422b31419f81827b13a52251a61e1e772c6ff7"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cargo_metadata-0.23.1.sha256sum] = "ef987d17b0a113becdd19d3d0022d04d7ef41f9efe4f3fb63ac44ba61df3ade9"
 SRC_URI[cbindgen-0.29.2.sha256sum] = "befbfd072a8e81c02f8c507aefce431fe5e7d051f83d48a23ffc9b9fe5a11799"
@@ -713,7 +713,7 @@ SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278f
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[psm-0.1.30.sha256sum] = "3852766467df634d74f0b2d7819bf8dc483a0eb2e3b0f50f756f9cfe8b0d18d8"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
-SRC_URI[pyo3-introspection-0.28.3.sha256sum] = "96040524552ac54e645ce08146b24023d720ceb0e788fff758c0beb9fe841736"
+SRC_URI[pyo3-introspection-0.29.0.sha256sum] = "7775fcc875acdce3872dcb91a4b7bd155ffba6e0ea8be88b8caab7d0b34539a6"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
 SRC_URI[python-pkginfo-0.6.8.sha256sum] = "229fe47647d6602b9b0934b21fab8aece1c5a5aeb0a934196a14355fec656623"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.14.0.bb b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.14.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.14.1.bb
index 6a8a071508..b690a57772 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.14.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.14.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "f7f82a6aca4a6c402bf00b99200be199d4874d04b9b9e74e825726a3478bba7f"
+SRC_URI[sha256sum] = "9d6577a62cd08e0ceba7a0db06fb098e0c9b1b3429bad747a4f3a18215a1b3df"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.47.1


--===============2509675789291512717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-maturin: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.14.0.tar.gz;downloadfilename=maturin-1.14.0.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arwen/0.0.5 crate://crates.io/arwen-codesign/0.0.1-alpha.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.0 crate://crates.io/borrow-or-share/0.2.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3
 .20.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.44 crate://crates.io/cargo-cyclonedx/0.5.9 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.7.6 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.22.0 crate://crates.io/cargo-zigbuild/0.22.2 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 crate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.60 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.14.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_complete/4.6.2 crate://crates.io/clap_complete_command/0.6.1 crate://crates
 .io/clap_complete_nushell/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.16.3 crate://crates.io/const-oid/0.10.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.1 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.1 crate://crates.io/cyclonedx-bom/0.8.1 cr
 ate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.8.0 crate://crates.io/deranged/0.5.8 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.2 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.11 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.4.1 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.4.1 crate://crates.io/fnv/1.0.7 cr
 ate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.2 crate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-s
 erde/1.1.1 crate://crates.io/hybrid-array/0.4.10 crate://crates.io/icu_collections/2.2.0 crate://crates.io/icu_locale_core/2.2.0 crate://crates.io/icu_normalizer/2.2.0 crate://crates.io/icu_normalizer_data/2.2.0 crate://crates.io/icu_properties/2.2.0 crate://crates.io/icu_properties_data/2.2.0 crate://crates.io/icu_provider/2.2.0 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.14.0 crate://crates.io/indicatif/0.18.4 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.1 crate://crates.io/jni-sys/0.4.1 crate://crates.io/jni-sys-macros/0.4.1 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.95 crate://crates.io/keyr
 ing/3.6.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.3 crate://crates.io/libc/0.2.185 crate://crates.io/libmimalloc-sys/0.1.46 crate://crates.io/libredox/0.1.16 crate://crates.io/linux-keyutils/0.2.5 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.2 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.10 crate://crates.io/memo-map/0.3.3 crate://crates.io/mimalloc/0.1.49 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.19.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.10.0 crate://crates.io/native-tls/0.2.18 crate://crates.io/nix/0.31.2 crate://cr
 ates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.1 crate://crates.io/num-traits/0.2.19 crate://crates.io/object/0.37.3 crate://crates.io/object/0.38.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.80 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.116 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/5.3.0 crate://crates.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/1.0.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generator/0.11.3 crat
 e://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.33 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.1.0 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.5 crate://crates.io/powerfmt/0.2.0 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyo3-introspection/0.28.3 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.8 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.2 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.8.6 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscal
 l/0.7.4 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.4 crate://crates.io/rustls/0.23.38 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.13 crate://crates.io/rustversion/1.0.22 crate://crates.io/ruzstd/0.8.2 crate
 ://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.29 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.7.0 crate://crates.io/security-framework-sys/2.17.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/serial_test/3.4.0 crate://crates.io/serial_test_derive/3.4.0 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/si
 md-adler32/0.3.9 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/1.2.1 crate://crates.io/snapbox-macros/1.1.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.28.0 crate://crates.io/strum_macros/0.28.0 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.46 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io
 /time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.3 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.12+spec-1.1.0 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/trycmd/1.2.0 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typenum/1.20.0 crate://crates.io/unicase/2.9.0 crate://crates.io/unic
 ode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-segmentation/1.13.2 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unit-prefix/0.5.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.3.0 crate://crates.io/ureq-proto/0.6.0 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf8-zero/0.8.1 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate://crates.io/validator/0.19.0 crate://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.3 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.3+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bin
 dgen/0.2.118 crate://crates.io/wasm-bindgen-macro/0.2.118 crate://crates.io/wasm-bindgen-macro-support/0.2.118 crate://crates.io/wasm-bindgen-shared/0.2.118 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.7 crate://crates.io/webpki-roots/1.0.7 crate://crates.io/which/8.0.2 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/window
 s-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1
  crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/winnow/1.0.1 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.3 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.9.0 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.2 crate://crates.io/yoke-deri
 ve/0.8.2 crate://crates.io/zerofrom/0.1.7 crate://crates.io/zerofrom-derive/0.1.7 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.4 crate://crates.io/zerovec/0.11.6 crate://crates.io/zerovec-derive/0.11.3 crate://crates.io/zip/7.2.0 crate://crates.io/zip/8.5.1 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.14.1.tar.gz;downloadfilename=maturin-1.14.1.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/ar_archive_writer/0.5.1 crate://crates.io/arwen/0.0.5 c
 rate://crates.io/arwen-codesign/0.0.1-alpha.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/automod/1.0.16 crate://crates.io/base64/0.22.1 crate://crates.io/base64ct/1.8.3 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.0 crate://crates.io/borrow-or-share/0.2.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.11.1 crate://crates.io/bytesize/2.3.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.2.2 crate://crates.io/cargo-config2/0.1.44 crate://crates.io/cargo-cyclonedx/0.5.9 crate://crates.io/cargo-lock/10.1.0 crate://crates.io/cargo-options/0.8.1 crate://crates.io/cargo-platform/0.1.9 crate://crates.io/cargo-platform/0.3.2 crate://crates.io/cargo-xwin/0.23.0 crate://crates.io/cargo-zigbuild/0.23.0 crate://crates.io/cargo_metadata/0.18.1 crate://crates.io/cargo_metadata/0.23.1 cr
 ate://crates.io/cbindgen/0.29.2 crate://crates.io/cc/1.2.60 crate://crates.io/cesu8/1.1.0 crate://crates.io/cfb/0.14.0 crate://crates.io/cfg-if/1.0.4 crate://crates.io/cfg_aliases/0.2.1 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.12.0 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_complete/4.6.2 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/cli-table/0.5.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/combine/4.6.7 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.16.3 crate://crates.io/const-oid/0.10.2 crate://crates.io/content_inspector/0.2.4 crate://crates.io/cookie/0.18.1 crate://crates.io/cookie_store/0.22.1 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation/0.10.1 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 
 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc/3.4.0 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.1 crate://crates.io/cyclonedx-bom/0.8.1 crate://crates.io/cyclonedx-bom-macros/0.1.0 crate://crates.io/data-encoding/2.10.0 crate://crates.io/der/0.8.0 crate://crates.io/deranged/0.5.8 crate://crates.io/dialoguer/0.12.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.2 crate://crates.io/dirs/6.0.0 crate://crates.io/dirs-sys/0.5.0 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.11 crate://crates.io/document-features/0.2.12 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.
 0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/env_logger/0.10.2 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/expect-test/1.5.1 crate://crates.io/fastrand/2.4.1 crate://crates.io/fat-macho/0.4.10 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/flate2/1.1.9 crate://crates.io/fluent-uri/0.4.1 crate://crates.io/fnv/1.0.7 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/fs4/0.13.1 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.17 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.2 cr
 ate://crates.io/glob/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/goblin/0.10.5 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hermit-abi/0.5.2 crate://crates.io/hex/0.4.3 crate://crates.io/http/1.4.0 crate://crates.io/httparse/1.10.1 crate://crates.io/humantime/2.3.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/hybrid-array/0.4.10 crate://crates.io/icu_collections/2.2.0 crate://crates.io/icu_locale_core/2.2.0 crate://crates.io/icu_normalizer/2.2.0 crate://crates.io/icu_normalizer_data/2.2.0 crate://crates.io/icu_properties/2.2.0 crate://crates.io/icu_properties_data/2.2.0 crate://crates.io/icu_provider/2.2.0 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/ignore/0.4.25 crate://crates.io/indexmap/2.14.0 crate://crates.io/indicatif/0.18.4 crate://crates.io/indoc/2.0.7 crate://crates.io/in
 sta/1.47.2 crate://crates.io/is-terminal/0.4.17 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.18 crate://crates.io/jni/0.21.1 crate://crates.io/jni-sys/0.3.1 crate://crates.io/jni-sys/0.4.1 crate://crates.io/jni-sys-macros/0.4.1 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.95 crate://crates.io/keyring/3.6.3 crate://crates.io/lazy_static/1.5.0 crate://crates.io/lddtree/0.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.3 crate://crates.io/libc/0.2.185 crate://crates.io/libmimalloc-sys/0.1.46 crate://crates.io/libredox/0.1.16 crate://crates.io/linux-keyutils/0.2.5 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.2 crate://crates.io/litrs/1.0.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.6 crate://crates.io/mailpa
 rse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/memmap2/0.9.10 crate://crates.io/memo-map/0.3.3 crate://crates.io/mimalloc/0.1.49 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.5 crate://crates.io/minijinja/2.19.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/msi/0.10.0 crate://crates.io/native-tls/0.2.18 crate://crates.io/nix/0.31.2 crate://crates.io/nom/8.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.5.0 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/num-conv/0.2.1 crate://crates.io/num-traits/0.2.19 crate://crates.io/object/0.37.3 crate://crates.io/object/0.38.1 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/openssl/0.10.80 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.2.1 crate://crates.io/openssl-sys/0.9.116 crate://crates.io/option-ext/0.2.0 crate://crates.io/ordered-float/5.3.0 crate://crat
 es.io/os_pipe/1.2.3 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pathdiff/0.2.3 crate://crates.io/pem-rfc7468/1.0.0 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.33 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.1.0 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/potential_utf/0.1.5 crate://crates.io/powerfmt/0.2.0 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-crate/3.5.0 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/psm/0.1.30 crate://crates.io/purl/0.1.6 crate://crates.io/pyo3-introspection/0.
 29.0 crate://crates.io/pyproject-toml/0.13.7 crate://crates.io/python-pkginfo/0.6.8 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.2 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rand/0.8.6 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.12.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/redox_syscall/0.7.4 crate://crates.io/redox_users/0.5.2 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.3.9 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.7.5 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.1.0 crate://crates.io/ring/0.17.14 crate://crates.io/rstest/0.26.1 crate://crates.io/rstest_macros/0.26.1 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustc_ver
 sion/0.4.1 crate://crates.io/rustflags/0.1.7 crate://crates.io/rustix/1.1.4 crate://crates.io/rustls/0.23.38 crate://crates.io/rustls-native-certs/0.8.3 crate://crates.io/rustls-pki-types/1.14.0 crate://crates.io/rustls-platform-verifier/0.6.2 crate://crates.io/rustls-platform-verifier-android/0.1.1 crate://crates.io/rustls-webpki/0.103.13 crate://crates.io/rustversion/1.0.22 crate://crates.io/ruzstd/0.8.2 crate://crates.io/same-file/1.0.6 crate://crates.io/scc/2.4.0 crate://crates.io/schannel/0.1.29 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.13.0 crate://crates.io/scroll_derive/0.13.1 crate://crates.io/sdd/3.0.10 crate://crates.io/security-framework/2.11.1 crate://crates.io/security-framework/3.7.0 crate://crates.io/security-framework-sys/2.17.0 crate://crates.io/semver/1.0.28 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://
 crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/0.6.9 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/serial_test/3.4.0 crate://crates.io/serial_test_derive/3.4.0 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.9 crate://crates.io/similar/2.7.0 crate://crates.io/siphasher/1.0.2 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/1.2.1 crate://crates.io/snapbox-macros/1.1.0 crate://crates.io/socks/0.3.4 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/stacker/0.1.23 crate://crates.io/strsim/0.11.1 crate://crates.io/strum/0.28.0 crate://crates.io/strum_macros/0.28.0 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.
 2 crate://crates.io/tar/0.4.46 crate://crates.io/target-lexicon/0.13.5 crate://crates.io/tempfile/3.27.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.3 crate://crates.io/toml/0.8.23 crate://crates.io/toml/0.9.12+spec-1.1.0 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/0.6.11 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.22.27 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_write/0.1.2 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate:
 //crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/trycmd/1.2.0 crate://crates.io/twox-hash/2.1.2 crate://crates.io/typed-path/0.12.3 crate://crates.io/typenum/1.20.0 crate://crates.io/unicase/2.9.0 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-segmentation/1.13.2 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unit-prefix/0.5.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/3.3.0 crate://crates.io/ureq-proto/0.6.0 crate://crates.io/url/2.5.8 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf8-zero/0.8.1 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate://crates.io/validator/0.19.0 crate
 ://crates.io/valuable/0.1.1 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.3 crate://crates.io/version_check/0.9.5 crate://crates.io/versions/7.0.0 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.3+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.118 crate://crates.io/wasm-bindgen-macro/0.2.118 crate://crates.io/wasm-bindgen-macro-support/0.2.118 crate://crates.io/wasm-bindgen-shared/0.2.118 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-root-certs/1.0.7 crate://crates.io/webpki-roots/1.0.7 crate://crates.io/which/8.0.2 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/w
 inapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows/0.62.2 crate://crates.io/windows-collections/0.3.2 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-future/0.3.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.3.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.45.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.42.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.2.1 crate://crates.io/windows_aarch64_gnullvm/0.42.2 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.42.2 crate://crates.io/windo
 ws_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.42.2 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.42.2 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.42.2 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.42.2 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.42.2 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/winnow/1.0.1 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/wit-bindgen-cor
 e/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.3 crate://crates.io/xattr/1.6.1 crate://crates.io/xml-rs/0.8.28 crate://crates.io/xwin/0.9.0 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.8.2 crate://crates.io/yoke-derive/0.8.2 crate://crates.io/zerofrom/0.1.7 crate://crates.io/zerofrom-derive/0.1.7 crate://crates.io/zeroize/1.8.2 crate://crates.io/zerotrie/0.2.4 crate://crates.io/zerovec/0.11.6 crate://crates.io/zerovec-derive/0.11.3 crate://crates.io/zip/7.2.0 crate://crates.io/zip/8.5.1 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-maturin: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6536936 to 6537760 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 15463005 to 15471197 (+0%)
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.14.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.14.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PV changed from "1.14.0" to "1.14.1"
packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.14.1.dist-info

--===============2509675789291512717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/maturin-1.14.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info -> /usr/lib/python3.14/site-packages/maturin-1.14.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.14/site-packages/maturin-1.14.0.dist-info moved to /usr/lib/python3.14/site-packages/maturin-1.14.1.dist-info

--===============2509675789291512717==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.14.0-1.14.1.patch"

RnJvbSA2NjNlMGYzNzkzMzlkNDM0NzlhYmJlMmNlZDE2OTI5YThjNjA0OTFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjAgSnVuIDIwMjYgMDU6NDA6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hdHVyaW46IHVwZ3JhZGUgMS4xNC4wIC0+IDEuMTQuMQoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jICAgICAgICAgICAgfCAxNiArKysrKysrKy0tLS0t
LS0tCiAuLi50dXJpbl8xLjE0LjAuYmIgPT4gcHl0aG9uMy1tYXR1cmluXzEuMTQuMS5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXR1cmluXzEuMTQu
MC5iYiA9PiBweXRob24zLW1hdHVyaW5fMS4xNC4xLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCmlu
ZGV4IDM1MDBjMTk0NjAuLmQ4ZmFmNWUxOGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVzLmluYwpAQCAtMzQsMTEgKzM0
LDExIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28tY29uZmln
Mi8wLjEuNDQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLWN5Y2xvbmVkeC8wLjUuOSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28tbG9jay8xMC4xLjAgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NhcmdvLW9wdGlvbnMvMC43LjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nh
cmdvLW9wdGlvbnMvMC44LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLXBsYXRmb3Jt
LzAuMS45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1wbGF0Zm9ybS8wLjMuMiBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28teHdpbi8wLjIyLjAgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2NhcmdvLXppZ2J1aWxkLzAuMjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2Fy
Z28teHdpbi8wLjIzLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLXppZ2J1aWxkLzAu
MjMuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ29fbWV0YWRhdGEvMC4xOC4xIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnb19tZXRhZGF0YS8wLjIzLjEgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NiaW5kZ2VuLzAuMjkuMiBcCkBAIC0yMzgsNyArMjM4LDcgQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuMTA2IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9wc20vMC4xLjMwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wdXJs
LzAuMS42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWludHJvc3BlY3Rpb24vMC4yOC4z
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWludHJvc3BlY3Rpb24vMC4yOS4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weXByb2plY3QtdG9tbC8wLjEzLjcgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3B5dGhvbi1wa2dpbmZvLzAuNi44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9x
dW90ZS8xLjAuNDUgXApAQCAtNTA5LDExICs1MDksMTEgQEAgU1JDX1VSSVtjYW1pbm8tMS4yLjIu
c2hhMjU2c3VtXSA9ICJlNjI5YTY2ZDY5MmNiOWZmMWExYzY2NGU0MTc3MWIzZGNhZjk2MTk4NWE5
NzcKIFNSQ19VUklbY2FyZ28tY29uZmlnMi0wLjEuNDQuc2hhMjU2c3VtXSA9ICIyNWFkYTUzZjcz
MzljNzgwODRmYjM3ZDdlMTdmMzRlNzY1Mzc1NDFjNGZiYjAyZmEzYTJiYWExNGI4ZmFhZDM3Igog
U1JDX1VSSVtjYXJnby1jeWNsb25lZHgtMC41Ljkuc2hhMjU2c3VtXSA9ICI1ZDE2MmY2NzcwNWYw
ZjUwMzg3NTlkNzNiZjU0NmEwODNiZjMwZTg2NzdjMmU5NDRiNDE2YmNhNDhkOWQ2OWE4IgogU1JD
X1VSSVtjYXJnby1sb2NrLTEwLjEuMC5zaGEyNTZzdW1dID0gImMwNmFjYjRmNzE0MDdiYTIwNWEw
N2NiNDUzMjExZTBlNmE2N2IyMTkwNGU0N2Y2YmExZjk1ODllMzhmMmU0NTQiCi1TUkNfVVJJW2Nh
cmdvLW9wdGlvbnMtMC43LjYuc2hhMjU2c3VtXSA9ICJmODllMWQ2ZDZmNjVmZTA0ZDVlMjFiZTlk
ZTE5ZDMxYTA3NGUzYjdlNDNhYTM5ZWU1Yjg1ZjRjZWUxNmMzMTg4IgorU1JDX1VSSVtjYXJnby1v
cHRpb25zLTAuOC4xLnNoYTI1NnN1bV0gPSAiYjkxNmExNmIyYTRiMGNlOTFkNDZlNDJjNTFiN2Zj
NDJlNzU0MjIwYTRjYzhiYmZkMTk0N2VmYWFmZWE5OWFmNyIKIFNSQ19VUklbY2FyZ28tcGxhdGZv
cm0tMC4xLjkuc2hhMjU2c3VtXSA9ICJlMzVhZjE4OTAwNmI5YzBmMDBhMDY0Njg1YzcyNzAzMWUz
ZWQyZDgwMjBmN2JhMjg0ZDc4Y2MyNjcxYmQzNmVhIgogU1JDX1VSSVtjYXJnby1wbGF0Zm9ybS0w
LjMuMi5zaGEyNTZzdW1dID0gIjg3YTBjMGU2MTQ4ZjExZjAxZjMyNjUwYTJlYTAyZDUzMmIyYWQ0
ZTgxZDhiZDQxZTZlNTY1YjVhZGM1ZTYwODIiCi1TUkNfVVJJW2NhcmdvLXh3aW4tMC4yMi4wLnNo
YTI1NnN1bV0gPSAiYzAxMGEwZTkwZTFkYzA5YTkwNDI4Yzg3Njg4MDhiYjRhZDhjZDc1MjNlNGRm
Mzg3MTk0MThlMTQ1NzlhOWUzNyIKLVNSQ19VUklbY2FyZ28temlnYnVpbGQtMC4yMi4yLnNoYTI1
NnN1bV0gPSAiY2Q2MzUxYWZiM2Y5NTBjNjJlOGQzNmYyN2Q5MDg5ZDY1YjkxYmYwOWViMTQyOGVk
YTU4ODA4NTU3ZThkMTVhOSIKK1NSQ19VUklbY2FyZ28teHdpbi0wLjIzLjAuc2hhMjU2c3VtXSA9
ICIyMmE5NzhkNDMzYzE3ZWU1MzJkNGNiMGE4ZWM5YjdhZWIxMjFlNjU4MjY3YWMxYzYzNzUwNDU4
M2IxMmIyODYxIgorU1JDX1VSSVtjYXJnby16aWdidWlsZC0wLjIzLjAuc2hhMjU2c3VtXSA9ICI2
OGM3ZGY0NWI5ZDk5MzRhYWVkNTk4N2ZiZjQyMmIzMTQxOWY4MTgyN2IxM2E1MjI1MWE2MWUxZTc3
MmM2ZmY3IgogU1JDX1VSSVtjYXJnb19tZXRhZGF0YS0wLjE4LjEuc2hhMjU2c3VtXSA9ICIyZDg4
NjU0N2U0MWY3NDBjNjE2YWU3MzEwOGY2ZWI3MGFmZTZkOTQwYzdiYzY5N2NiMzBmMTNkYWVjMDcz
MDM3IgogU1JDX1VSSVtjYXJnb19tZXRhZGF0YS0wLjIzLjEuc2hhMjU2c3VtXSA9ICJlZjk4N2Qx
N2IwYTExM2JlY2RkMTlkM2QwMDIyZDA0ZDdlZjQxZjllZmU0ZjNmYjYzYWM0NGJhNjFkZjNhZGU5
IgogU1JDX1VSSVtjYmluZGdlbi0wLjI5LjIuc2hhMjU2c3VtXSA9ICJiZWZiZmQwNzJhOGU4MWMw
MmY4YzUwN2FlZmNlNDMxZmU1ZTdkMDUxZjgzZDQ4YTIzZmZjOWI5ZmU1YTExNzk5IgpAQCAtNzEz
LDcgKzcxMyw3IEBAIFNSQ19VUklbcHJvYy1tYWNyby1jcmF0ZS0zLjUuMC5zaGEyNTZzdW1dID0g
ImU2N2JhN2U5YjJiNTY0NDZmMWQ0MTliMWQ4MDc5MDYyNzhmCiBTUkNfVVJJW3Byb2MtbWFjcm8y
LTEuMC4xMDYuc2hhMjU2c3VtXSA9ICI4ZmQwMGYwYmIyZTkwZDgxZDEwNDRjMmIzMjYxN2Y2OGZj
YjlmYTNiYjc2NDBjMjNlOWM3NDhlNTNmYjMwOTM0IgogU1JDX1VSSVtwc20tMC4xLjMwLnNoYTI1
NnN1bV0gPSAiMzg1Mjc2NjQ2N2RmNjM0ZDc0ZjBiMmQ3ODE5YmY4ZGM0ODNhMGViMmUzYjBmNTBm
NzU2ZjljZmU4YjBkMThkOCIKIFNSQ19VUklbcHVybC0wLjEuNi5zaGEyNTZzdW1dID0gIjYwZWJl
NDI2MmFlOTFkZGQyOGM4NzIxMTExYTBhNmU5ZTU4ODYwZTIxMWZjOTIxMTZjNGJiODVjOThmZDk2
YWQiCi1TUkNfVVJJW3B5bzMtaW50cm9zcGVjdGlvbi0wLjI4LjMuc2hhMjU2c3VtXSA9ICI5NjA0
MDUyNDU1MmFjNTRlNjQ1Y2UwODE0NmIyNDAyM2Q3MjBjZWIwZTc4OGZmZjc1OGMwYmViOWZlODQx
NzM2IgorU1JDX1VSSVtweW8zLWludHJvc3BlY3Rpb24tMC4yOS4wLnNoYTI1NnN1bV0gPSAiNzc3
NWZjYzg3NWFjZGNlMzg3MmRjYjkxYTRiN2JkMTU1ZmZiYTZlMGVhOGJlODhiOGNhYWI3ZDBiMzQ1
MzlhNiIKIFNSQ19VUklbcHlwcm9qZWN0LXRvbWwtMC4xMy43LnNoYTI1NnN1bV0gPSAiZjZkNzU1
NDgzYWQxNGI0OWU3NjcxM2I1MjI4NTIzNTQ2MWE1YjRmNzNmMTc2MTIzNTNlMTFhNWRlMzZhNWZk
MiIKIFNSQ19VUklbcHl0aG9uLXBrZ2luZm8tMC42Ljguc2hhMjU2c3VtXSA9ICIyMjlmZTQ3NjQ3
ZDY2MDJiOWIwOTM0YjIxZmFiOGFlY2UxYzVhNWFlYjBhOTM0MTk2YTE0MzU1ZmVjNjU2NjIzIgog
U1JDX1VSSVtxdW90ZS0xLjAuNDUuc2hhMjU2c3VtXSA9ICI0MWYyNjE5OTY2MDUwNjg5MzgyZDJi
NDRmNjY0ZjRiYzU5M2UxMjk3ODVhMzZkNmVlMzc2ZGRmMzcyNTliOTI0IgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS4xNC4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS4xNC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1tYXR1cmluXzEuMTQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS4xNC4xLmJiCmluZGV4IDZhOGEwNzE1MDguLmI2
OTBhNTc3NzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tYXR1cmluXzEuMTQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbl8xLjE0LjEuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIHwg
QXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2xpY2Vuc2UtYXBhY2hlO21k
NT0xODM2ZWZiMmViNzc5OTY2Njk2ZjQ3M2VlODU0MDU0MiBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9saWNlbnNlLW1pdDttZDU9ODVmZDNiNjcwNjljZmY3ODRkOThlYmZjN2Q1YzA3OTci
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmN2Y4MmE2YWNhNGE2YzQwMmJmMDBiOTkyMDBiZTE5
OWQ0ODc0ZDA0YjliOWU3NGU4MjU3MjZhMzQ3OGJiYTdmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjlkNjU3N2E2MmNkMDhlMGNlYmE3YTBkYjA2ZmIwOThlMGM5YjFiMzQyOWJhZDc0N2E0ZjNhMTgy
MTVhMWIzZGYiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L21hdHVyaW4tJHtQVn0iCiAKLS0gCjIuNDcu
MQoK

--===============2509675789291512717==--

