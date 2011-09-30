Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fKs-0003th-4z
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:49:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+mnjboyKcWkEWUETTHMOH3XU82Z1MCJtjMYZpH08iHQ=;
	b=i5l50PVV+UAI3FuDz2Jhag9j4KEreBNfKJjB8ouSifBMi4wUW+SL94bCyhKE/fozWb
	u0T8bzOmRa8AnuliRxanPZUMeQY2uWEWMe476kshlEeFSDHtJkN1CExviIe1wLJN8uFl
	H84PcDfNSw71AtAKiEps6OgvMmAUVAe98G+fo=
Received: by 10.223.8.139 with SMTP id h11mr1340804fah.21.1317397426893;
	Fri, 30 Sep 2011 08:43:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm7158744fam.22.2011.09.30.08.43.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:43:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:21 +0200
Message-Id: <0ba663758bd1b5c4c8cd06f39f0a9872ae13e0f0.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 2/9] json-glib: upgrade to 0.14.0
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
X-List-Received-Date: Fri, 30 Sep 2011 15:49:14 -0000

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



