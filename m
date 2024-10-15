Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01673CFC284
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 10:07:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.9710.1728986865780458394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 03:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cbnS9zcI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF271E0007;
	Tue, 15 Oct 2024 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728986864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IKw7jt3Zmbz0YWBXb4Ez51PsQAXXw9m31sb3H0RVCDE=;
	b=cbnS9zcI696RDj+USSRKSWizis0reQ3F+9WCnmZpFjoM9M7Y4m3PasdJZ0TezWc5dtRSCM
	sv+21gMas0CL183lmO8TSDa2d70AKVX6cBYb9q8im6QkZCrRxCbBBkHSB0/yiEx8N2BndY
	grbHjA/YzXw6CcuVn3YawPawXvHuqFHOzmtNl8s8rvnbzSUw+s54hZDnYitmQ7eE37A+PV
	nzOOJSMh2yxYgtqJynBBUX35o0XivlaHkdiQwSGmQXLingBYIUPnkOtjYL7YaXGYIOHViw
	x8V3HZK+P200h0dYmu90cjvIHqrM/fMndlv8qkKDZzsyhAC+8plOsU6t5iHdhA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 15 Oct 2024 12:07:32 +0200
Subject: [PATCH] kernel-yocto: remove deprecated variable KMETA_AUDIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-deprecated-kmeta-audit-v1-1-4a38514da362@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOM+DmcC/x2MwQqDQAwFf0VyNuAGW2h/RTwE82xDqcruKoL47
 y4eB2bmoIToSPSuDorYPPk8FQh1RcNXpw/YrTBJI21owoMNS8SgGca/P7KyruaZg0LwsvYJESp
 xkUbf73HXn+cFCO0LFmgAAAA=
X-Change-ID: 20241015-deprecated-kmeta-audit-1ae2e9d46e22
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VNp/BkEeLyKUvQTExznL4yr5NauT+absmP8uYPEL53g=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnDj7vcMCRzK6x1gJmBtxNFQ8ARrzVo+Ta2//+x
 ZUfgqoPFTuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw4+7wAKCRDRgEFAKaOo
 Ng8jEACZlXHdt2OEdxeRF44GQcDUMZqf/sYFlU5cdFrzyIQPqXBqnM31gfLvImRA1f330CqW3ZV
 324hWfRfWE0sZDZVEM/VfO6SaKUwgywCeMMsyfNJvee7i7dbSOMuxFl2fLY/P4R2BPJmsallYHO
 k4RSGKCJ3IqnzKNFpxU67cBdN2YJVxHCPMs3BK8eFhBYJx87yqycFcsj0ZR5r6/yjPvTpaF3xyQ
 uwEAn04hua/Y5+oPx17utOpe1/QrNx29bcFKKEO1WzdIBDdLvuBeRx1zk1hqfuL7TAEsG1LHatc
 42y5BNkNWL6QtfamY81mvKVyzaOsnB+yEiOnV3kSsETAg2oH4Ims4Pq9vaaUWugl5zD4F57VGZ0
 czOdVrb8Z8Aw2nV6B5+GO2RAkGxCflSspx+M7vSEjozAWM/RhlNnbynuoFonnR+45rmxyXd6rP9
 NxmwI/GZk+8n7DS9ebBsOnMmTFFOYL82ICJQ1j3W2aRWFTcL7Hq2+QlS7GoS6FlX/bqtEuTwMBa
 ElQSOP5eZA13rTVF0PL4GGmkn35mb2TfJJmTYMy8q/AjwaKWIbY+ZubvtbaIk0bodXOVcHNbiu7
 Ywk4CLisp9WgipwaMvvBET9RZe35t397xkVUSvocsIV3iaqarcW8+9dzzIjKc7VVgHFb05VvXRw
 yeMjERVcckZfPHg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 10:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205802

This variable has been introduced by commit
1d4c120edeb6e45665eafd6962a10ebb89d758eb ("kernel-yocto: allow branch
auditing to be suspended") but its usage removed by commit
0f698dfd1c8bbc0d53ae7977e26685a7a3df52a3 ("kernel-yocto: streamline
patch, configuration and audit phases").

I haven't found any reference to this variable elsewhere... so remove it
entirely.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 6d5c3b6327b61b9bb6678dae2dbf059dbde178f6..bf22f332b955d08e45ad73facde5a82e4b53eef2 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -23,7 +23,6 @@ SRCREV_FORMAT ?= "meta_machine"
 #   2: report options that are not hardware related, but set by a BSP
 KCONF_AUDIT_LEVEL ?= "1"
 KCONF_BSP_AUDIT_LEVEL ?= "0"
-KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 
 # returns local (absolute) path names for all valid patches in the

---
base-commit: c83a535d1b32f7fd292cd9caea1ec962bc3c735b
change-id: 20241015-deprecated-kmeta-audit-1ae2e9d46e22

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


