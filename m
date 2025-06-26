Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CE6C77B7C
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 01:57:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1737.1750903070387460149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 18:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82724b0e40=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q1Q2tw004504
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 18:57:50 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14vy0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 18:57:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 25 Jun 2025 18:57:46 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 25 Jun 2025 18:57:45 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jinfeng.wang.cn@windriver.com>
Subject: [PATCH] mtools: upgrade 4.0.48 -> 4.0.49
Date: Thu, 26 Jun 2025 09:57:45 +0800
Message-ID: <20250626015745.1124284-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.39.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: M55FNMJC2FgU2azobqPjasaIYQwpwPPr
X-Proofpoint-GUID: M55FNMJC2FgU2azobqPjasaIYQwpwPPr
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685ca91d cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=_6HNBx9gwFrwLxd684kA:9 a=qJXtpl8PtDUA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAxNCBTYWx0ZWRfX0VWBwcVGN7AB mb97QlDDYPYtII8Ben2xf4dlJ1zwUy525x1tuIM2KT49gIAn5mKrdcCUzJ+ixhaSnc9Iz06BwYl 9YoeDqlG1D36IJ5Fm8kW6w/rgqjOt3yzWM0wW4U1GOTlQcgs2NHRRb3VIOlY++9HqmAFLsNmNzp
 LPXJJcupnOWql8gO75WKj6yzLK5U/vwkoJcHfkWn6hqPsFZL4/QPFAy7AiWFruhsNJsJBojmSPB A/H8vq/yvAq+Z1Fe0/JRLB3m1+rFy73I28/uxXg+hB2CRO3am8UaD49UYDL4TcVmppvO+mlgFgS txdL5Y3LfXJUUOJVwgOHt6ntiBpnpTtCVqesfgA5kXy2LoVxzwUFvD7iabXgDPRUcc5bWl+Q/Hd
 VpB9k+hNiEmV2p9PF7Du6yqyeCYtxk3vS2Qy9TvLuesBxYYAmWCFdCEcuCiDb63++Xa4nNl7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_01,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=832
 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 01:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219335

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

New version includes check for overlong file names, see [1].

[1] https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.48.bb b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.48.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.49.bb
index 646735f3b3..294b2f37b2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.48.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
+SRC_URI[sha256sum] = "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.39.4


