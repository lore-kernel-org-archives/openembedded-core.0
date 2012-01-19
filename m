Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RnsWd-0004XV-LC
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 14:59:35 +0100
Received: by eekd41 with SMTP id d41so568241eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fsLYlPO1Z81H6tuMqNBurc8lD7fV/m/smNJrRt4NgWw=;
	b=QhO5fIqUdrjEF0SZGdLkZa0t/V8pJtX+Z1XPXP4stD/t56wv8C/34nG2Clw1nxT23S
	tbL3fWRtIrvjS+AR9V/WPgh9nvNk3uK2g8W2x0tBlQFSwZzH9cWPEuSouIgSSd6a9goM
	V1PXGlWbrS4yMBWI4cD+Zg6eFifdTWxyshdCc=
Received: by 10.14.17.101 with SMTP id i77mr1750122eei.30.1326981113138;
	Thu, 19 Jan 2012 05:51:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm113620489eef.7.2012.01.19.05.51.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 05:51:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 14:51:44 +0100
Message-Id: <1326981104-9888-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH] task-base: rename VIRTUAL-RUNTIME-alsa-state to use underscore
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
X-List-Received-Date: Thu, 19 Jan 2012 13:59:35 -0000

* in http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/016226.html
  we talked about
  VIRTUAL-RUNTIME_alsa-state, but
  VIRTUAL-RUNTIME-alsa-state was used instead, which is inconsistent with other VIRTUAL-RUNTIME vars

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 meta/recipes-core/tasks/task-base.bb           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 6615d55..efa8117 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 #
 VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
 VIRTUAL-RUNTIME_apm ?= "apm"
-VIRTUAL-RUNTIME-alsa-state ?= "alsa-state"
+VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index a7d7c40..2032432 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -181,7 +181,7 @@ RRECOMMENDS_task-base-vfat = "\
 RDEPENDS_task-base-alsa = "\
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
-    ${VIRTUAL-RUNTIME-alsa-state}"
+    ${VIRTUAL-RUNTIME_alsa-state}"
 
 RRECOMMENDS_task-base-alsa = "\
     kernel-module-snd-mixer-oss \
-- 
1.7.8.3



