Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9Gt-0002sG-1Z
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:24:39 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so335465dak.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=S/5pEDjtO0BKzzy+o9HwA+qD8yz9iROcaYK5o+qNzvY=;
	b=BfNmX0vq9rOp6y+/NR5ZbMKLB830U2r0iBGsTcQJZJGtMcQ5Dw/JbwKgciwE7pFLhu
	vjMsLracwAJ3qeuxwI+E5XgT4BPoAUBnczvsbZFwNM/VGde00tIJk0Az4B0oAvoQMo24
	W1z3M0SXF/NrvZbBxLJa0SE6eagYOZhkMpSfX8xKmAoM2d6I8Cvv6gouI5SoIy6yoNC5
	0GUZKIAzQjaYzIpnbU0f9isDtfh/0u4qkgLjM971m+DaCzLjYZ6fNf0+/e+4gV6drpwB
	NlE8GEJxLA8Lrt9k3SDA4dz1NM0nJ7M2qaqg3rzxCInciGjjwcoc/ClZFZwLXpGxaAOd
	dVCA==
X-Received: by 10.68.116.169 with SMTP id jx9mr30660845pbb.94.1363032475392;
	Mon, 11 Mar 2013 13:07:55 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.07.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:07:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:31 -0700
Message-Id: <48b41b4d60b531524523588507b2b8d5bdd4be26.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnylw6poGWsKNRSUXHkxOZkmiWkbhXxL/OFafE/egWPB3+j8nvbMF7h85d7JemFu1zzT45C
Subject: [PATCH 1/9] systemd: merge udev-systemd into udev
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
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000

Merge the contents of udev-systemd, which is just the service files, into udev
itself.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 5180eef..962b120 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -171,7 +171,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "dbus udev-systemd"
+RDEPENDS_${PN} += "dbus"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty \
                       util-linux-agetty \
@@ -179,7 +179,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
@@ -210,6 +210,8 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/95*.rules \
                ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
               "
 
 FILES_udev-consolekit += "/lib/ConsoleKit"
@@ -217,9 +219,6 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-FILES_udev-systemd = "${systemd_unitdir}/system/*udev* ${systemd_unitdir}/system/*.wants/*udev*"
-RDEPENDS_udev-systemd = "udev"
-
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.10.4



