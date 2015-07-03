Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7B90575CEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 01:45:57 +0000 (UTC)
Received: by ieqy10 with SMTP id y10so68601448ieq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 18:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2Y882ltHxZNRJ6urLAfJ9oL5wB5YvJtpBbOSNxY4KWk=;
	b=sDE4vwks6Ft9HapBRbKyVJG6/5U+ar2Top4Hdf7vVmeTNRcJ0ECLNW1SCRf/iYeGj3
	iaoQskvwqq8x9LII2MGO4z6ysTIk5SwFddrdQtcr52rKpEwaGcmCzjG5/lQr+T3o+7/Q
	hdVtMhG4VbnBWjqP/cx7P/Wuwvhdlxoz2NUTbC4rZCQ7UvGEwKym9PCnaNuS0ooNKjr9
	rBUUGzlwE+Y5V35rS9UmHK4rCDVbuq7Lu3mmuCAkwenDsKWAZVKMIJeGDeQ6R6IaF6YI
	GFHFy3Qex1Rj7tI4NPIRobhUrkyK0MmF26KGPmfklM7XBIlpx9k0gD7k/6wVJmE7RNZB
	Nnbw==
X-Received: by 10.50.225.35 with SMTP id rh3mr45268795igc.29.1435887958018;
	Thu, 02 Jul 2015 18:45:58 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id x4sm5233578iod.26.2015.07.02.18.45.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Jul 2015 18:45:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jul 2015 18:45:39 -0700
Message-Id: <1435887942-20254-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
References: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] busybox: merge login-utilities.cfg into defconfig
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
X-List-Received-Date: Fri, 03 Jul 2015 01:45:59 -0000

The login-utilities.cfg busybox config fragment was added during the
transition of default login manager from tinylogin to busybox [1]. The
tinylogin recipe was removed from oe-core prior to the 1.5 / Dora
release [2].

Merging the config fragment into defconfig simplifies the process of
keeping the oe-core busybox defconfig aligned with new busybox releases.

  [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=4207
  [2] http://git.openembedded.org/openembedded-core/commit/?id=2762ff976a3473be4259889029e048ab8b3be5ab

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig        | 26 +++++++++++-----------
 .../busybox/busybox/login-utilities.cfg            | 13 -----------
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 -
 meta/recipes-core/busybox/busybox_git.bb           |  1 -
 4 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 468c40e..2a1706b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -449,39 +449,39 @@ CONFIG_MESG=y
 #
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
-# CONFIG_FEATURE_SHADOWPASSWDS is not set
+CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
-# CONFIG_ADDUSER is not set
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+CONFIG_ADDUSER=y
+CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
-# CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+CONFIG_ADDGROUP=y
+CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-# CONFIG_DELUSER is not set
-# CONFIG_DELGROUP is not set
+CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
 # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-# CONFIG_GETTY is not set
-# CONFIG_LOGIN is not set
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
 # CONFIG_LOGIN_SESSION_AS_CHILD is not set
 # CONFIG_PAM is not set
 # CONFIG_LOGIN_SCRIPTS is not set
 # CONFIG_FEATURE_NOLOGIN is not set
 # CONFIG_FEATURE_SECURETTY is not set
-# CONFIG_PASSWD is not set
+CONFIG_PASSWD=y
 # CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
 # CONFIG_CRYPTPW is not set
 # CONFIG_CHPASSWD is not set
 CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
-# CONFIG_SU is not set
+CONFIG_SU=y
 # CONFIG_FEATURE_SU_SYSLOG is not set
 # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
-# CONFIG_SULOGIN is not set
-# CONFIG_VLOCK is not set
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
 
 #
 # Linux Ext2 FS Progs
diff --git a/meta/recipes-core/busybox/busybox/login-utilities.cfg b/meta/recipes-core/busybox/busybox/login-utilities.cfg
deleted file mode 100644
index cc9b2db..0000000
--- a/meta/recipes-core/busybox/busybox/login-utilities.cfg
+++ /dev/null
@@ -1,13 +0,0 @@
-CONFIG_FEATURE_SHADOWPASSWDS=y
-CONFIG_ADDUSER=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_ADDGROUP=y
-CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
-CONFIG_DELUSER=y
-CONFIG_DELGROUP=y
-CONFIG_GETTY=y
-CONFIG_LOGIN=y
-CONFIG_PASSWD=y
-CONFIG_SU=y
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 85e462e..f698c34 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -27,7 +27,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index c5596d8..ce70e8a 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -33,7 +33,6 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
-- 
1.9.1


