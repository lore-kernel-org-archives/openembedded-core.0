Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi6r-00023e-Mn
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:50:57 +0100
Received: by yenm12 with SMTP id m12so4959356yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=da0uVBT2p3wnYmJeyBIC63i5OAZcD/2Gyt1k4ShE3pM=;
	b=Xt7Ap+geMZkRYC5V31sj1QW7FrGfZF4eXDc1FTe1neiOS38y6du+N1bblb6J7vlXe+
	obDYacfs3+OkhNrjWhCxJBYhz5MPnWVwJbV5bUhUm1FOSypVyOlA9KW4gGGdVbjwEmDi
	ifNldIa95+fjnBX3aFfsRhynPbsPWqrZ2UDZ0=
Received: by 10.236.22.136 with SMTP id t8mr14945365yht.30.1324557831318;
	Thu, 22 Dec 2011 04:43:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:43:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:23 +0000
Message-Id: <6b3f9177357c663bd267b3d750dca5ef66a76bdb.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
Subject: [PATCH v2 3/9] udev: reorganize files of 164 version
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
X-List-Received-Date: Thu, 22 Dec 2011 12:50:58 -0000

We merged both files and udev-164 directory onto a single directory
and renamed udev-new.inc onto udev.inc as we have a single version of
udev now.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/{udev-new.inc => udev.inc}  |    0
 .../udev/{files => udev}/devfs-udev.rules          |    0
 meta/recipes-core/udev/{udev-164 => udev}/init     |    0
 meta/recipes-core/udev/{files => udev}/links.conf  |    0
 .../udev/{udev-164 => udev}/local.rules            |    0
 meta/recipes-core/udev/{files => udev}/mount.sh    |    0
 meta/recipes-core/udev/{files => udev}/network.sh  |    0
 .../udev/{udev-164 => udev}/permissions.rules      |    0
 .../recipes-core/udev/{udev-164 => udev}/run.rules |    0
 .../udev/{files => udev}/udev-166-v4l1-1.patch     |    0
 meta/recipes-core/udev/{files => udev}/udev-cache  |    0
 .../udev/{udev-164 => udev}/udev.rules             |    0
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 13 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-core/udev/{udev-new.inc => udev.inc} (100%)
 rename meta/recipes-core/udev/{files => udev}/devfs-udev.rules (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/init (100%)
 rename meta/recipes-core/udev/{files => udev}/links.conf (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/local.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/mount.sh (100%)
 rename meta/recipes-core/udev/{files => udev}/network.sh (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/permissions.rules (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/run.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-166-v4l1-1.patch (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-cache (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/udev.rules (100%)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev.inc
similarity index 100%
rename from meta/recipes-core/udev/udev-new.inc
rename to meta/recipes-core/udev/udev.inc
diff --git a/meta/recipes-core/udev/files/devfs-udev.rules b/meta/recipes-core/udev/udev/devfs-udev.rules
similarity index 100%
rename from meta/recipes-core/udev/files/devfs-udev.rules
rename to meta/recipes-core/udev/udev/devfs-udev.rules
diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev/init
similarity index 100%
rename from meta/recipes-core/udev/udev-164/init
rename to meta/recipes-core/udev/udev/init
diff --git a/meta/recipes-core/udev/files/links.conf b/meta/recipes-core/udev/udev/links.conf
similarity index 100%
rename from meta/recipes-core/udev/files/links.conf
rename to meta/recipes-core/udev/udev/links.conf
diff --git a/meta/recipes-core/udev/udev-164/local.rules b/meta/recipes-core/udev/udev/local.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/local.rules
rename to meta/recipes-core/udev/udev/local.rules
diff --git a/meta/recipes-core/udev/files/mount.sh b/meta/recipes-core/udev/udev/mount.sh
similarity index 100%
rename from meta/recipes-core/udev/files/mount.sh
rename to meta/recipes-core/udev/udev/mount.sh
diff --git a/meta/recipes-core/udev/files/network.sh b/meta/recipes-core/udev/udev/network.sh
similarity index 100%
rename from meta/recipes-core/udev/files/network.sh
rename to meta/recipes-core/udev/udev/network.sh
diff --git a/meta/recipes-core/udev/udev-164/permissions.rules b/meta/recipes-core/udev/udev/permissions.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/permissions.rules
rename to meta/recipes-core/udev/udev/permissions.rules
diff --git a/meta/recipes-core/udev/udev-164/run.rules b/meta/recipes-core/udev/udev/run.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/run.rules
rename to meta/recipes-core/udev/udev/run.rules
diff --git a/meta/recipes-core/udev/files/udev-166-v4l1-1.patch b/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
similarity index 100%
rename from meta/recipes-core/udev/files/udev-166-v4l1-1.patch
rename to meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
diff --git a/meta/recipes-core/udev/files/udev-cache b/meta/recipes-core/udev/udev/udev-cache
similarity index 100%
rename from meta/recipes-core/udev/files/udev-cache
rename to meta/recipes-core/udev/udev/udev-cache
diff --git a/meta/recipes-core/udev/udev-164/udev.rules b/meta/recipes-core/udev/udev/udev.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/udev.rules
rename to meta/recipes-core/udev/udev/udev.rules
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index d487add..3e4e402 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,4 +1,4 @@
-include udev-new.inc
+include udev.inc
 
 PR = "r7"
 
-- 
1.7.2.5



