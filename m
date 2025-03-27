Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B54FC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:11:16 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web11.43680.1743055874391512577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=jup2OZ2z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=21814084f2=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5xtQ3003261
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=/IsfKGurNQ5utnLXWvZXRYEdZK
	OCN8T2N1Pv4HA4BAY=; b=jup2OZ2z1Vf2pt/jrTt18ztDc6sq1dp0aXzh92CKpw
	GTRQBYHesNL0NJFXvwP8Jm7f9XYxNNNgCYOuZisgL0SY9qGtIlIyq9Fu1BiQ3Blu
	2/UjxXvzSN0STypLyUSOGNfCVACM2u0ejrhLUNW963Krr0OUDChF3K+M/la/O7Hc
	rLYfc//SE0Gs6pJRlmU7CH8nMz843ozSVN6LSqlkDPuJrgLuxKt+Lqf4M/ixKkdm
	JN22zMlz4oDQj04JYezDfU140wsrebGlk8xPE6zJgeAtd536wyLKZuD1Xmq9QybO
	muNAPXy7bP+LU3JgFn9dQrv4zyg0PDCbZEtRZzv2g9Xw==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 45n0b3gskt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:11:13 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 27 Mar 2025 01:11:11 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 27 Mar 2025 01:11:10
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH] perl-ptest: copy xconfig data from perl source directory
Date: Thu, 27 Mar 2025 11:38:55 +0530
Message-ID: <20250327060855.428041-1-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lCvPe2mpfLzUJJe-ggfg0ZbNjxMEODPK
X-Proofpoint-GUID: lCvPe2mpfLzUJJe-ggfg0ZbNjxMEODPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213704

The following perl ptests:

  - dist/ExtUtils-ParseXS/t/001-basic
  - dist/ExtUtils-ParseXS/t/002-more
  - dist/ExtUtils-ParseXS/t/003-usage
  - cpan/ExtUtils-Constant/t/Constant
  - cpan/ExtUtils-MakeMaker/t/02-xsdynamic

are erroring out with:
| /usr/lib/perl/ptest/perl_langinfo.h:8:10: fatal error:
xconfig.h: No such file or directory
|     8 | #include "xconfig.h"

xconfig.h contains references to the build host architecture and was
removed by commit 2e0f30c46802 ("perl: do not install files that contain
build host specific data")

However, it is still included from various other places including these
tests, and we are still depending on build host architecture data by
including the patches from perl-cross recipe, a dependency to perl recipe.

xconfig.h was added back as a copy step in the commit f90922cdeef5
("update 5.36.1 -> 5.38.0") but was not added back in perl-ptest include
file.

Borrowed the logic from the above commit to make a copy of config.h
that is specific to the target architecture. The changes in this commit
fixes the test failures.

Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 4b4756118c..49d322a848 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -20,6 +20,11 @@ do_install_ptest () {
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
 
+	# xconfig.h contains references to build host architecture, and yet is included from various other places.
+	# To make it reproducible let's make it a copy of config.h patch that is specific to the target architecture.
+	# It is believed that the original header is the product of building miniperl (a helper executable built with host compiler).
+	cp ${D}${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/config.h ${D}${PTEST_PATH}/xconfig.h
+
 	# Remove build host references from various scattered files...
 	find "${D}${PTEST_PATH}" \
 	     \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name '*.pl' -o -name '*.sh' -o -name '*.pm' \
@@ -44,7 +49,7 @@ do_install_ptest () {
 	 sed -i -e '/Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/unicore/mktables.lst
 
 	 # Remove files with host-specific configuration for building native binaries
-	 rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.h ${D}${PTEST_PATH}/xconfig.sh
+	 rm ${D}${PTEST_PATH}/Makefile.config ${D}${PTEST_PATH}/xconfig.sh
 
          # create an empty file that is checked for existence by makerel test
          touch ${D}${PTEST_PATH}/win32/Makefile
-- 
2.34.1


