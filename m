Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA861C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 11:31:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12457.1691062301972003893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 04:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CN5aZ207;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757996d9fc=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 373AxGk3004824
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Aug 2023 11:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/8nKB
	9oI5xe9/HT5d8S/3GO1IXaNwW1jgsY7SSuB9pM=; b=CN5aZ207dKux5KvrUt66T
	0s0P7ZdAMUGkcWecfYHWB8bWGanERWeH0zHdYKOxNoDpdigd3ouUdXnNEtl7sUdi
	RziHDP+LjdkeSrC0CZ4dpuTNq0ENd8bsaCyu57NDetBqz9ayWn2AGeezg/iJRSsR
	yCBP6jBk7P3uH6fkdN1dS5peLyE/uX/6qy89robZ8kQAc+2kJQ3baM5dLZz4yFga
	roLZjqK0rRE1Wc508BhQLZj36dJE1bVl2ihfzUGLKegE0cnBLMqsFtRGMHRviBLv
	ALRJaSvmtREcVrwzOwl3+OIUoVS9YBi4xeQLsF+6B36j/ad/2B4mA7pF2Db8fNdd
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4sr64qsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:31:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 04:31:38 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][mickledore][PATCH 1/1] python3-certifi: upgrade 2022.12.7 -> 2023.7.22
Date: Thu, 3 Aug 2023 11:31:17 +0000
Message-ID: <20230803113117.356232-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: eEl7FCPXZfVzwyXrmtIadG0NegrmhoGv
X-Proofpoint-ORIG-GUID: eEl7FCPXZfVzwyXrmtIadG0NegrmhoGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_10,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308030103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 11:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185474

From: Narpat Mali <narpat.mali@windriver.com>

python3-certifi 2023.7.22 contains the CVE-2023-37920 fix.

No changelog provided. Commits:

8fb96ed (tag: 2023.07.22) 2023.07.22
afe7722 Bump actions/setup-python from 4.6.1 to 4.7.0 (#230)
2038739 Bump dessant/lock-threads from 3.0.0 to 4.0.1 (#229)
44df761 Hash pin Actions and enable dependabot (#228)
8b3d7ba (tag: 2023.05.07) 2023.05.07
53da240 ci: Add Python 3.12-dev to the testing (#224)
c2fc3b1 Create a Security Policy (#222)
c211ef4 Set up permissions to github workflows (#218)
2087de5 Don't let deprecation warning fail CI (#219)
e0b9fc5 remove paragraphs about 1024-bit roots from README
9427a5a fix CI
fed4048 get CI passing again
9e9e840 (tag: 2022.12.07) 2022.12.07

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...ython3-certifi_2022.12.7.bb => python3-certifi_2023.7.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2022.12.7.bb => python3-certifi_2023.7.22.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb b/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
rename to meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
index dca3d26811..f63b0b6cb8 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2023.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c2b7404369c587c3559afb604fce2f2"
 
-SRC_URI[sha256sum] = "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
+SRC_URI[sha256sum] = "539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082"
 
 inherit pypi setuptools3
 
-- 
2.40.0


