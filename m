Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FA1C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:11:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17863.1752250274456510212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9287446b54=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B4QGAh020445;
	Fri, 11 Jul 2025 16:11:09 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ps91xt34-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Jul 2025 16:11:09 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 09:11:08 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 09:11:05 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chen Qi <Qi.Chen@windriver.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/2] sudo: upgrade from 1.9.15p2 to 1.9.15p5
Date: Fri, 11 Jul 2025 21:40:54 +0530
Message-ID: <20250711161055.47019-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PLcP+eqC c=1 sm=1 tr=0 ts=6871379d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=SETLuvH0AAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=ngvIrZBGaJz3TdFlRrYA:9
 a=K2dp-gY6hJjlCEVBUzYH:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: Q0qTEqG63nhzq6bYEHKly8WfIp_1x09s
X-Proofpoint-ORIG-GUID: Q0qTEqG63nhzq6bYEHKly8WfIp_1x09s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX7EvVkCnkMxYa DTVSWQODmg8bPwdjC08XIe8xbMP49umDG/EBPXDOMEUC9YACTYZ1n1OCFN1OswkRguElqaM0ugU tidh5JIgYlYytvtbqmSeVz0EIInnVZCGJrNcjiTp23l+kaVGjc/Wqrl9EjT2By55Gy+ykT4YNGT
 dROz4n1wM4+lKp0Yk/O91+QMEtDFqfzn35fMGHSoovohjxoMqLZTSbVicFoW0KTRHlHwjIvmodT 25OEmfPKcxkSrcFn9UFecEsf1Hp45P31eprxxzxydJam9I2cyz+dvnkWkfHkrI4qZwaBOsm+gB4 ezT7YvYo4f4wxZTos/9rlLhJ5F5YqAU2A5PmLw1EUD5XYTjY6Dr8KQQTJFkq2yvpH4iX1Yzd0Od UyjLp9Vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220155

From: Chen Qi <Qi.Chen@windriver.com>

(From OE-Core rev: 4b2eccc0ee3f2906f9b04de194b9df6e24c2cdf4)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 468633036c4b049b137d80740c4380ae1959e645)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 431dfba3c2..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
+SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.40.0


