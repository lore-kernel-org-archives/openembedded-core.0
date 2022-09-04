Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240FFC54EE9
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 18:54:48 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.16578.1662317681878716026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 11:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=NsVYv59+;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.232, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 558CD200003;
	Sun,  4 Sep 2022 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1662317680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4PVahIYUw0OMSaJBFoYVrhRXVYQrufw2pG7h8w693Lk=;
	b=NsVYv59+0VEIEskGwlOp0t4DyhhJZiP5iIVedBZT4jrnjq3ued11EKtFJlNeEqaCpk/pgw
	cvqXjKD21YDcJi9s3HhhDdWMZA0vDyzzgz9q5Ai8K/vbTiR0evDrZtcoKFMdRMn4Rk728O
	08Te5yydbNG/6WYwsWky32+lJs+JBMz3VMrkkGO8f2M4hp07TQkknaggEgXDPeqJ8KX1Vb
	zodaF/LC2yKFAEsDB6rhTs6y3gu4kVfCOKCJJTrwS03m7joDctmvtexU5kSzOeS7/w95Al
	PlKi2DioDCUU654om1zCpNv/v84wvuNzC83AaFaJeZrWZIReA+DjrProevxaog==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 1/3] xorg-lib-common: Add variable to set tarball type
Date: Sun,  4 Sep 2022 11:53:36 -0700
Message-Id: <20220904185338.394626-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 18:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170292

Upstream has switched some new releases from bz2 to xz compression. Add
an XORG_EXT variable so recipes can set the file name extension needed
for the compression type.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 60bc8c76fa..68137c4147 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -6,8 +6,9 @@ LICENSE = "MIT"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
+XORG_EXT ?= "tar.bz2"
 
-SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.35.1


