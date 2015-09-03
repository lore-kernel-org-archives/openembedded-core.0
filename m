Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 3B70877030
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 14:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 667693C88695
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 15:58:18 +0100
Message-Id: <9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Thu, 03 Sep 2015 14:58:50 -0000

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/systemd/systemd_219.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 4d32fd5..fbd86e8 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -306,10 +306,10 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysctl.d \
                 ${exec_prefix}/lib/sysusers.d \
                 ${localstatedir} \
-                /lib/udev/rules.d/70-uaccess.rules \
-                /lib/udev/rules.d/71-seat.rules \
-                /lib/udev/rules.d/73-seat-late.rules \
-                /lib/udev/rules.d/99-systemd.rules \
+                ${base_libdir}/udev/rules.d/70-uaccess.rules \
+                ${base_libdir}/udev/rules.d/71-seat.rules \
+                ${base_libdir}/udev/rules.d/73-seat-late.rules \
+                ${base_libdir}/udev/rules.d/99-systemd.rules \
                "
 
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
@@ -327,7 +327,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
 
 PACKAGES =+ "udev-dbg udev udev-hwdb"
 
-FILES_udev-dbg += "/lib/udev/.debug"
+FILES_udev-dbg += "${base_libdir}/udev/.debug"
 
 RPROVIDES_udev = "hotplug"
 
-- 
2.1.4


