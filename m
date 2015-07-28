Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 162A276427
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:46 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so3836749ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k+E+iN/i47YLBSGziSE+0sn4O4rRBXVvhMVDjNek78k=;
	b=lSziiAZx6ihZ7reH6q3jxM32pAcsQ43z3Hi+TCmWx2nEp3Kdx4CkBWA+5QwJGUwJZ6
	n758cIBfNlcwB6QVtqaM2TXx7nTRqEUp8I4AS03tbzBVXWpLRHHFHnpLKM+9clTk5aI1
	6G5Hyda17uGdC3E1n76SAYuAAWCRKFB/11u2vB0M/pou803I7mQ9FObJBVLZqi4ndNqJ
	wFfcKKGZIvz7vIsHa934L5dQWOO8YbCmb+luBC1949pdcmvfTbFdLhzmRh97cUoJCRpr
	bJB+MvEpJ6XbgFLFzyXlDFeUaXqmGdwoq6cAcE4kXSooH7TuWV+oPQPUTHdGNBAcRoX3
	bY1Q==
X-Received: by 10.107.18.10 with SMTP id a10mr63174801ioj.98.1438125707119;
	Tue, 28 Jul 2015 16:21:47 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:21:04 -0700
Message-Id: <1438125665-14966-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/8] busybox: disable fstrim in defconfig
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:47 -0000

The fstrim applet (to discard unused blocks on a mounted filesystem)
doesn't seem like core functionality, so disable by default.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 74d12ee..ad0c7e1 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -546,7 +546,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 #
 # CONFIG_BLOCKDEV is not set
 # CONFIG_FATATTR is not set
-CONFIG_FSTRIM=y
+# CONFIG_FSTRIM is not set
 # CONFIG_MDEV is not set
 # CONFIG_FEATURE_MDEV_CONF is not set
 # CONFIG_FEATURE_MDEV_RENAME is not set
-- 
1.9.1


