Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 024F87713A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:47 +0000 (UTC)
Received: by pasz6 with SMTP id z6so120638416pas.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qTHyGNNY8RVWsQgekuOfGF9V63pIo4pV1bGYB89qH58=;
	b=mbIOZPwrZ5pjRcxgR3JsJVtVv32VQ5cssdfLcKD9VVExa17SixGMtjMdD9paBXXZwq
	CX48n5BY98SByUAuxP228oQFmPOKOzAnNuEBDPqvw8a2tPlEQ+LgzxDLq7IjBshvlKTt
	+z3ENMCg2iW13DZrkhuhKk/ZjCXAj/lhjIhq+p04N+k9k54pwNc8aw/Ax0+GaaU+nS5d
	3kLzgtfCt/H3NKQH4760iKBEid9NUOz3OS5dZxm9l0a4J+eL87Asxci3fXio4V+mSE1h
	cmo+IDIcmIbB+66gACMWM8uY47ZLS02nBid+/N4nR/I63emwwBQ0CymoJ+KcLnTt2x/L
	JG+w==
X-Received: by 10.66.179.6 with SMTP id dc6mr297677pac.67.1446799668033;
	Fri, 06 Nov 2015 00:47:48 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:10 -0800
Message-Id: <1446799631-7037-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:48 -0000

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


