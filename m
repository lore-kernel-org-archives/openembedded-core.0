Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TzkeK-0001Wm-8G
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:05:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2013 00:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="253466715"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 00:49:10 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 10:50:04 +0200
Message-Id: <1359363004-31295-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] openssh : upgrade to 6.1p1
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
X-List-Received-Date: Mon, 28 Jan 2013 09:05:32 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../openssh/{openssh-6.0p1 => openssh-6.1p1}/init  |    0
 .../{openssh-6.0p1 => openssh-6.1p1}/nostrip.patch |    0
 .../openssh-CVE-2011-4327.patch                    |    0
 .../{openssh-6.0p1 => openssh-6.1p1}/ssh_config    |    0
 .../openssh/{openssh-6.0p1 => openssh-6.1p1}/sshd  |    0
 .../{openssh-6.0p1 => openssh-6.1p1}/sshd_config   |    0
 .../openssh/{openssh_6.0p1.bb => openssh_6.1p1.bb} |    6 +++---
 7 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.0p1 => openssh-6.1p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.0p1 => openssh-6.1p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.0p1 => openssh-6.1p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.0p1 => openssh-6.1p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.0p1 => openssh-6.1p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.0p1 => openssh-6.1p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.0p1.bb => openssh_6.1p1.bb} (95%)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/init b/meta/recipes-connectivity/openssh/openssh-6.1p1/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.0p1/init
rename to meta/recipes-connectivity/openssh/openssh-6.1p1/init
diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-6.1p1/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.0p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-6.1p1/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.1p1/openssh-CVE-2011-4327.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.0p1/openssh-CVE-2011-4327.patch
rename to meta/recipes-connectivity/openssh/openssh-6.1p1/openssh-CVE-2011-4327.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/ssh_config b/meta/recipes-connectivity/openssh/openssh-6.1p1/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.0p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-6.1p1/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd b/meta/recipes-connectivity/openssh/openssh-6.1p1/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.0p1/sshd
rename to meta/recipes-connectivity/openssh/openssh-6.1p1/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.1p1/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-6.1p1/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
similarity index 95%
rename from meta/recipes-connectivity/openssh/openssh_6.0p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.1p1.bb
index df77040..71d71e4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r4"
+PR = "r0"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -27,9 +27,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
-SRC_URI[md5sum] = "3c9347aa67862881c5da3f3b1c08da7b"
-SRC_URI[sha256sum] = "589d48e952d6c017e667873486b5df63222f9133d417d0002bd6429d9bd882de"
 
+SRC_URI[md5sum] = "3345cbf4efe90ffb06a78670ab2d05d5"
+SRC_URI[sha256sum] = "d1c157f6c0852e90c191cc7c9018a583b51e3db4035489cb262639d337a1c411"
 inherit useradd update-rc.d update-alternatives
 
 USERADD_PACKAGES = "${PN}-sshd"
-- 
1.7.9.5



