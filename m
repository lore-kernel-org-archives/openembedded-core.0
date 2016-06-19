Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 377B260107
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 01:32:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so8879145pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=snPudPAfm+gMHIwkEx9Kfq445x9h2QQjQDTnUdictSo=;
	b=B5TxdzWMSUg72V9dmouvKPPF0XuH74uxsVPeOQCFA57IvB66LuoXZRzTiMWg991sb9
	4Yyec9pv1i+W4edQruRhIRC7lsmDjirkYeKCMH/TNtJoGAn1iaKmyvXBQmL9cXpv/bmI
	Kcx/NhTaS1TB/mp6L2LicrRsAOaF+DVCgJsXFUz96/I3zyyj9Xpy/yjUJKhU/tWWRnNV
	xHpg+76jCMlCpfnuu3mZyxJq5P4SZ6qG1fs5GYCnrIa51eAHKRkGKP/UrrCD0/xMSLqj
	4nEv9UWSCviAL7TzMd4ChYWkjpy0LXYgnLoZyjt+/59uNurRT5m1T0fLU0Pwbx16hKgT
	kp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=snPudPAfm+gMHIwkEx9Kfq445x9h2QQjQDTnUdictSo=;
	b=T0WLBR7dX2hnWP5Al6xOEuFAgcUcXFwD888c0k4ojAUbvY/JBpmNmCoWMKv9uE/1uq
	fdzo2NFRyXP2F95pGGxTEmqfp8BDbZ72pZFEcr7OiQWEGlMZsMTJNTmPNKaUGTA1X1LQ
	yFX6+IOSG8ZILpIxzmCobdEPqdmNPmZTcJSSW/Xm1tixUUvU/MEJ25i62qSg/rT8odmp
	Nggb0v4bLX9fRO5ZvoE/y40MwYQvKeqn2mQtR99pOlgfR1RssuaoYvY98wHebd87UV2d
	RBnEY3wpkuAdjrthpPOVB9VCzsAOb2i3kjxdBMq3sQkBdM+G5aG0CGXUb/0a573knUcI
	igAQ==
X-Gm-Message-State: ALyK8tL9jyTzgvIpakvudG/45GqnmfDmMzs8YwCkUoljI6lSKg7ii+ZKuwG+Sup5e7AjcQ==
X-Received: by 10.98.73.198 with SMTP id r67mr12464671pfi.50.1466299980765;
	Sat, 18 Jun 2016 18:33:00 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	g63sm56257642pfb.7.2016.06.18.18.32.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 18:33:00 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2016 18:31:12 -0700
Message-Id: <1466299873-8445-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 3/4] linux-firmware : fix typo in RDEPENDS line for iwlwifi-6000g2b-5
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
X-List-Received-Date: Sun, 19 Jun 2016 01:33:01 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index bce2c0b..cdc7315 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -488,7 +488,7 @@ RDEPENDS_${PN}-iwlwifi-3160-9    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2b-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
-- 
2.1.4


