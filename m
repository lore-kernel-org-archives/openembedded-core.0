Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18F0C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 10:31:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.60456.1672741903297257033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 02:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W+4lzpIz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0367bd8ea5=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303A6dJ0027584
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jan 2023 02:31:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Rs9xqK5W93aPXpgMYbpqa+tE13NLd5wHxoO+6ysbg0Y=;
 b=W+4lzpIztlrWJ/EjyDMZanwU6/xio1hYa1M8x4UYlP9oH4YEFTUXG3SOq4sjOAxMstRm
 4ZkHydH5CdTNu4hSRctSDDRhdFERVfHwF5Ex3W34ds/ik/9QtgYrQUjTpWA8k0nS2JC5
 TpJWbR2B4BeSdMp+1tvgL45A7iOlTtBL1rfZogPsmr5RGYQ1P9ucVAp7IaHjvoVNIOc2
 /PHidsVJvPtsulFoBP85X8C+2U1aGeNVyYAP26UpO6mt8mZQvH3pUALB3rc/owSLOD5Z
 BPvvySBW8WARCjpAIo49zmw1c3LqFmEUH8T1sKqjuUa6cOW2HVD9rKGcQvN0SPpXhlzN mA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtnfrscw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 02:31:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 02:31:41 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 3 Jan 2023 02:31:41 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sqlite3: upgrade 3.40.0 -> 3.40.1
Date: Tue, 3 Jan 2023 18:31:40 +0800
Message-ID: <20230103103140.4077001-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Jd9gLaytrRAo9MAr85fSmkkiRM3SN2Td
X-Proofpoint-GUID: Jd9gLaytrRAo9MAr85fSmkkiRM3SN2Td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_01,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=895
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301030093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 10:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175340

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../sqlite/{sqlite3_3.40.0.bb => sqlite3_3.40.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.40.0.bb => sqlite3_3.40.1.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.40.0.bb b/meta/recipes-support/sqlite/sqlite3_3.40.1.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.40.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.40.1.bb
index 82718432b5..c9b6ca1c5f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.40.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.40.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "0333552076d2700c75352256e91c78bf5cd62491589ba0c69aed0a81868980e7"
+SRC_URI[sha256sum] = "2c5dea207fa508d765af1ef620b637dcb06572afa6f01f0815bd5bbf864b33d9"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


