Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATLv-0002nS-Qv
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:45:55 +0100
Received: by wibhm17 with SMTP id hm17so13118wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Vjmh8f4UN4F84pfrPY2bpsSGacy1raWp45DSAGFUguw=;
	b=oZv4Np31cgcT7G1UOsyeyRIVVGgTO20DZ5XUYSl7b7BA7KVQkXRWCuska7YzUQxWyK
	5kG+nlJ2WiZR2X4UVN0zJJ6pgzRrR7RUJE7QBg+CTupnpV90MvCmOElOiXvUXbylo6PD
	pEtvIJckmwhe5G3fWeJfDY9lFY5ib3TE/Uw0mk7vK5ZVWP/7Wzfdkb3x4c7uj4crawin
	j51OGPj9O3FLmjjLDa2uaMy5dM5YV2sp1hb/JLw1FwUZ5vQK8zVEtMI0Hira+esmDseh
	g2MBV2uuE+isygLw7eZxuoYwX0R8zG4Qerqb1oUODdyOBYS4b9sr6c8n9FSXy98O/Azx
	yiBQ==
Received: by 10.180.103.35 with SMTP id ft3mr12485368wib.0.1332365821848;
	Wed, 21 Mar 2012 14:37:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fw5sm7709598wib.0.2012.03.21.14.37.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:11 +0100
Message-Id: <f21ffad75e377042ebb9d59a01d6b424c6bba711.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/13] gtk+: import native support from meta-oe
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
X-List-Received-Date: Wed, 21 Mar 2012 21:45:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 4e03670..1700117 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -23,6 +23,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 PACKAGECONFIG[gtk-directfb] = "--with-gdktarget=directfb,,directfb"
 
+BBCLASSEXTEND = "native"
+EXTRA_OECONF_virtclass-native += "--disable-introspection"
+
 inherit autotools pkgconfig
 
 PACKAGES += "libgail gtk-demo"
@@ -65,6 +68,7 @@ GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
+RRECOMMENDS_${PN}_virtclass-native = ""
 
 do_install () {
 	autotools_do_install
-- 
1.7.8.5



