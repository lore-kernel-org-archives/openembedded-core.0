Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF79C67871
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 08:38:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4234.1666859923685876697
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 01:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hVpimOYO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7299a514d3=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29R6jRHf005737
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 01:38:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=0adTOWM7juvhNUDc9senPfM6c10vBRKuHaNnJtbu8y0=;
 b=hVpimOYOZWueONXEqmXv6Gy+4cMVGdSj6iYyhmorFcv+nzqQur60QOsLh6expJ8zyyce
 B85MOJ9aN3FUK08rSZzC3JZpJ9fu0rQZywTj94riVDykVj44SHGw0OtKwLNlil6zNb3S
 F21YHFJNX+bog1CSzNSsljMC3lsjlLKkT74ikoRxyr3uekIrejynHBp2zptMwl80eiwZ
 zK8haQBk/H9EvoBE1s1O0u4ot5x1OcMx0uq1ro0SlN6Kz3ztVWCYDHazChfUioNE0/2m
 qqq10rtGV/S/HzhJBLIyZTv6JgzXoMUbmwy7ByrDmAQwBp/95RTi/NI8/vDbUO3ssi7P Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3gr933-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 01:38:43 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29R8bpot020677
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 01:38:42 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3gr931-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 27 Oct 2022 01:38:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 27 Oct 2022 01:38:41 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 27 Oct 2022 01:38:39 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>,
        Alexander Kanavin <alex@linutronix.de>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 -> 1.2.0
Date: Thu, 27 Oct 2022 08:35:42 +0000
Message-ID: <20221027083541.1757707-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Bu9JM6yJ8hVuaXNDvqeKJJX571xxB-_9
X-Proofpoint-ORIG-GUID: Xs5i1LS-QpOjnK1gYdbFknMYsM-9AoG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_03,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 08:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172188

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=f273900e846b8ac416c9d579db32a08c2f34141e

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (59%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
similarity index 59%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
index 71e5d96ba1..11e5f326bd 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
@@ -2,16 +2,18 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
+SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
+                  ${PYTHON_PN}-markupsafe \
                   ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-pygments \
                   ${PYTHON_PN}-threading \
 "
 
-- 
2.34.1


