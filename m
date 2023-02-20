Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AD6C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 05:57:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6941.1676872630141200090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 21:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e7KRT8fK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14151d2590=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K5ua7g003626
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:57:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=uc8JKNBKrrkeGR3fZcdPumnjavAnuRisWDykMdmEtBg=;
 b=e7KRT8fKIwZW5q5rVHYa7AhyBydu4rVpdPEOkeXPqU5arDAroEJdHbGKPtvhNpsNeVA5
 2gMsWCY+31GsWp2bg4aJFGMqx+dvs2gcSQ6okDgXtrXfNlLZSV/n+oOCankNuJnWeRlM
 wcCY30GnFISnAXCdX47n5I91+jivWoo93JvIP7QxcdaFCGYJomzIeznKXKterAXcUvcO
 xNMp4zl1Y0Hi/pT/x8NGGVw6oVeicVK+Mjx76Og0I1ZZ357lSPDBulE8Xi6Is4TtUWRS
 KFESXFpD/QxMmg5XoKPXekPgQx+IqzjV/0HoLqYk2yMLFsuYu+Yek7yPxVYIun6aOdU+ lg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2ps548-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 21:57:09 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sun, 19 Feb 2023 21:57:08 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 19 Feb 2023 21:57:08 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] xserver-xorg: 21.1.6 -> 21.1.7
Date: Mon, 20 Feb 2023 13:57:05 +0800
Message-ID: <20230220055705.22319-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jL2Xjbj6SqvTLQcihTE-33DALkV6xtzX
X-Proofpoint-GUID: jL2Xjbj6SqvTLQcihTE-33DALkV6xtzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_03,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=859 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 05:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177394

From: Kai Kang <kai.kang@windriver.com>

According to the ANNOUNCE of xorg-server 21.1.7[1]:

This release contains the fix for CVE-2023-0494 in today's security
advisory: https://lists.x.org/archives/xorg-announce/2023-February/003320.html
It also fixes a second possible OOB access during EnqueueEvent and a
crasher caused by ResourceClientBits not correctly honouring the
MaxClients value in the configuration file.

Finally, a bunch of Xquartz updates including the ability to correctly detect
ssh-tunneled clients as remote.

[1]: https://lists.x.org/archives/xorg-announce/2023-February/003321.html

(From OE-Core rev: 60737bee6466e206d8f3c751910dfce00b60d703)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{xserver-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
index 256903ce5f..212c7d39c2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1eb86ed674d042b6c8b1f9135e59395cbbca35ed551b122f73a7d8bb3bb22484"
+SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.17.1


