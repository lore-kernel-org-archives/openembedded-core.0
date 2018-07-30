Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9EB78D80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:38:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6U9cCBY022930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 02:38:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 30 Jul 2018 02:38:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2018 17:41:57 +0800
Message-ID: <3d50059e869d9d288a64995954c116c039f8fa2f.1532943666.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1532943666.git.Qi.Chen@windriver.com>
References: <cover.1532943666.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: move init related configs to init.cfg
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
X-List-Received-Date: Mon, 30 Jul 2018 09:38:11 -0000
Content-Type: text/plain

Move init related configs to init.cfg.

These config items do not make much sense unless busybox is selected
as the init manager. They should belong to init.cfg.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 meta/recipes-core/busybox/busybox/init.cfg  |  7 ++++++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index fbb5fd8..59d93c7 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -468,21 +468,21 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 # CONFIG_BOOTCHARTD is not set
 # CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
 # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
-CONFIG_HALT=y
-CONFIG_POWEROFF=y
-CONFIG_REBOOT=y
+# CONFIG_HALT is not set
+# CONFIG_POWEROFF is not set
+# CONFIG_REBOOT is not set
 # CONFIG_FEATURE_CALL_TELINIT is not set
-CONFIG_TELINIT_PATH=""
+# CONFIG_TELINIT_PATH is not set
 # CONFIG_INIT is not set
 # CONFIG_LINUXRC is not set
 # CONFIG_FEATURE_USE_INITTAB is not set
 # CONFIG_FEATURE_KILL_REMOVED is not set
-CONFIG_FEATURE_KILL_DELAY=0
+# CONFIG_FEATURE_KILL_DELAY is not set
 # CONFIG_FEATURE_INIT_SCTTY is not set
 # CONFIG_FEATURE_INIT_SYSLOG is not set
 # CONFIG_FEATURE_INIT_QUIET is not set
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
-CONFIG_INIT_TERMINAL_TYPE=""
+# CONFIG_INIT_TERMINAL_TYPE is not set
 # CONFIG_FEATURE_INIT_MODIFY_CMDLINE is not set
 
 #
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
index 006d4c6..3c1fdd4 100644
--- a/meta/recipes-core/busybox/busybox/init.cfg
+++ b/meta/recipes-core/busybox/busybox/init.cfg
@@ -1,3 +1,8 @@
 CONFIG_INIT=y
 CONFIG_FEATURE_USE_INITTAB=y
-
+CONFIG_HALT=y
+CONFIG_POWEROFF=y
+CONFIG_REBOOT=y
+CONFIG_FEATURE_KILL_DELAY=0
+CONFIG_TELINIT_PATH=""
+CONFIG_INIT_TERMINAL_TYPE=""
-- 
1.9.1


