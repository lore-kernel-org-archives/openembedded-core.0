Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0C9CA5FC8
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8572.1790756226780608257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EBzUGi0p;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 24D711A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6E5260749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF789103298BB;
	Wed, 30 Sep 2026 10:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=95zH+XRayv1cj6PCLVUw6dhVQTHu5G6ESQYlhyx36Q8=;
	b=EBzUGi0pa1NZ2hn6fz4Z3k5jZQiTdBszrEtUud7Ylsj2TlVoBCqYAfg3LQfVlOMWU48Ty1
	4pm+WkuaoRnmSscOZtjRDx4WZIcKNd6uoUdSR2Kz2C2oV5zLQpfzVsAue0B78THn5aGvUH
	mkaUf/nWbzi7VgzmITdDX27MyniNRuR3olBLdzc4KtBpw5HeAFbip3z6UNelahns4raBsW
	R4lr4NDIpCGH2ZzaXkCxFacr2sAH7MZXp2bxVsL6rvzWr1SAPCcbpiQvld+2g2uh9oH1Ou
	qItgj5veHGJvL/1B2s9D7x1fibdMq4erKS0YkPPLa7rnrJGmUT/XWG05G+CUyg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:45 +0200
Subject: [PATCH 20/24] python3-uv-build: upgrade 0.12.19 -> 0.12.20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-20-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=8078;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=MAQaStdHwygpo8LzCwnz+4HCz1i1GnfdmNY6oLo47HI=;
 b=8+2iMaQsrrH0Lb7Bl2DM4UZMdDqzXqT7VdgMTK4ufk6vXKK8jnFT26k54D2xEnkv0gHar0yxh
 tXmI8K5z20eDTBT6z3N+BJtJOM3+0PUSnN7fLAlkTvviIs6GBIjCEtX
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246944

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/python3-uv-build-crates.inc               | 20 ++++++++++----------
 ...-build_0.12.19.bb => python3-uv-build_0.12.20.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 3ba46dd5de9a..a21746312ebf 100644
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
index 9004a762480d..0a590d16564d 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.19.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "6b605574da32cefd4264727f7e391e77fe289686192a7eb772e69b3e705da577"
+SRC_URI[sha256sum] = "1d6906511beb61469ca638e1cd97472c9e887c4d03495eba91bab14fd68920c7"
 
 require ${BPN}-crates.inc
 

-- 
2.47.3


