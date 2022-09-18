Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B917EC32771
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 17:33:32 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.10979.1663522410217868006
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 10:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=hOyYgQUX;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.231, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A2ED100003;
	Sun, 18 Sep 2022 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1663522408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ca1q4JmT252DQNr1LG3c5tUPsgZWk7Wk2p6/SnSt520=;
	b=hOyYgQUXSsdKhK5oYdZ385F0BdvSPNH5+4NBEczsdx+b0XJU4qN/hFMrJkOTLTu4dhA0lk
	y+o0uuOA5KYp+qoJ+21jXu0bCV4NiwHry6JS8KhyaKuWIbax0AiCAnI/wqqqWXoMo5plrP
	NH96Yvilfc+2S4zuLrd+umofEcwSO/2zVkmdKIwm9vLlPYaFzgmC1Tea9RIkA9H7qGw6o4
	Ky8eT6oYbP+ODj51B/gVT1uOWdRHSFg7AZcPgf+X07LSqxcwaWoCxMIkm+YRSjw9XwlG1U
	t7al17SUhsOaoO26yjqfiv/wd6a06l6gJpr0KCJSKxPXSOt2eZYUIHijxoHxAg==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] tzdata: Update from 2022b to 2022c
Date: Sun, 18 Sep 2022 10:33:11 -0700
Message-Id: <20220918173311.2619392-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 17:33:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170852

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2b956cf7c0..d032fed356 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022b"
+PV = "2022c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "bab20d943e59a3218435f48d868a4e552f18d6d7f3dd128660c5660c80b8a05f"
-SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
+SRC_URI[tzcode.sha256sum] = "3e7ce1f3620cc0481907c7e074d69910793285bffe0ca331ef1a6d1ae3ea90cc"
+SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
 
-- 
2.35.1


