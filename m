Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATLX-0002ZW-To
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:45:31 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1340601wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=46kxJJJT5TeaBGnlKw+yDZ6zVR5g0g5UJw0MeMee9jM=;
	b=yI3RHCn4+oN3ThX3Jsl2Sh5xzySkCLmozr4BGY0SIagO2NiUpnO8wsE7fYLz3PD7u2
	qc7vJ44IsoalTOIMSzASZywHLG3TQ/3XU8y43XIx2Pb1SMsZonHgndE9zCx6xg+3Mr4i
	hB+VCdkgXSu89qAU3s6KGixypEaIuB1IrR9iY+euaY068eHGG2eIkDQe2EEUJGIWlLRZ
	3Ed4YNf15y3h5OcsAz8YUL4o8efsvIKkTgKd7kqtmfxFtV6CrGVbgL5cI0fhPOtJDzS9
	SY+gAmVFtAX6xNkwOB0fRBQTdbwYVL6qvBf4XzYV7gLr3LxbEFLnfbRXvZ2VsgFk6e8i
	7ilQ==
Received: by 10.216.136.149 with SMTP id w21mr3009922wei.90.1332365800119;
	Wed, 21 Mar 2012 14:36:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm7674821wib.5.2012.03.21.14.36.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:36:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:08 +0100
Message-Id: <a5136599436cccfdcc6688acb8c617c58e88e434.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/13] classes: scons: add EXTRA_OESCONS
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
X-List-Received-Date: Wed, 21 Mar 2012 21:45:32 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/scons.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 211746f..a07a366 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -1,12 +1,14 @@
 DEPENDS += "python-scons-native"
 
+EXTRA_OESCONS ?= ""
+
 scons_do_compile() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${prefix} prefix=${prefix} || \
+        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
         bbfatal "scons build execution failed."
 }
 
 scons_do_install() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install || \
+        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install ${EXTRA_OESCONS}|| \
         bbfatal "scons install execution failed."
 }
 
-- 
1.7.8.5



