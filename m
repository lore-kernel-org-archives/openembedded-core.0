Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC4F60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:42 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116509248pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KyYvaxUu5NDy4u2RAA1y7v8fIgGhq+4yCb7BN/h1+Pg=;
	b=P5aPVrpVxMdflpL6lNME1J1ERC08ugUV2R/++4xkJ9+yXHMnKEjJXbLWSiO9+zLo6K
	+/dfsGJTrWFur+1qliS+zklwqaRhcdx7PsVCxUK6SIjnfrZGm+GDwSk3OtWF7GkBLYp9
	wcZ74+wLsqIJE9mQxL4Ov0kntdDjxN79k16f1ooCIaAyxkpQV+0s4JoRC2sWTZ7CPuVG
	sF5ZAogxb0JtdrJxNBQRg2OunjFK6StOqz3gudLLjQ6geKEUkDG9wk3ElRZIB1LpFnbJ
	MPBp0IsJ7myAvcVd54s+rLN8OwsX0LgDL4AoEl7xTB10J1c3zlPJCghCoAtRdeKEM4+Z
	LpMA==
X-Received: by 10.68.131.164 with SMTP id on4mr16100944pbb.35.1446799663427;
	Fri, 06 Nov 2015 00:47:43 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:42 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:08 -0800
Message-Id: <1446799631-7037-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 08/11] busybox: re-order defconfig to align with busybox 1.24.1
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:43 -0000

No functional changes, simply re-order lines in defconfig so that
the existing options don't move elsewhere in the file when run
though busybox 1.24.1 'make oldconfig'.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 38 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 4f5df9e..a5adea2 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -183,10 +183,15 @@ CONFIG_DATE=y
 # CONFIG_FEATURE_DATE_ISOFMT is not set
 # CONFIG_FEATURE_DATE_NANO is not set
 CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
+# CONFIG_FEATURE_DD_IBS_OBS is not set
 # CONFIG_HOSTID is not set
 CONFIG_ID=y
 CONFIG_GROUPS=y
 CONFIG_SHUF=y
+CONFIG_SYNC=y
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
@@ -211,10 +216,6 @@ CONFIG_CHROOT=y
 CONFIG_CP=y
 # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
 CONFIG_CUT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
-# CONFIG_FEATURE_DD_IBS_OBS is not set
 CONFIG_DF=y
 # CONFIG_FEATURE_DF_FANCY is not set
 CONFIG_DIRNAME=y
@@ -283,7 +284,6 @@ CONFIG_STAT=y
 CONFIG_FEATURE_STAT_FORMAT=y
 CONFIG_STTY=y
 # CONFIG_SUM is not set
-CONFIG_SYNC=y
 # CONFIG_TAC is not set
 CONFIG_TAIL=y
 CONFIG_FEATURE_FANCY_TAIL=y
@@ -553,6 +553,15 @@ CONFIG_FSTRIM=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 # CONFIG_FEATURE_MDEV_EXEC is not set
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+# CONFIG_FEATURE_MOUNT_VERBOSE is not set
+# CONFIG_FEATURE_MOUNT_HELPERS is not set
+# CONFIG_FEATURE_MOUNT_LABEL is not set
+CONFIG_FEATURE_MOUNT_NFS=y
+# CONFIG_FEATURE_MOUNT_CIFS is not set
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
 # CONFIG_REV is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
@@ -599,15 +608,6 @@ CONFIG_LOSETUP=y
 CONFIG_MKSWAP=y
 # CONFIG_FEATURE_MKSWAP_UUID is not set
 CONFIG_MORE=y
-CONFIG_MOUNT=y
-# CONFIG_FEATURE_MOUNT_FAKE is not set
-# CONFIG_FEATURE_MOUNT_VERBOSE is not set
-# CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
-CONFIG_FEATURE_MOUNT_NFS=y
-# CONFIG_FEATURE_MOUNT_CIFS is not set
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
@@ -758,6 +758,11 @@ CONFIG_NC=y
 CONFIG_PING=y
 CONFIG_PING6=y
 CONFIG_FEATURE_FANCY_PING=y
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
 # CONFIG_WHOIS is not set
 CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
@@ -885,11 +890,6 @@ CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
 # CONFIG_UDPSVD is not set
 # CONFIG_VCONFIG is not set
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-CONFIG_FEATURE_WGET_TIMEOUT=y
 # CONFIG_ZCIP is not set
 
 #
-- 
1.9.1


