Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EEDC44503
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39120.1782887651839226785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P/DG/ucg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tF5ATazP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f1c629725-1caa8964-34cc-4331-b8d1-636559f73bbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887651;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=skUXMiq+EfprMmbWxKdfRw1VrwCjNt2FBxSvPXq8KSs=;
	b=P/DG/ucgTMdmCyjzKbNJabBTmb5sfisMO9INd0wrtlbR7B8A9I2b4+Xh8jXJWUk+
	bPWbhb8l4SL4E7Pmq13Mz3IK1NJr8y0K8yEcDAx3B1RrWH9fWROPyPlo/Dp8H9+qkko
	Sc2GZen8+Ra8CzjP92CWZg8DaGCBqRhUBJMt5PJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887651;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=skUXMiq+EfprMmbWxKdfRw1VrwCjNt2FBxSvPXq8KSs=;
	b=tF5ATazPvMOjSDRJ7Ogyv5MioP6KCD0xj7SzykTUAMH7Kjsj9me5Y4Sp4kTjgyZ2
	z21N9LVZXTwAjTx7IPyfTojgFMUhV2u1ixIACk31g0PycjFSDJXcp8E2U2ggdD74DHW
	US9mclWEN6VOGn97XLzGo/RER9PUclpLm9xZwGJU=
Content-Type: multipart/mixed; boundary="===============5839200384450931129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.26 SUCCEEDED
Message-ID: <0101019f1c629725-1caa8964-34cc-4331-b8d1-636559f73bbe-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239935

--===============5839200384450931129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.21-0.11.26.patch
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
From 481bfcde41488e1ddb4aab3f043cd31b0b615887 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 06:06:54 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.21 -> 0.11.26

---
 .../python/python3-uv-build-crates.inc        | 82 +++++++++++--------
 ...0.11.21.bb => python3-uv-build_0.11.26.bb} |  2 +-
 2 files changed, 51 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.21.bb => python3-uv-build_0.11.26.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index be20115668..5f8b1b1183 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,22 +12,23 @@ SRC_URI += " \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/arcstr/1.2.0 \
-    crate://crates.io/arrayvec/0.7.6 \
-    crate://crates.io/astral-tokio-tar/0.6.2 \
-    crate://crates.io/astral-version-ranges/0.1.4 \
+    crate://crates.io/arrayvec/0.7.7 \
+    crate://crates.io/astral-tokio-tar/0.6.3 \
+    crate://crates.io/astral-version-ranges/0.2.0 \
     crate://crates.io/astral_async_zip/0.0.18 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.13.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
-    crate://crates.io/bytes/1.11.1 \
+    crate://crates.io/bytes/1.12.0 \
     crate://crates.io/bzip2/0.5.2 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
@@ -45,6 +46,9 @@ SRC_URI += " \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
     crate://crates.io/data-encoding/2.11.0 \
+    crate://crates.io/defmt/1.1.0 \
+    crate://crates.io/defmt-macros/1.1.0 \
+    crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
@@ -59,7 +63,6 @@ SRC_URI += " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.4.1 \
-    crate://crates.io/filetime/0.2.29 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.9 \
@@ -98,12 +101,12 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/insta/1.47.2 \
+    crate://crates.io/insta/1.48.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.28 \
-    crate://crates.io/jiff-static/0.2.28 \
+    crate://crates.io/jiff/0.2.29 \
+    crate://crates.io/jiff-static/0.2.29 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -112,6 +115,7 @@ SRC_URI += " \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -119,7 +123,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.1 \
+    crate://crates.io/memchr/2.8.2 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -146,6 +150,8 @@ SRC_URI += " \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
     crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro-error-attr2/2.0.0 \
+    crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
@@ -156,14 +162,15 @@ SRC_URI += " \
     crate://crates.io/redox_syscall/0.5.15 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
-    crate://crates.io/reflink-copy/0.1.29 \
-    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/reflink-copy/0.1.30 \
+    crate://crates.io/regex/1.12.4 \
     crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.16 \
     crate://crates.io/rkyv_derive/0.8.16 \
     crate://crates.io/rustc-hash/2.1.2 \
+    crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -189,12 +196,13 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/spdx/0.13.4 \
     crate://crates.io/stable_deref_trait/1.2.1 \
+    crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/2.0.118 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
@@ -233,9 +241,10 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.2 \
+    crate://crates.io/uuid/1.23.3 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
@@ -306,22 +315,23 @@ SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db416
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
-SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
-SRC_URI[astral-tokio-tar-0.6.2.sha256sum] = "cb50a7aae84a03bf55b067832bc376f4961b790c97e64d3eacee97d389b90277"
-SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
+SRC_URI[arrayvec-0.7.7.sha256sum] = "f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe"
+SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
+SRC_URI[astral-version-ranges-0.2.0.sha256sum] = "086f936efdefab117f5a72367fb3d68c4fded8ba5a7008e3c63365eecf723822"
 SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
-SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
+SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
@@ -339,6 +349,9 @@ SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abe
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
 SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
+SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
+SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
+SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
@@ -353,7 +366,6 @@ SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
-SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
@@ -392,12 +404,12 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8efa867b6895af7e094e"
+SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.28.sha256sum] = "4603d3033e49e2b0e31229fcab20a5d40089c607d975cd9c80551dc69eed9102"
-SRC_URI[jiff-static-0.2.28.sha256sum] = "782d32378dddf207193ac91cefb848ad41abb58195c95168e1291227a0832b47"
+SRC_URI[jiff-0.2.29.sha256sum] = "34f877a98676d2fb664698d74cc6a51ce6c484ce8c770f05d0108ec9090aeb46"
+SRC_URI[jiff-static-0.2.29.sha256sum] = "0666b5ab5ecaca213fc2a85b8c0083d9004e84ee2d5f9a7e0017aaf50986f25f"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -406,6 +418,7 @@ SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -413,7 +426,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
+SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -440,6 +453,8 @@ SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
+SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
@@ -450,14 +465,15 @@ SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
-SRC_URI[reflink-copy-0.1.29.sha256sum] = "13362233b147e57674c37b802d216b7c5e3dcccbed8967c84f0d8d223868ae27"
-SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
+SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.16.sha256sum] = "73389e0c99e664f919275ab5b5b0471391fe9a8de61e1dff9b1eaf56a90f16e3"
 SRC_URI[rkyv_derive-0.8.16.sha256sum] = "5d2ed0b54125315fb36bd021e82d314d1c126548f871634b483f46b31d13cac6"
 SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
+SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
@@ -483,12 +499,13 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
+SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -527,9 +544,10 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.2.sha256sum] = "d258b83ceec21034727ecee8c382cfa6c3e133699b0742c64571814fb420c9f7"
+SRC_URI[uuid-1.23.3.sha256sum] = "144d6b123cef80b301b8f72a9e2ca4370ddec21950d0a103dd22c437006d2db7"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
index 4ee2fdbaa7..5256edaeae 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "d512911d357f71dd7c1be43503ee66ebaba9a8d207998bbea77581e95aadabe6"
+SRC_URI[sha256sum] = "4ec58a93d29967a07b8de466b7fe35e0e0cb0ca2bcab8b61d80403b5a9b7a34b"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============5839200384450931129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.21.tar.gz;downloadfilename=uv_build-0.11.21.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-tokio-tar/0.6.2 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io
 /bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/en
 umflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/filetime/0.2.29 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 cra
 te://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.28 crate://crates.io/jiff-static/0.2.28 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate
 ://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.1 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/
 0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4 cra
 te://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://cr
 ates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-sub
 scriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.2 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crate
 s.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.5
 2.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.26.tar.gz;downloadfilename=uv_build-0.1
 1.26.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.7 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.0 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0
 .5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags
 2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://c
 rates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.29 crate://crates.io/jiff-static/0.2.29 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crat
 es.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.
 1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/
 rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2
  crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tr
 acing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.3 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 c
 rate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.
 io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate
 ://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.21" to "0.11.26"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.21 [default] to 0.11.26 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5340466 to 5348658 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info

