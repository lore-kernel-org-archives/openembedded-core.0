Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f1F-00060B-NW
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:42 +0200
Received: by mail-pz0-f51.google.com with SMTP id t11so2214665daj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gmK7Z0v1VpY+nqrD4kP5M6zWWUvg+Vh8kyLlKWNzqHI=;
	b=Q3V722IFG3mfOf2AdR7KtUCYZVeYvdMIyK2yoJJzq03CG1XRL7elYuGC75a/JAGh1z
	o0TB2YzuzpimrxK9zZGoQ3s9j+c+P+Qo3S2weCYC4WnuB6WsHxNsxywV3mm8Dtkr6Hw8
	i7t1uzVBJtUsx/GXkckKxi94isjWolZdyvmqeRi2UqDKp2gPF2gCwots69BsyJm83BnP
	dOErrh46jsDhK2RXAb3YAQ1h6Zowutn+Ji7ZF15DpOOB8Dl5j85EQGHu4q8Qmxx17vBr
	pbjT31nWvvkGH9cKj1E8bJT5FMDMcZiLArIOy2UQCs4B/WzLxVmTeHi7msy2brnD8e7k
	lpqg==
Received: by 10.66.72.197 with SMTP id f5mr34543253pav.20.1345518520401;
	Mon, 20 Aug 2012 20:08:40 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:59 -0700
Message-Id: <488cf1c375044a3f5991d9f8b02048c31418c137.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 9/9] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:42 -0000

svn tar balls are 96M as compared to 1.3G git tars
its unnessary to suck in that much of data.

Fixes [YOCTO #2908]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 3f13385..89e22cb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r9"
+PR = "r10"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -11,7 +11,7 @@ PR = "r9"
 # using 4.7.1.0 for upgrade path when we move past 4.7.2 release
 # then we should drop the last 0 as well.
 
-PV = "4.7.1.0+git${SRCPV}"
+PV = "4.7.1.0+svn${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
@@ -21,7 +21,7 @@ PV = "4.7.1.0+git${SRCPV}"
 
 BINV = "4.7.2"
 
-SRCREV = "d07e24f4ab59f264d68d21838795349faab5dede"
+SRCREV = "190218"
 BRANCH = "gcc-4_7-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
@@ -36,7 +36,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -76,7 +76,7 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
 	   file://disablesdt.patch \
 	  "
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
 B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
-- 
1.7.9.5



