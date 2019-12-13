Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 038FA7F857
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 15:34:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47ZF893n2Sz1rhs2;
	Fri, 13 Dec 2019 16:34:17 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47ZF893bpjz1rYZm;
	Fri, 13 Dec 2019 16:34:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 7C0PDu9tmaEB; Fri, 13 Dec 2019 16:34:16 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri, 13 Dec 2019 16:34:16 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 0FB374540435;
	Fri, 13 Dec 2019 16:34:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id UILlPXWs2uEe; Fri, 13 Dec 2019 16:34:13 +0100 (CET)
Received: from papero.fritz.box (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 2D1BB4540419;
	Fri, 13 Dec 2019 16:34:13 +0100 (CET)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 16:34:11 +0100
Message-Id: <20191213153411.21468-1-sbabic@denx.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cronie:fix SRC_URI path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Dec 2019 15:34:17 -0000

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 meta/recipes-extended/cronie/cronie_1.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.5.bb b/meta/recipes-extended/cronie/cronie_1.5.5.bb
index 82cd4285f6..0def4a187d 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.5.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.5.bb
@@ -16,7 +16,7 @@ SECTION = "utils"
 
 UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
-SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
+SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
-- 
2.17.1


