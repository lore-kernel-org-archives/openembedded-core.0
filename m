Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B250678294;
	Sat,  1 Jul 2017 21:53:09 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k67so41635264wrc.1;
	Sat, 01 Jul 2017 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n/qHmftsxOcnMbqFnXkVe1JQDYBdJySS+CJFc+JShb0=;
	b=uKG6bSydR4eIVFEXP+/mXumZ5b/acT/AmCbBptZzEUMXW3a6lv8TTqnEHkUvJs9UHZ
	KMwLssf8+iZTEKl3LIRSe/495LrR6I+APccL5RzfIJXy9vAxiIrRLSs6gtHvybhJ7gLL
	/YAHGT3lvsBSY+zOHt9IYxuEvVAtjMjhIzvhnRrLJ//Z8KzpBTEs5fMH3KLyC+hpZT9i
	7Gumrwz+aKwQzzI+VnbpR/T0u6Pz3/t60gahoSv2fMiumjEQ5b8BQviq2HKa3oK/TIcj
	DVi1K05YTRAYq1X8bEBLIkqnaXSd8k/QYbQ4Lr4TRabFIRmqxDUDy0rMhZjinGRiM3R5
	ZcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n/qHmftsxOcnMbqFnXkVe1JQDYBdJySS+CJFc+JShb0=;
	b=YSPB4CQ6EIy55iZSoJVGli47+q4EIHlV5Vu7Li5WagAeXb77wqOgZ/MG9vB4xStkXA
	0PBsL5qkG3umlOJDF2Ba90aubiOmT8umXbPlq3JRNJbRjV4LPtr9rx6yrJOqz8fUzHFO
	Zlocjpvd+58Zary0q1aXMo9MyuX5jk53Ew+zgKDFjtYKN+kYxFcs11q5rAUNrFMA9vjd
	qjbd9kDLVacVRU76i3H3lH/e1BM+/6mSyj4GEdaVUrhqjePv6nLT1hcSFFMaOwFhx4Jj
	DjXdpecGgueSYuxXG0ldC6Tmu/kKJUbKih60POEqnBpY6UJAfyMbbhroQLTxV+y7EgX9
	MtnA==
X-Gm-Message-State: AKS2vOwCY+N3veDMkPDYQTZfUA7hcnR2pg8yfbHAbGMs+gm+nqcQpYVc
	VSiV2o4qYIe7GA==
X-Received: by 10.223.179.67 with SMTP id k3mr32138703wrd.198.1498945990396;
	Sat, 01 Jul 2017 14:53:10 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host251-139-dynamic.104-80-r.retail.telecomitalia.it.
	[80.104.139.251]) by smtp.gmail.com with ESMTPSA id
	h16sm27346781wma.14.2017.07.01.14.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Jul 2017 14:53:09 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: shr-devel@lists.shr-project.org
Date: Sat,  1 Jul 2017 23:53:03 +0200
Message-Id: <1498945983-4205-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498945983-4205-1-git-send-email-andrea.adami@gmail.com>
References: <1498945983-4205-1-git-send-email-andrea.adami@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: [meta-shr-distro][PATCH 2/2] jenkins-job.sh: remove PNBLACKLIST for linux-yocto-tiny for world builds
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
X-List-Received-Date: Sat, 01 Jul 2017 21:53:10 -0000

While there have been issue with the introduction kernel of shared workdir
it appears linux-yocto-tiny build is fine today, all green in AB:

https://autobuilder.yoctoproject.org/main/builders/poky-tiny

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 jenkins-job.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/jenkins-job.sh b/jenkins-job.sh
index 2f53b24..cf4979a 100755
--- a/jenkins-job.sh
+++ b/jenkins-job.sh
@@ -401,8 +401,6 @@ PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so mu
 PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
 PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"
 
-PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels and modules - broken for years"
-
 # enable reporting
 # needs http://patchwork.openembedded.org/patch/68735/
 ERR_REPORT_SERVER = "errors.yoctoproject.org"
-- 
2.7.4


