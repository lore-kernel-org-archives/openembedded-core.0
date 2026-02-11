Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B789EB5967
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10531.1770780017325433254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mqzUIWkK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e9d17b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B1U2KP3781698
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=69y5Bc95gn9XoZ+6/acmI+aMKnPRiVYPNRXIjGr0UIY=; b=mqzUIWkKc313
	vDyBrHnPl/wR/2P+hrUG8n3Xo0BUtdFP5+/X/fvCYyXFJn8XOTa1LQj+ouAxGNjp
	7dzOEbUDEmCyDiGtFdH4r9b+ZfIMqkT6vMVHpjbilh6MzNzKN5HcL7KQj2AFtbBE
	Xm5uaPd4giWVDCTWq2w/yHOFrtF0SZG+jT2MLqDfhysPp+QBsgCuU0fNikmw6VyT
	2TNCe4uVZGmV4brh7SGe0ACZ+/72s4nWMkBkC4opATX5A12LtUoAGwrfzfxX4Y0R
	Hp5FzVgLin/O9yYWoCABu3MKMbLPQdsOzb1MwItpAqaGQ4N4fK1sLIbe/HpYMkYf
	ZqaiEyUsAA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4uyx9-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 19:20:15 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 19:20:15 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 4/7] glib/python3/acl: Add pkgconfig to RDEPENDS
Date: Tue, 10 Feb 2026 19:20:11 -0800
Message-ID: <da290c16e090e47c2a7ffeb9d1ad905b88191076.1770779786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770779786.git.liezhi.yang@windriver.com>
References: <cover.1770779786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698bf570 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=npddxdQffQXCx6DdGT8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DTZvmj9dhbrININKenZQ5cM-66A4rzYG
X-Proofpoint-GUID: DTZvmj9dhbrININKenZQ5cM-66A4rzYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNSBTYWx0ZWRfX/eI88BsYQlrF
 phVGSiRa33PBbuIFiSGxWHqdeDqKhC3hiYDD9ThNO6eyoBV4jINynhkzUgYL5/CH+23bjbJMhYK
 ppbNhy/NxLil/+Gb/Qyi0RapGS3Vs/n1b1aFnps+9c/8b1VLFm32OA/w5TQnQWCI6g3Z9jqdgBv
 qmMzHerPh1ySqSBftIAlU10SRSBTSFajrWqIkKCGCGbNV+o1Unvs+0/E70PagFZgypdRV2PWsja
 kroyDV5FEiZyw+tsaLzqDo+Cyuaf8wNc9qf4thJJlCsggSeQ2CHybS92okGwPyE+SsTu6a/X1GY
 KfpX2y+WCh6fa9DQXW5Uzd1HafowxL25SOWv+L9VJGhQpz58qC4iynuDiW5JxDtnceLGQdY7rK7
 6J1EySMLVq6OaDh7KFW/nID4FeO3J8+tvQajvN3WdPiq4+mWo7abUiXQxN4bjdYc3ElxGATMbW8
 orU1blJocvJUvFNud8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230954

From: Robert Yang <liezhi.yang@windriver.com>

Fixed issues like::
Error:
 Problem 1: package python3-ptest-3.14.2-r0.cortexa15t2hf_neon from oe-repo requires python3-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by python3-dev-3.14.2-r0.cortexa15t2hf_neon from oe-repo
 Problem 2: package libglib-2.0-ptest-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo requires glib-2.0-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by libglib-2.0-dev-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo
(try to add '--skip-broken' to skip uninstallable packages or '--setopt=optional_metadata_types=filelists' to load additional filelists metadata)

This is because the rpm 6.0.1 can find the pkg-config files (.pc)
provides/requires correctly now, the rpm 4.20.1 couldn't find that.
---
 meta/recipes-core/glib-2.0/glib.inc            | 2 +-
 meta/recipes-devtools/python/python3_3.14.2.bb | 2 ++
 meta/recipes-support/attr/acl_2.3.2.bb         | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e15cc7675..3d733e21ae 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -159,7 +159,7 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-dev += "${PN}-utils"
+RDEPENDS:${PN}-dev += "${PN}-utils pkgconfig"
 
 RDEPENDS:${PN}-ptest += "\
             coreutils \
diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
index 7481e70e13..7af828684e 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -493,6 +493,8 @@ RDEPENDS:${PN}-pydoc += "${PN}-io"
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
 RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 
+RDEPENDS:{PN}-dev += "pkgconfig"
+
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index a405cc2692..1a6c9136e9 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -67,4 +67,6 @@ RDEPENDS:${PN}-ptest = "acl \
                         perl-module-posix \
                        "
 
+RDEPENDS:${PN}-dev = "pkgconfig"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.1


