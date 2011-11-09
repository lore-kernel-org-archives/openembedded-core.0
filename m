Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCI6-0007uS-Vk
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:50:29 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2005273faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/6e8whj3iMTLaVuxlZP/Mga2ZeRG6bVjmnfU9FvQLWs=;
	b=l7Ym3SunTYpSqXW29wAucpRYWK3HYRT+GKaj1TsSaxEyHFE9SNI2xpeMG835SCwSP0
	CteA8rILlc81N03QFpC/P3TI4jkOIhXNr9bV5c8uSRprOwyY4EeqXNKOBCaOBwFjuVOE
	UkGlvadum52oJX3B29X8uMxQ7phPQLP8hVB+E=
Received: by 10.223.76.197 with SMTP id d5mr6280976fak.13.1320860653402;
	Wed, 09 Nov 2011 09:44:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm7451406faf.0.2011.11.09.09.44.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:44:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:43:26 +0100
Message-Id: <68f2dabecbc86e3869b9c6310fa37ab33e2a3607.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
References: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2][oe-core 05/10] task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and graphical_init_manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2011 17:50:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/tasks/task-core-x11.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/tasks/task-core-x11.bb
index 26d550a..106bc0f 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -30,6 +30,12 @@ ALLOW_EMPTY = "1"
 FILEMANAGER ?= "pcmanfm"
 FILEMANAGER_mips ?= ""
 
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+
+# elsa, xserver-nodm-init
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
+
 
 RDEPENDS_task-core-x11-base = "\
     dbus \
@@ -42,8 +48,8 @@ RDEPENDS_task-core-x11-base = "\
     matchbox-desktop \
     matchbox-session \
     ${XSERVER} \
-    x11-common \
-    xserver-nodm-init \
+    ${VIRTUAL-RUNTIME_xserver_common} \
+    ${VIRTUAL-RUNTIME_graphical_init_manager} \
     liberation-fonts \
     xauth \
     xhost \
-- 
1.7.8.rc1



