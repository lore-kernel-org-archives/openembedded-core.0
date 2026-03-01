Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AA5FD006C
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 12:26:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136985.1772367976102498879
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 04:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BVdariRm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75206bce17=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621CKmI83942698;
	Sun, 1 Mar 2026 04:26:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=S44PD7dLh4eX6VQUNQOE9uLy4znhCe7hozn2rM17kSE=; b=
	BVdariRmYmuj058OyyS7FtPxX2Iyps/sKNaHxgk5jzpPYMN8asn2CxQ84VtKjlLN
	344M24RkiIgIUg1Kq4P5kBdNuq/yzp9jLekdHdn6qMLJK+8CdrBylblCrzjUJ06r
	LxHBVrZvA+XDG9B1v9ESWPWHCN7UHny5CdcAfw05Jx4pSxFmQL0EOQiyjc97lNXj
	3eqWOg6ZUnofKEpk++X1h9wceTCMQciGAG3DHYBs8o4znj2H1m+CdVH6OwD2/U/s
	ZtKF49EuKYoqczBEPTjQjpF525sYRFzbcR9HntY+BqmeqBnTR0M6NsCefq76iQdL
	nJhVP2r3goZDmG4DRJdmzA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41456-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 01 Mar 2026 04:26:06 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 1 Mar 2026 04:26:05 -0800
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 1 Mar 2026 04:26:05 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v7 4/7] glib/python3/acl: Add pkgconfig to RDEPENDS
Date: Sun, 1 Mar 2026 04:26:01 -0800
Message-ID: <9d590846d1e71d2911c904144d0a11819b8fedba.1772367692.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1772367692.git.liezhi.yang@windriver.com>
References: <cover.1772367692.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pUuByWXU5OhhPo2Mo7W2JvG8u1J04lre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMiBTYWx0ZWRfX4W8mPwraL1Wn
 RbdYt1DdTJfsqB7prC0BNUa1Qko2yQ6IVuCIw20fEe5gN0dBP4vnxtogmudEJxSOcIAitGl79Pl
 lAGvXIU/tV9D9fRz+YRZ+waGgp7QvzrqiItsB/CXCpOOoUih2ceUyk1kaY632yYYMU5FCDfWstI
 gdcW+R4jn+GmD7teGCyqI5r62gjnE/2fL2TVOfW5H8xFnaGi0WcH4BKDPKD2NRypWa5/9WEkMdO
 ppUWlRxeKiS1e96W/9mXs9xVjSxFurtDRUUxemYjNbuvMNyo+fyxHknGAyXycFBIsMChk30lXgs
 n6gv67X64T0IAqtb7FE9c0EHH4taM+FvlOIWQFd6KbH9YvFXJe1frFECL48Gfx7RbkKsS102kLY
 eUio9SwNOWj7pHpGCHk3r63EmwucafGvgSGuM05cVaTkYmSDDDN5TiDaaSiHc/+Q5szjkOUEg6L
 3MVWUu2fSL+pjt5T9sw==
X-Proofpoint-GUID: pUuByWXU5OhhPo2Mo7W2JvG8u1J04lre
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a4305e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=cQkoBJ3bwYSCJnzXndgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 12:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232138

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

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc            | 2 +-
 meta/recipes-devtools/python/python3_3.14.3.bb | 2 ++
 meta/recipes-support/attr/acl_2.3.2.bb         | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d1f25ef8f2..377c6a323d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -159,7 +159,7 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-dev += "${PN}-utils"
+RDEPENDS:${PN}-dev += "${PN}-utils pkgconfig"
 
 RDEPENDS:${PN}-ptest += "\
             coreutils \
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index e475c6e042..a85ec3a9bd 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -494,6 +494,8 @@ RDEPENDS:${PN}-pydoc += "${PN}-io"
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


