Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AC02078282;
	Sat,  1 Jul 2017 21:53:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u23so13853197wma.2;
	Sat, 01 Jul 2017 14:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=58srYNnJLcA6WZNCucf5Yl4Zc6g9QaHLTeyLSgtM0g8=;
	b=muOK7FVoBLUvc57q2XXPTZziFERynXSwqR2Tn0cZnTXVFHB2YnTHU53TdAleNCwDMu
	fhdUo0jCua/D6SbJUq8YV1Qv1D0p+4+e2PC8+4yqbZCfmQqPaAorgAAO3zJqfd809TmE
	paFJJelTb8vkAsTvsucKpAmhbu1UxLd0atpSMphH9lBvXTV1tCYg7jjuKPEuF9zAgodG
	9vtvz69VYJA0tZkKCzOg03m08KfgsoXEuV5dwiZMiorR3Vc7DM4Esy9t/7tBPIm7gaW3
	JxSLU5lKpM9zRtGCltrWuXII5YT9+sieSQ1wnlhCa1Dp7XqkDnYnQSVg6lGqQq9Am/Q2
	KfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=58srYNnJLcA6WZNCucf5Yl4Zc6g9QaHLTeyLSgtM0g8=;
	b=fMDB2e/ySzOvhP+ZmQamBfoqnOh3BAwLLu7pznv35GrtF713Yp6+flcjvBAiLshS6G
	RJA6QTQqwm3Nhdad9aAiKZypf8oVAxTV7WOZyQFTn9o+8Mwc7dh+Nfw0srhXzxvugHxB
	JxwmeyPCfWKyghK+cb10TKl9SphIL2OMLHkOTlrJb7zqG4M5AG9C4HneK/7/9b83XScV
	wgUWEtQvQaMzuxmfi9QZYVbaOdaUJoJnoliWDQbG6SeCmG3aJPE1OsMdsW0pvx7D1qAK
	yoUT9k9yyxPrNv6L3H69K6tjbemm2GI3UFjFnzBXE8FE32Z7dzM55exxJ5Azrif1qRNN
	PyHw==
X-Gm-Message-State: AKS2vOyDqI2lwc1YHwxhMlySOax4GkqAC/liNg5T4o6Tu/GeHOJ56f9g
	Mz6apf+y04T+Bw==
X-Received: by 10.28.26.2 with SMTP id a2mr18978521wma.32.1498945987396;
	Sat, 01 Jul 2017 14:53:07 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host251-139-dynamic.104-80-r.retail.telecomitalia.it.
	[80.104.139.251]) by smtp.gmail.com with ESMTPSA id
	h16sm27346781wma.14.2017.07.01.14.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Jul 2017 14:53:06 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: shr-devel@lists.shr-project.org
Date: Sat,  1 Jul 2017 23:53:02 +0200
Message-Id: <1498945983-4205-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: [meta-shr-distro][PATCH 1/2] jenkins-job.sh: remove PNBLACKLIST for linux-yocto-tiny-kexecboot for world builds
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
X-List-Received-Date: Sat, 01 Jul 2017 21:53:07 -0000

Recipe has been removed from meta-initramfs with commit

  8c03a06 linux-yocto-tiny-kexecboot: remove obsoleted recipe

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 jenkins-job.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/jenkins-job.sh b/jenkins-job.sh
index b5c5bdb..2f53b24 100755
--- a/jenkins-job.sh
+++ b/jenkins-job.sh
@@ -401,7 +401,6 @@ PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so mu
 PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
 PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"
 
-PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking other kernels and modules - broken for years"
 PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels and modules - broken for years"
 
 # enable reporting
-- 
2.7.4


