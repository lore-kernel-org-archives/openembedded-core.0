Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 95586770DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:44:03 +0000 (UTC)
Received: by pacao1 with SMTP id ao1so5903826pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uB9DcdM0UlYDjRac/pAstnroI0vKjTMYSlACiS6cDts=;
	b=iSftxNIjYKO+ER9dqnzik6F2Slza+1T4bFo7IsuOdDy4fAPq0+nzDiT0WWEXPIkeVL
	DrPJuK0GIHF4JTBwXTgbbJmmKYDinsousL3WskZhCo/BN2Fni/hiDcyiTmWN6bACxNKI
	uqVRpdYnb0QFjVw2mbRw3QMceZKRkvh9qWXDYiuIgGmbYtr3nB3ySb7FgpUIRq1q+IFW
	obOfUletT8L2puvy4rYEcN9C7gGcpAVPAm7TKekJCXHAP7eM/vN+NVXX1kgDxmYlS88y
	Yh7YnjjJ88SnqVuPVG7xNOqUUhIPafzIFNE5FHJW3G1O562wtxaLzpMKLKy3zsZca+bC
	J4xQ==
X-Received: by 10.68.103.194 with SMTP id fy2mr6952164pbb.120.1444873443904;
	Wed, 14 Oct 2015 18:44:03 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.44.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:44:03 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:23 -0700
Message-Id: <1444873403-21093-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 11/11] busybox: disable support for mounting NFS file systems on Linux < 2.6.23
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
X-List-Received-Date: Thu, 15 Oct 2015 01:44:03 -0000

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
index 6473b82..0fc4026 100644
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


