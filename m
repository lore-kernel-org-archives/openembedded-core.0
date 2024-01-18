Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF54FC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 12:28:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10209.1705580930559673261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 04:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xzi9N55d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17470a300f=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IBU2IW017559
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 04:28:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Cflkn
	6siD0lJakSxU6itQ0iMuZIvHy+WiAYl10OzKxY=; b=Xzi9N55dX66OmeBow8421
	SMB/DmsNjSr2YmtRbyFlvVjgBMlFOXpD/71LgXjATcVsTh7CG0siZnNkkfOhDjRH
	hAG6BL3NtiaeyJ3sNNNWSA9K2LlY7AD5azio8/9vLFdfMkbbDPNCQMljqQaPV7Ob
	3oHk/rFFJSFCiLhKi1rU8JpgJatpFDjLVtYY5sAc7uG/b0qcUTi09IGkN7wFzGRm
	UY+PyvMY3gIp/wwTH7WrgHye5oxEmnPflPcKUhOsUO6/e686s9TrNZZRfy7fc13a
	C1zUwIpkfCYwFVNO3S1+s/BHZ5quC+AVRz/TGc5f3LZLq32vaPVFQO+SgdUCYeof
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vktwknby4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 04:28:49 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 04:28:59 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 04:28:59 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xserver-xorg: 21.1.9 -> 21.1.11
Date: Thu, 18 Jan 2024 20:28:44 +0800
Message-ID: <20240118122844.2287736-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WjyAfmeAot434_T36ACnGGEnno0gI9VH
X-Proofpoint-GUID: WjyAfmeAot434_T36ACnGGEnno0gI9VH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_06,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=1 adultscore=0
 mlxlogscore=953 suspectscore=0 phishscore=0 lowpriorityscore=1 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 12:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193976

From: Kai Kang <kai.kang@windriver.com>

Update xserver-xorg from 21.1.9 to 21.1.11.

Release Notes of 21.1.11 [1]:

This release contains fixes for the issues reported in today's security
advisory: https://lists.x.org/archives/xorg/2024-January/061525.html

* CVE-2023-6816
* CVE-2024-0229
* CVE-2024-21885
* CVE-2024-21886
* CVE-2024-0408
* CVE-2024-0409

Additionally, it also contains a fix for XRandR to allow for multiple virtual
monitors on a physical display.

Release Notes of 21.1.10 [2]:

This release contains fixes for CVE-2023-6377 and CVE-2023-6478 as
reported in today's security advisory:
https://lists.x.org/archives/xorg-announce/2023-December/003435.html

[1]: https://lists.x.org/archives/xorg/2024-January/061526.html
[2]: https://lists.x.org/archives/xorg/2023-December/061518.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.9.bb => xserver-xorg_21.1.11.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
index 43c06181e3..6506d775ca 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
+SRC_URI[sha256sum] = "1d3dadbd57fb86b16a018e9f5f957aeeadf744f56c0553f55737628d06d326ef"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


