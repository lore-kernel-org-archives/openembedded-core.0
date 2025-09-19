Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48172CAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 06:48:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10040.1758264528932436322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 23:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Oq6D4ZFH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357189f71=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J5oUdN726591
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=cqvO/1XGmkJERjFt3pHPoBEfQYaUor2g2l9QhChnuhk=; b=Oq6D4ZFHxMSv
	FW29mELOv5KMxf9MHupjRGUB+0ldMk0iw7/6KxA8nlnVjq739RZUXtueknBN6Y0p
	xf2OfKo4I3wTC4OH4J5RQgGqF3iWM6dzqV2219xGbol+FZNiaBm38Q9DLjgmqSHI
	dEHFKgosc14v6xwzNkwSeZJtEuo5VwKQdvLbSGylE1HcZuiofxxlZL11Bo6siq/n
	0WMS2rpxz+3wtXTXbK9LhUEtc4Bee9vxbAi4ATDycvezcREtiwJKGg7tH9n3fQQH
	qi1DCnnjynJOU83RPl4HcsPSzlGxXV3DVd3dwts+6J64bOI4GRbLbkCZ6CFOVnnb
	3+yE/hiUng==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vjw07mh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:48:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 23:48:45 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 23:48:45 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] gawk: Append AGPL-3.0-or-later to LICENSE when pma is enabled
Date: Thu, 18 Sep 2025 23:48:59 -0700
Message-ID: <d619772b36cee9470e7ea8bcb245e98cd8033556.1758264088.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758264088.git.liezhi.yang@windriver.com>
References: <cover.1758264088.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Hrt2G1TS c=1 sm=1 tr=0 ts=68ccfcd0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=tbZuqhzTA99IrQVuh3gA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6Nw9xTqI3owDKbFlPCCgZsNeAliEefer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA2MCBTYWx0ZWRfX3mSmXXWlFTU9
 GXugdkvdnKtoVQZMGgCvEK8TfwHwkM2RAptj+CGOnTb0OjS0Ex7StJbLsOqUy8EIKvzi+KTbzm+
 nR1NX2W6YyvbVNKXaHxIwKL1wL6wUSbkKZK29L9/2HSn+L5fsAcaB/d/z3KpG30SiFDdmglRjb1
 CXSmju90pjl2nuUqiT9mx0rwCD25P7YhMAklJT/lsR9qDjFoW561FrXl+0Q2/Y4URp4y1l7kcjL
 J1msZWz3Rw/Uk8WhedIbg+1nEj1KaQQlByHXcUhUoWt2tpX5x2j8RI1pnGlOtdm5CfTBpcIRxB8
 rcTg2B7vw0sBbyTRHHKCsT91OE8AWGnqqxQZ7RY6sfmFK9ebVrsSj4tRhWexf4=
X-Proofpoint-GUID: 6Nw9xTqI3owDKbFlPCCgZsNeAliEefer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223723

From: Robert Yang <liezhi.yang@windriver.com>

The support/pma.c and support/pma.h's license is AGPL-3.0-or-later, this patch
disables pma by default, and append AGPL-3.0-or-later to LICENSE when pma is
enabled, and print a warning for that.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/gawk/gawk_5.3.2.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
index 833fe78bf9a..75fce0c08a6 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
@@ -6,14 +6,14 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
 BUGTRACKER  = "bug-gawk@gnu.org"
 SECTION = "console/utils"
 
-# gawk <= 3.1.5: GPL-2.0-only
-# gawk >= 3.1.6: GPL-3.0-only
+# The LICENSE will be "GPL-3.0-only & AGPL-3.0-or-later" when pma is enabled.
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PACKAGECONFIG ??= "readline mpfr"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
+PACKAGECONFIG[pma] = ",--disable-pma"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
@@ -34,6 +34,16 @@ ALTERNATIVE:${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
 ALTERNATIVE_PRIORITY = "100"
 
+python() {
+    packageconfig = (d.getVar('PACKAGECONFIG') or '').split()
+    # The support/pma.c and support/pma.h's license is AGPL-3.0-or-later
+    if 'pma' in packageconfig:
+        bb.warn("Appending AGPL-3.0-or-later to LICENSE since pma is enabled")
+        d.appendVar('LICENSE', ' & AGPL-3.0-or-later')
+        d.appendVar('LIC_FILES_CHKSUM', ' file://support/pma.h;endline=21;md5=32bd750ee5aa5cbcf7978c1be6462b8a \
+                    file://support/pma.c;endline=28;md5=a3f33ec236ab96537cdfd1dcda270c75')
+}
+
 do_install:append() {
 	# remove the link since we don't package it
 	rm ${D}${bindir}/awk
-- 
2.49.0


