Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B03AF786BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 23:00:46 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 136so11756630pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RJJ6Ws6v70YYnFSUiqPvh1EahJVfStNBOoB5rp7JOMY=;
	b=GhgfitUIptEBVXRvshl9E4g2msNfaa5+9kbFTWTDC+5kwULaO44T/YAPM4Mmj8oyLe
	cWzNqKTGY0vVBxytZQKUnlF8X/pxwNXzIBI/heiw2mqyeu9Ltxwu+cJ/VrFJXpf9Voh+
	VEJgo6PK4lTjOV2BRmJo6GBo+v/8WO1Y4vwaOt8POZ64BLEOCiVg+ZFHnWzq5ID2HV/m
	F6SMTm5hynoSuNeF7F6tgbmdVlKtmeVgd0gBNxn0NPOzY7Rw/fFs2yoWXirlA1J3Zl1Q
	o7clB5Q2FqQa3q0e+b+eaQ+BYR+2CyNWSkd3pTXXJhQkKBChAyL2jL7Md5RFET25OkGU
	7CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RJJ6Ws6v70YYnFSUiqPvh1EahJVfStNBOoB5rp7JOMY=;
	b=SioHapz4C/VfzxeFYBiKJeK+hKqoU+LjuR2bQx4qI9h4zq2A72C1Svj8pULmEU2+hR
	Fq40wmmT0Iu5JRBJn3ez5xt3/yjoPA7JMVgi0af8T7hwIQ3N8miVDJQonEvV6/+08EsU
	BeWt7wnUeS2NeWpHZGcAeY8rHeZXiEBohhBbNOsYPj5rnh9mCLWvy36Uwa6ZyFwYlxd/
	brAimt1JAVsAyB9Bz5NgbLJkNaoiqmAkIJI1nmf+JyKbKmLsW1pc/JiZjFcmy2Q+Gru3
	/XdnMdMwGj3YGEHKjxixuR4NjoViE539VxWvjDjuTTcgikJu5vuRjBwez+MwphXwm8iy
	TRaw==
X-Gm-Message-State: AKGB3mL1JNIZe0sqPKWTBPAysmhGIWHsG3/EZODJf2F2g3U5cUm82Lpj
	Ga282EPn4bnRSDCWjDEaNqjWOg==
X-Google-Smtp-Source: ACJfBosep9mYM63f/0O9m95Uu2BOyM2149WLQqpHIJzxe4DRAxNBUk8u04gNvjOr/g+wdELiUA9DnA==
X-Received: by 10.98.210.5 with SMTP id c5mr32625969pfg.238.1516230047430;
	Wed, 17 Jan 2018 15:00:47 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g77sm10828294pfk.49.2018.01.17.15.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Jan 2018 15:00:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:00:40 -0800
Message-Id: <1516230041-32601-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel.bbclass: drop legacy fallback to yes '' | make oldconfig
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
X-List-Received-Date: Wed, 17 Jan 2018 23:00:46 -0000

The "oldnoconfig" target has been supported since Linux 2.6.36.

According to OLDEST_KERNEL, the oldest kernel currently supported by
OE is 3.2.0, so the fallback to yes '' | make oldconfig is no longer
required.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a36f4f9..1ecb840 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -486,7 +486,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
-- 
1.9.1


