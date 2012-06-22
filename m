Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8F-0007hP-9B
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173266"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:50 -0700
Message-Id: <a72ad7d3e93af764347d0d1e5a2a64665b76dd9c.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/17] sudo: upgrade to 1.8.5p2
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:13 -0000

From: Scott Garman <scott.a.garman@intel.com>

LIC_FILES_CHKSUM updated due to trivial copyright date change.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                |    2 +-
 .../sudo/{sudo_1.8.4p4.bb => sudo_1.8.5p2.bb}      |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.4p4.bb => sudo_1.8.5p2.bb} (83%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 2168690..babea37 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=19f95c610f585c26a836975654807669 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=d25a8240ca6decdecb9990789e593130 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=fba1c1dca0951819964dfdc618e81724 \
                     file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb b/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
similarity index 83%
rename from meta/recipes-extended/sudo/sudo_1.8.4p4.bb
rename to meta/recipes-extended/sudo/sudo_1.8.5p2.bb
index 20c4a14..dfba7e0 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "b9be6df7ecefedff2263052ed9fc5e93"
-SRC_URI[sha256sum] = "bf965b09bde9b0cf7fd2355c53a81884d02d522af2d539cf40218436e9a5051e"
+SRC_URI[md5sum] = "dc42ed9f0946d92273762d0ae7314d59"
+SRC_URI[sha256sum] = "c32ae2bc3faf83444c82ca75ccb10ad3684d8222e3535f164c4a4db7cdddf8cf"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.7.6



