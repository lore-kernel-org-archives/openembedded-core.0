Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53607CA5FAE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1849.1790662721876065690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ggmIeRVg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LirO1uXR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0ebd0bdf8-11e17308-1431-4340-9eac-01f7f5ae65e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/A1KB7SIwYaZ94n2XGxp/3yBfMJDHrB7+Q0xYwBSJGs=;
	b=ggmIeRVgXiB/Pp7uHNZlFQ+Ylw1yHYY3S0oA2+Z2Ny/lFRScYFplQpGBxJ7rIzql
	qFrM1ccCps3S0Orjjf0CdyyC2AIpezMFgVmFcL/uL+uHDGqrqJfMfaeuA2KIIC3kSN1
	Q3wlBIVmep4PpKfvFx6i+hYIGyvIfzbncOg8DsTE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/A1KB7SIwYaZ94n2XGxp/3yBfMJDHrB7+Q0xYwBSJGs=;
	b=LirO1uXRdSFoVfyYW5gYxidI3X/f2PR6lIE2NAwcofSW09IpU2E4DNEoqberyKbP
	TinawwQ4yEAPeLvW/FMQNytA/AGGlfXNOUVcVQkvuHoLw4GwVDDFldtQsL++E69xAiC
	LEn1J7ovQzDpGDE34HRDhsH9mTw9exWBjCIhva3o=
Content-Type: multipart/mixed; boundary="===============2193752545070115015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.20 SUCCEEDED
Message-ID: <010101a0ebd0bdf8-11e17308-1431-4340-9eac-01f7f5ae65e3-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246830

--===============2193752545070115015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.19-0.12.20.patch
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
From 2d7c18a69ef27710970df51e09d630994c7de8e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:29:31 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.19 -> 0.12.20

---
 .../python/python3-uv-build-crates.inc        | 20 +++++++++----------
 ...0.12.19.bb => python3-uv-build_0.12.20.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.19.bb => python3-uv-build_0.12.20.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 3ba46dd5de..a21746312e 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -70,7 +70,7 @@ SRC_URI += " \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
-    crate://crates.io/flate2/1.1.9 \
+    crate://crates.io/flate2/1.1.10 \
     crate://crates.io/foldhash/0.1.5 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
@@ -103,7 +103,7 @@ SRC_URI += " \
     crate://crates.io/icu_provider/2.1.1 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/indexmap/2.14.1 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/insta/1.48.0 \
     crate://crates.io/io-extras/0.19.0 \
@@ -131,14 +131,14 @@ SRC_URI += " \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/maybe-owned/0.3.4 \
     crate://crates.io/memchr/2.8.3 \
-    crate://crates.io/miniz_oxide/0.8.9 \
+    crate://crates.io/miniz_oxide/0.9.1 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
     crate://crates.io/munge_macro/0.4.7 \
     crate://crates.io/nu-ansi-term/0.50.3 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/owo-colors/4.3.0 \
+    crate://crates.io/owo-colors/4.4.0 \
     crate://crates.io/parking/2.2.1 \
     crate://crates.io/parking_lot/0.12.5 \
     crate://crates.io/parking_lot_core/0.9.12 \
@@ -210,7 +210,7 @@ SRC_URI += " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
-    crate://crates.io/syn/3.0.3 \
+    crate://crates.io/syn/3.0.4 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tar-codec/0.0.14 \
     crate://crates.io/tar-framing/0.0.14 \
@@ -379,7 +379,7 @@ SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
-SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
+SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
 SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
@@ -412,7 +412,7 @@ SRC_URI[icu_properties_data-2.1.2.sha256sum] = "616c294cf8d725c6afcd8f55abc17c56
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
+SRC_URI[indexmap-2.14.1.sha256sum] = "07aa2048142242915a31d35844fb311e0e53fcca590c3a0a40dcf1b841fa09eb"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[io-extras-0.19.0.sha256sum] = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
@@ -440,14 +440,14 @@ SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[maybe-owned-0.3.4.sha256sum] = "4facc753ae494aeb6e3c22f839b158aebd4f9270f55cd3c79906c45476c47ab4"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
-SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
+SRC_URI[miniz_oxide-0.9.1.sha256sum] = "b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
 SRC_URI[munge_macro-0.4.7.sha256sum] = "4568f25ccbd45ab5d5603dc34318c1ec56b117531781260002151b8530a9f931"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[owo-colors-4.3.0.sha256sum] = "d211803b9b6b570f68772237e415a029d5a50c65d382910b879fb19d3271f94d"
