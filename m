Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6ADCD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34829.1778851231040779576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X5Ovahe+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cGp7KYzo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e2bcbc205-a438be18-b6fc-4de9-a068-80016eaa38c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m06VMyb00dIf/qDGdqN15Ic0SSCceg12nVdsBVSVIHg=;
	b=X5Ovahe+cbZQ7IH4fazGvv3TpxdQXUx+GeBn+miRma2s6ho3Oldo/B9SVBd1ZFST
	19FXocE7Ykp3kqrg+414st2QXAR4TEerFkj3emdjjQI6ACPoTkrNoHMainp7Di/3rqE
	lKrudA5KAeozEnLRQQSiKCwi4BhlldNvnTG2DfSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m06VMyb00dIf/qDGdqN15Ic0SSCceg12nVdsBVSVIHg=;
	b=cGp7KYzo1k8ekEpu1oHwm2nbICL1aCn+NYE0OKpWLploIWW7jSu5+6cU2Wc6eXEP
	guaX6Q5cr4lXj7+byq6wR8qIVgqVMgq/KlYQ1dQ/1Q2+R/ioGMcuzPZw2hH+Edy5drH
	aVrxS37IhVxBFQolqU7SL+laEce5ny5hinHXs/Bc=
Content-Type: multipart/mixed; boundary="===============6496415371030557845=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.14 SUCCEEDED
Message-ID: <0101019e2bcbc205-a438be18-b6fc-4de9-a068-80016eaa38c7-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237126

--===============6496415371030557845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.8-0.11.14.patch
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
From f783819b4ea30c0d9468843148c67c94e47a805d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:15:26 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.8 -> 0.11.14

---
 .../python/python3-uv-build-crates.inc        | 64 +++++++------------
 ..._0.11.8.bb => python3-uv-build_0.11.14.bb} |  2 +-
 2 files changed, 23 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.8.bb => python3-uv-build_0.11.14.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 218fe61b83..28706b0a3a 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,11 +12,12 @@ SRC_URI += " \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/arcstr/1.2.0 \
+    crate://crates.io/arrayvec/0.7.6 \
     crate://crates.io/astral-version-ranges/0.1.4 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.0 \
+    crate://crates.io/bitflags/2.11.1 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
@@ -28,9 +29,9 @@ SRC_URI += " \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.0 \
+    crate://crates.io/clap/4.6.1 \
     crate://crates.io/clap_builder/4.6.0 \
-    crate://crates.io/clap_derive/4.6.0 \
+    crate://crates.io/clap_derive/4.6.1 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.3 \
@@ -39,7 +40,7 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
-    crate://crates.io/data-encoding/2.10.0 \
+    crate://crates.io/data-encoding/2.11.0 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
@@ -77,7 +78,6 @@ SRC_URI += " \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.16.1 \
     crate://crates.io/hashbrown/0.17.0 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
@@ -97,13 +97,13 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.23 \
-    crate://crates.io/jiff-static/0.2.23 \
+    crate://crates.io/jiff/0.2.24 \
+    crate://crates.io/jiff-static/0.2.24 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
     crate://crates.io/js-sys/0.3.91 \
-    crate://crates.io/junction/1.4.2 \
+    crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libbz2-rs-sys/0.2.2 \
@@ -157,8 +157,8 @@ SRC_URI += " \
     crate://crates.io/regex-automata/0.4.14 \
     crate://crates.io/regex-syntax/0.8.10 \
     crate://crates.io/rend/0.5.3 \
-    crate://crates.io/rkyv/0.8.15 \
-    crate://crates.io/rkyv_derive/0.8.15 \
+    crate://crates.io/rkyv/0.8.16 \
+    crate://crates.io/rkyv_derive/0.8.16 \
     crate://crates.io/rustc-hash/2.1.2 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
@@ -202,7 +202,7 @@ SRC_URI += " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.51.1 \
+    crate://crates.io/tokio/1.52.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/toml/0.9.10+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
@@ -255,27 +255,17 @@ SRC_URI += " \
     crate://crates.io/windows-numerics/0.2.0 \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
-    crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.53.1 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.53.1 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_gnullvm/0.53.1 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.53.1 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.53.1 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/0.7.15 \
     crate://crates.io/wit-bindgen/0.51.0 \
@@ -312,11 +302,12 @@ SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db416
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
+SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
 SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.0.sha256sum] = "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
+SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
@@ -328,9 +319,9 @@ SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.0.sha256sum] = "b193af5b67834b676abd72466a96c1024e6a6ad978a1f484bd90b85c94041351"
+SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
 SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
-SRC_URI[clap_derive-4.6.0.sha256sum] = "1110bd8a634a1ab8cb04345d8d878267d57c3cf1b38d91b71af6686408bbca6a"
+SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.3.sha256sum] = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
@@ -339,7 +330,7 @@ SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b718
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
-SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
+SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
@@ -377,7 +368,6 @@ SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[hashbrown-0.17.0.sha256sum] = "4f467dd6dccf739c208452f8014c75c18bb8301b050ad1cfb27153803edb0f51"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
@@ -397,13 +387,13 @@ SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.23.sha256sum] = "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
-SRC_URI[jiff-static-0.2.23.sha256sum] = "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
+SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
+SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
-SRC_URI[junction-1.4.2.sha256sum] = "8cfc352a66ba903c23239ef51e809508b6fc2b0f90e3476ac7a9ff47e863ae95"
+SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
@@ -457,8 +447,8 @@ SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab4
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
 SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
-SRC_URI[rkyv-0.8.15.sha256sum] = "1a30e631b7f4a03dee9056b8ef6982e8ba371dd5bedb74d3ec86df4499132c70"
-SRC_URI[rkyv_derive-0.8.15.sha256sum] = "8100bb34c0a1d0f907143db3149e6b4eea3c33b9ee8b189720168e818303986f"
+SRC_URI[rkyv-0.8.16.sha256sum] = "73389e0c99e664f919275ab5b5b0471391fe9a8de61e1dff9b1eaf56a90f16e3"
+SRC_URI[rkyv_derive-0.8.16.sha256sum] = "5d2ed0b54125315fb36bd021e82d314d1c126548f871634b483f46b31d13cac6"
 SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
@@ -502,7 +492,7 @@ SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b7635
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.51.1.sha256sum] = "f66bf9585cda4b724d3e78ab34b73fb2bbaba9011b9bfdf69dc836382ea13b8c"
+SRC_URI[tokio-1.52.1.sha256sum] = "b67dee974fe86fd92cc45b7a95fdd2f99a36a6d7b0d431a231178d3d670bbcc6"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[toml-0.9.10+spec-1.1.0.sha256sum] = "0825052159284a1a8b4d6c0c86cbc801f2da5afd2b225fa548c72f2e74002f48"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
@@ -555,27 +545,17 @@ SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd4
 SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
 SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.8.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.8.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
