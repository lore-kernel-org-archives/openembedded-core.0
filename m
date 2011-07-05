Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWy-0006xr-P7
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id C19F131330; Tue,  5 Jul 2011 23:51:25 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:08 +0100
Message-Id: <4cfb662d2aaca9ff7225186e206b4d2dfffbe2a0.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/17] systemtap: Don't set prefix to a path including so examples get placed in the correct path and packaged correctly
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index f24c179..e8aa54f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "elfutils sqlite3"
 
 SRCREV = "4ab3a1863bf4f472acae7a809bf2b38d91658aa8"
-PR = "r3"
+PR = "r4"
 PV = "1.4+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
 	file://fix_for_compilation_with_gcc-4.6.0.patch \
           "
 
-EXTRA_OECONF = "--prefix=${D} --with-libelf=${STAGING_DIR_TARGET} --without-rpm \
+EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 	     ac_cv_file__usr_include_nss=no \
 	     ac_cv_file__usr_include_nss3=no \
 	     ac_cv_file__usr_include_nspr=no \
-- 
1.7.4.1



