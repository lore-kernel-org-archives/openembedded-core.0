Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 889A360112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 22:44:37 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so22636512igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qTHyGNNY8RVWsQgekuOfGF9V63pIo4pV1bGYB89qH58=;
	b=e0O7p3dF1vvkzhMCmqXuHam4IIrqw2Z28w0szwUSoyoKBQj4K+e0xVzIYLtnuTbBy3
	411aHS/WfZzZFvLEIOjVINMeWoIx1l4FC9eTei7p+Zb16D00KBtezz2k8agFFMwTYVvM
	dbRBa08UsP42QMwcQ+p9v/50LpA0PU77GIPw2wueWHF+AZBkz1PpC47u7LzbF4DWIrd1
	WjDtusJ9022gFpPPq818JvCi2N3nvZh/HAt0gP2JJpo3vezgmhq01htuvTOfzxQXki1J
	BDWbJuYB9NquEYyo+big5jXoml/ZeQaUO0NqAnU+m7vf3sKJI2all8crXbYjhNZDCtqm
	BrUA==
X-Received: by 10.50.64.211 with SMTP id q19mr1166549igs.44.1448059478148;
	Fri, 20 Nov 2015 14:44:38 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p79sm677008ioi.15.2015.11.20.14.44.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Nov 2015 14:44:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 14:43:57 -0800
Message-Id: <1448059438-24431-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
References: <1448059438-24431-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 10/11] busybox: disable support for mounting NFS file systems on Linux < 2.6.23
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
X-List-Received-Date: Fri, 20 Nov 2015 22:44:37 -0000

The busybox CONFIG_FEATURE_MOUNT_NFS config option is described as:

  Enable mounting of NFS file systems on Linux kernels prior
  to version 2.6.23. Note that in this case mounting of NFS
  over IPv6 will not be possible.

Since OE-core sets OLDEST_KERNEL = "2.6.32", CONFIG_FEATURE_MOUNT_NFS
is not required in the default busybox defconfig.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 77274d0..ffea6be 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -52,7 +52,7 @@ CONFIG_FEATURE_SUID_CONFIG_QUIET=y
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
 CONFIG_FEATURE_SYSLOG=y
-CONFIG_FEATURE_HAVE_RPC=y
+# CONFIG_FEATURE_HAVE_RPC is not set
 
 #
 # Build Options
@@ -563,7 +563,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
 # CONFIG_FEATURE_MOUNT_LABEL is not set
-CONFIG_FEATURE_MOUNT_NFS=y
+# CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
-- 
1.9.1


