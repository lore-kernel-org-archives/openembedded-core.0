Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D0B3C75A31
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 06:58:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u366wmpZ024211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 23:58:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 23:58:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 23:58:41 -0700
Message-ID: <198ea506d53bf82e1ac8ae48469acb8bd486c481.1459925867.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459925867.git.liezhi.yang@windriver.com>
References: <cover.1459925867.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] tcl: remove unused fix-configure.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2016 06:58:49 -0000
Content-Type: text/plain

It wasn't used since 2010 at least, and the configure works well, so
remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/tcltk/tcl/fix-configure.patch | 46 ----------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/fix-configure.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/fix-configure.patch b/meta/recipes-devtools/tcltk/tcl/fix-configure.patch
deleted file mode 100644
index b692a0e..0000000
--- a/meta/recipes-devtools/tcltk/tcl/fix-configure.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Index: unix/tcl.m4
-===================================================================
---- tcl8.4.11/unix.orig/tcl.m4
-+++ tcl8.4.11/unix/tcl.m4
-@@ -845,7 +845,7 @@ AC_DEFUN(SC_CONFIG_CFLAGS, [
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print $3}' /etc/.relid'`
-+		system=MP-RAS-`awk '{print $3}' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-@@ -2250,7 +2250,7 @@ AC_DEFUN(SC_BLOCKING_STYLE, [
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print $3}' /etc/.relid'`
-+		system=MP-RAS-`awk '{print $3}' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-Index: unix/configure
-===================================================================
---- tcl8.4.11/unix.orig/configure
-+++ tcl8.4.11/unix/configure
-@@ -2130,7 +2130,7 @@ echo "configure:2121: checking system ve
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print }' /etc/.relid'`
-+		system=MP-RAS-`awk '{print }' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-@@ -7608,7 +7608,7 @@ echo "configure:7600: checking FIONBIO v
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print }' /etc/.relid'`
-+		system=MP-RAS-`awk '{print }' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-- 
2.8.0


