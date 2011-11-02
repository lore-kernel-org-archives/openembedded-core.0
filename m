Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLWke-0003j0-Eu
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 10:04:52 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so186973faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Ta6ImTXPyEL0/5s9NY+Y030FI+1cbMbTx8Q5LpAayBA=;
	b=ZPlcyMqm12SxgLzLaDYjz+A9DlNQGYTNkgRchUo8N+yVxYbJB4XGoCaV2lh0IztWtf
	JP+mSDonhPwqJ8pzCtc1bY59F9msNwH9CSZ2BT4C4fFwgRyIRfdR/4YoZV2jt31c7OtY
	aewQ0o2BH7n8u8YoLQ5uSeLUrDifLtAYYplao=
Received: by 10.223.76.66 with SMTP id b2mr7321306fak.15.1320224327786;
	Wed, 02 Nov 2011 01:58:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm4228324fab.6.2011.11.02.01.58.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 01:58:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 09:58:25 +0100
Message-Id: <1320224305-6747-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1320224305-6747-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320224305-6747-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and graphical_init_manager
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
X-List-Received-Date: Wed, 02 Nov 2011 09:04:52 -0000

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
1.7.7.1



