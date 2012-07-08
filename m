Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFm-0001Uh-C0
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:34 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16967057pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pHjT02w9s6BCy7EEPwBujy9ZMNT9UOZeg3KRUhp07bE=;
	b=bCpcqY1Ns8MzNuAOGGra+eA8gIDFxmey5Jdh8u8sF1v7niJls+yCuL1MTnd736VKtX
	GSsLe0anNQ2cb/iB4EbyjFm3T79ODJ5aoUbuNJW/yxeZ6s8L0/DBblE8M/k6D6hWTYfW
	jbZKjIn02AXl8QZDobyGcStNXM9V1erM5+pN54mi8tzPJvGF+Rh+TS7tw9Jt6wgTmBkl
	wYFPZT66US/+OeJJLCsBcWQkgZLeWlm/pU2O7c0KQCM7ztpd2bZbwKQquW9p8OuwhNYD
	WvA+u1xz8NsyxT5RydGZg1iW8prAcwO507XsHQ2vol+O0zZyTae9LNx6a5qj3Al/1cyy
	DkAA==
Received: by 10.66.83.161 with SMTP id r1mr59443890pay.69.1341763888069;
	Sun, 08 Jul 2012 09:11:28 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:33 -0700
Message-Id: <d81a98a5c13256f6f14c5b7921492c293dd9587b.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 15/19] gcc: Switch to git SRC_URI
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:35 -0000

svn has been giving troubles with svn 1.7 upgrade

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 65153b3..a824573 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -8,7 +8,7 @@ PR = "r2"
 # on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
 # to reflect that change
 
-PV = "4.7.1+svnr${SRCPV}"
+PV = "4.7.1+git${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -18,7 +18,7 @@ PV = "4.7.1+svnr${SRCPV}"
 
 BINV = "4.7.2"
 
-SRCREV = "188658"
+SRCREV = "d07e24f4ab59f264d68d21838795349faab5dede"
 BRANCH = "gcc-4_7-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
+SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};proto=git \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -70,8 +70,8 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://fix-g++-sysroot.patch \
 	  "
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
-B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
+B = "${WORKDIR}/git/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
-- 
1.7.9.5



