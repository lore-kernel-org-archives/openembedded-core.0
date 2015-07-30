Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9107652D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:57:00 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so492883igb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LCYas42cqyYdPZuTGkEeIVWuX+l06K751FJ8F24jknQ=;
	b=IR2YBh/NwUQBiKMyT6qPV3bPyG4O6chbhT1Ax9y+ooiP6p/di4/fO7J8rX3XFrB9Re
	ll+Y3pFHizsdWYV91wtjlXnNrNTGZwzPkMM0AP3OAEjRwzfYHwdE4Mi3TPakW82t+iTe
	icVlbvkG/eNNbXl0CzUTQFbg4EKx00Xhow9HW5R/wvWUknTWgCAJkKlxmyBUQYiuNRjr
	6ghP7dHi+piT9Qys0vY/FTzkiV6D0f4a9wnFVdfhlVIrBhHWdM7wxo41UjfvDAILj+Uc
	HPjTO6xY/yr+aD8ldlKAeP57PLSXJKc1e7bCYW81wRJVOclsW247vuqtAy1jO0pKJCjR
	FVCA==
X-Received: by 10.50.164.232 with SMTP id yt8mr8365912igb.81.1438289820458;
	Thu, 30 Jul 2015 13:57:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a6sm1530978ioj.1.2015.07.30.13.56.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:56:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:56:26 -0700
Message-Id: <1438289788-23120-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
References: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/7] busybox: disable fatattr in defconfig
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
X-List-Received-Date: Thu, 30 Jul 2015 20:57:00 -0000

The fatattr applet (to display or change file attributes on a fat file
system) doesn't seem to be core functionality, so disable by default.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 0274123..c5d3275 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -545,7 +545,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # Linux System Utilities
 #
 # CONFIG_BLOCKDEV is not set
-CONFIG_FATATTR=y
+# CONFIG_FATATTR is not set
 CONFIG_FSTRIM=y
 # CONFIG_MDEV is not set
 # CONFIG_FEATURE_MDEV_CONF is not set
-- 
1.9.1


