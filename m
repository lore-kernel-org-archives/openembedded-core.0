Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKh-0005rV-Ao
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:03 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so12500315pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8P3WJAzZQ0eRkgCb1ZqU0iTekS9j3ubFHB35OPPjWR8=;
	b=nfo6KUk4BDOhjrigZZsTvE03dFHDEa1aabipCiL2VBb0C9cbtfVH2p4458b1Zgg1Yr
	comRxCwtKyUNNDtDxhYemCAbnbpjAep1Ct4LLy/p7Fg/Rbl2YlzkguY6Irt+uSYYTduU
	TELQdWrt2oAag3DrYS7CDCrYtJWuPfGnLrq+5v4UBuoGUWnmQpss9Zq5EGGQ1NOkB0br
	N8JMKCj9hjtUkQnQcaxK+hfXOoVssNaykXmDnnpuLtknlZSO13aXvq7wJrg/pFPmuzgZ
	9YMuHjs6z23Zv+jJJ2EszvEKUpexNuJdODKiJkcks+EZuSXdpFJ6Nwpw00i+cEukJ04K
	OXaQ==
Received: by 10.68.191.72 with SMTP id gw8mr28702201pbc.143.1341498960790;
	Thu, 05 Jul 2012 07:36:00 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.35.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:22 -0700
Message-Id: <474f9ab1dbdcdb7587669c9841994f6acdcf1fca.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 03/14] busybox: Include sys/resource.h for rusage definition
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:03 -0000

Seen with eglibc 2.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/busybox-1.19.4/sys_resource.patch      |   18 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch b/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
new file mode 100644
index 0000000..a72aca0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
@@ -0,0 +1,18 @@
+rusage needs this include with eglibc 2.16
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: busybox-1.19.4/include/libbb.h
+===================================================================
+--- busybox-1.19.4.orig/include/libbb.h	2012-07-02 21:41:52.692047712 -0700
++++ busybox-1.19.4/include/libbb.h	2012-07-02 21:42:24.204049228 -0700
+@@ -46,6 +46,7 @@
+ #include <termios.h>
+ #include <time.h>
+ #include <sys/param.h>
++#include <sys/resource.h>
+ #ifdef HAVE_MNTENT_H
+ # include <mntent.h>
+ #endif
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index de331ad..4271c67 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -8,6 +8,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-parts.in.usr-bin.patch \
            file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
+           file://sys_resource.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \
-- 
1.7.9.5



