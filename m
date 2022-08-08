Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A80C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 09:27:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.23263.1659950840546383858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Mx7EvrTC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 6E94D40007;
	Mon,  8 Aug 2022 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659950838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1gRHD2JgvXMa23PfSREVKCeR3R8dwyFqrLZCoecPtOY=;
	b=Mx7EvrTCWHQYRgDppLjJo/ChIhMOJDHqEaHmByNdr42dViKSPOfJFKvRINmwU4BzuxthsI
	ygoiWK0V/R1O1wjO7OKOV2zFVmlk3Lgpu+OjkT4gzyu86LdNZPAsoFw/3CX9YeQVdGGVSC
	r/THKvQQHgyq5yaYSE7IjxuY7KMtVkCDB2BRe9fZCAwiGhqs4WLhcphpLN/ovbf4mgXBOA
	AAf3PdKuH60z0nGvzYeYJeCEHm4dA7Ezi7Jol1HPSKCD4BS5ncM9gem8TcBdKuBtv5PvGc
	qS5Y/qMBbLe7Yh0p1DKvhzc9TFPtscZNGXlSjZzoyyVkRBt3TVJ8RqQza+jSnA==
From: luca.ceresoli@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] libmnl: remove unneeded SRC_URI 'name' option
Date: Mon,  8 Aug 2022 11:27:14 +0200
Message-Id: <20220808092714.773923-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 09:27:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169076

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

The 'name' option here is not needed as there is only one file in SRC_URI.

The layer index lists no bbappend for this recipe, thus this is unlikely
useful for bbappends.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 3c5bde33195e..748326c0a08e 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
-SRC_URI[tar.sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
+SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


