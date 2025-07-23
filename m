Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2E3C87FCC
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 03:29:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5878.1753241377757437858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 20:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299fc1790=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N1qRCc1386999
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:36 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu9ney-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 20:29:23 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 20:29:23 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/6] mtools: upgrade 4.0.44 -> 4.0.45
Date: Wed, 23 Jul 2025 11:29:29 +0800
Message-ID: <20250723032933.546382-2-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
References: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BCWqPycWhjkMKvP25WHrakEsFQ8vy-xo
X-Proofpoint-ORIG-GUID: BCWqPycWhjkMKvP25WHrakEsFQ8vy-xo
X-Authority-Analysis: v=2.4 cv=AbqxH2XG c=1 sm=1 tr=0 ts=68805720 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=Y9R4SXIICSwYWHl_OwoA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNyBTYWx0ZWRfX9qHIHmaPCQHx
 EO+su0LjJlpOeQmdl5IsCF0UG6qmWpsYH2zQmsoQPGS0FcuNkN996+TAHrCMx3mrAIyA270aoT4
 J65QwI8rvldBkJvnS2Xt6dOpFXc140pbAs5eqTceC2DGmlS/UKIoXwSX338SJfJTQFHivGUYb9n
 GrbYVLwkYfNeKaNwb/MAZk2Kdw79arTehvjsw5th4lYa0vtXikg2uNjo7ztb4Zn5N598tmw58+W
 C6nBglSE83pr0Yl1MH886BR9MgrAHoiG9AMHYri6GsQtkJ3y64i3r4+124jONdtnbMvNSzc7Eef
 ttMbb5e1nw2HmIceGYoI+EtWO0dQGWe0y/q8iKZW4yR302cSF25v9YD8QcMcyigNOs4zsCV0kZu
 kxRFotRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220780

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed iconv descriptor leak
- Fixed size of error message buffer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: cc1975888ffdc58655e80d3d14450cf68ee0f719)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.44.bb b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.44.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.45.bb
index d8dd671be2..34040d7a0d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.44.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
+SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


