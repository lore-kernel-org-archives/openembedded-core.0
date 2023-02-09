Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE00C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 15:07:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17702.1675955238006748076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 07:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SfMy6Zw4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=140456a884=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3199w6Jw000320
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Feb 2023 15:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=28oloULY6CpdP9l5xNbuwWjKo5fyoJBBPP7OZZadRO0=;
 b=SfMy6Zw45iLsKeluJ51mqb4oN3WtxkFsO6sJlY2ywCEUH/dBDQ06Wt238lMf3Kj9Ve8l
 eB9VScasn2kyEbH5nz/LyypXyUhOXKtyGMvb//idCOxJJlHufYL0Tk815FA0Q4M7AirY
 vza46dIkWBpL5/+wORXkaSe2LZAA7cFCeLei+M1pcOrJ0hK2TNT56PtXSc2ZchmYhi6k
 Uhfee7gvybxkeWmmG5z/gIIKG3/C4GBkgQnJyZMgYRr3/jolt2PP6uV2HnZTN/WL1/3S
 RAqX8kESucGylgfO8jpD0ucLeBgWKJdG/Ftuj1uqYch08bJ/GMz7gdpYAz7t8dfbt1G1 Dg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck35df8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 15:07:16 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 9 Feb 2023 07:07:15 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Feb 2023 07:07:15 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xserver-xorg: 21.1.6 -> 21.1.7
Date: Thu, 9 Feb 2023 23:07:12 +0800
Message-ID: <20230209150712.36813-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: I5nAYjBt8GiimQN4qBizPhsmIs5R3qT_
X-Proofpoint-GUID: I5nAYjBt8GiimQN4qBizPhsmIs5R3qT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=843 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 15:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176961

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

Signed-off-by: Kai Kang <kai.kang@windriver.com>
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


