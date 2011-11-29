Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWm4-0001Ov-Uk
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:07:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 15:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720818"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:25 -0800
Message-Id: <7803a04d0e0714163088e84b62d5054eb406da45.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 25/26] PR Bump for OpenSSL 1.0
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
X-List-Received-Date: Tue, 29 Nov 2011 23:07:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/claws-mail/claws-mail.inc         |    2 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    2 +-
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    2 +-
 .../telepathy/telepathy-idle_0.1.10.bb             |    2 +-
 meta/recipes-devtools/git/git_1.7.7.bb             |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    2 +-
 meta/recipes-extended/iputils/iputils_s20101006.bb |    2 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb      |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc b/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
index b9fa4d9..664a0bc 100644
--- a/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
+++ b/meta-demoapps/recipes-sato/claws-mail/claws-mail.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Mail user agent"
 #DEPENDS = "gtk+ gpgme libetpan libgnomeprint aspell openssl"
 DEPENDS = "gtk+ libetpan openssl libowl"
 LICENSE = "GPL"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "\
 	${SOURCEFORGE_MIRROR}/sylpheed-claws/claws-mail-${PV}.tar.bz2	\
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index af473e9..c2efa47 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
 
 DEPENDS = "openssl"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
diff --git a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
index f9493d7..749f89e 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
index 22caf42..470df50 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
@@ -5,7 +5,7 @@ DEPENDS = "glib-2.0 dbus telepathy-glib openssl"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtools/git/git_1.7.7.bb
index d383c10..9d24911 100644
--- a/meta/recipes-devtools/git/git_1.7.7.bb
+++ b/meta/recipes-devtools/git/git_1.7.7.bb
@@ -1,6 +1,6 @@
 require git.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
 SRC_URI[md5sum] = "5d645884e688921e773186783b65ce33"
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 5682e05..5417d5e 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 7795914..2c0c076 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r25"
+PR = "r26"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index 37591c2..2c11628 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f
 
 SRCREV = "1855"
 PV = "0.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=agent;proto=http \
            http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.html;name=epl \
diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb b/meta/recipes-extended/iputils/iputils_s20101006.bb
index 5216c10..912a346 100644
--- a/meta/recipes-extended/iputils/iputils_s20101006.bb
+++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
 
 DEPENDS = "sysfsutils openssl docbook-utils-native sgmlspl-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://debian/fix-dead-host-ping-stats.diff \
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index a6b270c..f494f1b 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
index 1c66318..9bf7d41 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
 
 DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
            file://starting-fix.patch \
-- 
1.7.6.4



