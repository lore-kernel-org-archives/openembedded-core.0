Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id B4EF16079F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 12:52:01 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id h67so13948803qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TXxYKSMpcOK8C6qGm141xlBkBZOP3h7+WyOS2ggAwLQ=;
	b=u82jYqs3csGb4n/PteMN1fu59wAk05TEaF50CpZpAHgpIBGheaSG1ZZPgOWIvqCccl
	AcRoBitthTnozEcaBQx7YlU6m9mNxk5k6MwO5ELRlK2B02YH482NQG2QHeoJ7EFLA4iq
	xG/DKHbHrUwYhyKindjNlX+U/62pIk2WBmOtuc3KRvzFId6F5GbZdsBr+LQlrq6w9pDK
	jkkIWvDeZbPuLJm9HujjpvzkW/yCyFg0ReSJv5fkthUhpqbGqNYdNpm3yTVPdN29/K1b
	01uNBVxn4sCL7hCyMyMXQup0VO6H7z5KM4OXkG11UawGWmMgTvlr2c2NPGJBGVb8iJNs
	12AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=TXxYKSMpcOK8C6qGm141xlBkBZOP3h7+WyOS2ggAwLQ=;
	b=A61EkudIDR9i0GYtLJTWJw0Xdpg/OrJNeOqVVRo2HsIIGEmu0IjXed0NlPtAN8lURw
	j0ZjIz32lBvfu/P3m0cUZXslJ724jqpOIgmrXE3MW4VTVzdQFXHuD8QtFhHSBSRHHNpC
	Pe4k+RXrdch18oLISItfiT2TyudbFn02P3sk/+LWY4hKgmVKfXZmfbbq3DKjittGvMdy
	iaLzGRfhm15jsTtcrEGoRdM6kDMILohzaW590i9vOpwuFsWy1re6RXV6W87cOn/r9XB7
	Dp3LvYRMer2/C+6xoCmVcit7trOgKDtHi//L6rLQ4z2iDiCcUeYu0DiWsd56G6qLSxU1
	4D1Q==
X-Gm-Message-State: AFeK/H2xhshg67tr4vMfGgs/RcWKfzenJojFrzLjoM1PCzoIJxxUWWzvNfsH3HELS11Vlg==
X-Received: by 10.55.43.95 with SMTP id r92mr11971576qkh.123.1491223922319;
	Mon, 03 Apr 2017 05:52:02 -0700 (PDT)
Received: from thuvia.localdomain
	(pool-108-44-116-166.ronkva.east.verizon.net. [108.44.116.166])
	by smtp.gmail.com with ESMTPSA id l6sm9495282qkd.66.2017.04.03.05.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 05:52:00 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 08:51:38 -0400
Message-Id: <1491223898-6338-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot: Add bc-native to DEPENDS to fix u-boot/spl build.
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
X-List-Received-Date: Mon, 03 Apr 2017 12:52:01 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-bsp/u-boot/u-boot_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
index dabe709..37c21dc 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
@@ -1,4 +1,4 @@
 require u-boot-common_${PV}.inc
 require u-boot.inc
 
-DEPENDS += "dtc-native"
+DEPENDS += "bc-native dtc-native"
-- 
2.7.4


