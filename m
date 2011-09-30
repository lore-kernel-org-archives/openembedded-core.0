Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9dV8-0001Wn-Aj
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 15:51:42 +0200
Received: by fxi1 with SMTP id 1so3081323fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+mnjboyKcWkEWUETTHMOH3XU82Z1MCJtjMYZpH08iHQ=;
	b=CI4TpHWFxKftIv9PP4FKO/tYRjKwarS1ZZ57hxM+927nwF63ewlq4KoemGXDyiBQyM
	iK26J3M/5u7qc/Chtw/pQG1iGm+Qerg05nsBMNRyFQn23fA/SI/KRIxjFJD2nfx+aHjb
	Wi8RJtG+ADq4Pfm/kfEV6fKfHo85A8/OzdSkM=
Received: by 10.223.41.153 with SMTP id o25mr8055980fae.79.1317390370308;
	Fri, 30 Sep 2011 06:46:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w14sm6782096fae.13.2011.09.30.06.46.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 06:46:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 15:46:00 +0200
Message-Id: <1317390360-21444-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCHv2] json-glib: upgrade to 0.14.0
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
X-List-Received-Date: Fri, 30 Sep 2011 13:51:42 -0000

* 0.12.4 fails to build with glib-2.30.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{json-glib_0.12.4.bb => json-glib_0.14.0.bb}   |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_0.12.4.bb => json-glib_0.14.0.bb} (74%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb b/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
similarity index 74%
rename from meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
rename to meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
index 5bd9dcd..8635bf0 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
@@ -10,11 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "347e1714e4a2ce54298969d5ffec7dca"
-SRC_URI[archive.sha256sum] = "462cd611016ae189d5e3f258dc7741e6a2e8267404b4e3806aaf346d50f1df7e"
+SRC_URI[archive.md5sum] = "6ba14cc2cc9582250451ff645c20a779"
+SRC_URI[archive.sha256sum] = "efa6a22711c99208feef3bdcd6692573640ac7635725417024980b80990a2966"
 
-PR = "r0"
-
-inherit gnome
+inherit gnome gettext
 
 EXTRA_OECONF = "--disable-introspection"
-- 
1.7.6.1



