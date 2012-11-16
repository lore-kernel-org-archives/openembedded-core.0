Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TZSfg-0006wF-5c
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 21:37:52 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1298360bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 12:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=K1l7ll39Py3JEumFc6f48K3aWZtrzkFBadzNDK4rINA=;
	b=KKPCZwiIMy5Y3lvp7smS7NtfIqn4dhvDrDjxudzM36to8KDBfgZvS6ePZtIIg5BonK
	nJzJJXExF5LHtc4WnpuOWEBHUXrHFrjACsu2Rp2ygpT/VLngogRHDQ0nuZ/K/8Gc/39Y
	tOJmVNYg/K5XbBTnSCjHaSd94mq3cngwyR/a0H1nE/7llWNz/cEubxv/PB6F7hIllDDH
	wmNzktaLH4rxevxQ8/TqlXSX/02ohN15cPJEnK4W2kmgsEb4TARYAFUDuW9OzdkfsraD
	VoLOPfGR9RXRIHj0iJXF1nNvMGiC3udKl5k0AvERKUYIiZ4o+GnB+YMr1kxD5HXgxbe6
	xLiQ==
Received: by 10.204.127.27 with SMTP id e27mr2459795bks.126.1353097433526;
	Fri, 16 Nov 2012 12:23:53 -0800 (PST)
Received: from localhost.localdomain (93-136-14-159.adsl.net.t-com.hr.
	[93.136.14.159])
	by mx.google.com with ESMTPS id z13sm1861361bkv.8.2012.11.16.12.23.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 12:23:52 -0800 (PST)
From: dromede@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 21:11:39 +0100
Message-Id: <1353096699-19130-1-git-send-email-dromede@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Fri, 16 Nov 2012 20:37:52 -0000

From: Marko Katic <dromede.gmail.com>

udev provides a udev-utils package that once provided utility binaries
such as udevadm, udevtest and udevinfo. udevtest and udevinfo are
deprecated and their functions are now handled by udevadm.

https://bugzilla.redhat.com/show_bug.cgi?id=597539

remove udevinfo and udevtest from the udev-utils package.

Signed-off-by: Marko Katic <dromede.gmail.com>
---
 meta/recipes-core/udev/udev.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 4705b9b..7133cc4 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -74,7 +74,7 @@ FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-c
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
+FILES_udev-utils = "${bindir}/udevadm"
 
 RDEPENDS_udev-consolekit += "udev-acl"
 FILES_udev-consolekit = "${libdir}/ConsoleKit"
-- 
1.7.9.5