--===============5839200384450931129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.21-0.11.26.patch"

RnJvbSA0ODFiZmNkZTQxNDg4ZTFkZGI0YWFiM2YwNDNjZDMxYjBiNjE1ODg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjowNjo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMS4yMSAtPiAwLjExLjI2CgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDgyICsrKysrKysrKysrLS0t
LS0tLS0KIC4uLjAuMTEuMjEuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI2LmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
MS4yMS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTEuMjYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVz
LmluYwppbmRleCBiZTIwMTE1NjY4Li41ZjhiMWIxMTgzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAt
MTIsMjIgKzEyLDIzIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5z
dHlsZS13aW5jb24vMy4wLjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnlob3cvMS4wLjEw
MiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJjc3RyLzEuMi4wIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9hcnJheXZlYy8wLjcuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXRv
a2lvLXRhci8wLjYuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXZlcnNpb24tcmFu
Z2VzLzAuMS40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hcnJheXZlYy8wLjcuNyBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXRva2lvLXRhci8wLjYuMyBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vYXN0cmFsLXZlcnNpb24tcmFuZ2VzLzAuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9hc3RyYWxfYXN5bmNfemlwLzAuMC4xOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN5
bmMtY29tcHJlc3Npb24vMC40LjE5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEu
NS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9iYWNrb24vMS42LjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdz
LzIuMTEuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMS4zLjIgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIuMTMuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
YmxvY2stYnVmZmVyLzAuMTAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYm94Y2FyLzAuMi4x
NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnN0ci8xLjEyLjEgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2J1bXBhbG8vMy4yMC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlY2hlY2sv
MC44LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVjaGVja19kZXJpdmUvMC44LjIgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVzLzEuMTEuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vYnl0ZXMvMS4xMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9iemlwMi8wLjUuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnppcDItc3lzLzAuMS4xMysxLjAuOCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2MvMS4yLjU3IFwKQEAgLTQ1LDYgKzQ2LDkgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9jc3YvMS40LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Nzdi1jb3JlLzAuMS4xMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGF0YS1lbmNvZGluZy8y
LjExLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RlZm10LzEuMS4wIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9kZWZtdC1tYWNyb3MvMS4xLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rl
Zm10LXBhcnNlci8xLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlnZXN0LzAuMTAuNyBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlzcGxheWRvYy8wLjIuNSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZHVuY2UvMS4wLjUgXApAQCAtNTksNyArNjMsNiBAQCBTUkNfVVJJICs9ICIgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VyYXNlZC1zZXJkZS8wLjQuMTAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Vycm5vLzAuMy4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmFzdHJhbmQv
Mi40LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZpbGV0aW1lLzAuMi4yOSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZmluZC1tc3ZjLXRvb2xzLzAuMS45IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9maXhlZGJpdHNldC8wLjUuNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmxhdGUyLzEu
MS45IFwKQEAgLTk4LDEyICsxMDEsMTIgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9pZG5hX2FkYXB0ZXIvMS4yLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZGV4
bWFwLzIuMTQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kb2MvMi4wLjcgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2luc3RhLzEuNDcuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5z
dGEvMS40OC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pc190ZXJtaW5hbF9wb2x5ZmlsbC8x
LjcwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0ZXJ0b29scy8wLjE0LjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2l0b2EvMS4wLjE3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZm
LzAuMi4yOCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1zdGF0aWMvMC4yLjI4IFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4yOSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
amlmZi1zdGF0aWMvMC4yLjI5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXR6ZGIvMC4x
LjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtdHpkYi1wbGF0Zm9ybS8wLjEuMyBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vam9ic2VydmVyLzAuMS4zNCBcCkBAIC0xMTIsNiArMTE1LDcg
QEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGViMTI4Zm10LzAuMS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9saWJjLzAuMi4xODYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LXJh
dy1zeXMvMC40LjE1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saW51eC1yYXctc3lzLzAuMTIu
MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGl0ZW1hcC8wLjguMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbG9ja19hcGkvMC40LjE0IFwKQEAgLTExOSw3ICsxMjMsNyBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtc3lzLzAuMS4yMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbWFpbHBhcnNlLzAuMTYuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWF0
Y2hlcnMvMC4yLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbWNoci8yLjguMSBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuOC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9t
aW5pel9veGlkZS8wLjguOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWlvLzEuMi4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9tdW5nZS8wLjQuNyBcCkBAIC0xNDYsNiArMTUwLDggQEAgU1JD
X1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMtdXRpbC8w
LjIuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG90ZW50aWFsX3V0Zi8wLjEuNCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHJldHR5cGxlYXNlLzAuMi4zNyBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHJvYy1tYWNyby1lcnJvci1hdHRyMi8yLjAuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHJvYy1tYWNyby1lcnJvcjIvMi4wLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2Mt
bWFjcm8yLzEuMC4xMDYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B0cl9tZXRhLzAuMy4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9wdHJfbWV0YV9kZXJpdmUvMC4zLjEgXApAQCAtMTU2LDE0
ICsxNjIsMTUgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWRveF9z
eXNjYWxsLzAuNS4xNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmLWNhc3QvMS4wLjI1IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWYtY2FzdC1pbXBsLzEuMC4yNSBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcmVmbGluay1jb3B5LzAuMS4yOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cmVnZXgvMS4xMi4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWZsaW5rLWNvcHkvMC4xLjMw
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC8xLjEyLjQgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3JlZ2V4LWF1dG9tYXRhLzAuNC4xNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVn
ZXgtc3ludGF4LzAuOC4xMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgtc3ludGF4LzAu
OC4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVuZC8wLjUuMyBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmt5di8wLjguMTYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZfZGVyaXZl
LzAuOC4xNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGMtaGFzaC8yLjEuMiBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4LzAuMzguNDQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3J1c3RpeC8xLjEuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdHZlcnNpb24vMS4wLjIy
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yeXUvMS4wLjIzIFwKQEAgLTE4OSwxMiArMTk2LDEz
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZHV0ZjgvMC4xLjUg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpbWlsYXIvMi43LjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NsYWIvMC40LjEyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE1
LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTUuMiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc21hd2svMC4zLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgvMC4x
My40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFibGVfZGVyZWZfdHJhaXQvMS4yLjEgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0cmlwLWFuc2ktZXNjYXBlcy8wLjIuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc3Ryc2ltLzAuMTEuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3lu
LzIuMC4xMTcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTE4IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9zeW5zdHJ1Y3R1cmUvMC4xMy4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by90ZW1wLWVudi8wLjMuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVtcGZpbGUvMy4yNy4w
IFwKQEAgLTIzMyw5ICsyNDEsMTAgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby91cmwvMi41LjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V0ZjhfaXRlci8xLjAuNCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOHBhcnNlLzAuMi4yIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby91dWlkLzEuMjMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8xLjIzLjMg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZhbHVhYmxlLzAuMS4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby92ZXJzaW9uX2NoZWNrLzAuOS41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby92dGUv
MC4xNC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWxrZGlyLzIuNS4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby93YXNpLzAuMTEuMSt3YXNpLXNuYXBzaG90LXByZXZpZXcxIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93YXNpLzAuMTQuNyt3YXNpLTAuMi40IFwKQEAgLTMwNiwyMiArMzE1
LDIzIEBAIFNSQ19VUklbYW5zdHlsZS1xdWVyeS0xLjEuNS5zaGEyNTZzdW1dID0gIjQwYzQ4Zjcy
ZmQ1M2NkMjg5MTA0ZmM2NDA5OWFiY2E3M2RiNDE2CiBTUkNfVVJJW2Fuc3R5bGUtd2luY29uLTMu
MC4xMS5zaGEyNTZzdW1dID0gIjI5MWU2YTI1MGZmODZjZDRhODIwMTEyZmI4ODk4ODA4YTM2NmQ4
ZjlmNThjZTE2ZDFmNTM4MzUzYWQ1NTc0N2QiCiBTUkNfVVJJW2FueWhvdy0xLjAuMTAyLnNoYTI1
NnN1bV0gPSAiN2YyMDJkZjg2NDg0Yzg2OGRiYWQ3ZWFhNTU3ZWY3ODVkNWM2NjI5NWU0MWI0NjBl
ZjkyMmVjYTA3MjNiODQyYyIKIFNSQ19VUklbYXJjc3RyLTEuMi4wLnNoYTI1NnN1bV0gPSAiMDM5
MThjM2RiZDc3MDFhODVjNmI5ODg3NzMyZTI5MjExNzVmMjZjMzUwYjQ1NjM4NDFkMDk1OGMyMWQ1
N2U2ZCIKLVNSQ19VUklbYXJyYXl2ZWMtMC43LjYuc2hhMjU2c3VtXSA9ICI3YzAyZDEyM2RmMDE3
ZWZjZGZiZDczOWVmODE3MzViMzZjNWJhODNlYzNjNTljODBhOWQ3ZWNjNzE4ZjkyZTUwIgotU1JD
X1VSSVthc3RyYWwtdG9raW8tdGFyLTAuNi4yLnNoYTI1NnN1bV0gPSAiY2I1MGE3YWFlODRhMDNi
ZjU1YjA2NzgzMmJjMzc2ZjQ5NjFiNzkwYzk3ZTY0ZDNlYWNlZTk3ZDM4OWI5MDI3NyIKLVNSQ19V
UklbYXN0cmFsLXZlcnNpb24tcmFuZ2VzLTAuMS40LnNoYTI1NnN1bV0gPSAiMzE5NzliYzMwNTYx
MDI0NmQ3OGFjMDFkNjM0NjdhMTJkODQ1NGM2ZTNiOGIyMmI1ODExZDM0M2ExMTk4ZGZiYiIKK1NS
Q19VUklbYXJyYXl2ZWMtMC43Ljcuc2hhMjU2c3VtXSA9ICJmMDI4ODI4ODRkM2UxYmM1MjRmYjEy
Yzc5ZjEwN2Y2YWQwZTFjZmQ0OThjNTM2ZmZiNDk0MzAxNzQwOTk1ZGZlIgorU1JDX1VSSVthc3Ry
YWwtdG9raW8tdGFyLTAuNi4zLnNoYTI1NnN1bV0gPSAiMDg2NDhmZWYzNTNhYjM5YTlkMjZmOTA5
YWQ1M2ZjNGYwNzFiZTRjOTE4NTNiNzg1MjNmNWNjM2Q5ZTVlYmZmZCIKK1NSQ19VUklbYXN0cmFs
LXZlcnNpb24tcmFuZ2VzLTAuMi4wLnNoYTI1NnN1bV0gPSAiMDg2ZjkzNmVmZGVmYWIxMTdmNWE3
MjM2N2ZiM2Q2OGM0ZmRlZDhiYTVhNzAwOGUzYzYzMzY1ZWVjZjcyMzgyMiIKIFNSQ19VUklbYXN0
cmFsX2FzeW5jX3ppcC0wLjAuMTguc2hhMjU2c3VtXSA9ICJjMTVmYzViNTkxZjE5ZGZiYmJjZTcz
NjYxNTkwOGQ3NGYxZDkyNTJiYjM0YjIzMTg3M2NiOTk1ZjJhOTk3ZmZiIgogU1JDX1VSSVthc3lu
Yy1jb21wcmVzc2lvbi0wLjQuMTkuc2hhMjU2c3VtXSA9ICIwNjU3NWU2YTk2NzM1ODBmNTI2NjFj
OTIxMDdiYWFiZmZiZjQxZTIxNDEzNzM0NDFjYmNkYzQ3Y2I3MzMwMDNjIgogU1JDX1VSSVthdXRv
Y2ZnLTEuNS4wLnNoYTI1NnN1bV0gPSAiYzA4NjA2ZjhjM2NiZjRjZTZlYzhlMjhmYjAwMTRhMmMw
ODY3MDhmZTk1NGVhYTg4NTM4NGE2MTY1MTcyZTdlOCIKIFNSQ19VUklbYmFja29uLTEuNi4wLnNo
YTI1NnN1bV0gPSAiY2ZmYjBlOTMxODc1YjY2NmZjNGZjYjIwZmVlNTJlOWJiZDFlZjgzNmZkOWU5
ZTA0ZWMyMTU1NWY5Zjg1ZjdlZiIKIFNSQ19VUklbYmFzZTY0LTAuMjIuMS5zaGEyNTZzdW1dID0g
IjcyYjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5OWY4YzY1MDhmYmVjYjlkOTFmNTc1
ZTBmYmI4YzYiCi1TUkNfVVJJW2JpdGZsYWdzLTIuMTEuMS5zaGEyNTZzdW1dID0gImM0NTEyMjk5
ZjM2ZjA0M2FiMDlhNTgzZTU3YmNlYjVhNWFhYjdhNzNkYjE4MDU4NDhlOGZlZjNjOWU4Yzc4YjMi
CitTUkNfVVJJW2JpdGZsYWdzLTEuMy4yLnNoYTI1NnN1bV0gPSAiYmVmMzhkNDUxNjNjMmYxZGRl
MDk0YTdkZmQzM2NjZjU5NWM5MjkwNWM4ZjhmNGZkYzE4ZDA2ZmIxMDM3NzE4YSIKK1NSQ19VUklb
Yml0ZmxhZ3MtMi4xMy4wLnNoYTI1NnN1bV0gPSAiYjQzODhiZWU4NjgzZTNkMDRhZjc0N2M3MzQy
MmFmNTMxMDJkMmJkMjRkOWVhZGI2Y2JjMTAwYmFlZjRiNDNmOCIKIFNSQ19VUklbYmxvY2stYnVm
ZmVyLTAuMTAuNC5zaGEyNTZzdW1dID0gIjMwNzhjNzYyOWI2MmQzZjA0Mzk1MTdmYTM5NDk5NmFj
YWNjNWNiYzkxYzVhMjBkOGM2NThlNzdhYmQ1MDNhNzEiCiBTUkNfVVJJW2JveGNhci0wLjIuMTQu
c2hhMjU2c3VtXSA9ICIzNmY2NGJlYWU0MGE4NGRhMWI0YjI2ZmYyNzYxYTViODk1YzEyYWRjNDFk
YzI1YWFlZTFjNGYyYmJmZTk3YTZlIgogU1JDX1VSSVtic3RyLTEuMTIuMS5zaGEyNTZzdW1dID0g
IjYzMDQ0ZTFhZThlNjlmM2I1YTkyYzczNmNhNjI2OWI4ZDEyZmE3ZWZlMzliZjM0ZGRiMDZkMTAy
Y2YwZTJjYWIiCiBTUkNfVVJJW2J1bXBhbG8tMy4yMC4yLnNoYTI1NnN1bV0gPSAiNWQyMDc4OTg2
OGY0YjAxYjJmMmNhZWM5ZjVjNGUwMjEzYjQxZTNlNTcwMmE1MDE1N2Q2OTlhZTMxY2VkMmZjYiIK
IFNSQ19VUklbYnl0ZWNoZWNrLTAuOC4yLnNoYTI1NnN1bV0gPSAiMGNhYTMzYTJjMGVkY2EwNDE5
ZDE1YWM3MjNkZmYwM2YxOTU2Zjc5NzgzMjliMWUzYjVmZGFhYWVkOWQzY2E4YiIKIFNSQ19VUklb
Ynl0ZWNoZWNrX2Rlcml2ZS0wLjguMi5zaGEyNTZzdW1dID0gIjg5Mzg1ZTgyYjVkMTgyMWQyMjE5
ZTBiMDk1ZWZhMmNjMWYyNDZjYmY5OTA4MGYzYmU0NmExYTg1YzBkMzkyZDkiCi1TUkNfVVJJW2J5
dGVzLTEuMTEuMS5zaGEyNTZzdW1dID0gIjFlNzQ4NzMzYjdjYmM3OThlMTQzNGI2YWM1MjRmMGMx
ZmYyYWI0NTZmZTIwMTUwMWU2NDk3Yzg0MTdhNGZjMzMiCitTUkNfVVJJW2J5dGVzLTEuMTIuMC5z
aGEyNTZzdW1dID0gIjhhZTNmNWQzMTU5MjQyNzA1MzAyMDdlMmE2ODM5NmMzY2M1NDdmNmRjYTNm
YmRjYTMxN2NmYjFhNTFlZGI1OTMiCiBTUkNfVVJJW2J6aXAyLTAuNS4yLnNoYTI1NnN1bV0gPSAi
NDllY2ZiMjJkOTA2ZjgwMGQ0ZmU4MzNiNjI4MmNmNGRjMWMyOThmNTA1N2NhMGI1NDQ1ZTVjMjA5
NzM1Y2E0NyIKIFNSQ19VUklbYnppcDItc3lzLTAuMS4xMysxLjAuOC5zaGEyNTZzdW1dID0gIjIy
NWJmZjMzYjIxNDE4NzRmZTgwZDcxZTA3ZDZlZWM0Zjg1YzVjMjE2NDUzZGQ5NjM4ODI0MGY5NmUx
YWNjMTQiCiBTUkNfVVJJW2NjLTEuMi41Ny5zaGEyNTZzdW1dID0gIjdhMGRkMWNhMzg0OTMyZmYz
NjQxYzg3MThhMDI3NjlmMTY5OGU3NTYzZGM2OTc0ZmZkMDMzNDYxMTYzMTA0MjMiCkBAIC0zMzks
NiArMzQ5LDkgQEAgU1JDX1VSSVtjcnlwdG8tY29tbW9uLTAuMS43LnNoYTI1NnN1bV0gPSAiNzhj
ODI5MjA1NWQxYzFkZjBjY2U1ZDE4MDM5M2RjOGNjZTBhYmUKIFNSQ19VUklbY3N2LTEuNC4wLnNo
YTI1NnN1bV0gPSAiNTJjZDlkNjhjZjdlZmM2ZGRmYWFlZTQyZTcyODhkM2E5OWQ2MTNkNGI1MGY3
NmNlOTgyN2FlMGM2ZTE0ZjkzOCIKIFNSQ19VUklbY3N2LWNvcmUtMC4xLjEzLnNoYTI1NnN1bV0g
PSAiNzA0YTNjMjY5OTZhODA0NzExODkyNjU4MTRkYmMyYzI1NzU5OGI5NmI4YTdmZWFlMmQzMWFj
ZTY0NmJiOTc4MiIKIFNSQ19VUklbZGF0YS1lbmNvZGluZy0yLjExLjAuc2hhMjU2c3VtXSA9ICJh
NGFlNWYxNWRkYTNjNzA4YzBhZGU4NGJmZWUzMWNjYWI0NGEzZGE0Zjg4MDE1ZWQyMmY2MzczMmFi
ZTMwMGM4IgorU1JDX1VSSVtkZWZtdC0xLjEuMC5zaGEyNTZzdW1dID0gImE2ZTUyNDUwNjQ5MGEx
OTUzZDIzN2NiODdiMWNmYzFlNDZmODhjMThmMTBhMjJkZmUwZjUwN2RjNmJmYzdmN2YiCitTUkNf
VVJJW2RlZm10LW1hY3Jvcy0xLjEuMC5zaGEyNTZzdW1dID0gImYwYTI3NzcwZTljOGY3MTlhNzlk
OGI2MzgyODFmNGQ4MjhmNzdkOGZkNjFlMGJkOTQ0NTFiOWI4NWU1NzZhMGIiCitTUkNfVVJJW2Rl
Zm10LXBhcnNlci0xLjAuMC5zaGEyNTZzdW1dID0gIjEwZDYwMzM0YjNiMmU3YzlkOTFlZjgxNTBh
YmZiNmZhNGMxYzM5ZWJiY2Y0YTgxYzJlMzQ2YWFkOTM5ZmVlM2UiCiBTUkNfVVJJW2RpZ2VzdC0w
LjEwLjcuc2hhMjU2c3VtXSA9ICI5ZWQ5YTI4MWY3YmM5Yjc1NzZlNjE0NjhiYTYxNWE2NmE1Yzhj
ZmRmZjQyNDIwYTcwYWE4MjcwMWEzYjFlMjkyIgogU1JDX1VSSVtkaXNwbGF5ZG9jLTAuMi41LnNo
YTI1NnN1bV0gPSAiOTczNjljYmJjMDQxYmMzNjY5NDliYzc0ZDM0NjU4ZDZjZGE1NjIxMDM5NzMx
YzYzMTA1MjE4OTJhM2EyMGFlMCIKIFNSQ19VUklbZHVuY2UtMS4wLjUuc2hhMjU2c3VtXSA9ICI5
Mjc3MzUwNGQ1OGMwOTNmNmRlMjQ1OWFmNGFmMzNmYWE1MThjMTM0NTFlYjhmMmI1Njk4ZWQzZDM2
ZTdjODEzIgpAQCAtMzUzLDcgKzM2Niw2IEBAIFNSQ19VUklbZXF1aXZhbGVudC0xLjAuMi5zaGEy
NTZzdW1dID0gIjg3N2E0YWNlODcxM2IwYmNmMmE0ZTdlZWM4MjUyOWMwMjlmMWQwNjE5CiBTUkNf
VVJJW2VyYXNlZC1zZXJkZS0wLjQuMTAuc2hhMjU2c3VtXSA9ICJkMmFkZDhhMDdkZDZhOGQ5M2Zm
NjI3MDI5YzUxZGUxNDVlMTI2ODZmYmMzNmVjYjI5OGFjMjJlNzRjZjAyZGVjIgogU1JDX1VSSVtl
cnJuby0wLjMuMTQuc2hhMjU2c3VtXSA9ICIzOWNhYjcxNjE3YWUwZDYzZjUxYTM2ZDY5Zjg2NjM5
MTczNWI1MTY5MWRiZGE2M2NmNmY5NmQwNDJiNjNlZmViIgogU1JDX1VSSVtmYXN0cmFuZC0yLjQu
MS5zaGEyNTZzdW1dID0gIjlmMWYyMjc0NTJhMzkwODA0Y2RiNjM3Yjc0YTg2OTkwZjJhN2Q3YmE0
YjdkNTY5M2FhYzliNGRkNmRlZmQ4ZDYiCi1TUkNfVVJJW2ZpbGV0aW1lLTAuMi4yOS5zaGEyNTZz
dW1dID0gIjVjMjg3YTMzYzdmMGE2MjBjMzhlNjQxZTdmNjA4Mjc3MTM5ODdiM2MwZjI2ZThkZGM5
NDYyY2M2OWNmNzU3NTkiCiBTUkNfVVJJW2ZpbmQtbXN2Yy10b29scy0wLjEuOS5zaGEyNTZzdW1d
ID0gIjViYWViYzA3NzQxNTFmOTA1YTFhMmNjNDE5ODkzMDBiMWU2ZmJiMjlhZmYwY2VmZmExMDY0
ZmRkMzA4OGQ1ODIiCiBTUkNfVVJJW2ZpeGVkYml0c2V0LTAuNS43LnNoYTI1NnN1bV0gPSAiMWQ2
NzRlODEzOTFkMWUxYWI2ODFhMjhkOTlkZjA3OTI3YzZkNGFhNWIwMjdkN2RhMTZiYTMyZDFkMjFl
Y2Q5OSIKIFNSQ19VUklbZmxhdGUyLTEuMS45LnNoYTI1NnN1bV0gPSAiODQzZmJhMjc0NmU0NDhi
MzdlMjZhODE5NTc5OTU3NDE1YzhjZWYzMzliZjA4NTY0ZmU4YjdkZGJkOTU5NTczYyIKQEAgLTM5
MiwxMiArNDA0LDEyIEBAIFNSQ19VUklbaWRuYS0xLjEuMC5zaGEyNTZzdW1dID0gIjNiMDg3NWYy
M2NhYTAzODk4OTk0ZjZkZGM1MDE4ODZhNDVjN2QzZDYyZDA0ZDJkCiBTUkNfVVJJW2lkbmFfYWRh
cHRlci0xLjIuMS5zaGEyNTZzdW1dID0gIjNhY2FlOTYwOTU0MGFhMzE4ZDFiYzU4ODQ1NTIyNWZi
MjA4NWI5ZWQwYzRmNmJkMGQ5ZDViY2Q4NmYxYTAzNDQiCiBTUkNfVVJJW2luZGV4bWFwLTIuMTQu
MC5zaGEyNTZzdW1dID0gImQ0NjZlOTQ1NGYwOGU0YTkxMWUxNDgwNmMyNGUxNmZiYTFiNGMxMjFk
MWVhNDc0Mzk2ZjM5NjA2OWNmOTQ5ZDkiCiBTUkNfVVJJW2luZG9jLTIuMC43LnNoYTI1NnN1bV0g
PSAiNzljZjVjOTNmOTMyMjhjZjhlZmIzYmEzNjI1MzVmYjExMTk5YWM1NDhhMDljZTExN2M5YjFh
ZGMzMDMwZDcwNiIKLVNSQ19VUklbaW5zdGEtMS40Ny4yLnNoYTI1NnN1bV0gPSAiN2I0YTYyNDhl
YjkzYTQ0MDFlZDJmMzdkZmU4ZWE1OTJkM2NmMDViN2NmNGY4ZWZhODY3YjY4OTVhZjdlMDk0ZSIK
K1NSQ19VUklbaW5zdGEtMS40OC4wLnNoYTI1NnN1bV0gPSAiODZmMGY4ZmVlOGM5MjY0MTVjNThk
NmFlNDNhMDg1MjNhMjZmYWNjYjIzMjNmNWU2YjY0NGZlN2RkNGVmNmI4MiIKIFNSQ19VUklbaXNf
dGVybWluYWxfcG9seWZpbGwtMS43MC4yLnNoYTI1NnN1bV0gPSAiYTZjYjEzOGJiNzlhMTQ2YzFi
ZDQ2MDAwNTYyM2UxNDJlZjAxODFlM2QwMjE5Y2I0OTNlMDJmN2QwOGEzNTY5NSIKIFNSQ19VUklb
aXRlcnRvb2xzLTAuMTQuMC5zaGEyNTZzdW1dID0gIjJiMTkyYzc4MjAzN2ZhZGQ5Y2ZhNzU1NDgz
MTA0ODhhYWJkYmYzZDJkYTczODg1YjMxYmQwYWJkMDMzNTEyODUiCiBTUkNfVVJJW2l0b2EtMS4w
LjE3LnNoYTI1NnN1bV0gPSAiOTJlY2M2NjE4MTgxZGVmMDQ1NzM5MmNjZDBlZTUxMTk4ZTA2NWUw
MTZkMWQ1MjdhN2FjMWI2ZGM3YzFmMDlkMiIKLVNSQ19VUklbamlmZi0wLjIuMjguc2hhMjU2c3Vt
XSA9ICI0NjAzZDMwMzNlNDllMmIwZTMxMjI5ZmNhYjIwYTVkNDAwODljNjA3ZDk3NWNkOWM4MDU1
MWRjNjllZWQ5MTAyIgotU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIuMjguc2hhMjU2c3VtXSA9ICI3
ODJkMzIzNzhkZGRmMjA3MTkzYWM5MWNlZmI4NDhhZDQxYWJiNTgxOTVjOTUxNjhlMTI5MTIyN2Ew
ODMyYjQ3IgorU1JDX1VSSVtqaWZmLTAuMi4yOS5zaGEyNTZzdW1dID0gIjM0Zjg3N2E5ODY3NmQy
ZmI2NjQ2OThkNzRjYzZhNTFjZTZjNDg0Y2U4Yzc3MGYwNWQwMTA4ZWM5MDkwYWViNDYiCitTUkNf
VVJJW2ppZmYtc3RhdGljLTAuMi4yOS5zaGEyNTZzdW1dID0gIjA2NjZiNWFiNWVjYWNhMjEzZmMy
YTg1YjhjMDA4M2Q5MDA0ZTg0ZWUyZDVmOWE3ZTAwMTdhYWY1MDk4NmYyNWYiCiBTUkNfVVJJW2pp
ZmYtdHpkYi0wLjEuNi5zaGEyNTZzdW1dID0gImM5MDBlZjg0ODI2ZjEzMzhhNTU3Njk3ZGM4ZmM2
MDFkZjljYTlhZjRhYzEzN2M3ZmI2MWQ0YzZmMmRmZDMwNzYiCiBTUkNfVVJJW2ppZmYtdHpkYi1w
bGF0Zm9ybS0wLjEuMy5zaGEyNTZzdW1dID0gIjg3NWE1YTY5YWMyYmFiMWE4OTE3MTFjZjVlY2Ni
ZWMxY2UwMzQxZWE4MDU1NjBkY2Q5MGI3YTJlOTI1MTMyZTgiCiBTUkNfVVJJW2pvYnNlcnZlci0w
LjEuMzQuc2hhMjU2c3VtXSA9ICI5YWZiM2RlNDM5NWQ2YjNlNjdhNzgwYjZkZTY0YjUxYzk3OGVj
ZjExY2I5YTQ2MmM2NmJlN2Q0Y2E5MDM5ZDMzIgpAQCAtNDA2LDYgKzQxOCw3IEBAIFNSQ19VUklb
anVuY3Rpb24tMi4wLjAuc2hhMjU2c3VtXSA9ICIxNjBmMmVhZGUwOTdmMzAyNjNiNTQ4YWFlNWRl
YjEyYWQzNDljOTA5YmFhCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4wLnNoYTI1NnN1bV0gPSAi
YmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2ODVlMWYyOTgwNjgz
MTZlNjZmZSIKIFNSQ19VUklbbGViMTI4Zm10LTAuMS4wLnNoYTI1NnN1bV0gPSAiMDllZGQ5ZThi
NTRlNDllNTg3ZTRmNjI5NWE3ZDI5YzNlYTk0ZDQ2OWNiNDBhYjhjYTcwYjI4ODI0OGE4MWRiMiIK
IFNSQ19VUklbbGliYy0wLjIuMTg2LnNoYTI1NnN1bV0gPSAiNjhhYjkxMDE3ZmUxNmM2MjI0ODY4
NDBlNGM4M2M5YTM3YWZlZmY5NzhiZDIzOWI1MjkzZDYxZWNlNTg3ZGU2NiIKK1NSQ19VUklbbGlu
dXgtcmF3LXN5cy0wLjQuMTUuc2hhMjU2c3VtXSA9ICJkMjZjNTJkYmQzMmRjY2YyZDEwY2FjNzcy
NWY4ZWFlNTI5Njg4NWZiNTcwM2IyNjFmN2QwYTA3MzllYzgwN2FiIgogU1JDX1VSSVtsaW51eC1y
YXctc3lzLTAuMTIuMS5zaGEyNTZzdW1dID0gIjMyYTY2OTQ5ZTAzMGRhMDBlOGM3ZDQ0MzRiMjUx
NjcwYTkxNTU2ZjQxNDQ5NDFkMzc0NTI3NjljMjVkNThhNTMiCiBTUkNfVVJJW2xpdGVtYXAtMC44
LjEuc2hhMjU2c3VtXSA9ICI2MzczNjA3YTU5ZjBiZTczYTM5YjZmZTQ1NmI4MTkyZmNjMzU4NWY2
MDJhZjIwNzUxNjAwZTk3NGRkNDU1ZTc3IgogU1JDX1VSSVtsb2NrX2FwaS0wLjQuMTQuc2hhMjU2
c3VtXSA9ICIyMjQzOTllNzRiODdiNWYzNTU3NTExZDk4ZGZmOGIxNDA4OWIzZGFkYWZjYWI2YmI5
M2VhYjY3ZDNhYWNlOTY1IgpAQCAtNDEzLDcgKzQyNiw3IEBAIFNSQ19VUklbbG9nLTAuNC4yOS5z
aGEyNTZzdW1dID0gIjVlNTAzMmUyNDAxOTA0NWM3NjJkM2MwZjI4ZjViNmI4YmJmMzg1NjNhNjU5
MDgzCiBTUkNfVVJJW2x6bWEtc3lzLTAuMS4yMC5zaGEyNTZzdW1dID0gIjVmZGEwNGFiMzc2NGU2
Y2RlNzhiOTk3NGVlYzRmNzc5YWNhYmE3YzRlODRiMzZlY2EzY2Y3N2M1ODFiODVkMjciCiBTUkNf
VVJJW21haWxwYXJzZS0wLjE2LjEuc2hhMjU2c3VtXSA9ICI2MDgxOWE5N2RkY2I4MzFhNTYxNGVi
M2IwMTc0ZjM2MjBlNzkzZTk3ZTA5MTk1YTM5NWJmYTk0OGZkNjhlZDJmIgogU1JDX1VSSVttYXRj
aGVycy0wLjIuMC5zaGEyNTZzdW1dID0gImQxNTI1YTJhMjhjN2Y0ZmEwZmM5OGJiOTFhZTc1NWQx
ZTJkMTUwNTA3OWUwNTUzOWUzNWJjODc2YjVkNjVhZTkiCi1TUkNfVVJJW21lbWNoci0yLjguMS5z
aGEyNTZzdW1dID0gIjZiOTQ3YWU0OWRiMGQyMjJiMWRiYzZiMTEzY2U3MjQ4YTNmYzNhNmNhMjFi
Njk2NzE3YmZjMDAwYmE0NDg0ZDgiCitTUkNfVVJJW21lbWNoci0yLjguMi5zaGEyNTZzdW1dID0g
Ijg4OTA0NDM0YWJjMjkwMWYxOTdmZThjYzU1ZjA0NDVlN2RlZDkyMWRiYTU5MTFkYWQyZTJiMzli
NDhlNjYzYzQiCiBTUkNfVVJJW21pbml6X294aWRlLTAuOC45LnNoYTI1NnN1bV0gPSAiMWZhNzZh
MmM4NmY3MDRiZGIyMjJkNjY5NjVmYjNkNjMyNjljZTM4NTE4YjgzY2IwNTc1ZmNhODU1ZWJiNjMx
NiIKIFNSQ19VUklbbWlvLTEuMi4wLnNoYTI1NnN1bV0gPSAiNTBiN2U1YjI3YWEwMmE3NGJhYzhj
M2YyM2Y0NDhmOGQ4N2ZmMTFmOTJkM2FhYzFhNmVkMzY5ZWUwOGNjNTZjMSIKIFNSQ19VUklbbXVu
Z2UtMC40Ljcuc2hhMjU2c3VtXSA9ICI1ZTE3NDAxZjI1OWViYTk1NmNhMTY0OTE0NjFiNmU4Zjcy
OTEzYTBhMTE0ZTM5NzM2Y2U0MDQ0MTBmOTE1YTBjIgpAQCAtNDQwLDYgKzQ1Myw4IEBAIFNSQ19V
UklbcG9ydGFibGUtYXRvbWljLTEuMTMuMS5zaGEyNTZzdW1dID0gImMzM2E5NDcxODk2ZjFjNjlj
ZWNlZjhkMjBjYmUyZjdhY2NkCiBTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy11dGlsLTAuMi42LnNo
YTI1NnN1bV0gPSAiMDkxMzk3YmU2MWEwMWQ0YmU1OGU3ODQxNTk1YmQ0YmZlZGIxNWYxY2Q1NDk3
N2Q3OWI4MjcxZTk0ZWQ3OTlhMyIKIFNSQ19VUklbcG90ZW50aWFsX3V0Zi0wLjEuNC5zaGEyNTZz
dW1dID0gImI3Mzk0OTQzMmY1ZTJhMDk2NTcwMDNjMjViY2E1ZTE5YTBlOWM4NGY4MDU4Y2EzNzRm
NDllMGViZTYwNWFmNzciCiBTUkNfVVJJW3ByZXR0eXBsZWFzZS0wLjIuMzcuc2hhMjU2c3VtXSA9
ICI0NzljYThhZGFjZGQ3Y2U4ZjFmYjM5Y2U5ZWNjY2JmZTkzYTNmMTM0NGIzZDBkOTdmMjBiYzAx
OTYyMDhmNjJiIgorU1JDX1VSSVtwcm9jLW1hY3JvLWVycm9yLWF0dHIyLTIuMC4wLnNoYTI1NnN1
bV0gPSAiOTZkZTQyZGYzNmJiOWJiYTU1NDJmZTlmMWEwNTRiOGNjODdlMTcyNzU5YTE4NjhhYTA1
YzFmM2FjYzg5ZGZjNSIKK1NSQ19VUklbcHJvYy1tYWNyby1lcnJvcjItMi4wLjEuc2hhMjU2c3Vt
XSA9ICIxMWVjMDVjNTJiZTBhMDdiMDgwNjFmN2RkMDAzZTdkNzA5MmUwNDcyYmM3MzFiNGFmN2Ji
MWVmODc2MTA5ODAyIgogU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuMTA2LnNoYTI1NnN1bV0gPSAi
OGZkMDBmMGJiMmU5MGQ4MWQxMDQ0YzJiMzI2MTdmNjhmY2I5ZmEzYmI3NjQwYzIzZTljNzQ4ZTUz
ZmIzMDkzNCIKIFNSQ19VUklbcHRyX21ldGEtMC4zLjEuc2hhMjU2c3VtXSA9ICIwYjlhMGNmOTVh
MTE5NmFmNjFkNGYxY2JkYWI5NjcxNzk1MTZkOWE0YTQzMTJhZjFmMzE5NDhmOGY2MjI0YTc5Igog
U1JDX1VSSVtwdHJfbWV0YV9kZXJpdmUtMC4zLjEuc2hhMjU2c3VtXSA9ICI3MzQ3ODY3ZDBhN2Ux
MjA4ZDkzYjQ2NzY3YmU4M2UyYjhmOTc4YzNkYWQzNWY3NzVhYzhkODg0NzU1MWQ2ZmUxIgpAQCAt
NDUwLDE0ICs0NjUsMTUgQEAgU1JDX1VSSVtyYW5jb3ItMC4xLjEuc2hhMjU2c3VtXSA9ICJhMDYz
ZWE3MjM4MTUyN2MyYTA1NjFkYTljODAwMDBlZjgyMmJkZDdjMzI0MWIKIFNSQ19VUklbcmVkb3hf
c3lzY2FsbC0wLjUuMTUuc2hhMjU2c3VtXSA9ICI3ZThhZjBkZGUwOTQwMDYwMTFlNmE3NDBkNDg3
OTMxOTQzOTQ4OTgxM2JkMGJjZGM3ZDgyMWJlYWVlZmY0OGVjIgogU1JDX1VSSVtyZWYtY2FzdC0x
LjAuMjUuc2hhMjU2c3VtXSA9ICJmMzU0MzAwYWU2NmY3NmYxYzg1YzVmODQ2OTNmMGNlODFkNzQ3
ZTJjM2YyMWE0NWZlZjQ5NmQ4OWM5NjBiZjdkIgogU1JDX1VSSVtyZWYtY2FzdC1pbXBsLTEuMC4y
NS5zaGEyNTZzdW1dID0gImI3MTg2MDA2ZGNiMjE5MjA5OTAwOTNmMzBlM2RlYTYzYjdkNmU5Nzdi
ZjEyNTZiZTIwYzM1NjNhNWRiMDcwZGEiCi1TUkNfVVJJW3JlZmxpbmstY29weS0wLjEuMjkuc2hh
MjU2c3VtXSA9ICIxMzM2MjIzM2IxNDdlNTc2NzRjMzdiODAyZDIxNmI3YzVlM2RjY2NiZWQ4OTY3
Yzg0ZjBkOGQyMjM4NjhhZTI3IgotU1JDX1VSSVtyZWdleC0xLjEyLjMuc2hhMjU2c3VtXSA9ICJl
MTA3NTRhMTRiOTEzN2RkN2IxZTNlNWIwNDkzY2M5MTcxZmRkMTA1ZTBhYjQ3N2Y1MWI3MmU3ZjNh
YzBlMjc2IgorU1JDX1VSSVtyZWZsaW5rLWNvcHktMC4xLjMwLnNoYTI1NnN1bV0gPSAiZDlkZDdh
YjRhZjAzNjNkNWNjZmQyODM4ZDc4MmEyODE5NmNmMzJhNWNjMmU0ZmUzYzVkYzgzZjJiZTU4OGI4
YiIKK1NSQ19VUklbcmVnZXgtMS4xMi40LnNoYTI1NnN1bV0gPSAiZjEyOTJiNzc1OWFlMWNiOWVj
MTk1NDUyZDEzOTBhMDc0ZjBjZDg1NDFhYjdhNWE4YzMxY2Q2ZGI0NWQ0YTZiYSIKIFNSQ19VUklb
cmVnZXgtYXV0b21hdGEtMC40LjE0LnNoYTI1NnN1bV0gPSAiNmUxZGQ0MTIyZmMxNTk1ZTgxNjI2
MTg5NDU0NzY4OTJlZWZjYTdiODhjNTI4MjBlNzRhZjYyNjIyMTNjYWU4ZiIKLVNSQ19VUklbcmVn
ZXgtc3ludGF4LTAuOC4xMC5zaGEyNTZzdW1dID0gImRjODk3ZGQ4ZDllOGJkMWVkOGNkYWQ4MmI1
OTY2YzNlMGVjYWUwOWZiMTkwN2Q1OGVmYWEwMTM1NDMxODVkMGEiCitTUkNfVVJJW3JlZ2V4LXN5
bnRheC0wLjguMTEuc2hhMjU2c3VtXSA9ICJkNmY2ZmY5YTM3ODQ4NWIyOThhNTI4NjY1NmRhNjY1
YmE3NDQxM2QzNmRiMDk3OTYzMzI3NWQyZTcwODE0NWQ0IgogU1JDX1VSSVtyZW5kLTAuNS4zLnNo
YTI1NnN1bV0gPSAiY2FkYWRlZjMxN2MyZjIwNzU1YTY0ZDdmZGM0OGY5ZTcxNzhlZTZiMGUxZjdm
Y2UzM2ZhNjBmMWQ2OGEyNzZlNiIKIFNSQ19VUklbcmt5di0wLjguMTYuc2hhMjU2c3VtXSA9ICI3
MzM4OWUwYzk5ZTY2NGY5MTkyNzVhYjViNWIwNDcxMzkxZmU5YThkZTYxZTFkZmY5YjFlYWY1NmE5
MGYxNmUzIgogU1JDX1VSSVtya3l2X2Rlcml2ZS0wLjguMTYuc2hhMjU2c3VtXSA9ICI1ZDJlZDBi
NTQxMjUzMTVmYjM2YmQwMjFlODJkMzE0ZDFjMTI2NTQ4Zjg3MTYzNGI0ODNmNDZiMzFkMTNjYWM2
IgogU1JDX1VSSVtydXN0Yy1oYXNoLTIuMS4yLnNoYTI1NnN1bV0gPSAiOTQzMDBhYmYzZjFhZTJl
MmI4ZmZiN2I1ODA0M2RlM2QzOTljNzNmYTZmNGI3MzgyNjQwMmE1YzQ1NzYxNGRiZSIKK1NSQ19V
UklbcnVzdGl4LTAuMzguNDQuc2hhMjU2c3VtXSA9ICJmZGI1YmMxYWUyYmFhNTkxODAwZGYxNmM5
Y2E3ODYxOWJmNjVjMDQ4OGI0MWI5NmNjZWM1ZDExMjIwZDhjMTU0IgogU1JDX1VSSVtydXN0aXgt
MS4xLjQuc2hhMjU2c3VtXSA9ICJiNmZlNDU2NWI5NTE4YjgzZWY0ZjkxYmI0N2NlMjk2MjBjYTgy
OGJkMzJjYjdlNDA4ZjAwNjJlOTkzMGJhMTkwIgogU1JDX1VSSVtydXN0dmVyc2lvbi0xLjAuMjIu
c2hhMjU2c3VtXSA9ICJiMzljZGVmMGZhODAwZmM0NDUyNWM4NGNjYjU0YTAyOTk2MWE4MjE1Zjk2
MTk3NTM2MzVhOWMwZDI1MzhkNDZkIgogU1JDX1VSSVtyeXUtMS4wLjIzLnNoYTI1NnN1bV0gPSAi
OTc3NGJhNGE3NGRlNWY3YjFjMTQ1MWVkNmNkNTI4NWEzMmVkZGI1Y2NjYjhjYzY1NWE0ZTUwMDA5
ZTA2NDc3ZiIKQEAgLTQ4MywxMiArNDk5LDEzIEBAIFNSQ19VUklbc2ltZC1hZGxlcjMyLTAuMy44
LnNoYTI1NnN1bV0gPSAiZTMyMGE2YzVhZDMxZDI3MWFkNTIzZGNmM2FkMTNlMjc2N2FkOGIxCiBT
UkNfVVJJW3NpbWR1dGY4LTAuMS41LnNoYTI1NnN1bV0gPSAiZTNhOWZlMzRlM2U3YTUwMzE2MDYw
MzUxZjM3MTg3YTNmNTQ2YmNlOTU0OTYxNTY3NTRiNjAxYTVmYTcxYjc2ZSIKIFNSQ19VUklbc2lt
aWxhci0yLjcuMC5zaGEyNTZzdW1dID0gImJiYmI1ZDk2NTkxNDE2NDZhZTY0N2I0MmZlMDk0ZGFm
NmM2MTkyZDE2MjA4NzBiNDQ5ZDk1NTdmNzQ4YjJkYWEiCiBTUkNfVVJJW3NsYWItMC40LjEyLnNo
YTI1NnN1bV0gPSAiMGM3OTBkZTIzMTI0ZjlhYjQ0NTQ0ZDdhYzA1ZDYwNDQwYWRjNTg2NDc5Y2U1
MDFjMWQ2ZDdkYTNjZDhjOWNmNSIKLVNSQ19VUklbc21hbGx2ZWMtMS4xNS4xLnNoYTI1NnN1bV0g
PSAiNjdiMWI3YTNiNWZlNGYxMzc2ODg3MTg0MDQ1ZmNmNDVjNjllOTJhZjczNGI3YWFkZGMwNWZi
Nzc3YjZmYmQwMyIKK1NSQ19VUklbc21hbGx2ZWMtMS4xNS4yLnNoYTI1NnN1bV0gPSAiOGVkNmE2
M2YwMmM4NTM5YzkxYTg2ODVhODZmNDA5OTY2MWJhM2RhMDE3OTMyZjZlYmJlYTZkZTNmMGZhN2M5
MCIKIFNSQ19VUklbc21hd2stMC4zLjIuc2hhMjU2c3VtXSA9ICJiN2MzODhjMWI1ZTkzNzU2ZDBj
NzQwOTY1YzQxZTg4MjJmODY2NjIxZDQxYWNiZGY2MzM2YTZhMTY4Zjg4NDBjIgogU1JDX1VSSVtz
cGR4LTAuMTMuNC5zaGEyNTZzdW1dID0gImE4ZGE1OTNlMzBiZWI3OTBmYzk0MjQ1MDJlYjg5ODMy
MGI0NGU1ZWIzMDM2N2RiZGExYzFlZGRlOGUyZjMyZDciCiBTUkNfVVJJW3N0YWJsZV9kZXJlZl90
cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFmOTFkZjcxYmZhMTJhZDM3
ZDdhZjEwOTJhZTczNmYzYTZjZDBlMzdiYzc4MTA1OTYiCitTUkNfVVJJW3N0cmlwLWFuc2ktZXNj
YXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4ZTdlNzk2OWFiYjNmMWI3YzJhODExMjI1
ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUiCiBTUkNfVVJJW3N0cnNpbS0wLjExLjEu
c2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3ZWE1ZDllMjYyODU2NGIzYjA0M2E3
MDk0OGEzZjBiNzc4ODM4YzVmYjRmIgotU1JDX1VSSVtzeW4tMi4wLjExNy5zaGEyNTZzdW1dID0g
ImU2NjViODgwM2U3YjFkMmE3MjdmNDAyMzQ1NmJiYmJlNzRkYTY3MDk5YzU4NTI1OGFmMGFkOWM1
MDEzYjliOTkiCitTUkNfVVJJW3N5bi0yLjAuMTE4LnNoYTI1NnN1bV0gPSAiMWI5YWU1N2Y5MDQy
MTNlYmI2NDljZTY4OTViOGE2NmM2NmYwMjAzYjkzMTk3MThmNjlhNTYxMmEwNjViMTQyMiIKIFNS
Q19VUklbc3luc3RydWN0dXJlLTAuMTMuMi5zaGEyNTZzdW1dID0gIjcyOGE3MGYzZGJhZjViYWI3
ZjBjNGIxYWM4ZDdhZTVlYTYwYTRiNTU0OWM4YTU5MTQzNjFjOTkxNDdhNzA5ZDIiCiBTUkNfVVJJ
W3RlbXAtZW52LTAuMy42LnNoYTI1NnN1bV0gPSAiOTYzNzQ4NTUwNjhmNDc0MDJjMzEyMWM2ZWVk
ODhkMjljYjFkZThmM2FiMjcwOTBlMjczZTQyMGJkYWJjZjA1MCIKIFNSQ19VUklbdGVtcGZpbGUt
My4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0YzdiMzg1MzJlZmNkZWJlZWY4Nzk3MDdhYTlm
Nzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKQEAgLTUyNyw5ICs1NDQsMTAgQEAgU1JDX1VS
SVt1bnNjYW5ueS0wLjEuMC5zaGEyNTZzdW1dID0gImU5ZGYyYWYwNjdhNzk1M2U5YzM4MzEzMjBm
MzVjMWNjMDYwMGMzMGQ0NGQKIFNSQ19VUklbdXJsLTIuNS44LnNoYTI1NnN1bV0gPSAiZmY2N2E4
YTQzOTczNzNjM2VmNjYwODEyYWNhYjMyNjgyMjIwMzUwMTBhYjg2ODBlYzQyMTVmMzhiYTNkMGVl
ZCIKIFNSQ19VUklbdXRmOF9pdGVyLTEuMC40LnNoYTI1NnN1bV0gPSAiYjZjMTQwNjIwZTdmZmJi
MjJjMmRlZTU5Y2FmZTYwODRhNTliNWZmYzI3YTg4NTlhNWYwZDQ5NGI1ZDUyYjZiZSIKIFNSQ19V
UklbdXRmOHBhcnNlLTAuMi4yLnNoYTI1NnN1bV0gPSAiMDZhYmRlMzYxMTY1N2FkZjY2ZDM4M2Yw
MGIwOTNkN2ZhZWNjN2ZhNTcwNzFjY2UyNTc4NjYwYzlmMTAxMDgyMSIKLVNSQ19VUklbdXVpZC0x
LjIzLjIuc2hhMjU2c3VtXSA9ICJkMjU4YjgzY2VlYzIxMDM0NzI3ZWNlZThjMzgyY2ZhNmMzZTEz
MzY5OWIwNzQyYzY0NTcxODE0ZmI0MjBjOWY3IgorU1JDX1VSSVt1dWlkLTEuMjMuMy5zaGEyNTZz
dW1dID0gIjE0NGQ2YjEyM2NlZjgwYjMwMWI4ZjcyYTllMmNhNDM3MGRkZWMyMTk1MGQwYTEwM2Rk
MjJjNDM3MDA2ZDJkYjciCiBTUkNfVVJJW3ZhbHVhYmxlLTAuMS4xLnNoYTI1NnN1bV0gPSAiYmE3
M2VhOWNmMTZhMjVkZjBjOGNhYTE2YzUxYWNiOTM3ZDU3MTJhODQyOWRiNzhhM2VlMjlkNWRjYWNk
M2E2NSIKIFNSQ19VUklbdmVyc2lvbl9jaGVjay0wLjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMz
ZDk3NWZjNmFkOWY4NmM4ZjI4Mzg1M2FkMjZiZGQ1YjEwYjdmMTU0MmFhMmZhMTVlMjI4OTEwNWEi
CitTUkNfVVJJW3Z0ZS0wLjE0LjEuc2hhMjU2c3VtXSA9ICIyMzFmZGNkN2VmMzAzN2U4MzMwZDhl
MTdlNjEwMTFhMmMyNDQxMjZhY2MwYTk4MmY0MDQwYWMzZjlmMGJjMDc3IgogU1JDX1VSSVt3YWxr
ZGlyLTIuNS4wLnNoYTI1NnN1bV0gPSAiMjk3OTA5NDY0MDRmOTFkOWM1ZDA2Zjk4NzRlZmRkZWEx
ZGMwNmM1ZWZlOTQ1NDFhN2Q2ODYzMTA4ZTNhNWU0YiIKIFNSQ19VUklbd2FzaS0wLjExLjErd2Fz
aS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gImNjZjNlYzY1MWE4NDdlYjAxZGU3M2Nj
YWQxNWViN2Q5OWY4MDQ4NWRlMDQzZWZiMmYzNzBjZDY1NGY0ZWE0NGIiCiBTUkNfVVJJW3dhc2kt
MC4xNC43K3dhc2ktMC4yLjQuc2hhMjU2c3VtXSA9ICI4ODM0NzhkZTIwMzY3ZTIyNGMwMDkwYWY5
Y2Y1ZjlmYTg1YmVkNjNhOTVjMWFiZjNhZmM1YzA4M2ViYzA2ZThjIgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNi5iYgpz
aW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMjYuYmIKaW5kZXggNGVlMmZkYmFh
Ny4uNTI1NmVkYWVhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXV2LWJ1aWxkXzAuMTEuMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMjYuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS1BUEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1w
ZXA1MDgvTGljZW5zZS1BcGFjaGU7bWQ1PWUyM2ZhZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZh
IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1C
U0Q7bWQ1PWVmN2E2MDI3ZGM0YzIzODliOWFmYWQ3ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZDUxMjkxMWQzNTdmNzFkZDdjMWJlNDM1MDNlZTY2ZWJhYmE5YThkMjA3OTk4YmJl
YTc3NTgxZTk1YWFkYWJlNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZWM1OGE5M2QyOTk2N2Ew
N2I4ZGU0NjZiN2ZlMzVlMGUwY2IwY2EyYmNhYjhiNjFkODA0MDNiNWE5YjdhMzRiIgogCiByZXF1
aXJlICR7QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDcuMQoK

--===============5839200384450931129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info

--===============5839200384450931129==--

