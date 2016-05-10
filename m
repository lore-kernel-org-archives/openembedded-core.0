Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D07B731D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:48:19 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id i5so16718910pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2XTSjoWAW6c5BRx09BqDMkhUC3zjXpWe3pHpisBA2+c=;
	b=K3EZ+LmB3Xx0MwZVQU5d4HNTgDBAKHUWnBhQ36AhRrt0ZvDe59ZLw02+/mVUBHSbF0
	faCa9nEPBJKvG2bbNRSYk4iwjHBHZyOhKAfzJMl71byklWs+XwrPQypofVUqcFhK5zJV
	tw+zIcVUoTa3Kqsqifv6SejmDH67muxI92KsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2XTSjoWAW6c5BRx09BqDMkhUC3zjXpWe3pHpisBA2+c=;
	b=av0EO1Ui2+b5L90WSqZktPNkgFuKSJCfuAn7bplBDCTeee/PTIrW+tgnQNNyeXZKTA
	+GbL4DFI3gMqVAKaIzwYwD78WpXHTdX1LuaLsaz9utomQrLd550LUIiMfTYm4EXrXi1r
	Oa54TzKRu3OTTw6ny8ZtXbcFr6ylwgKYug9liC2zSMA324g0Ff3t1s5lKKfQybBjFved
	+PtD+BE7We4h//e44dG10Gmh5BdOQXG3dAwiTqYVI3F0ouF2f+AsPg0sNsA7kl3CdVM/
	m4+kYT2Uv5fifut1VNPexwCMpfDAcoC25oAGMQnWs2ozx5BypvhHWp5dJmJUqj4DXL0t
	AsYQ==
X-Gm-Message-State: AOPr4FXlTpOeOKfBRG10Puef7nLahVnfp5u0FRsVY0HnYTssXXTY70RQUJ4ZIVgmjG/30Q==
X-Received: by 10.66.139.199 with SMTP id ra7mr53392134pab.111.1462841300239; 
	Mon, 09 May 2016 17:48:20 -0700 (PDT)
Received: from localhost (50-205-91-113-static.hfc.comcastbusiness.net.
	[50.205.91.113]) by smtp.gmail.com with ESMTPSA id
	eh9sm43324273pad.47.2016.05.09.17.48.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 May 2016 17:48:19 -0700 (PDT)
From: Ruslan Babayev <ruslan@babayev.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 17:48:03 -0700
Message-Id: <1462841284-7345-2-git-send-email-ruslan@babayev.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1462841284-7345-1-git-send-email-ruslan@babayev.com>
References: <1462841284-7345-1-git-send-email-ruslan@babayev.com>
Subject: [PATCH 1/2] edgerouter: fix machine tune
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
X-List-Received-Date: Tue, 10 May 2016 00:48:19 -0000

Octeon+ lacks FPU

Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
---
 meta-yocto-bsp/conf/machine/edgerouter.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf
index 6343dfc..062d896 100644
--- a/meta-yocto-bsp/conf/machine/edgerouter.conf
+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
@@ -2,6 +2,7 @@
 #@NAME: Edgerouter
 #@DESCRIPTION: Edgerouter
 
+DEFAULTTUNE ?= "mips64-nf"
 require conf/machine/include/tune-mips64.inc
 
 MACHINE_FEATURES = "pci ext2 ext3 serial"
-- 
2.7.4


