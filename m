Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2AB766DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:56:10 +0000 (UTC)
Received: by lalv9 with SMTP id v9so25311810lal.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=J5loG2xsMyMXSLGfR5lT9gpKRPfRg/9IO4sjwYXPTL4=;
	b=OYat9NopJGjJpIFhl5IM12lOL53TYXuXSN3ulDsoau8aU7QfEYQCZKnDLX+YWZ162y
	kD+HjbKE7mfdLaRoQQYltXoTp0+OCdWEiSofa06xUBY/VCAn7euHxOxBdJ3z8huCIjBS
	X8RKQRImSESABbxK5u8wkAHHjhrRMKCxhqZqDb82RYXs9UnXGucyc+j6oJ8x+o5oHOIG
	G6ehVJgtP+N19PbkJr1MdNkWlxo5VmwIR15QWokO32qv/2quKBca5d+tHJ8g1Oc0jRAX
	C+m68LGa6Ygf/kiU0V6beil5QVUHXa72wHEa2d10Gb/lyQBa7CPzUho0E1Kf6iV5xt5L
	DrUw==
X-Received: by 10.152.178.133 with SMTP id cy5mr3550639lac.42.1440086170293;
	Thu, 20 Aug 2015 08:56:10 -0700 (PDT)
Received: from umbar.auriga.ru (cl-1614.mbx-01.si.sixxs.net.
	[2001:15c0:65ff:64d::2])
	by smtp.gmail.com with ESMTPSA id y1sm1338070lad.25.2015.08.20.08.56.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 08:56:09 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 18:56:04 +0300
Message-Id: <1440086164-21146-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440086164-21146-1-git-send-email-dbaryshkov@gmail.com>
References: <1440086164-21146-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/2] tune-octeon.inc: add BASE_LIB settings
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
X-List-Received-Date: Thu, 20 Aug 2015 15:56:16 -0000

Provide BASE_LIB settings for octeon* tunes that follow the practice of
mips64/mips64-n32 tunes (lib64 for N64 ABI, lib32 for N32 ABI).

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/machine/include/tune-octeon.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/include/tune-octeon.inc b/meta/conf/machine/include/tune-octeon.inc
index fdd48b5..f24d9db 100644
--- a/meta/conf/machine/include/tune-octeon.inc
+++ b/meta/conf/machine/include/tune-octeon.inc
@@ -8,10 +8,12 @@ TUNEVALID[octeon2] = "Enable optimization related to octeon2 support"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon2", " -march=octeon2 ", "",d)}"
 
 TUNE_FEATURES_tune-octeon2 = "${TUNE_FEATURES_tune-mips64-n32} octeon2"
+BASE_LIB_tune-octeon2 = "lib32"
 MIPSPKGSFX_VARIANT_tune-octeon2 = "octeon2"
 PACKAGE_EXTRA_ARCHS_tune-octeon2 = "mips64-n32 octeon2-n32"
 
 TUNE_FEATURES_tune-octeon2_64 = "${TUNE_FEATURES_tune-mips64} octeon2"
+BASE_LIB_tune-octeon2_64 = "lib64"
 MIPSPKGSFX_VARIANT_tune-octeon2_64 = "octeon2_64"
 PACKAGE_EXTRA_ARCHS_tune-octeon2_64 = "mips64 octeon2_64"
 
@@ -20,9 +22,11 @@ TUNEVALID[octeon3] = "Enable optimization related to octeon3 support"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon3", " -march=octeon3 ", "",d)}"
 
 TUNE_FEATURES_tune-octeon3 = "${TUNE_FEATURES_tune-mips64-n32} octeon3"
+BASE_LIB_tune-octeon3 = "lib32"
 MIPSPKGSFX_VARIANT_tune-octeon3 = "octeon3"
 PACKAGE_EXTRA_ARCHS_tune-octeon3 = "mips64-n32 octeon3-n32"
 
 TUNE_FEATURES_tune-octeon3_64 = "${TUNE_FEATURES_tune-mips64} octeon3"
+BASE_LIB_tune-octeon3_64 = "lib64"
 MIPSPKGSFX_VARIANT_tune-octeon3_64 = "octeon3_64"
 PACKAGE_EXTRA_ARCHS_tune-octeon3_64 = "mips64 octeon3_64"
-- 
2.5.0


