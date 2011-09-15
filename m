Received: from mail-ew0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Cxa-00072b-VE
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 16:30:39 +0200
Received: by ewy2 with SMTP id 2so1920514ewy.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oOKhtGPb4pUXtarZ1RRonww1pdTB3YOZ16z0MIAM0NA=;
	b=n8OVoJht3Exr50pYO9hzUu5gmnIIBp/7dy3GER4OI10HfVDmvrbVBaoE8oaYXdq5nH
	w0rRcmFltO424TukW4PDjBk21GhsVb9vxVMun9jICtcB64vIpyc7Bdm2xO39Os8DyS0b
	vt1ylmmmZK9JuvcDuEUUFU4EMknLWSJQZd3J8=
Received: by 10.223.6.26 with SMTP id 26mr1036184fax.40.1316096702433;
	Thu, 15 Sep 2011 07:25:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r3sm7167315fam.26.2011.09.15.07.25.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 07:25:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:24:27 +0200
Message-Id: <e1cfe72e7d1e8c165aeec4e380788288fe80a244.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
References: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316096375.git.Martin.Jansa@gmail.com>
References: <cover.1316096375.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] abiword: be carefull with # comments ending with backslash
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
X-List-Received-Date: Thu, 15 Sep 2011 14:30:39 -0000

* next line after #foo \ is not parsed correctly!
* but http://bugzilla.pokylinux.org/show_bug.cgi?id=813 says NOTABUG, so be *very carefull*

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/abiword/abiword-2.5.inc          |    5 +++--
 meta-demoapps/recipes-gnome/abiword/abiword.inc    |    3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc b/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc
index e3f6a9d..ce537df 100644
--- a/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc
+++ b/meta-demoapps/recipes-gnome/abiword/abiword-2.5.inc
@@ -17,8 +17,6 @@ FILES_${PN} += " \
 		${datadir}/abiword-${SHRT_VER}/scripts \
 		${datadir}/abiword-${SHRT_VER}/system.profile-en \
 		${datadir}/abiword-${SHRT_VER}/system.profile-en_GB \
-#		${datadir}/abiword-${SHRT_VER}/templates/A4.awt \
-#		${datadir}/abiword-${SHRT_VER}/templates/US-Letter.awt \
 		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
 		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
 		${datadir}/abiword-${SHRT_VER}/templates/Employee-Directory.awt \
@@ -29,6 +27,9 @@ FILES_${PN} += " \
 		${datadir}/abiword-${SHRT_VER}/templates/Memo.awt \
 		${datadir}/abiword-${SHRT_VER}/templates/Press-Release.awt "
 
+#		${datadir}/abiword-${SHRT_VER}/templates/A4.awt \
+#		${datadir}/abiword-${SHRT_VER}/templates/US-Letter.awt \
+
 inherit autotools pkgconfig
 
 PARALLEL_MAKE = ""
diff --git a/meta-demoapps/recipes-gnome/abiword/abiword.inc b/meta-demoapps/recipes-gnome/abiword/abiword.inc
index 5d7e3ce..b1b0f67 100644
--- a/meta-demoapps/recipes-gnome/abiword/abiword.inc
+++ b/meta-demoapps/recipes-gnome/abiword/abiword.inc
@@ -25,9 +25,10 @@ FILES_${PN} += " \
 		${datadir}/abiword-${SHRT_VER}/glade \
 		${datadir}/abiword-${SHRT_VER}/system.profile-en \
 		${datadir}/abiword-${SHRT_VER}/system.profile-en-GB \
+  "
+
 #		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
 #		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
-  "
 
 inherit autotools pkgconfig
 
-- 
1.7.6.1



