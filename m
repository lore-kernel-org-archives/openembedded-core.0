Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCD2731D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:49:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t190so12032686pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=snPudPAfm+gMHIwkEx9Kfq445x9h2QQjQDTnUdictSo=;
	b=FNOQKc+/S0n6qBgNhNblJYsA6SOl7xfb4eOy11flKBtzzvBGR8RH31aNBWA3LSPyOT
	Nx6gKCjoUXvt7fmZpbh3MDs4eC9jqagxg6yBx1PB4/mvQA0Kktbb2DHXwt7SdGxzM1AR
	lZ2h/OT4vfQz/wZ7d+7qZFTs1sWx5zk1lM0BUlwh7xwOZ9Xb9DC0+cCDgN27AhKxUuBB
	8F68gogTKUKQOx7uxJ6nZwMzS2FSPAI5EhO7jLzOIOHYdg4WEjzaYAJhnH4vCmeJtoUY
	EhCBP0NGj3S29qp0qYDZ1A7au0hBT0v2kOYwwNxpfxCo/uX9C3Di/6OJ//UiuBIsSH12
	UgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=snPudPAfm+gMHIwkEx9Kfq445x9h2QQjQDTnUdictSo=;
	b=hTvkvAlhJsrJ+BhglytcaUD775ElTNzyxa8+NlOIgCgS9zU+p1orQmdiwb5kVRAcog
	+6cLPePrSUWKi0c7xmIc1uXSGbBYa+N/Mb9ZuRf79EwKZFOUPGx1Xs+Bz+xqxXcS/L5D
	yOGEkkMEZcqNX7KSlKxmH6qnfTsno8BFYsY96oLQarjCkfloKMsanOr0KdZqJxhfnyCe
	Lx7154aDflf20vXOFIEoQVwVahJQZoYbY4J6xW7s36Pm6cOeCAldImUqoM4pkA8BjUd6
	l1bPgbAu2LS+cdtx2KIqqzzSeQYnGveLw2bhd2MXQ2mtt95eusBgG2kPOjEWMB2Gkqu6
	WyiQ==
X-Gm-Message-State: ALyK8tKfdZv2xBjZ5rwKB31pEtlRJXcEKk5cZGG95ddH92wTF/HxNxTyYhvGvqk3+43aJg==
X-Received: by 10.98.193.1 with SMTP id i1mr726027pfg.78.1466444969083;
	Mon, 20 Jun 2016 10:49:29 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	i187sm56862025pfc.62.2016.06.20.10.49.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 10:49:28 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 10:48:53 -0700
Message-Id: <1466444935-16308-3-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v3 3/5] linux-firmware : fix typo in RDEPENDS line for iwlwifi-6000g2b-5
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
X-List-Received-Date: Mon, 20 Jun 2016 17:49:28 -0000

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


