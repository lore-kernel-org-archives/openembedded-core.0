Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfziz-0007mz-BT
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:45 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so7413885yho.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=VCsdFaq/MbVgfqFwiswx3WX0e4oTke+xWebW+Rnskyc=;
	b=aBXHAPMlXLYghR0/EEubpVqJ8EgYpuSSKf5b/Qgv1XRNA9gdfM656ockL8yQExl936
	wfOUixtPADroxZ40c50GXi/u3x66yRt5723wKvi5iS1Djsca9ku3u3N6EesOT+wat2dz
	azV3aO4oYvnSBqHujDaTPcGAM9NGGphZ2oGN0=
Received: by 10.236.175.198 with SMTP id z46mr45305476yhl.31.1325102193833;
	Wed, 28 Dec 2011 11:56:33 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:37 +0000
Message-Id: <6f18fef6fba719b506a7c14665712ed352d1bbd7.1325101675.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 16/16] udev: remove commented code from init script (no code changes)
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:46 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index c5d969b..65000b7 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -84,18 +84,6 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
-	#install -m 0644 ${WORKDIR}/permissions.rules   ${D}${sysconfdir}/udev/rules.d/permissions.rules
-	#install -m 0644 ${WORKDIR}/run.rules          ${D}${sysconfdir}/udev/rules.d/run.rules
-	#install -m 0644 ${WORKDIR}/udev.rules          ${D}${sysconfdir}/udev/rules.d/udev.rules
-	#install -m 0644 ${WORKDIR}/links.conf          ${D}${sysconfdir}/udev/links.conf
-	#if [ "${UDEV_DEVFS_RULES}" = "1" ]; then
-	#	install -m 0644 ${WORKDIR}/devfs-udev.rules ${D}${sysconfdir}/udev/rules.d/devfs-udev.rules
-	#fi
-
-	# Remove some default rules that don't work well on embedded devices
-	#rm ${D}${libexecdir}/rules.d/60-persistent-input.rules
-	#rm ${D}${libexecdir}/rules.d/60-persistent-storage.rules
-	#rm ${D}${libexecdir}/rules.d/60-persistent-storage-tape.rules
 
 	install -d ${D}${sysconfdir}/udev/scripts/
 
-- 
1.7.2.5



