Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U3Zwk-0008DB-4G
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:27:58 +0100
Received: from sangmingze-mail.local (siminn-int-gw.on-waves.com
	[157.157.59.158])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 6132F2543431;
	Thu,  7 Feb 2013 11:50:27 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1U3Pkw-0000xc-0W; Thu, 07 Feb 2013 12:35:06 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 12:35:03 +0100
Message-Id: <1360236903-3586-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [PATCH] systemd_197.bb: Point to the place where we keep the /etc/rcN.d files
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
X-List-Received-Date: Thu, 07 Feb 2013 22:28:06 -0000

By default /etc/rc.d is searched by systemd but we will keep rcN.d directories
inside /etc.
---
 meta/recipes-core/systemd/systemd_197.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 48188ba..d55206b 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r2"
+PR = "r4"
 
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -65,6 +65,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --enable-split-usr \
                  --disable-microhttpd \
                  --without-python \
+                 --with-sysvrcnd-path=${sysconfdir} \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
-- 
1.7.10.4



