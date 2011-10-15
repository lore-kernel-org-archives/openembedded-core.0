Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF12z-0006jI-S0
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:00:55 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so3087329bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lM16kbgequxqKfZuDb8Ci5QF/KmCHrVUBwEtCI5RMDI=;
	b=H4f/EfzXliEDN6FBEjXXUY2CFjv70SoXBRVEzkfnTJhN311ehY1iyQOjWO2MN6FQjQ
	9nBMH2KOjQ1nmC/MaVTbxn7WFu4Z7G0sbGH+J1xPuESo6QBBkwxMwW/ap/ZxfpOXJ2an
	vl35SnFsdJK3aUEp80cHa6SDCOZHWEs5/yiKs=
Received: by 10.223.17.11 with SMTP id q11mr10142559faa.13.1318672508776;
	Sat, 15 Oct 2011 02:55:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o22sm9332759fab.11.2011.10.15.02.55.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 02:55:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Oct 2011 11:54:51 +0200
Message-Id: <1318672491-31826-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1318672491-31826-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318672491-31826-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] mesa-common: install internal GL headers to libgl-dev
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
X-List-Received-Date: Sat, 15 Oct 2011 10:00:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index b8f2289..ca2d931 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -51,3 +51,8 @@ FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_libegl-dbg += "${libdir}/egl/.debug/*"
+
+do_install_append () {
+    install -d ${D}/${includedir}/GL
+    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
+}
-- 
1.7.7



