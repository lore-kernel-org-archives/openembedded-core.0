Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLg-0003ik-1r
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8298997"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:38 -0700
Message-Id: <969cdde4541819ef5123a77391d870843aff0b55.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 02/13] openssh: upgrade to v5.8p2
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:12 -0000

From: Scott Garman <scott.a.garman@intel.com>

LICENCE checksum updated due to a one-line change in the file (RedHat
was added as a copyright holder).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../openssh/{openssh-5.6p1 => openssh-5.8p2}/init  |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/nostrip.patch |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/ssh_config    |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/sshd_config   |    0
 .../openssh/{openssh_5.6p1.bb => openssh_5.8p2.bb} |    9 +++++----
 5 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.6p1.bb => openssh_5.8p2.bb} (93%)

diff --git a/meta/recipes-connectivity/openssh/openssh-5.6p1/init b/meta/recipes-connectivity/openssh/openssh-5.8p2/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.6p1/init
rename to meta/recipes-connectivity/openssh/openssh-5.8p2/init
diff --git a/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-5.8p2/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-5.8p2/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-5.6p1/ssh_config b/meta/recipes-connectivity/openssh/openssh-5.8p2/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.6p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-5.8p2/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-5.6p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.6p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-5.8p2/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh_5.6p1.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
similarity index 93%
rename from meta/recipes-connectivity/openssh/openssh_5.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_5.8p2.bb
index b112b79..04d99d9 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -4,10 +4,11 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://openssh.org"
 SECTION = "console/network"
+PRIORITY = "optional"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=7ae09218173be1643c998a4b71027f9b"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r2"
+PR = "r0"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -25,8 +26,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://ssh_config \
            file://init \
           "
-SRC_URI[md5sum] = "e6ee52e47c768bf0ec42a232b5d18fb0"
-SRC_URI[sha256sum] = "538af53b2b8162c21a293bb004ae2bdb141abd250f61b4cea55244749f3c6c2b"
+SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
+SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
 
 inherit autotools
 
-- 
1.7.3.4



