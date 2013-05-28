Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 213296A4E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 05:39:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4S5dOXY007152
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 22:39:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 27 May 2013 22:39:24 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 13:39:39 +0800
Message-ID: <4f4edbf9838c30a32a61d1284b86c9eacb30b1d1.1369719531.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369719531.git.Qi.Chen@windriver.com>
References: <cover.1369719531.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 2/2] busybox: enable login/password commands by default
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
X-List-Received-Date: Tue, 28 May 2013 05:39:23 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

As we switch to using busybox as the default login manager, we here
modify the defconfig file of busybox to enable the commands that
were previously provided by tinylogin.

These commands are: addgroup, adduser, delgroup, deluser, login, su,
getty, sulogin, passwd and vlock.

[YOCTO #4207]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox-1.20.2/defconfig |   26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/defconfig b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
index bdfdadf..72f792d 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
@@ -449,39 +449,39 @@ CONFIG_INIT_TERMINAL_TYPE=""
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
 CONFIG_FIRST_SYSTEM_ID=0
 CONFIG_LAST_SYSTEM_ID=0
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
-- 
1.7.9.5


