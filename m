Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72FC76AC92
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 06:39:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s636dtIZ017438
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 23:39:55 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 23:39:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 14:54:37 +0800
Message-ID: <7b1b3d9ada735294d165b6944ab716da6e56d424.1404370293.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1404370293.git.liezhi.yang@windriver.com>
References: <cover.1404370293.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] meta: fix no newline at end of file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jul 2014 06:39:58 -0000
Content-Type: text/plain

Add a '\n' to the last line of the file to fix:

No newline at end of file

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/meta.bbclass                                               | 2 +-
 meta/recipes-bsp/pointercal/pointercal_0.0.bb                           | 2 +-
 meta/recipes-connectivity/dhcp/files/default-relay                      | 2 +-
 meta/recipes-core/udev/udev/run-ptest                                   | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service             | 2 +-
 meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd             | 2 +-
 .../x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh          | 2 +-
 meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch                 | 2 +-
 meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch               | 2 +-
 meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/meta.bbclass b/meta/classes/meta.bbclass
index d35c40b..5e68902 100644
--- a/meta/classes/meta.bbclass
+++ b/meta/classes/meta.bbclass
@@ -1,4 +1,4 @@
 
 PACKAGES = ""
 
-do_build[recrdeptask] = "do_build"
\ No newline at end of file
+do_build[recrdeptask] = "do_build"
diff --git a/meta/recipes-bsp/pointercal/pointercal_0.0.bb b/meta/recipes-bsp/pointercal/pointercal_0.0.bb
index 5029c4a..df735a5 100644
--- a/meta/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -19,4 +19,4 @@ do_install() {
 
 ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-INHIBIT_DEFAULT_DEPS = "1"
\ No newline at end of file
+INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-connectivity/dhcp/files/default-relay b/meta/recipes-connectivity/dhcp/files/default-relay
index 59249db..7961f01 100644
--- a/meta/recipes-connectivity/dhcp/files/default-relay
+++ b/meta/recipes-connectivity/dhcp/files/default-relay
@@ -9,4 +9,4 @@ SERVERS=""
 INTERFACES=""
 
 # Additional options that are passed to the DHCP relay daemon?
-OPTIONS=""
\ No newline at end of file
+OPTIONS=""
diff --git a/meta/recipes-core/udev/udev/run-ptest b/meta/recipes-core/udev/udev/run-ptest
index 6817ef7..c6961ce 100644
--- a/meta/recipes-core/udev/udev/run-ptest
+++ b/meta/recipes-core/udev/udev/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-make -k check-TESTS
\ No newline at end of file
+make -k check-TESTS
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
index 5d7a586..fd9a6c4 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
@@ -7,4 +7,4 @@ Type=forking
 ExecStart=@SBINDIR@/tcf-agent -d -L- -l0
 
 [Install]
-WantedBy=multi-user.target
\ No newline at end of file
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd b/meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd
index cd25bf1..f5f1c37 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd
+++ b/meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd
@@ -1 +1 @@
-<html><body><h1>It works!</h1></body></html>
\ No newline at end of file
+<html><body><h1>It works!</h1></body></html>
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh
index db7aa22..3d7008c 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh
@@ -4,4 +4,4 @@ if [ -d $XDGAUTOSTART ]; then
         CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
         $CMD &
     done
-fi
\ No newline at end of file
+fi
diff --git a/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch b/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
index 84bd973..40f81f0 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
+++ b/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
@@ -57,4 +57,4 @@ index 58a8e70..0f89629 100644
  #include <X11/Xlib.h>
  #include <stdio.h>
 --
-cgit v0.9.0.2-2-gbebe
\ No newline at end of file
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
index 5f59a2b..5641c0f 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
+++ b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
@@ -22,4 +22,4 @@ index 6d7c9a5..22cceb9 100644
 +HAVE_CHECK=no
  AM_CONDITIONAL(HAVE_CHECK, test x$HAVE_CHECK = xyes)
  
- AC_CONFIG_HEADERS([src/config.h])
\ No newline at end of file
+ AC_CONFIG_HEADERS([src/config.h])
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
index 99bee4c..662659a 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
@@ -7,4 +7,4 @@ Exec=poweroff
 Icon=system-shutdown
 Terminal=false
 Categories=Utility;
-StartupNotify=true
\ No newline at end of file
+StartupNotify=true
-- 
1.8.3.1