index 8ae54f0f56..f443342e6b 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.8.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "77c7f1eb47f4fa76b0848e1d8838255f75f5777bdbfbf06d4aa66bac19aad82e"
+SRC_URI[sha256sum] = "89755665ec50d7f14dc4886cb88528990f00a6cd6b793b48c7bf17d86f29341e"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============6496415371030557845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.8.tar.gz;downloadfilename=uv_build-0.11.8.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.6.1 crate://c
 rates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.0 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.0 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.10.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate:
 //crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.16.1 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crat
 e://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.23 crate://crates.io/jiff-static/0.2.23 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/1.4.2 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.2 crate://crates.io/libc/0.2.183 crate://crates.io/libredox/0.1.14 crate://crates.io/linux-raw-sys/0.12
 .1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plain/0.2.3 crate://crates.io/portable-atomic/1.13.1 crate:/
 /crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/redox_syscall/0.7.0 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.15 crate://crates.io/rkyv_derive/0.8.15 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate:/
 /crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/1.0.4 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.45 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_s
 ize/0.4.3 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.51.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/toml/0.9.10+spec-1.1.0 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_edit/0.24.0+spec-1.1.0 crate://crates.io/toml_parser/1.0.9+spec-1.1.0 crate://crates.io/toml_writer/1.0.6+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typed-path/0.12.3 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident
 /1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate:
 //crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 cr
 ate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zip/8.1.0 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate:
 //crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.14.tar.gz;downloadfilename=uv_build-0.11.14.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate:
 //crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.6.1 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 cra
 te://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/filetime/0.2.27 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.0 crate://crates.io/heck/0.5.0 cr
 ate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.24 crate://crates.io/jiff-static/0.2.24 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libbz2-rs-sys/0.2.2 crate://crates.io/libc/0.2.183 
 crate://crates.io/libredox/0.1.14 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-rust2/0.16.2 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://
 crates.io/plain/0.2.3 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/redox_syscall/0.7.0 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://cr
 ates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/1.0.4 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar/0.4.45 crate://crates.io/temp-en
 v/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.3 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/toml/0.9.10+spec-1.1.0 crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 crate://crates.io/toml_edit/0.24.0+spec-1.1.0 crate://crates.io/toml_parser/1.0.9+spec-1.1.0 crate://crates.io/toml_writer/1.0.6+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typed-path/0.12.3 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1
 .19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crate
 s.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.15 crate://crates.io/wit-bi
 ndgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zip/8.1.0 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zopfli/0.8.3 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.8" to "0.11.14"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.8 [default] to 0.11.14 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5376265 to 5372170 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses/LICENSE-APACHE was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses/LICENSE-MIT was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses/LICENSE-APACHE was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses/LICENSE-MIT was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/WHEEL was removed

--===============6496415371030557845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses/LICENSE-APACHE was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/licenses/LICENSE-MIT was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.14.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses/LICENSE-APACHE was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/licenses/LICENSE-MIT was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/uv_build-0.11.8.dist-info/WHEEL was removed

--===============6496415371030557845==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.8-0.11.14.patch"

