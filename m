Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S2Uzi-0006Rr-Gt
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 22:54:02 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id E509D2FF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 16:45:31 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 13:45:28 -0800
Message-Id: <948126e8b9392e90f86f18a7095589586cc22d42.1330465479.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330465479.git.scott.a.garman@intel.com>
References: <cover.1330465479.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1330465479.git.scott.a.garman@intel.com>
References: <cover.1330465479.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: E509D2FF3D.4A6A4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] sudo: upgrade to 1.8.4
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
X-List-Received-Date: Tue, 28 Feb 2012 21:54:02 -0000

During the upgrade to 1.8.4, the UCB-licensed fnmatch.c was replaced
with a non-recursive BSD-licensed version, hence the removal of UCB
and addition of BSD in the LICENSE field. This led to checksum changes
in the doc/LICENSE file, and we now additionally track the comment
headers in redblack.c.

These changes were confirmed on the sudo mailing list:

http://www.sudo.ws/pipermail/sudo-workers/2012-February/000736.html

This upgrade also fixes CVE-2012-0809.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                |    7 ++++---
 .../sudo/{sudo_1.8.3.bb => sudo_1.8.4.bb}          |    4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.3.bb => sudo_1.8.4.bb} (84%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 83dd209..2168690 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -3,9 +3,10 @@ DESCRIPTION = "Sudo (superuser do) allows a system administrator to give certain
 HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
-LICENSE = "ISC & UCB & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=54f1b46c2459ecec3d892618eab44302 \
-                    file://compat/fnmatch.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
+LICENSE = "ISC & BSD & Zlib"
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=19f95c610f585c26a836975654807669 \
+                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=fba1c1dca0951819964dfdc618e81724 \
+                    file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
                     file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea"
diff --git a/meta/recipes-extended/sudo/sudo_1.8.3.bb b/meta/recipes-extended/sudo/sudo_1.8.4.bb
similarity index 84%
rename from meta/recipes-extended/sudo/sudo_1.8.3.bb
rename to meta/recipes-extended/sudo/sudo_1.8.4.bb
index 99fe5b9..dfa7291 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.4.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "9e5517bbf3aee420b38c2d1d7a71bcad"
-SRC_URI[sha256sum] = "ff1fcc410c5465063ee4912912e29936ea39f017d9a8a57ec76b0ded71b7c3c4"
+SRC_URI[md5sum] = "5a54dde137618bbc1dd46bb0ef725d7d"
+SRC_URI[sha256sum] = "17a91da1857954aa73445197e6f73d5d50cc8c48719f6db457723bb8badc32a5"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.5.4