+SRC_URI[owo-colors-4.4.0.sha256sum] = "13c45bb4a6ae1280ec0803b1ef9d3455eb50f01efbbe1447ab020f1d54fba9d8"
 SRC_URI[parking-2.2.1.sha256sum] = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
 SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
 SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
@@ -519,7 +519,7 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
-SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
+SRC_URI[syn-3.0.4.sha256sum] = "e6275cddf4610d1775e6d1fe9469b2e77d0f39fd98fb7450901b821e0c53649f"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tar-codec-0.0.14.sha256sum] = "7ea42eb144d30fcbf32c26dfea8959175bb8335bfb7b18d20c6ed32edecf0551"
 SRC_URI[tar-framing-0.0.14.sha256sum] = "783223a7a6590be4227cb821e7ce80372575511f67c824921aba0752d8ad5573"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.20.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.20.bb
index 9004a76248..0a590d1656 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "6b605574da32cefd4264727f7e391e77fe289686192a7eb772e69b3e705da577"
+SRC_URI[sha256sum] = "1d6906511beb61469ca638e1cd97472c9e887c4d03495eba91bab14fd68920c7"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2193752545070115015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.19.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://
 crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/
 digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://cra
 tes.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 
 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-col
 ors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://cra
 tes.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.
 1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/
 0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate
 ://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/wind
 ows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://c
 rates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.20.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-
 version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crate
 s.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/
 0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_propert
 ies_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.1 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/m
 atchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_u
 tf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io
 /scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.4 crate://crates.io/synstructure/0.1
 3.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.
 6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io
 /windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 cr
 ate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.19" to "0.12.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4486369 to 4490465 (+0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.19 [default] to 0.12.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.20.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.20.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.19" to "0.12.20"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.20.dist-info

--===============2193752545070115015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.19-0.12.20.patch"

RnJvbSAyZDdjMThhNjllZjI3NzEwOTcwZGY1MWUwOWQ2MzA5OTRjN2RlOGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6Mjk6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMTkgLT4gMC4xMi4yMAoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCAyMCArKysrKysrKystLS0t
LS0tLS0tCiAuLi4wLjEyLjE5LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMi4yMC5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTIuMTkuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjIwLmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggM2JhNDZkZDVkZS4uYTIxNzQ2MzEyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTcwLDcgKzcwLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mYXN0
cmFuZC8yLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmluZC1tc3ZjLXRvb2xzLzAuMS45
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9maXhlZGJpdHNldC8wLjUuNyBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZmxhdGUyLzEuMS45IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9mbGF0ZTIv
MS4xLjEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mb2xkaGFzaC8wLjEuNSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZm9sZGhhc2gvMC4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Zv
cm1fdXJsZW5jb2RlZC8xLjIuMiBcCkBAIC0xMDMsNyArMTAzLDcgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvdmlkZXIvMi4xLjEgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2lkbmEvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lkbmFfYWRhcHRl
ci8xLjIuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kZXhtYXAvMi4xNC4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9pbmRleG1hcC8yLjE0LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2luZG9jLzIuMC43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0YS8xLjQ4LjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2lvLWV4dHJhcy8wLjE5LjAgXApAQCAtMTMxLDE0ICsxMzEsMTQg
QEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYXRjaGVycy8wLjIuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWF5YmUtb3duZWQvMC4zLjQgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL21lbWNoci8yLjguMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaXpfb3hp
ZGUvMC44LjkgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbml6X294aWRlLzAuOS4xIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9taW8vMS4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL211
bmdlLzAuNC43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tdW5nZV9tYWNyby8wLjQuNyBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbnUtYW5zaS10ZXJtLzAuNTAuMyBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vb25jZV9jZWxsLzEuMjEuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9j
ZWxsX3BvbHlmaWxsLzEuNzAuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3dvLWNvbG9ycy80
LjMuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3dvLWNvbG9ycy80LjQuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcGFya2luZy8yLjIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGFy
a2luZ19sb3QvMC4xMi41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wYXJraW5nX2xvdF9jb3Jl
LzAuOS4xMiBcCkBAIC0yMTAsNyArMjEwLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zdHJpcC1hbnNpLWVzY2FwZXMvMC4yLjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3N0cnNpbS8wLjExLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTE4IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMy4wLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3N5bi8zLjAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luc3RydWN0dXJlLzAuMTMuMiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWNvZGVjLzAuMC4xNCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGFyLWZyYW1pbmcvMC4wLjE0IFwKQEAgLTM3OSw3ICszNzksNyBAQCBTUkNfVVJJ
W2Vycm5vLTAuMy4xNC5zaGEyNTZzdW1dID0gIjM5Y2FiNzE2MTdhZTBkNjNmNTFhMzZkNjlmODY2
MzkxNzM1YjUxNjkxZGJkYQogU1JDX1VSSVtmYXN0cmFuZC0yLjUuMC5zaGEyNTZzdW1dID0gImRh
N2M2MmNlYWUyMDdkZDM3ZWE1Yjg0NWRhNmEwNjk2Yzc5OWY4NWU5N2RhMWFiNWI3OTEwYmUzYzFj
ODAyMjMiCiBTUkNfVVJJW2ZpbmQtbXN2Yy10b29scy0wLjEuOS5zaGEyNTZzdW1dID0gIjViYWVi
YzA3NzQxNTFmOTA1YTFhMmNjNDE5ODkzMDBiMWU2ZmJiMjlhZmYwY2VmZmExMDY0ZmRkMzA4OGQ1
ODIiCiBTUkNfVVJJW2ZpeGVkYml0c2V0LTAuNS43LnNoYTI1NnN1bV0gPSAiMWQ2NzRlODEzOTFk
MWUxYWI2ODFhMjhkOTlkZjA3OTI3YzZkNGFhNWIwMjdkN2RhMTZiYTMyZDFkMjFlY2Q5OSIKLVNS
Q19VUklbZmxhdGUyLTEuMS45LnNoYTI1NnN1bV0gPSAiODQzZmJhMjc0NmU0NDhiMzdlMjZhODE5
NTc5OTU3NDE1YzhjZWYzMzliZjA4NTY0ZmU4YjdkZGJkOTU5NTczYyIKK1NSQ19VUklbZmxhdGUy
LTEuMS4xMC5zaGEyNTZzdW1dID0gIjZlNjM0ZTJlMGViYWMxZWUwMzQwMjBkYTFjYTU4MmUxN2Zm
ZTRlMGY1ZTk4NTgyMzcyMWUxNjg5MjgxMzZkY2IiCiBTUkNfVVJJW2ZvbGRoYXNoLTAuMS41LnNo
YTI1NnN1bV0gPSAiZDljNGY1ZGFjNWUxNWMyNGViOTk5YzI2MTgxYTZjYTQwYjM5ZmU5NDZjYmU0
YzI2M2M3MjA5NDY3YmM4M2FmMiIKIFNSQ19VUklbZm9sZGhhc2gtMC4yLjAuc2hhMjU2c3VtXSA9
ICI3N2NlMjRjYjU4MjI4ZmJiOGFhMDQxNDI1YmIxMDUwODUwYWMxOTE3NzY4NmVhNmUwZjQxYTcw
NDE2ZjU2ZmRiIgogU1JDX1VSSVtmb3JtX3VybGVuY29kZWQtMS4yLjIuc2hhMjU2c3VtXSA9ICJj
YjRjYjI0NTAzODUxNmY1Zjg1Mjc3ODc1Y2RhYTRmN2QyYzlhMGZhMDQ2OGRlMDZlZDE5MDE2M2Ix
NTgxZmNmIgpAQCAtNDEyLDcgKzQxMiw3IEBAIFNSQ19VUklbaWN1X3Byb3BlcnRpZXNfZGF0YS0y
LjEuMi5zaGEyNTZzdW1dID0gIjYxNmMyOTRjZjhkNzI1YzZhZmNkOGY1NWFiYzE3YzU2CiBTUkNf
VVJJW2ljdV9wcm92aWRlci0yLjEuMS5zaGEyNTZzdW1dID0gIjg1OTYyY2YwY2UwMmUxZTBhNjI5
Y2MzNGU3Y2EzZTM3M2NlMjBkZGE0YzRkNzI5NGJiZDBiZjFmZGI1OWU2MTQiCiBTUkNfVVJJW2lk
bmEtMS4xLjAuc2hhMjU2c3VtXSA9ICIzYjA4NzVmMjNjYWEwMzg5ODk5NGY2ZGRjNTAxODg2YTQ1
YzdkM2Q2MmQwNGQyZDkwNzg4ZDQ3YmUxYjFlNGRlIgogU1JDX1VSSVtpZG5hX2FkYXB0ZXItMS4y
LjEuc2hhMjU2c3VtXSA9ICIzYWNhZTk2MDk1NDBhYTMxOGQxYmM1ODg0NTUyMjVmYjIwODViOWVk
MGM0ZjZiZDBkOWQ1YmNkODZmMWEwMzQ0IgotU1JDX1VSSVtpbmRleG1hcC0yLjE0LjAuc2hhMjU2
c3VtXSA9ICJkNDY2ZTk0NTRmMDhlNGE5MTFlMTQ4MDZjMjRlMTZmYmExYjRjMTIxZDFlYTQ3NDM5
NmYzOTYwNjljZjk0OWQ5IgorU1JDX1VSSVtpbmRleG1hcC0yLjE0LjEuc2hhMjU2c3VtXSA9ICIw
N2FhMjA0ODE0MjI0MjkxNWEzMWQzNTg0NGZiMzExZTBlNTNmY2NhNTkwYzNhMGE0MGRjZjFiODQx
ZmEwOWViIgogU1JDX1VSSVtpbmRvYy0yLjAuNy5zaGEyNTZzdW1dID0gIjc5Y2Y1YzkzZjkzMjI4
Y2Y4ZWZiM2JhMzYyNTM1ZmIxMTE5OWFjNTQ4YTA5Y2UxMTdjOWIxYWRjMzAzMGQ3MDYiCiBTUkNf
VVJJW2luc3RhLTEuNDguMC5zaGEyNTZzdW1dID0gIjg2ZjBmOGZlZThjOTI2NDE1YzU4ZDZhZTQz
YTA4NTIzYTI2ZmFjY2IyMzIzZjVlNmI2NDRmZTdkZDRlZjZiODIiCiBTUkNfVVJJW2lvLWV4dHJh
cy0wLjE5LjAuc2hhMjU2c3VtXSA9ICIyMGZkNmRlNGNjZmNjMTg3ZTM4YmMyMWNmYTU0M2NiNWEz
MDJjYjg2YThiMTE0ZWI3ZjBiZjBkYzlmOGFjMDBmIgpAQCAtNDQwLDE0ICs0NDAsMTQgQEAgU1JD
X1VSSVttYWlscGFyc2UtMC4xNi4xLnNoYTI1NnN1bV0gPSAiNjA4MTlhOTdkZGNiODMxYTU2MTRl
YjNiMDE3NGYzNjIwZTc5M2U5N2UKIFNSQ19VUklbbWF0Y2hlcnMtMC4yLjAuc2hhMjU2c3VtXSA9
ICJkMTUyNWEyYTI4YzdmNGZhMGZjOThiYjkxYWU3NTVkMWUyZDE1MDUwNzllMDU1MzllMzViYzg3
NmI1ZDY1YWU5IgogU1JDX1VSSVttYXliZS1vd25lZC0wLjMuNC5zaGEyNTZzdW1dID0gIjRmYWNj
NzUzYWU0OTRhZWI2ZTNjMjJmODM5YjE1OGFlYmQ0ZjkyNzBmNTVjZDNjNzk5MDZjNDU0NzZjNDdh
YjQiCiBTUkNfVVJJW21lbWNoci0yLjguMy5zaGEyNTZzdW1dID0gImNmOGJhZjFjNTVlNjJmZmNh
Y2U3YTlmMDZmNGJkOWNkM2YwYzRiZWIwMjJkM2IzNjcyNTZiOTFiODc1MTNkOTgiCi1TUkNfVVJJ
W21pbml6X294aWRlLTAuOC45LnNoYTI1NnN1bV0gPSAiMWZhNzZhMmM4NmY3MDRiZGIyMjJkNjY5
NjVmYjNkNjMyNjljZTM4NTE4YjgzY2IwNTc1ZmNhODU1ZWJiNjMxNiIKK1NSQ19VUklbbWluaXpf
b3hpZGUtMC45LjEuc2hhMjU2c3VtXSA9ICJiNjNmYmM0YTUwODYwZTk4ZTdiMmFhNzgwNGRlZDFk
YjVjYmMzYWZmOTE5M2FkYWZmNTdhNjkzMWJmN2M0YjRjIgogU1JDX1VSSVttaW8tMS4yLjAuc2hh
MjU2c3VtXSA9ICI1MGI3ZTViMjdhYTAyYTc0YmFjOGMzZjIzZjQ0OGY4ZDg3ZmYxMWY5MmQzYWFj
MWE2ZWQzNjllZTA4Y2M1NmMxIgogU1JDX1VSSVttdW5nZS0wLjQuNy5zaGEyNTZzdW1dID0gIjVl
MTc0MDFmMjU5ZWJhOTU2Y2ExNjQ5MTQ2MWI2ZThmNzI5MTNhMGExMTRlMzk3MzZjZTQwNDQxMGY5
MTVhMGMiCiBTUkNfVVJJW211bmdlX21hY3JvLTAuNC43LnNoYTI1NnN1bV0gPSAiNDU2OGYyNWNj
YmQ0NWFiNWQ1NjAzZGMzNDMxOGMxZWM1NmIxMTc1MzE3ODEyNjAwMDIxNTFiODUzMGE5ZjkzMSIK
IFNSQ19VUklbbnUtYW5zaS10ZXJtLTAuNTAuMy5zaGEyNTZzdW1dID0gIjc5NTdiOTc0MDc0NDg5
MmYxMTQ5MzZhYjRhNTdiM2Y0ODc0OTFiYmVhZmFmODA4MzY4OGIxNjg0MWE0MjQwZTUiCiBTUkNf
VVJJW29uY2VfY2VsbC0xLjIxLjQuc2hhMjU2c3VtXSA9ICI5ZjdjM2U0YmViMzNmODVkNDVhZTNl
M2ExNzkyMTg1NzA2YzhlMTZkMDQzMjM4YzU5MzMzMWNjN2NkMzEzYjUwIgogU1JDX1VSSVtvbmNl
X2NlbGxfcG9seWZpbGwtMS43MC4yLnNoYTI1NnN1bV0gPSAiMzg0YjhhYjZkMzcyMTVmM2M1MzAx
YTk1YTRhY2NiNWQ2NGFhNjA3ZjFmY2IyNmExMWI1MzAzODc4NDUxYjRmZSIKLVNSQ19VUklbb3dv
LWNvbG9ycy00LjMuMC5zaGEyNTZzdW1dID0gImQyMTE4MDNiOWI2YjU3MGY2ODc3MjIzN2U0MTVh
MDI5ZDVhNTBjNjVkMzgyOTEwYjg3OWZiMTlkMzI3MWY5NGQiCitTUkNfVVJJW293by1jb2xvcnMt
NC40LjAuc2hhMjU2c3VtXSA9ICIxM2M0NWJiNGE2YWUxMjgwZWMwODAzYjFlZjlkMzQ1NWViNTBm
MDFlZmJiZTE0NDdhYjAyMGYxZDU0ZmJhOWQ4IgogU1JDX1VSSVtwYXJraW5nLTIuMi4xLnNoYTI1
NnN1bV0gPSAiZjM4ZDU2NTJjMTZmZGU1MTViYjFlY2VmNDUwYWIwZjZhMjE5ZDYxOWE3Mjc0OTc2
MzI0ZDVlMzc3ZjdkY2ViYSIKIFNSQ19VUklbcGFya2luZ19sb3QtMC4xMi41LnNoYTI1NnN1bV0g
PSAiOTM4NTc0NTMyNTBlMzA3N2JkNzFmZjk4YjZhNjVlYTY2MjFhMTliYjBmNTU5YTg1MjQ4OTU1
YWMxMmM0NWExYSIKIFNSQ19VUklbcGFya2luZ19sb3RfY29yZS0wLjkuMTIuc2hhMjU2c3VtXSA9
ICIyNjIxNjg1OTg1YTJlYmYxYzUxNjg4MWMwMjYwMzJhYzdkZWFmY2RhMWEyYzliNzg1MGRjODFl
M2RmY2I2NGMxIgpAQCAtNTE5LDcgKzUxOSw3IEBAIFNSQ19VUklbc3RhYmxlX2RlcmVmX3RyYWl0
LTEuMi4xLnNoYTI1NnN1bV0gPSAiNmNlMmJlOGRjMjU0NTVlMWY5MWRmNzFiZmExMmFkMzdkCiBT
UkNfVVJJW3N0cmlwLWFuc2ktZXNjYXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4ZTdl
Nzk2OWFiYjNmMWI3YzJhODExMjI1ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUiCiBT
UkNfVVJJW3N0cnNpbS0wLjExLjEuc2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3
ZWE1ZDllMjYyODU2NGIzYjA0M2E3MDk0OGEzZjBiNzc4ODM4YzVmYjRmIgogU1JDX1VSSVtzeW4t
Mi4wLjExOC5zaGEyNTZzdW1dID0gIjFiOWFlNTdmOTA0MjEzZWJiNjQ5Y2U2ODk1YjhhNjZjNjZm
MDIwM2I5MzE5NzE4ZjY5YTU2MTJhMDY1YjE0MjIiCi1TUkNfVVJJW3N5bi0zLjAuMy5zaGEyNTZz
dW1dID0gIjUzZTliYWU1ODg0OWY2NGRmYTRmNWQ1YWUzNzJjODM0MWY3MzA1ZjgyYTM4Njg3MDky
NjkzNDM2MjhiNjU5YTMiCitTUkNfVVJJW3N5bi0zLjAuNC5zaGEyNTZzdW1dID0gImU2Mjc1Y2Rk
ZjQ2MTBkMTc3NWU2ZDFmZTk0NjliMmU3N2QwZjM5ZmQ5OGZiNzQ1MDkwMWI4MjFlMGM1MzY0OWYi
CiBTUkNfVVJJW3N5bnN0cnVjdHVyZS0wLjEzLjIuc2hhMjU2c3VtXSA9ICI3MjhhNzBmM2RiYWY1
YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2MGE0YjU1NDljOGE1OTE0MzYxYzk5MTQ3YTcwOWQyIgogU1JD
X1VSSVt0YXItY29kZWMtMC4wLjE0LnNoYTI1NnN1bV0gPSAiN2VhNDJlYjE0NGQzMGZjYmYzMmMy
NmRmZWE4OTU5MTc1YmI4MzM1YmZiN2IxOGQyMGM2ZWQzMmVkZWNmMDU1MSIKIFNSQ19VUklbdGFy
LWZyYW1pbmctMC4wLjE0LnNoYTI1NnN1bV0gPSAiNzgzMjIzYTdhNjU5MGJlNDIyN2NiODIxZTdj
ZTgwMzcyNTc1NTExZjY3YzgyNDkyMWFiYTA3NTJkOGFkNTU3MyIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjE5LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjIwLmJiCmluZGV4IDkwMDRhNzYyNDgu
LjBhNTkwZDE2NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy11di1idWlsZF8wLjEyLjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11di1idWlsZF8wLjEyLjIwLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0Nzli
ZDg5ODY5NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVw
NTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNE
O21kNT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjZiNjA1NTc0ZGEzMmNlZmQ0MjY0NzI3ZjdlMzkxZTc3ZmUyODk2ODYxOTJhN2ViNzcy
ZTY5YjNlNzA1ZGE1NzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWQ2OTA2NTExYmViNjE0Njlj
YTYzOGUxY2Q5NzQ3MmM5ZTg4N2M0ZDAzNDk1ZWJhOTFiYWIxNGZkNjg5MjBjNyIKIAogcmVxdWly
ZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============2193752545070115015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.20.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.20.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.19.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.20.dist-info

--===============2193752545070115015==--

