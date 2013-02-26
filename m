Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGz1-0000yU-Fn
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:38:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9LdWZ024710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:39 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:35 +0800
Message-ID: <41e6fdecd7aa6f3c736cb9a5ec90f58f6d96b720.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 2/7] e2fsprogs: upgrade to the git version
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
X-List-Received-Date: Tue, 26 Feb 2013 09:38:04 -0000
Content-Type: text/plain

Change the source from tarball to git repo, and upgrade it to the
up-to-date git version.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc    | 4 +++-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index aea74f7..d8ae037 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,8 +19,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b48f21d765b875bd10400975d12c1ca2 \
 SECTION = "base"
 DEPENDS = "util-linux"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/${BPN}.git;protocol=git \
            file://mkdir.patch"
 
+S = "${WORKDIR}/git"
+
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index e6d90a1..70255ce 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
 "
 
-SRC_URI[md5sum] = "9e444c240c1001b3292d108fbad0f49c"
-SRC_URI[sha256sum] = "726b5919edeaee5b077d7a5b602284f1453ea31cf499efa433af26c679b667a5"
+SRCREV = "fca8b1b2416c384b91b4fe00d6d37cfccb8fb3d5"
+PV = "1.43-WIP+git${SRCPV}"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
-- 
1.7.11.2



