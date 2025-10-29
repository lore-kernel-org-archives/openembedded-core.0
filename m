Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7D1CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 06:20:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1616.1761718829365015197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 23:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y1oegE1R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33977d2df3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T47hhG1281991
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 23:20:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=yV0mVpXiNK3egL+gOU1U
	3GD7CMRHtCDSFH2BirPiJkM=; b=Y1oegE1RPmwI7lTKiZzu8QI8U+zxVK0ziSZK
	xHxL7xJSY8mOaGDZoM6M7lx9fJVisamRu48Meg70Yxhxn9fA5npgtPDSFiiYQ8na
	3YOrqNesdLVPHndwxWcbz6NYMgKAwP7gv5LIQDI8qczusiLIdb4WkzCJWZ9y6dVJ
	4aNrmszgN/00JUv9HtkIpp0cDSR2aPPcN0XyLoTNbkjZO58KEVv8xv/is06nnWgA
	TeWh+wIaBew0JhKx/IUeL/nuK73vteVesmV+VZC+bjOsF356Ju7e4fTfZbTkUUkK
	p0GzYK/7gZojhur/zB9t6ER5gN2RhZlYn50ARx8qKRH5Q4V0DA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a34890grd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 23:20:28 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 23:20:28 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 23:20:27 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cmake: remove GHS-related files
Date: Wed, 29 Oct 2025 14:20:27 +0800
Message-ID: <20251029062027.836131-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E6SiJ5GfCaGGAKH7xQv3drgUVcaEMJ4g
X-Proofpoint-ORIG-GUID: E6SiJ5GfCaGGAKH7xQv3drgUVcaEMJ4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0NCBTYWx0ZWRfXwS2HZ5Mr47+k
 UTN2o4A3lvmOkHQbR0ago94rzjtmr+Em0WIjc1SaWC3/9OfqhqRhdWvMAIgYoKtB1kCYp+URJpm
 M7IcOTGJP+P7Otu36ZH1epCxUeOTCfHJMxQ4a288j22SkV8ZwtulRrQ0iufphhM16tRIiuOeHo6
 H1v+hZIgfL02xnovhxt9Da15vmyA3+MOVS9tyhlUPFYkK+xxS4Gz05cIhB4zhQtZ/ZuKuakOwoC
 NmHEc3NQmw4LTkh3OLJc36cEKfRZhfbj1bK6HAEDaISE47+QyafXzoqJ+ay8D7Wje1LiegsmFxJ
 ZfD9xN8JMu3qMhYBQfH0znhAmP9lnrBpM4uKcfSyt4ZRs2yvMVWxDvAkJaarxI8qqpq43xX7+gr
 WXexgxFsj6t0m9QvBOJFM8eNd2CcOg==
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6901b22c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=_FoUYe0EEdZIyvCbGUgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 06:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225434

From: Jiaying Song <jiaying.song.cn@windriver.com>

Remove files starting with "GHS*". These files are related to the
Glasgow Haskell Compiler (GHS), which is not supported, so keeping them
is unnecessary.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/cmake/cmake_4.1.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake_4.1.2.bb b/meta/recipes-devtools/cmake/cmake_4.1.2.bb
index cfc5cb1b93..e348eccb9a 100644
--- a/meta/recipes-devtools/cmake/cmake_4.1.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.1.2.bb
@@ -61,6 +61,11 @@ do_install:append:class-nativesdk() {
     install -m 0755 ${UNPACKDIR}/cmake-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
 }
 
+do_install:append() {
+    # Remove files related to the Glasgow Haskell Compiler (GHS), which is not supported.
+    find ${D}${datadir}/cmake-${CMAKE_MAJOR_VERSION} -type f -name "GHS*" -exec rm -f {} +
+}
+
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}"
 
 FILES:${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION} ${datadir}/cmake ${datadir}/aclocal ${datadir}/emacs ${datadir}/vim"
-- 
2.34.1


