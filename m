Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC8CC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:54:43 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web11.69338.1742918079740445917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 08:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=aVVqVIIN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=2179673b40=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDnnRY016114
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 15:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=UBFmROsgIPbZUEUDjcU+lABEEg
	VfCMM6V82Ny7n3OLM=; b=aVVqVIINy3uXiEMDV428vdmGfheF+jm6jLVCrbaT+k
	XY269wHXy0+oW+JHPbylpzImyrzWUtrimfF/zc271eVjWRqSJcicuwgyJyAG2RdA
	+HrtAxYUkm6Mcygs42esRGlWVwLVl1Vp1XSANuQFyl93UARRX0jNqKvlvOMvB2U+
	cRIcDYacdOtAgWbtyWL8jmLxoxG9N0tJ5S0BT9AV3JGT5tSzn6zZvyAO4qZetxc2
	ZIhkrBitCFn0lYjUFMjcHaW5Cu1+3kG4MikX8xoRXFrk2liRegofx0yCSGXSQ/zK
	+RPUVzS66FwrbitKnVJLpFqjk41zi2B40C5pZyaqPxGQ==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 45kwqbjp0k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 15:54:38 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 25 Mar 2025 10:54:37 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Tue, 25 Mar 2025 10:54:36
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH] perl-ptest: copy xconfig data from perl source directory
Date: Tue, 25 Mar 2025 21:21:48 +0530
Message-ID: <20250325155148.981445-1-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FKUjM6rCdshGoZ75LZ6sI0YWoAhCxai9
X-Proofpoint-ORIG-GUID: FKUjM6rCdshGoZ75LZ6sI0YWoAhCxai9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503250111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 15:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213604

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
index e07355d3f5..42d46dfd78 100644
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
 }
 
 python populate_packages:prepend() {
-- 
2.34.1


