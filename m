Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C081EB64DD
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 14:21:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9275.1687789278202338868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 07:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Ph4B6P7G;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b7e1875cc1so7345745ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687789277; x=1690381277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkZT/KooFTXXkJ4LC4tfESYn7DuYzQmnsA53cNhk+JA=;
        b=Ph4B6P7G3m0VFUCkpJL+0jSVvYuB/H09GKYShTzTnFVRD95MDlATzjSrq7/rM//GrB
         FcddrONFp2RO/oYY9jYTz1CVjKdaETuOjTxs2SyO9p19mt6GzOQOaJCm0EchHg7jrCie
         CeMDH3TRsXRNYsFQIArNsym4ZWBRV9PTqu6A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687789277; x=1690381277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkZT/KooFTXXkJ4LC4tfESYn7DuYzQmnsA53cNhk+JA=;
        b=UJVWeG8nqbNnb6HUqM6j3cri1lVF/9Ck2bGtzBzSyPGIzQmV4pd2OqzLbsTE04oAPJ
         0FVgqZqkY7I0530UP9Q6VIL3rmYvOHWrZ+iPZToHt6JroRaVLQVv8e1Om43Ncw3mify8
         P5jhfpFfefnLnlaXPzd8xxe2OstZ8bRK4olg0575C/HkHInkVHNKOFvR6koZwgQMABHu
         epznNVhHlVBJiJ0gCM7kJPP+VVzlEMf/lCA/Xrw45+9ukFPJTK63pEa9TsnaVy6sWkPH
         mdIk+v7YS3Y6PuwoMdTA02C2d+Ef3X+s8eCMoDLuJSH/Vu7l5MBD/ToKmi3e/P4fnfO9
         /vxQ==
X-Gm-Message-State: AC+VfDx7HaMHd7PMQye/jlG6j/m7fFLW8ZE6J8WaBo3AJshJJaBRo6IZ
	zSHAVhTjyBGsDpajnJIE5OAo81W05abxT4psuAk=
X-Google-Smtp-Source: ACHHUZ70D2PEVQkY0U+NMaEQ2dQviDJ9q5dbOpbPT64mdMzUQyCp0Xq5UtSzfUws3mpbWtaP09FqUA==
X-Received: by 2002:a17:902:8c84:b0:1b6:702b:11a with SMTP id t4-20020a1709028c8400b001b6702b011amr3424539plo.47.1687789277157;
        Mon, 26 Jun 2023 07:21:17 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.146.97])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902748b00b001ac5896e96esm4240862pll.207.2023.06.26.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:21:16 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] Upgrade flac 1.4.2 => 1.4.3
Date: Mon, 26 Jun 2023 19:49:08 +0530
Message-Id: <20230626141908.97141-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 14:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183422

From: Siddharth Doshi <sdoshi@mvista.com>

Changes:

As there have been additions to the libFLAC interfaces, the libFLAC version number is incremented to 13. The libFLAC++ version number stays at 10.

* General
	* All PowerPC-specific code has been removed, as it turned out those improvements didn't actually improve anything
	* Large improvements in encoder speed for all presets. The largest change is for the fastest presets and for 24-bit and 32-bit inputs.
	* Small improvement in decoder speed for BMI2-capable CPUs
	* Various documentation fixes and cleanups (Mark Grassi, Jake Schmidt)
	* Various fixes (Ozkan Sezer, Zhipeng Xue, orbea, Sam James, Harish Mahendrakar)
	* Fix building on Universal Windows Platform (Dmitry Kostjučenko)
* flac
	* A lot of small fixes for bugs found by fuzzing
	* Various improvements to the --keep-foreign-metadata and --keep-foreign-metadata-if-present options on decoding
		* The output format (WAV/AIFF/RF64 etc.) is now automatically selected based on what kind of foreign metadata is stored
		* Decoded file is checked afterwards, to see whether stored foreign format data agrees with FLAC audio properties
		* AIFF-C sowt data can now be restored
	* Add --force-legacy-wave-format option, to decode to WAV with WAVEFORMATPCM where WAVE_FORMAT_EXTENSIBLE would be more appropriate
	* Add --force-aiff-c-none-format and --force-aiff-c-sowt-format to decode to AIFF-C
	* The storage of WAVEFORMATEXTENSIBLE_CHANNEL_MASK is no longer restricted to known channel orderings
	* Throw an error when WAV or AIFF files are over 4GiB in length and the --ignore-chunk-sizes option is not set
	* Warn on testing files when ID3v2 tags are found
	* Warn when data trails the audio data of a WAV/AIFF/RF64/W64 file
	* Fix output file not being deleted after error on Windows
	* Removal of the --sector--align option
* metaflac
	* A lot of small fixes for bugs found by fuzzing
	* Added options --append and --data-format, which makes it possible to copy metadata blocks from one FLAC file to another
	* Added option --remove-all-tags-except
	* Added option --show-all-tags (harridu, Martijn van Beurden)
* libFLAC
	* No longer write seektables to Ogg, even when specifically asked for. Seektables in Ogg are not defined
	* Add functions FLAC__metadata_object_set_raw and FLAC__metadata_object_get_raw to convert between blob and FLAC__StreamMetadata
* Build system
	* Autoconf (configure)
		* The option --enable-64-bit-words is now on by default
	* CMake
		* The option ENABLE_64_BIT_WORDS is now on by default
* Testing/validation
	* Fuzzers were added for the flac and metaflac command line tools
	* Fuzzer coverage was improved

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../flac/{flac_1.4.2.bb => flac_1.4.3.bb}              | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.4.2.bb => flac_1.4.3.bb} (80%)

diff --git a/meta/recipes-multimedia/flac/flac_1.4.2.bb b/meta/recipes-multimedia/flac/flac_1.4.3.bb
similarity index 80%
rename from meta/recipes-multimedia/flac/flac_1.4.2.bb
rename to meta/recipes-multimedia/flac/flac_1.4.3.bb
index d3ece3f3cf..9ef9ca75ef 100644
--- a/meta/recipes-multimedia/flac/flac_1.4.2.bb
+++ b/meta/recipes-multimedia/flac/flac_1.4.3.bb
@@ -5,15 +5,15 @@ BUGTRACKER = "https://github.com/xiph/flac/issues"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=17;md5=146d2c8c2fd287545cc1bd81f31e8758 \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=b1dab2704be7f01bfbd9b7f6d5f000a9 \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=23099119c034d894bd1bf7ef5bd22101 \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
+                    file://COPYING.Xiph;md5=0c90e41ab2fa7e69ca9391330d870221 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4"
+SRC_URI[sha256sum] = "6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70"
 
 CVE_PRODUCT = "libflac flac"
 
@@ -28,8 +28,6 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
     ogg \
 "
-PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
-PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg-libraries=${STAGING_LIBDIR} --with-ogg-includes=${STAGING_INCDIR},--disable-ogg,libogg"
 
-- 
2.25.1


