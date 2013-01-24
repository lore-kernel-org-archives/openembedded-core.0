Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TyMIl-0002CQ-40
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:53:12 +0100
From: ml@communistcode.co.uk
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 12:37:25 +0000
Message-Id: <1359031045-5615-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.1.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH v2] systemd: remove usbutils dependancy
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
X-List-Received-Date: Thu, 24 Jan 2013 12:53:12 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

V2:

Dependancy was removed in version 196 according to following systemd commit.

http://cgit.freedesktop.org/systemd/systemd/commit/configure.ac?id=796b06c21b62d13c9021e2fbd9c58a5c6edb2764

V1:

No where in the systemd readme does it specify that usbutils
is a dependancy of systemd. I can only guess that it was added
due to an issue elsewhere in the chain or it was brought in
when udev was merged and the dependancies never checked.

I have build tested this with no issues.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-core/systemd/systemd_196.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index a78a8a6..9eca25b 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 libgcrypt"
+DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
-- 
1.8.1.1