RnJvbSBmNzgzODE5YjRlYTMwYzBkOTQ2ODg0MzE0OGM2N2M5NGU0N2E4MDVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6MTU6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuOCAtPiAwLjExLjE0CgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDY0ICsrKysrKystLS0tLS0t
LS0tLS0KIC4uLl8wLjExLjguYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjE0LmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
MS44LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4xNC5iYn0gKDkyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jCmluZGV4IDIxOGZlNjFiODMuLjI4NzA2YjBhM2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCkBAIC0x
MiwxMSArMTIsMTIgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnN0
eWxlLXdpbmNvbi8zLjAuMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FueWhvdy8xLjAuMTAy
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNzdHIvMS4yLjAgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FycmF5dmVjLzAuNy42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVy
c2lvbi1yYW5nZXMvMC4xLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS41LjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JhY2tvbi8xLjYuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYmFzZTY0LzAuMjIuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi4x
MS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9iaXRmbGFncy8yLjExLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2Jsb2NrLWJ1ZmZlci8wLjEwLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2JveGNhci8wLjIuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JzdHIvMS4xMi4xIFwKQEAg
LTI4LDkgKzI5LDkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8x
LjIuNTcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NmZy1pZi8xLjAuNCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2hhcnNldC8wLjEuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcC80
LjYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcC80LjYuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vY2xhcF9idWlsZGVyLzQuNi4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFw
X2Rlcml2ZS80LjYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9kZXJpdmUvNC42LjEg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfbGV4LzEuMS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jb2xvcmNob2ljZS8xLjAuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29uc29s
ZS8wLjE2LjMgXApAQCAtMzksNyArNDAsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NyeXB0by1jb21tb24vMC4xLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nz
di8xLjQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3N2LWNvcmUvMC4xLjEzIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9kYXRhLWVuY29kaW5nLzIuMTAuMCBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZGF0YS1lbmNvZGluZy8yLjExLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RpZ2Vz
dC8wLjEwLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rpc3BsYXlkb2MvMC4yLjUgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2R1bmNlLzEuMC41IFwKQEAgLTc3LDcgKzc4LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9nbG9ic2V0LzAuNC4xOCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZ2xvby10aW1lcnMvMC4zLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2hhc2hicm93bi8wLjE1LjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hhc2hicm93bi8wLjE2
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hhc2hicm93bi8wLjE3LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2hlY2svMC41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hleC8wLjQu
MyBcCkBAIC05NywxMyArOTcsMTMgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9pc190ZXJtaW5hbF9wb2x5ZmlsbC8xLjcwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2l0ZXJ0b29scy8wLjE0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0b2EvMS4wLjE3IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4yMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vamlmZi1zdGF0aWMvMC4yLjIzIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4y
NCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1zdGF0aWMvMC4yLjI0IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9qaWZmLXR6ZGIvMC4xLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pp
ZmYtdHpkYi1wbGF0Zm9ybS8wLjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vam9ic2VydmVy
LzAuMS4zNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vanMtc3lzLzAuMy45MSBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vanVuY3Rpb24vMS40LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2p1
bmN0aW9uLzIuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGViMTI4Zm10LzAuMS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9saWJiejItcnMtc3lzLzAuMi4yIFwKQEAgLTE1Nyw4ICsxNTcsOCBAQCBTUkNfVVJJ
ICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LWF1dG9tYXRhLzAuNC4xNCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgtc3ludGF4LzAuOC4xMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmVuZC8wLjUuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmt5di8wLjguMTUg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZfZGVyaXZlLzAuOC4xNSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcmt5di8wLjguMTYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZfZGVy
aXZlLzAuOC4xNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGMtaGFzaC8yLjEuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4LzEuMS40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9ydXN0dmVyc2lvbi8xLjAuMjIgXApAQCAtMjAyLDcgKzIwMiw3IEBAIFNSQ19VUkkgKz0gIiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXN0ci8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdGlueXZlYy8xLjExLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rpbnl2ZWNfbWFj
cm9zLzAuMS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby8xLjUxLjEgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3Rva2lvLzEuNTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9r
aW8tbWFjcm9zLzIuNy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sLzAuOS4xMCtzcGVj
LTEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2RhdGV0aW1lLzAuNy41K3NwZWMt
MS4xLjAgXApAQCAtMjU1LDI3ICsyNTUsMTcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzLW51bWVyaWNzLzAuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by93aW5kb3dzLXJlc3VsdC8wLjMuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1z
dHJpbmdzLzAuNC4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXN5cy8wLjUyLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3Mtc3lzLzAuNjAuMiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93cy1zeXMvMC42MS4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5kb3dzLXRhcmdldHMvMC41Mi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXRh
cmdldHMvMC41My41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXRocmVhZGluZy8w
LjEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxsdm0vMC41
Mi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfZ251bGx2bS8wLjUz
LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNTIuNiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X21zdmMvMC41My4xIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251LzAuNTIuNiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudS8wLjUzLjEgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3NfaTY4Nl9nbnVsbHZtLzAuNTIuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2luZG93c19pNjg2X2dudWxsdm0vMC41My4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzX2k2ODZfbXN2Yy8wLjUyLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4
Nl9tc3ZjLzAuNTMuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251
LzAuNTIuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251LzAuNTMu
MSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251bGx2bS8wLjUyLjYg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC41My4xIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNTIuNiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjUzLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbm5vdy8wLjcuMTUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpdC1i
aW5kZ2VuLzAuNTEuMCBcCkBAIC0zMTIsMTEgKzMwMiwxMiBAQCBTUkNfVVJJW2Fuc3R5bGUtcXVl
cnktMS4xLjUuc2hhMjU2c3VtXSA9ICI0MGM0OGY3MmZkNTNjZDI4OTEwNGZjNjQwOTlhYmNhNzNk
YjQxNgogU1JDX1VSSVthbnN0eWxlLXdpbmNvbi0zLjAuMTEuc2hhMjU2c3VtXSA9ICIyOTFlNmEy
NTBmZjg2Y2Q0YTgyMDExMmZiODg5ODgwOGEzNjZkOGY5ZjU4Y2UxNmQxZjUzODM1M2FkNTU3NDdk
IgogU1JDX1VSSVthbnlob3ctMS4wLjEwMi5zaGEyNTZzdW1dID0gIjdmMjAyZGY4NjQ4NGM4Njhk
YmFkN2VhYTU1N2VmNzg1ZDVjNjYyOTVlNDFiNDYwZWY5MjJlY2EwNzIzYjg0MmMiCiBTUkNfVVJJ
W2FyY3N0ci0xLjIuMC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4NzczMmUy
OTIxMTc1ZjI2YzM1MGI0NTYzODQxZDA5NThjMjFkNTdlNmQiCitTUkNfVVJJW2FycmF5dmVjLTAu
Ny42LnNoYTI1NnN1bV0gPSAiN2MwMmQxMjNkZjAxN2VmY2RmYmQ3MzllZjgxNzM1YjM2YzViYTgz
ZWMzYzU5YzgwYTlkN2VjYzcxOGY5MmU1MCIKIFNSQ19VUklbYXN0cmFsLXZlcnNpb24tcmFuZ2Vz
LTAuMS40LnNoYTI1NnN1bV0gPSAiMzE5NzliYzMwNTYxMDI0NmQ3OGFjMDFkNjM0NjdhMTJkODQ1
NGM2ZTNiOGIyMmI1ODExZDM0M2ExMTk4ZGZiYiIKIFNSQ19VUklbYXV0b2NmZy0xLjUuMC5zaGEy
NTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4ZTI4ZmIwMDE0YTJjMDg2NzA4ZmU5NTRlYWE4
ODUzODRhNjE2NTE3MmU3ZTgiCiBTUkNfVVJJW2JhY2tvbi0xLjYuMC5zaGEyNTZzdW1dID0gImNm
ZmIwZTkzMTg3NWI2NjZmYzRmY2IyMGZlZTUyZTliYmQxZWY4MzZmZDllOWUwNGVjMjE1NTVmOWY4
NWY3ZWYiCiBTUkNfVVJJW2Jhc2U2NC0wLjIyLjEuc2hhMjU2c3VtXSA9ICI3MmIzMjU0ZjE2MjUx
YTgzODFhYTEyZTQwZTNjNGQyZjAxOTlmOGM2NTA4ZmJlY2I5ZDkxZjU3NWUwZmJiOGM2IgotU1JD
X1VSSVtiaXRmbGFncy0yLjExLjAuc2hhMjU2c3VtXSA9ICI4NDM4NjdiZTk2YzhkYWFkMGQ3NThi
NTdkZjkzOTJiNmQ4ZDI3MTEzNGZjZTU0OWRlNmNlMTY5ZmY5OGE5MmFmIgorU1JDX1VSSVtiaXRm
bGFncy0yLjExLjEuc2hhMjU2c3VtXSA9ICJjNDUxMjI5OWYzNmYwNDNhYjA5YTU4M2U1N2JjZWI1
YTVhYWI3YTczZGIxODA1ODQ4ZThmZWYzYzllOGM3OGIzIgogU1JDX1VSSVtibG9jay1idWZmZXIt
MC4xMC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5YjYyZDNmMDQzOTUxN2ZhMzk0OTk2YWNhY2M1
Y2JjOTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIKIFNSQ19VUklbYm94Y2FyLTAuMi4xNC5zaGEy
NTZzdW1dID0gIjM2ZjY0YmVhZTQwYTg0ZGExYjRiMjZmZjI3NjFhNWI4OTVjMTJhZGM0MWRjMjVh
YWVlMWM0ZjJiYmZlOTdhNmUiCiBTUkNfVVJJW2JzdHItMS4xMi4xLnNoYTI1NnN1bV0gPSAiNjMw
NDRlMWFlOGU2OWYzYjVhOTJjNzM2Y2E2MjY5YjhkMTJmYTdlZmUzOWJmMzRkZGIwNmQxMDJjZjBl
MmNhYiIKQEAgLTMyOCw5ICszMTksOSBAQCBTUkNfVVJJW2J6aXAyLTAuNi4xLnNoYTI1NnN1bV0g
PSAiZjNhNTNmYWMyNGYzNGE4MWJjOTk1NGI1ZDZjZmNlMGMyMWUxOGVjNjk1OWY0NAogU1JDX1VS
SVtjYy0xLjIuNTcuc2hhMjU2c3VtXSA9ICI3YTBkZDFjYTM4NDkzMmZmMzY0MWM4NzE4YTAyNzY5
ZjE2OThlNzU2M2RjNjk3NGZmZDAzMzQ2MTE2MzEwNDIzIgogU1JDX1VSSVtjZmctaWYtMS4wLjQu
c2hhMjU2c3VtXSA9ICI5MzMwZjhiMmZmMTNmMzQ1NDBiNDRlOTQ2ZWYzNTExMTgyNTcyN2IzOGQz
MzI4NmVmOTg2MTQyNjE1MTIxODAxIgogU1JDX1VSSVtjaGFyc2V0LTAuMS41LnNoYTI1NnN1bV0g
PSAiZjFmOTI3YjA3Yzc0YmE4NGM3ZTVmZTRkYjJiYWViM2U5OTZhYjI2ODg5OTJlMzlhYzY4Y2Uz
MjIwYTY3N2M3ZSIKLVNSQ19VUklbY2xhcC00LjYuMC5zaGEyNTZzdW1dID0gImIxOTNhZjViNjc4
MzRiNjc2YWJkNzI0NjZhOTZjMTAyNGU2YTZhZDk3OGExZjQ4NGJkOTBiODVjOTQwNDEzNTEiCitT
UkNfVVJJW2NsYXAtNC42LjEuc2hhMjU2c3VtXSA9ICIxZGRiMTE3ZTQzYmJmN2RhY2YwYTQxOTBm
ZWY0ZDM0NWI5YmFkNjhkZmM2NDljYjM0OWU3ZDE3ZDI4NDI4ZTUxIgogU1JDX1VSSVtjbGFwX2J1
aWxkZXItNC42LjAuc2hhMjU2c3VtXSA9ICI3MTRhNTMwMDFiZjY2NDE2YWRiMGUyZWY1YWM4NTcx
NDBlN2RjM2EwYzQ4ZmIyOGIyZjEwNzYyZmM0YjUwNjlmIgotU1JDX1VSSVtjbGFwX2Rlcml2ZS00
LjYuMC5zaGEyNTZzdW1dID0gIjExMTBiZDhhNjM0YTFhYjhjYjA0MzQ1ZDhkODc4MjY3ZDU3YzNj
ZjFiMzhkOTFiNzFhZjY2ODY0MDhiYmNhNmEiCitTUkNfVVJJW2NsYXBfZGVyaXZlLTQuNi4xLnNo
YTI1NnN1bV0gPSAiZjJjZTg2MDQ3MTBmNjczM2FhNjQxYTJiMzczMWVhYTFlOGIzZDk5NzNkNWUz
NTY1ZGExMTgwMDgxM2Y5OTdhOSIKIFNSQ19VUklbY2xhcF9sZXgtMS4xLjAuc2hhMjU2c3VtXSA9
ICJjOGQ0YTNiYjhiMWUwYzEwNTA0OTlkMTgxNWY1YWIxNmQwNGYwOTU5YjIzMzA4NWZiMzE2NTNm
YmZjOWQ5OGY5IgogU1JDX1VSSVtjb2xvcmNob2ljZS0xLjAuNS5zaGEyNTZzdW1dID0gIjFkMDc1
NTBjOTAzNmJmMmFlMGM2ODRjNDI5N2Q1MDNmODM4Mjg3YzgzYzUzNjg2ZDA1MzcwZDBlMTM5YWU1
NzAiCiBTUkNfVVJJW2NvbnNvbGUtMC4xNi4zLnNoYTI1NnN1bV0gPSAiZDY0ZThhZjU1NTEzNjlk
MTljZjUwMTM4ZGU2MWYxYzQyMDc0YWI5NzBmNzRlOTliZTkxNjY0Njc3N2Y4ZmM4NyIKQEAgLTMz
OSw3ICszMzAsNyBAQCBTUkNfVVJJW2NyYzMyZmFzdC0xLjUuMC5zaGEyNTZzdW1dID0gIjk0ODFj
MWM5MGNiZjJhYzk1M2YwN2M4ZDRhNThhYTM5NDVjNDI1YjcxOAogU1JDX1VSSVtjcnlwdG8tY29t
bW9uLTAuMS43LnNoYTI1NnN1bV0gPSAiNzhjODI5MjA1NWQxYzFkZjBjY2U1ZDE4MDM5M2RjOGNj
ZTBhYmVjMGE3MTAyYWRiNmM3YjFlZWY2MDE2ZDYwYSIKIFNSQ19VUklbY3N2LTEuNC4wLnNoYTI1
NnN1bV0gPSAiNTJjZDlkNjhjZjdlZmM2ZGRmYWFlZTQyZTcyODhkM2E5OWQ2MTNkNGI1MGY3NmNl
OTgyN2FlMGM2ZTE0ZjkzOCIKIFNSQ19VUklbY3N2LWNvcmUtMC4xLjEzLnNoYTI1NnN1bV0gPSAi
NzA0YTNjMjY5OTZhODA0NzExODkyNjU4MTRkYmMyYzI1NzU5OGI5NmI4YTdmZWFlMmQzMWFjZTY0
NmJiOTc4MiIKLVNSQ19VUklbZGF0YS1lbmNvZGluZy0yLjEwLjAuc2hhMjU2c3VtXSA9ICJkN2Ex
ZTJmMjc2MzZmMTE2NDkzYjhiODYwZjU1NDZlZGI0N2M4ZDhmOGVhNzNlMWQyYTIwYmU4OGUyOGQx
ZmVhIgorU1JDX1VSSVtkYXRhLWVuY29kaW5nLTIuMTEuMC5zaGEyNTZzdW1dID0gImE0YWU1ZjE1
ZGRhM2M3MDhjMGFkZTg0YmZlZTMxY2NhYjQ0YTNkYTRmODgwMTVlZDIyZjYzNzMyYWJlMzAwYzgi
CiBTUkNfVVJJW2RpZ2VzdC0wLjEwLjcuc2hhMjU2c3VtXSA9ICI5ZWQ5YTI4MWY3YmM5Yjc1NzZl
NjE0NjhiYTYxNWE2NmE1YzhjZmRmZjQyNDIwYTcwYWE4MjcwMWEzYjFlMjkyIgogU1JDX1VSSVtk
aXNwbGF5ZG9jLTAuMi41LnNoYTI1NnN1bV0gPSAiOTczNjljYmJjMDQxYmMzNjY5NDliYzc0ZDM0
NjU4ZDZjZGE1NjIxMDM5NzMxYzYzMTA1MjE4OTJhM2EyMGFlMCIKIFNSQ19VUklbZHVuY2UtMS4w
LjUuc2hhMjU2c3VtXSA9ICI5Mjc3MzUwNGQ1OGMwOTNmNmRlMjQ1OWFmNGFmMzNmYWE1MThjMTM0
NTFlYjhmMmI1Njk4ZWQzZDM2ZTdjODEzIgpAQCAtMzc3LDcgKzM2OCw2IEBAIFNSQ19VUklbZ2V0
cmFuZG9tLTAuNC4xLnNoYTI1NnN1bV0gPSAiMTM5ZWYzOTgwMDExOGM3NjgzZjJmZDNjOThjMWIy
M2MwOWFlMDc2NTU2CiBTUkNfVVJJW2dsb2JzZXQtMC40LjE4LnNoYTI1NnN1bV0gPSAiNTJkZmMx
OTE1M2E0OGJkZTBjYmQ2MzA0NTM2MTVjODE1MWJjZTNhNWFkZmFjN2EwYWViZmJmMGExZTFmNTdl
MyIKIFNSQ19VUklbZ2xvby10aW1lcnMtMC4zLjAuc2hhMjU2c3VtXSA9ICJiYmIxNDNjZjk2MDk5
ODAyMDMzZTBkNGY0OTYzYjE5ZmQyZTBiNzI4YmNmMDc2Y2Q5Y2Y3ZjY2MzRmMDkyOTk0IgogU1JD
X1VSSVtoYXNoYnJvd24tMC4xNS41LnNoYTI1NnN1bV0gPSAiOTIyOWNmZTUzZGZkNjlmMDYwOWE0
OWY2NTQ2MWJkOTMwMDFlYTFlZjg4OWNkNTUyOWRkMTc2NTkzZjUzMzhhMSIKLVNSQ19VUklbaGFz
aGJyb3duLTAuMTYuMS5zaGEyNTZzdW1dID0gIjg0MWQxY2M5YmVkN2Y5MjM2ZjMyMWRmOTc3MDMw
MzczZjRhNDE2M2FlMWE3ZGJmZTFhNTFhMmMxYTUxZDkxMDAiCiBTUkNfVVJJW2hhc2hicm93bi0w
LjE3LjAuc2hhMjU2c3VtXSA9ICI0ZjQ2N2RkNmRjY2Y3MzljMjA4NDUyZjgwMTRjNzVjMThiYjgz
MDFiMDUwYWQxY2ZiMjcxNTM4MDNlZGIwZjUxIgogU1JDX1VSSVtoZWNrLTAuNS4wLnNoYTI1NnN1
bV0gPSAiMjMwNGUwMDk4M2Y4N2ZmYjM4YjU1YjQ0NGI1ZTNiNjBhODg0YjVkMzBjMGZjYTdkODJm
ZTMzNDQ5YmJlNTVlYSIKIFNSQ19VUklbaGV4LTAuNC4zLnNoYTI1NnN1bV0gPSAiN2YyNDI1NGFh
OWE1NGI1Yzg1OGVhZWUyZjViY2NkYjQ2YWFmMGU0ODZhNTk1ZWQ1ZmQ4Zjg2YmE1NTIzMmE3MCIK
QEAgLTM5NywxMyArMzg3LDEzIEBAIFNSQ19VUklbaW5zdGEtMS40Ny4yLnNoYTI1NnN1bV0gPSAi
N2I0YTYyNDhlYjkzYTQ0MDFlZDJmMzdkZmU4ZWE1OTJkM2NmMDViN2NmNGY4CiBTUkNfVVJJW2lz
X3Rlcm1pbmFsX3BvbHlmaWxsLTEuNzAuMi5zaGEyNTZzdW1dID0gImE2Y2IxMzhiYjc5YTE0NmMx
YmQ0NjAwMDU2MjNlMTQyZWYwMTgxZTNkMDIxOWNiNDkzZTAyZjdkMDhhMzU2OTUiCiBTUkNfVVJJ
W2l0ZXJ0b29scy0wLjE0LjAuc2hhMjU2c3VtXSA9ICIyYjE5MmM3ODIwMzdmYWRkOWNmYTc1NTQ4
MzEwNDg4YWFiZGJmM2QyZGE3Mzg4NWIzMWJkMGFiZDAzMzUxMjg1IgogU1JDX1VSSVtpdG9hLTEu
MC4xNy5zaGEyNTZzdW1dID0gIjkyZWNjNjYxODE4MWRlZjA0NTczOTJjY2QwZWU1MTE5OGUwNjVl
MDE2ZDFkNTI3YTdhYzFiNmRjN2MxZjA5ZDIiCi1TUkNfVVJJW2ppZmYtMC4yLjIzLnNoYTI1NnN1
bV0gPSAiMWEzNTQ2ZGM5NmI2ZDQyYzVmMjQ5MDJhZjllMjUzOGU4MmUzOWFkMzUwYjBjNzY2ZWIz
ZmJmMmQ4ZjNkODM1OSIKLVNSQ19VUklbamlmZi1zdGF0aWMtMC4yLjIzLnNoYTI1NnN1bV0gPSAi
MmE4YzhiMzQ0MTI0MjIyZWZkNzE0YjczYmI0MWY4YjUxMjBiMjdhN2NjMWM3NTU5M2E2ZmY3Njhk
OWQwNWFhNCIKK1NSQ19VUklbamlmZi0wLjIuMjQuc2hhMjU2c3VtXSA9ICJmMDBiNWRiZDYyMGQ2
MWRmZGNiNjAwN2M5YzFmNjA1NGViZDc1MzE5ZjE2M2Q4ODZhOTA1NWNlYzExNTUwNzNkIgorU1JD
X1VSSVtqaWZmLXN0YXRpYy0wLjIuMjQuc2hhMjU2c3VtXSA9ICJlMDAwZGUwMzBmZjgwMjJlYTFk
YTNmNDY2ZmJiMGYzYTgwOWY1ZTUxZWQzMWY2ZGQ5MzFjMzUxODFhZDhlNmQ3IgogU1JDX1VSSVtq
aWZmLXR6ZGItMC4xLjYuc2hhMjU2c3VtXSA9ICJjOTAwZWY4NDgyNmYxMzM4YTU1NzY5N2RjOGZj
NjAxZGY5Y2E5YWY0YWMxMzdjN2ZiNjFkNGM2ZjJkZmQzMDc2IgogU1JDX1VSSVtqaWZmLXR6ZGIt
cGxhdGZvcm0tMC4xLjMuc2hhMjU2c3VtXSA9ICI4NzVhNWE2OWFjMmJhYjFhODkxNzExY2Y1ZWNj
YmVjMWNlMDM0MWVhODA1NTYwZGNkOTBiN2EyZTkyNTEzMmU4IgogU1JDX1VSSVtqb2JzZXJ2ZXIt
MC4xLjM0LnNoYTI1NnN1bV0gPSAiOWFmYjNkZTQzOTVkNmIzZTY3YTc4MGI2ZGU2NGI1MWM5Nzhl
Y2YxMWNiOWE0NjJjNjZiZTdkNGNhOTAzOWQzMyIKIFNSQ19VUklbanMtc3lzLTAuMy45MS5zaGEy
NTZzdW1dID0gImI0OTcxNWI3MDczZjM4NWJhNGJjNTI4ZTU3NDdkMDJlNjZjYjM5YzYxNDZlZmI2
NmI3ODFmMTMxZjBmYjM5OWMiCi1TUkNfVVJJW2p1bmN0aW9uLTEuNC4yLnNoYTI1NnN1bV0gPSAi
OGNmYzM1MmE2NmJhOTAzYzIzMjM5ZWY1MWU4MDk1MDhiNmZjMmIwZjkwZTM0NzZhYzdhOWZmNDdl
ODYzYWU5NSIKK1NSQ19VUklbanVuY3Rpb24tMi4wLjAuc2hhMjU2c3VtXSA9ICIxNjBmMmVhZGUw
OTdmMzAyNjNiNTQ4YWFlNWRlYjEyYWQzNDljOTA5YmFhNzEwZmEyNGI5MmM5MDkwYjJlMDA2Igog
U1JDX1VSSVtsYXp5X3N0YXRpYy0xLjUuMC5zaGEyNTZzdW1dID0gImJiZDJiY2I0Yzk2M2YyZGRh
ZTA2YTJlZmM3ZTlmMzU5MTMxMjQ3M2M1MGM2Njg1ZTFmMjk4MDY4MzE2ZTY2ZmUiCiBTUkNfVVJJ
W2xlYjEyOGZtdC0wLjEuMC5zaGEyNTZzdW1dID0gIjA5ZWRkOWU4YjU0ZTQ5ZTU4N2U0ZjYyOTVh
N2QyOWMzZWE5NGQ0NjljYjQwYWI4Y2E3MGIyODgyNDhhODFkYjIiCiBTUkNfVVJJW2xpYmJ6Mi1y
cy1zeXMtMC4yLjIuc2hhMjU2c3VtXSA9ICIyYzRhNTQ1YTE1MjQ0YzdkOTQ1MDY1YjVkMzkyYjJk
MmQ3ZjIxNTI2ZmJhNTZjZTUxNDY3YjA2ZWQ0NDVlOGY3IgpAQCAtNDU3LDggKzQ0Nyw4IEBAIFNS
Q19VUklbcmVnZXgtMS4xMi4zLnNoYTI1NnN1bV0gPSAiZTEwNzU0YTE0YjkxMzdkZDdiMWUzZTVi
MDQ5M2NjOTE3MWZkZDEwNWUwYWI0CiBTUkNfVVJJW3JlZ2V4LWF1dG9tYXRhLTAuNC4xNC5zaGEy
NTZzdW1dID0gIjZlMWRkNDEyMmZjMTU5NWU4MTYyNjE4OTQ1NDc2ODkyZWVmY2E3Yjg4YzUyODIw
ZTc0YWY2MjYyMjEzY2FlOGYiCiBTUkNfVVJJW3JlZ2V4LXN5bnRheC0wLjguMTAuc2hhMjU2c3Vt
XSA9ICJkYzg5N2RkOGQ5ZThiZDFlZDhjZGFkODJiNTk2NmMzZTBlY2FlMDlmYjE5MDdkNThlZmFh
MDEzNTQzMTg1ZDBhIgogU1JDX1VSSVtyZW5kLTAuNS4zLnNoYTI1NnN1bV0gPSAiY2FkYWRlZjMx
N2MyZjIwNzU1YTY0ZDdmZGM0OGY5ZTcxNzhlZTZiMGUxZjdmY2UzM2ZhNjBmMWQ2OGEyNzZlNiIK
LVNSQ19VUklbcmt5di0wLjguMTUuc2hhMjU2c3VtXSA9ICIxYTMwZTYzMWI3ZjRhMDNkZWU5MDU2
YjhlZjY5ODJlOGJhMzcxZGQ1YmVkYjc0ZDNlYzg2ZGY0NDk5MTMyYzcwIgotU1JDX1VSSVtya3l2
X2Rlcml2ZS0wLjguMTUuc2hhMjU2c3VtXSA9ICI4MTAwYmIzNGMwYTFkMGY5MDcxNDNkYjMxNDll
NmI0ZWVhM2MzM2I5ZWU4YjE4OTcyMDE2OGU4MTgzMDM5ODZmIgorU1JDX1VSSVtya3l2LTAuOC4x
Ni5zaGEyNTZzdW1dID0gIjczMzg5ZTBjOTllNjY0ZjkxOTI3NWFiNWI1YjA0NzEzOTFmZTlhOGRl
NjFlMWRmZjliMWVhZjU2YTkwZjE2ZTMiCitTUkNfVVJJW3JreXZfZGVyaXZlLTAuOC4xNi5zaGEy
NTZzdW1dID0gIjVkMmVkMGI1NDEyNTMxNWZiMzZiZDAyMWU4MmQzMTRkMWMxMjY1NDhmODcxNjM0
YjQ4M2Y0NmIzMWQxM2NhYzYiCiBTUkNfVVJJW3J1c3RjLWhhc2gtMi4xLjIuc2hhMjU2c3VtXSA9
ICI5NDMwMGFiZjNmMWFlMmUyYjhmZmI3YjU4MDQzZGUzZDM5OWM3M2ZhNmY0YjczODI2NDAyYTVj
NDU3NjE0ZGJlIgogU1JDX1VSSVtydXN0aXgtMS4xLjQuc2hhMjU2c3VtXSA9ICJiNmZlNDU2NWI5
NTE4YjgzZWY0ZjkxYmI0N2NlMjk2MjBjYTgyOGJkMzJjYjdlNDA4ZjAwNjJlOTkzMGJhMTkwIgog
U1JDX1VSSVtydXN0dmVyc2lvbi0xLjAuMjIuc2hhMjU2c3VtXSA9ICJiMzljZGVmMGZhODAwZmM0
NDUyNWM4NGNjYjU0YTAyOTk2MWE4MjE1Zjk2MTk3NTM2MzVhOWMwZDI1MzhkNDZkIgpAQCAtNTAy
LDcgKzQ5Miw3IEBAIFNSQ19VUklbdGhyZWFkX2xvY2FsLTEuMS45LnNoYTI1NnN1bV0gPSAiZjYw
MjQ2YTQ5NDRmMjRmNmUwMThhYTE3Y2RlZmZiNzgxOGI3NjM1CiBTUkNfVVJJW3RpbnlzdHItMC44
LjIuc2hhMjU2c3VtXSA9ICI0MmQzZTljNDVjMDlkZTE1ZDA2ZGQ4YWNmNWY0ZTBlMzk5ZTg1OTI3
YjdmMDA3MTEwMjRlYjdhZTEwZmE0ODY5IgogU1JDX1VSSVt0aW55dmVjLTEuMTEuMC5zaGEyNTZz
dW1dID0gIjNlNjFlNjcwNTNkMjVhNGU4MmM4NDRlODQyNDAzOWQ5NzQ1NzgxYjNmYzRmMzJiOGQ1
NWVkNTBmNWY2NjdlZjMiCiBTUkNfVVJJW3Rpbnl2ZWNfbWFjcm9zLTAuMS4xLnNoYTI1NnN1bV0g
PSAiMWYzY2NiYWMzMTFmZWEwNWY4NmY2MTkwNGI0NjJiNTVmYjNkZjg4MzdhMzY2ZGZjNjAxYTAx
NjFkMDUzMmYyMCIKLVNSQ19VUklbdG9raW8tMS41MS4xLnNoYTI1NnN1bV0gPSAiZjY2YmY5NTg1
Y2RhNGI3MjRkM2U3OGFiMzRiNzNmYjJiYmFiYTkwMTFiOWJmZGY2OWRjODM2MzgyZWExM2I4YyIK
K1NSQ19VUklbdG9raW8tMS41Mi4xLnNoYTI1NnN1bV0gPSAiYjY3ZGVlOTc0ZmU4NmZkOTJjYzQ1
YjdhOTVmZGQyZjk5YTM2YTZkN2IwZDQzMWEyMzExNzhkM2Q2NzBiYmNjNiIKIFNSQ19VUklbdG9r
aW8tbWFjcm9zLTIuNy4wLnNoYTI1NnN1bV0gPSAiMzg1YTZjYjcxYWI5YWI3OTBjNWZlOGQ2N2Yx
NjQ1ZTZjNDUwYTdjZTAwNmEzM2RlMDNkYWE5NTZjZjcwYTQ5NiIKIFNSQ19VUklbdG9tbC0wLjku
MTArc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gIjA4MjUwNTIxNTkyODRhMWE4YjRkNmMwYzg2Y2Jj
ODAxZjJkYTVhZmQyYjIyNWZhNTQ4YzcyZjJlNzQwMDJmNDgiCiBTUkNfVVJJW3RvbWxfZGF0ZXRp
bWUtMC43LjUrc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gIjkyZTFjZmVkNGEzMDM4YmM1YTEyN2Uz
NWEyZDM2MGYxNDVlMWY0Yjk3MWI1NTFhMmJhNWZkN2FlZGY3ZTEzNDciCkBAIC01NTUsMjcgKzU0
NSwxNyBAQCBTUkNfVVJJW3dpbmRvd3MtbGluay0wLjIuMS5zaGEyNTZzdW1dID0gImYwODA1MjIy
ZTU3Zjc1MjFkNmE2MmUzNmZhOTE2M2JjODkxYWNkNAogU1JDX1VSSVt3aW5kb3dzLW51bWVyaWNz
LTAuMi4wLnNoYTI1NnN1bV0gPSAiOTE1MGFmNjgwNjZjNGM1YzA3ZGRjMGNlMzA0MjE1NTQ3NzFl
NTI4YmRlNDI3NjE0YzYxMDM4YmMyYzkyYzJiMSIKIFNSQ19VUklbd2luZG93cy1yZXN1bHQtMC4z
LjQuc2hhMjU2c3VtXSA9ICI1NmY0MmJkMzMyY2M2YzhlYWM1YWYxMTNmYzBjMWZkNmE4ZmQyYWEw
OGEwMTE5MzU4Njg2ZTUxNjBkMDU4NmM2IgogU1JDX1VSSVt3aW5kb3dzLXN0cmluZ3MtMC40LjIu
c2hhMjU2c3VtXSA9ICI1NmU2YzkzZjNhMGMzYjM2MTc2Y2IxMzI3YTQ5NThhMDM1M2Q1ZDE2NmMy
YTM1Y2IyNjhhY2UxNWU5MWQzYjU3IgotU1JDX1VSSVt3aW5kb3dzLXN5cy0wLjUyLjAuc2hhMjU2
c3VtXSA9ICIyODJiZTVmMzZhOGNlNzgxZmFkOGM4YWUxOGZhM2Y5YmVmZjU3ZWMxYjUyY2IzZGUw
Nzg5MjAxNDI1ZDlhMzNkIgogU1JDX1VSSVt3aW5kb3dzLXN5cy0wLjYwLjIuc2hhMjU2c3VtXSA9
ICJmMmY1MDBlNGQyODIzNGY3MjA0MDk5MGVjOWQzOWUzYTZiOTUwZjlmMjJkM2RiYTE4NDE2YzM1
ODgyNjEyYmNiIgogU1JDX1VSSVt3aW5kb3dzLXN5cy0wLjYxLjIuc2hhMjU2c3VtXSA9ICJhZTEz
NzIyOWJjYmQ2Y2RmMGY3YjgwYTMxZGY2MTc2NjE0NTA3N2RkZjQ5NDE2YTcyOGIwMmNiMzkyMWZm
M2ZjIgotU1JDX1VSSVt3aW5kb3dzLXRhcmdldHMtMC41Mi42LnNoYTI1NnN1bV0gPSAiOWI3MjRm
NzI3OTZlMDM2YWI5MGMxMDIxZDQ3ODBkNGQzZDY0OGFjYTU5ZTQ5MWU2Yjk4ZTcyNWI4NGU5OTk3
MyIKIFNSQ19VUklbd2luZG93cy10YXJnZXRzLTAuNTMuNS5zaGEyNTZzdW1dID0gIjQ5NDVmOWY1
NTFiODhlMGQ2NWYzZGIwYmMyNWMzM2I4YWNlYTRkOWU0MTE2M2VkZjkwZGNkMGIxOWY5MDY5ZjMi
CiBTUkNfVVJJW3dpbmRvd3MtdGhyZWFkaW5nLTAuMS4wLnNoYTI1NnN1bV0gPSAiYjY2NDYzYWQy
ZTBlYTNiYmY4MDhiN2YxZDM3MTMxMWM4MGUxMTVjMGI3MWQ2MGVmYzE0MmNhZmJjZmIwNTdhNiIK
LVNSQ19VUklbd2luZG93c19hYXJjaDY0X2dudWxsdm0tMC41Mi42LnNoYTI1NnN1bV0gPSAiMzJh
NDYyMjE4MGU3YTBlYzA0NGJiNTU1NDA0YzgwMGJjOWZkOWVjMjYyZWMxNDdlZGQ1OTg5Y2NkMGMw
MmNkMyIKIFNSQ19VUklbd2luZG93c19hYXJjaDY0X2dudWxsdm0tMC41My4xLnNoYTI1NnN1bV0g
PSAiYTlkODQxNmZhOGI0MmY1Yzk0N2Y4NDgyYzQzZTdkODllNzNhMTczY2VhZDU2ZDA0NGY2YTU2
MTA0YTZkMWI1MyIKLVNSQ19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC41Mi42LnNoYTI1NnN1
bV0gPSAiMDllYzJhN2JiMTUyZTIyNTJiNTNmYTc4MDMxNTAwMDc4Nzk1NDhiYzcwOWMwMzlkZjc2
MjdjYWJiZDA1ZDQ2OSIKIFNSQ19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC41My4xLnNoYTI1
NnN1bV0gPSAiYjlkNzgyZTgwNGMyZjYzMmUzOTU3MDhlOTlhOTQyNzU5MTBlYjkxMDBiMjExNDY1
MWUwNDc0NGU5YjEyNTAwNiIKLVNSQ19VUklbd2luZG93c19pNjg2X2dudS0wLjUyLjYuc2hhMjU2
c3VtXSA9ICI4ZTliNWFkNWFiODAyZTk3ZWI4ZTI5NWFjNjcyMGU1MDllZTRjMjQzZjY5ZDc4MTM5
NDAxNGViZmU4YmJmYTBiIgogU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNTMuMS5zaGEyNTZz
dW1dID0gIjk2MGU2ZGEwNjlkODFlMDliZWNiMGNhNTdhNjUyMjBkZGZmMDE2ZmYyZDZhZjZhMjIz
Y2YzNzJhNTA2NTkzYTMiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnVsbHZtLTAuNTIuNi5zaGEy
NTZzdW1dID0gIjBlZWU1MmQzOGMwOTBiM2NhYTc2YzU2M2I4NmMzYTRiZDcxZWYxYTgxOTI4N2Mx
OWQ1ODZkNzMzNGFlOGVkNjYiCiBTUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnVsbHZtLTAuNTMuMS5z
aGEyNTZzdW1dID0gImZhNzM1OWQxMDA0OGY2OGFiOGIwOWZhNzFjM2RhY2NmYjBlOWI1NTlhZWQ2
NDhhOGY5NTQ2OWMyNzA1NzE4MGMiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNTIuNi5z
aGEyNTZzdW1dID0gIjI0MDk0OGJjMDVjNWU3YzZkYWJiYTI4YmY4OWQ4OWZmY2UzZTMwMzAyMjgw
OWU3M2RlYWVmZTRmNmVjNTZjNjYiCiBTUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNTMuMS5z
aGEyNTZzdW1dID0gIjFlN2FjNzUxNzlmMTgyMzJmZTljMjg1MTYzNTY1YTU3ZWY4ZDNjODkyNTRh
MzA2ODViNTdkODNhMzhkMzI2YzIiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjUyLjYu
c2hhMjU2c3VtXSA9ICIxNDdhNWM4MGFhYmZiZjBjN2Q5MDFjYjU4OTVkMWRlMzBlZjI5MDdlYjIx
ZmJiYWIyOWNhOTRjNWIwOGIxYTc4IgogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnUtMC41My4x
LnNoYTI1NnN1bV0gPSAiOWMzODQyY2RkNzRhODY1YTgwNjZhYjM5YzhhN2E0NzNjMDc3OGEzZjI5
MzcwYjVmZDZiNGI5YWE3ZGY0YTQ5OSIKLVNSQ19VUklbd2luZG93c194ODZfNjRfZ251bGx2bS0w
LjUyLjYuc2hhMjU2c3VtXSA9ICIyNGQ1YjIzZGM0MTc0MTI2Nzk2ODEzOTZmMmI0OWYzZGU4YzE0
NzNkZWI1MTZiZDM0NDEwODcyZWZmNTFlZDBkIgogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVs
bHZtLTAuNTMuMS5zaGEyNTZzdW1dID0gIjBmZmExNzllMmQwN2VlZThhZDhmNTc0OTM0MzY1NjZj
N2NjMzBhYzUzNmEzMzc5ZmRmMDA4ZjQ3ZjZiYjdhZTEiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0
X21zdmMtMC41Mi42LnNoYTI1NnN1bV0gPSAiNTg5ZjZkYTg0YzY0NjIwNDc0N2QxMjcwYTJhNTY2
MWVhNjZlZDFjY2VkMjYzMWQ1NDZmZGZiMTU1OTU5ZjllYyIKIFNSQ19VUklbd2luZG93c194ODZf
NjRfbXN2Yy0wLjUzLjEuc2hhMjU2c3VtXSA9ICJkNmJiZmY1ZjBhYWRhNDI3YTFlNWE2ZGE1ZjFm
OTgxNTgxODJmMjY1NTZmMzQ1YWM5ZTA0ZDM2ZDBlYmVkNjUwIgogU1JDX1VSSVt3aW5ub3ctMC43
LjE1LnNoYTI1NnN1bV0gPSAiZGY3OWQ5NzkyNzY4MmQyZmQ4YWRiMjk2ODJkMTE0MGIzNDNiZTRh
YzBmMDhmZDY4Yjc3NjVkOWMwNTlkMzk0NSIKIFNSQ19VUklbd2l0LWJpbmRnZW4tMC41MS4wLnNo
YTI1NnN1bV0gPSAiZDcyNDkyMTlmNjZjZWQwMjk2OTM4OGNmMmJiMDQ0YTA5NzU2YTA4M2QwZmFi
MWU1NjYwNTZiMDRkOWZiY2FhNSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4xNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMS44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dXYtYnVpbGRfMC4xMS4xNC5iYgppbmRleCA4YWU1NGYwZjU2Li5mNDQzMzQyZTZiIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS44
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8w
LjExLjE0LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyBcCiAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQXBhY2hlO21k
NT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNEO21kNT1lZjdhNjAyN2RjNGMyMzg5
YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3YzdmMWViNDdmNGZh
NzZiMDg0OGUxZDg4MzgyNTVmNzVmNTc3N2JkYmZiZjA2ZDRhYTY2YmFjMTlhYWQ4MmUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiODk3NTU2NjVlYzUwZDdmMTRkYzQ4ODZjYjg4NTI4OTkwZjAwYTZj
ZDZiNzkzYjQ4YzdiZjE3ZDg2ZjI5MzQxZSIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwog
Ci0tIAoyLjQ3LjEKCg==

--===============6496415371030557845==--

