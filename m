Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 8844 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Dec 2019 06:23:17 UTC
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id AC64C7FD8B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 06:23:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 1B4D73A3083
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 03:55:54 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from hebe.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CF2C41C0008;
	Fri, 20 Dec 2019 03:55:51 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 19:55:24 -0800
Message-Id: <20191220035524.2800396-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] ell: Update to 0.27
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
X-List-Received-Date: Fri, 20 Dec 2019 06:23:18 -0000
Content-Transfer-Encoding: 8bit

- Fix issue with data overflow and multiple PEMs.
- Fix issue with handling DHCP lease expiration.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-core/ell/{ell_0.26.bb => ell_0.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.26.bb => ell_0.27.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.26.bb b/meta/recipes-core/ell/ell_0.27.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.26.bb
rename to meta/recipes-core/ell/ell_0.27.bb
index f1f252ce4f..503f1e22a3 100644
--- a/meta/recipes-core/ell/ell_0.26.bb
+++ b/meta/recipes-core/ell/ell_0.27.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "4660e25541071e933a2bb02ef2f94e7d"
-SRC_URI[sha256sum] = "7855b4b8f271ba6ee67d87d0965b975a9a8dbeaa616665ca2248afa3b5fcbc77"
+SRC_URI[md5sum] = "e090d6a910a43c2a32114ba1cdc9f1f2"
+SRC_URI[sha256sum] = "afc5441d6f6ece512a188b1e6aeabd7153de4f38989c897a2197ae50fc46da96"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.24.1


