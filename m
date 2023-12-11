Return-Path: <Lizhi.Xu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9D8C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 03:39:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.759.1702265971428628282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 19:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sZ+W1GjI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ccdee2=lizhi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB3P2kt008390
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 19:39:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=a80Rm
	aSm3/0N+9SO5SYyxLOwasdy/9xBpVQABoe+dVo=; b=sZ+W1GjIImMYTw1fS8AZX
	Kz6vQP6/N4OFxbK0wZ4zJS7E5Cn7bnZwV/0j6E9XEgsg6L4UD5etfMyTmimLywca
	pWauBSMM0EaHsQujaE0TA7ahgxqoRw2ydP1GJoeLKor541diIvRX/Z6gDUSOkorn
	BdT1NxXbaVhVV2c6aIR3lNQAuPRdpUc8q3/lPIIrxCnOc+6SFPHZ+4RlS9hr6DLR
	/hLThUGBRuUzs205rehuT1RNoRnH+kQY9ajqcTI9j/zC4MeAcw0HQNhFi1/l6h/B
	uG8ng3SqGRai6D6UfrrO+fTKBHPK2nlKAWi3Jude3xwB5zIzAqe4+m/M2wr8uI4U
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd493qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 19:39:30 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 19:39:34 -0800
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 19:39:33 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anca.mihalache@windriver.com>
Subject: [PATCH] [OE-Core] tzdata: only the timezone subpackage tzdata-core is retained
Date: Mon, 11 Dec 2023 11:39:27 +0800
Message-ID: <20231211033927.1042557-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D21E8faHbtPKHKfaP7EyzVRKbaxq66-Q
X-Proofpoint-ORIG-GUID: D21E8faHbtPKHKfaP7EyzVRKbaxq66-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=929 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 03:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192141

To reduce the size of rootfs, the subpackages contained in tzdata.bb will now 
default to only retaining tzdata-core.

tzdata.bb by default pulls in all possible timezone data packages which increases
size of the final root filesystem considerably.
The customer would like to have extra timezones configurable so that only 
tzdata-core is chosen by default and rest of the zones are optional.

Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index dd1960ffa7..7b1d4fd460 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -201,4 +201,4 @@ CONFFILES:tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
 
 ALLOW_EMPTY:${PN} = "1"
 
-RDEPENDS:${PN} = "${TZ_PACKAGES}"
+RDEPENDS:${PN} = "tzdata-core"
-- 
2.43.0


