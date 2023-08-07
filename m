Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF14C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 17:34:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41172.1691429689844604430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 10:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GEICUKxr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7583fd2801=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 377Boaaf012607
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Aug 2023 10:34:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YezMj
	r1nTPx6ITZ1JjCOiix6yaWq1SRIiz7VoPHv0sA=; b=GEICUKxr4QFmqDv1iUdr0
	LpPtX19d09AjAoFDTQjInIf0uRM+uNvkW2z+ViRg8HptPN2RMI+aWhabof5QwxI/
	0lDO14ZzV18kvmNJRg2VgrvAKg8flHuhMKzIyQySFu/xcPWiCf7xzl/CvioOoBRx
	RARVciaNVY9lZ5W9ZoWomJNeJ+9D77vqvRZ7nGGTl7YA5AZDq304j+yHbkiI+dmx
	l+rWRePaKaonrayjw/NXf9Ytom9mnAYYZ0ln+LXboJM/OxOvanABZwQdtw3j+vYr
	gRHJQwm3zJJbjeQ3APa7UuXRb0XOscuFzAi+86AFiGlApKmBTITKHgt0HAcu/pjp
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9nxfhh5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 10:34:49 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 10:34:47 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core]mickledore][PATCH 1/1] openssh: upgrade 9.3p1 -> 9.3p2
Date: Mon, 7 Aug 2023 17:34:33 +0000
Message-ID: <20230807173433.3261181-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: bVzm8ys0m7btGTMHGi1US_BgU330VrNG
X-Proofpoint-ORIG-GUID: bVzm8ys0m7btGTMHGi1US_BgU330VrNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_19,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308070160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 17:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185616

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.3p2.bb
index 42ce814523..558e027f5d 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
            "
-SRC_URI[sha256sum] = "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8"
+SRC_URI[sha256sum] = "200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.40.0


