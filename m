Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB9E770DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:59 +0000 (UTC)
Received: by pacao1 with SMTP id ao1so5902403pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kH4k1KFcG0/gdT6e5ZUSlOcmcONo8ol4Guw+hJb0pjE=;
	b=0Inx+5odpMlfFoUpu+zRyBk+36HP7pyuKcyn7GyvClNgsSRhjAWfP7HANqUb1W/5aP
	XXTPpd8VisQ8qKDTVTh7DDxjVvZ9cxSNs9seRiEnCMGRqYkTEFFVD/HQIzSGyecM9qJr
	NCBSLOXarIo4uH0f1i7+LNB/d6GTI4goSc172cHBdOfZs8ldhwIciCsc1btJb6+9PMpg
	9bm3LN1R6SF/2JOkH/74eorVY1wBNu7mRIOZJZN+6WNOim6++jebYm22ohQI1XGi56ey
	xTPDq8qC0jDafyBniI1wdVCy5GnLtVf99hmGmmDamwWLgj5GpcyY4CO9CHaGmlnRvonq
	qPBA==
X-Received: by 10.68.90.34 with SMTP id bt2mr7078572pbb.145.1444873440327;
	Wed, 14 Oct 2015 18:44:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:21 -0700
Message-Id: <1444873403-21093-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 09/11] busybox: re-order defconfig to align with busybox 1.24.0
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
X-List-Received-Date: Thu, 15 Oct 2015 01:44:00 -0000

No functional changes, simply re-order lines in defconfig so that
the existing options don't move elsewhere in the file when run
though busybox 1.24.0 'make oldconfig'.

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


