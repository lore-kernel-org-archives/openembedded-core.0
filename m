Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgLMJ-00014G-Kj
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 21:14:19 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2153988eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 11:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=W3aM46My6M7noDeOgxJo+5BiKSGv4X+aaeurGn9JrIk=;
	b=v3FfTJ+2QmoVJVGNh4QDkRZtkfvvTASk4WRlZq/MhL3Co+e7d9tlrew4PRKfxYnJWu
	aDJPJCUiyJPpXXk+H72ZU2J8TxlUQXy26Aa9xezIuIEvviwKEfpR1AWuSRKvpCh9Wh6G
	iXObb0Q7SyQX8YGUQL3MRA7kIgo/iXX8rYveGEJYPZa59b9al+AGdSYSIWH9Y1kBFWmr
	UM59f5X/oAGe1VHHi0bvWxfmfZ5CxjqPVpUze0C4dwNLsIqa4LwamE8gOdsyGbI3KgsW
	qG4A4I3ud2Fuk17xNf8QCb2Z9PFSaCK5pguZ0ThEF4GmtzZdV2Vyvf9TpdwPpQPDbGm4
	XtHw==
Received: by 10.14.202.3 with SMTP id c3mr33693160eeo.4.1354737595470;
	Wed, 05 Dec 2012 11:59:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm11140014eep.12.2012.12.05.11.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 11:59:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 20:59:51 +0100
Message-Id: <d14951f1a0d4ae245780a6520d18588ce8594e40.1354737450.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <3ea1d54a3b1673540257592c1cfdaa9faf7a5d43.1354731942.git.Martin.Jansa@gmail.com>
References: <3ea1d54a3b1673540257592c1cfdaa9faf7a5d43.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354737450.git.Martin.Jansa@gmail.com>
References: <cover.1354737450.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 4/5] git: fix unpackaged python files
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
X-List-Received-Date: Wed, 05 Dec 2012 20:14:19 -0000

* EXTRA_OEMAKE is needed after inheriting autotools which sets it to empty
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

v2: should be disabled correctly now, instead of packaging them

 meta/recipes-devtools/git/git.inc      | 4 ++--
 meta/recipes-devtools/git/git_1.7.7.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 55e1482..82df6e3 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -14,10 +14,10 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
 "
 
-EXTRA_OEMAKE = "NO_PYTHON=1"
-
 inherit autotools perlnative
 
+EXTRA_OEMAKE = "NO_PYTHON=1"
+
 do_compile_prepend () {
 	# Remove perl/perl.mak to fix the out-of-date perl.mak error
 	# during rebuild
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



