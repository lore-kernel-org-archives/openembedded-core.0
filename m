Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtwLu-0003It-SL
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 08:45:19 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so1241102fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zfieCstBX4fWSwy+ejCi/1lb+sd1A7vDqDcAPdwQNZk=;
	b=Tp8E+BakmsEdFnP5Gu3hRoLD6OP77MCZkdqTHgAPAyvh0BckB0pzMsoSTYxKAu2W6M
	GxChjH2+7mQw/R8VuoCeahFtZ1SIJezdEee9ov5LtGfeUGsi+XdaCl33Kj10OMZNfhz1
	e8gqBgb0P/NJM4RjfrpuLv1ItnOp6oXxgZyzE=
Received: by 10.223.151.6 with SMTP id a6mr574363faw.120.1313649642041;
	Wed, 17 Aug 2011 23:40:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p3sm1486722faa.33.2011.08.17.23.40.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 23:40:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 08:40:36 +0200
Message-Id: <d41b52b9e9df02e8ab44b70c66a8c6ac320412b6.1313649419.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313649419.git.Martin.Jansa@gmail.com>
References: <cover.1313649419.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] task-core-boot: allow distribution to override default dev_manager provider with VIRTUAL-RUNTIME_dev_manager
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
X-List-Received-Date: Thu, 18 Aug 2011 06:45:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/tasks/task-core-boot.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index eb2b548..9116c38 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -17,6 +17,9 @@ PR = "r8"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
+# Distro can override dev_manager provider
+VIRTUAL-RUNTIME_dev_manager ?= "udev"
+
 PACKAGES = "\
     task-core-boot \
     task-core-boot-dbg \
@@ -33,7 +36,7 @@ RDEPENDS_task-core-boot = "\
     netbase \
     sysvinit \
     tinylogin \
-    udev \
+    ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-- 
1.7.6



