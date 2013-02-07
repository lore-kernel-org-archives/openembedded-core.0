Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U3Zrt-00088s-DN
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:23:03 +0100
Received: from sangmingze-mail.local (siminn-int-gw.on-waves.com
	[157.157.59.158])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 634D725434E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2013 19:55:06 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>) id 1U3XJv-0002HY-HM
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 20:39:43 +0100
Date: Thu, 7 Feb 2013 20:39:43 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130207193943.GO27288@xiaoyu.lan>
MIME-Version: 1.0
X-Mailer: git-send-email 1.7.10.4
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 07 Feb 2013 22:23:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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



