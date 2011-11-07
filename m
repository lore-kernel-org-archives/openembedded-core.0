Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ9P-0000Rq-5C
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:26:15 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2512213faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZkU1V3kcW+Q91ZWm33tI3P7CFO4hQQNV2o7/OKWivAc=;
	b=XRCoha4KB3Eert/RRlKgc+uxj2nTlzoXji8p05AgzRy9HZPRJB04oHxf25iHPC7SzF
	28vNOCYeXUesgihEUkJJGGDHymtcKC7d67/m/BoxczTN4Y8ph/9p8qLRRzTlDEvEgpBd
	IcDBoDMHqUNHEeyu//88za8sRj6PGvS4S/EuQ=
Received: by 10.152.105.211 with SMTP id go19mr6566732lab.31.1320675603866;
	Mon, 07 Nov 2011 06:20:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id tu2sm8616863lab.11.2011.11.07.06.20.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:20:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:21 +0100
Message-Id: <70d41446a7901ea85472633559074a4276ec4018.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
References: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320675529.git.Martin.Jansa@gmail.com>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
Subject: [oe-core 6/6] task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and graphical_init_manager
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
X-List-Received-Date: Mon, 07 Nov 2011 14:26:15 -0000

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
1.7.7.2



