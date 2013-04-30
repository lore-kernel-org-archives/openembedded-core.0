Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UX5M4-00071q-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 09:52:26 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so86593eek.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 00:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=8100LIvQyA9INiMy4EoOwKrfe3bMDjsrtmFETIo2WKk=;
	b=FhxRE0mDyzFBDDt9lKMWzrIPQImpEzqwVP2kKsR6VRJ0ZQqPCunWEO1EMTHCbrJsZa
	w6Qey6ORYyLE5/yIWpYqnBT6Ws9aYBJwYiCeEEBs7HXEo15J/nzOGkLHKA5W3xZiWRTe
	piclnKwotZlxRn5Z/KQLLO9r37D7hVPUqKazUrr7G12VM5dfkrusKv+tz37+rvPf8akJ
	IsHFwqL9mao17EavhJmOUrITStqkmk2O181MeBRAhVkFJz/k4bMr1z32v6szYwNtzgZQ
	tapiPuWslaTyagLyBSqUaYiOQn/P9QBB8cAvIpZgShfuLbLVLT90fTpIpQCSrmsbVjBP
	2CmQ==
X-Received: by 10.15.36.135 with SMTP id i7mr100387819eev.34.1367307254225;
	Tue, 30 Apr 2013 00:34:14 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id j43sm36946479eep.4.2013.04.30.00.34.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 00:34:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 09:31:48 +0200
Message-Id: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 07:53:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* adding this extra functionality is an image- or distro-decision
* at least automount-rule/script breaks other automount solutions causing
  misleading kernel messages as 'VFS: could not find a valid V7 on sda'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/systemd/systemd_199.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 43463c5..08cb0c6 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -211,7 +211,7 @@ FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
+RRECOMMENDS_udev += "udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/systemd/systemd-udevd \
-- 
1.7.6.5



