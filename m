Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD7B971B1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 23:59:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r16-v6so15652501wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hTJ08IKyhNwR4GJRjnvNji3NWjZUGGPedmiLczp25g0=;
	b=kU7li2XlfGZZG1+dIs/mndQXQzSt/CL95kDyu306XIBQmkd0G5ZMqXS5Hvnt6LrlM8
	tj8KKcXeFBctAk/qafpy9c85864A25CrVvKecPyfTehDMIResF1RNij+3IrEWebiv6Eb
	kO2ex5tV1C9Iq79ue2UWFh0pgXWaz33R4Eaply6jxwvor3npNeDWQdBW5uYqrLaYNGsw
	/0wCZM4vVPh0wsIeVO6VtyRRfb55gWp66Z1BxGQ2W4UaFNHFcjsRXn2YU1XjP0QuuM1R
	nFFZ4FcafSdNYCdR/okxCPhJYkJkU7/d5B6QuYNpKa+qkVnq9003rQKaMUuZTBLejMrB
	25mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hTJ08IKyhNwR4GJRjnvNji3NWjZUGGPedmiLczp25g0=;
	b=NCpp77+sRHBQ3xYsDKTg1FPomcqdndnUICLM56NWH59jk5nOh0r8r6+i9tJ1g0agnl
	S660cosy6MSDFdHEVd8htF/igUP3tEjSmZ/9+0x+CzdIxaLARlgW+RNUcBVUloBjT3M+
	uiOcH7/oI0kvj/3eWKzidj1vEQvJd01gjSCxpFEPfiUjMC9j8LFTmKI3riV2WpItaAjF
	rlXIA5YGPJupia3MA/+LT9D4WG6xIESBnNvAwM5qlAfIm6TBoE4ZDAKlJNvHjeoP5Iuu
	4jHk5HzdN6tErJodXJrTYCaz6dcMke1mRk6koS5BYa07K7qedhFkNGFkymQCk22jEjxn
	BuoA==
X-Gm-Message-State: AOUpUlFwmn9ljFJXLvAO3EnBi4T1CL4SFZ2qE/nDwaUIaxQFFuhlXO4M
	pA1aNaAZK/7jEpiPmpFYaJXafyuNLCY=
X-Google-Smtp-Source: AA+uWPy1PgZedSshRUd4MOChcKRPIBrUSUFbALiP7lQFyH/RuY3/hNEhBWzpcuVZw2P2+15nTwwb5w==
X-Received: by 2002:a5d:4f82:: with SMTP id
	d2-v6mr11797343wru.261.1534204781989; 
	Mon, 13 Aug 2018 16:59:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o14-v6sm16294252wmd.35.2018.08.13.16.59.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 16:59:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 00:59:39 +0100
Message-Id: <20180813235939.26006-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bzip2: use Yocto Project mirror for SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 23:59:42 -0000

The bzip.org domain expired and is now a holding site for adverts, so we can't
trust a tarball that appears on that site (luckily we have source checksums to
detect this).

For now, point SRC_URI at the tarball in the Yocto Project source mirror, but
set HOMEPAGE and UPSTREAM_CHECK_URI to the sourceware.org/bzip2/ page which
apparently will be resurrected as the new canonical home page.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index de668d6d2b6..acbf80a685b 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -2,13 +2,13 @@ SUMMARY = "Very high-quality data compression program"
 DESCRIPTION = "bzip2 compresses files using the Burrows-Wheeler block-sorting text compression algorithm, and \
 Huffman coding. Compression is generally considerably better than that achieved by more conventional \
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
-HOMEPAGE = "http://www.bzip.org/"
+HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
 PR = "r5"
 
-SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
            file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
@@ -19,7 +19,7 @@ SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
 
-UPSTREAM_CHECK_URI = "http://www.bzip.org/downloads.html"
+UPSTREAM_CHECK_URI = "https://www.sourceware.org/bzip2/"
 
 PACKAGES =+ "libbz2"
 
-- 
2.11.0


