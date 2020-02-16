Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 1327 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 16 Feb 2020 19:31:08 UTC
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 099DE60FC5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 19:31:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id B250C3A5A0D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 19:00:56 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DD2731C0002;
	Sun, 16 Feb 2020 19:00:53 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 10:59:09 -0800
Message-Id: <20200216185909.1566175-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] ell: Update to 0.28
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
X-List-Received-Date: Sun, 16 Feb 2020 19:31:09 -0000
Content-Transfer-Encoding: 8bit

ChangeLog:
- Fix issue with NULL check of D-Bus proxy for method calls.
- Add support for emitting D-Bus property changes on demand.
- Add support for reporting file attribute changes.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-core/ell/{ell_0.27.bb => ell_0.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.27.bb => ell_0.28.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.27.bb b/meta/recipes-core/ell/ell_0.28.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.27.bb
rename to meta/recipes-core/ell/ell_0.28.bb
index 503f1e22a3..464bf631e3 100644
--- a/meta/recipes-core/ell/ell_0.27.bb
+++ b/meta/recipes-core/ell/ell_0.28.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e090d6a910a43c2a32114ba1cdc9f1f2"
-SRC_URI[sha256sum] = "afc5441d6f6ece512a188b1e6aeabd7153de4f38989c897a2197ae50fc46da96"
+SRC_URI[md5sum] = "e38089e54d4b41e508bbb7f37a4a59d9"
+SRC_URI[sha256sum] = "6254fcb98d681cb2c3078dde462ba20bf90e6c10919204c6878a4381adcdb74b"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.24.1


