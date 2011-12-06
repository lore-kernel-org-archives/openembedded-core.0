Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXqbf-0002H3-W6
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 09:42:32 +0100
Received: by eaac1 with SMTP id c1so1317774eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 00:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=C3CP+2kPiEwrt3nsIfm1x/LyZoqeQnaWsqViT+XawGQ=;
	b=N3Pg+nw3eyS42VWRWKENgicH6t9h+XNquiczG+jOsqF1tUqarjjoeWH8OUUj3Grfag
	qqn+3jeZRzt4qZolJ0725yvKlc0guyQnH9zxEm3g+x2hD5Et/itZWQjnOwLB91txvHae
	1dgp8KKue0Wtt9l51gL+mDnCIdrsfMxCISKjc=
Received: by 10.213.32.208 with SMTP id e16mr1987948ebd.145.1323160544272;
	Tue, 06 Dec 2011 00:35:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 65sm44317134eeg.8.2011.12.06.00.35.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 00:35:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 09:35:21 +0100
Message-Id: <cee7f01a44766450e0475d1ed4cb36ea958e3f1d.1323160412.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
References: <822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323160412.git.Martin.Jansa@gmail.com>
References: <cover.1323160412.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 3/3] matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings
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
X-List-Received-Date: Tue, 06 Dec 2011 08:42:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 01e456e..c738584 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -5,9 +5,12 @@ BUGTRACKER = "http://bugzilla.openedhand.com/"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
 
+# Distro can override initscripts provider
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+
 SECTION = "x11"
-RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato initscripts matchbox-session"
-PR = "r28"
+RDEPENDS_${PN} = "formfactor gtk-sato-engine matchbox-theme-sato gtk-theme-sato matchbox-panel-2 matchbox-desktop-sato ${VIRTUAL-RUNTIME_initscripts} matchbox-session"
+PR = "r29"
 
 # This package is architecture specific because the session script is modified
 # based on the machine architecture.
-- 
1.7.8



