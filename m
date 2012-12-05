Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJu0-0006Bd-6b
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:41:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3064394eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4nrezb7uAkxnu5hEbzUnmcERciMC98ZEyHS3ePItmhI=;
	b=nRRsfg3HRkhPKJhsQqF+YSjC4ObJdQ/Et4H0QTIxa3uFDcxHEyltlx31ZKCPOOWcUg
	EImELivU0LKj00Kt2I+mHVDEybkD1HBPKv6VyBbbPibwLzoNH3AA1Ws0LJ9oiRAkopW0
	FIOagYz3iQk3cqthxwbOak6IyvJdfSnRQ7u2XDvLP2clcQFFucV7qJmkhgkOrbub/7Wo
	tDV8JUhArTxXqz/ygUKQ/7t7oF0Q6AJOTodrwcKFXRgvuqQOf5g4dxbajpFncRQ5+8ig
	lrTrrSGlnNUqNeeS5BS0LfI9o/6kXA2BFLMi2pDfjOe2/MzX2DHtz/XZUJ88wgRiHdgE
	2+9g==
Received: by 10.14.0.133 with SMTP id 5mr37480095eeb.29.1354731998297;
	Wed, 05 Dec 2012 10:26:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm10644288eel.14.2012.12.05.10.26.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:26:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:26:06 +0100
Message-Id: <3ea1d54a3b1673540257592c1cfdaa9faf7a5d43.1354731942.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] git: fix unpackaged python files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:41:07 -0000

* fixes:
git-1.7.7: git: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/python2.7
  /usr/lib64/python2.7/site-packages
  /usr/lib64/python2.7/site-packages/git_remote_helpers-0.1.0-py2.7.egg-info
  /usr/lib64/python2.7/site-packages/git_remote_helpers
  /usr/lib64/python2.7/site-packages/git_remote_helpers/__init__.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/util.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/__init__.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/util.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/__init__.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/importer.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/non_local.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/exporter.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/git.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/repo.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/__init__.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/importer.py
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/exporter.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/repo.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/git.pyc
  /usr/lib64/python2.7/site-packages/git_remote_helpers/git/non_local.py

* fixes [YOCTO #3344]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/git/git.inc      | 4 ++--
 meta/recipes-devtools/git/git_1.7.7.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 55e1482..80a88c2 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -16,7 +16,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 
 EXTRA_OEMAKE = "NO_PYTHON=1"
 
-inherit autotools perlnative
+inherit autotools perlnative python-dir
 
 do_compile_prepend () {
 	# Remove perl/perl.mak to fix the out-of-date perl.mak error
@@ -58,7 +58,7 @@ FILES_${PN}-perltools += " \
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
 
 PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir}/python*"
+FILES_${PN}-python = "${libdir}/python* ${PYTHON_SITEPACKAGES_DIR}"
 
 
 # git-tk package with gitk and git-gui
diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtools/git/git_1.7.7.bb
index 9d24911..6b6e04b 100644
--- a/meta/recipes-devtools/git/git_1.7.7.bb
+++ b/meta/recipes-devtools/git/git_1.7.7.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
 SRC_URI[md5sum] = "5d645884e688921e773186783b65ce33"
-- 
1.8.0



