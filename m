Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 16CE977D42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 13:15:16 +0000 (UTC)
Received: from Collabora.par1.mozilla.com (unknown
	[IPv6:2a00:8c40:243:232:747a:bb68:a210:2610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: aragua)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 745E626C646;
	Wed, 27 Sep 2017 14:15:17 +0100 (BST)
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 15:14:24 +0200
Message-Id: <20170927131426.4037-1-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3 1/3] wayland : Bump to version 1.14.0
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
X-List-Received-Date: Wed, 27 Sep 2017 13:15:17 -0000

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 .../recipes-graphics/wayland/{wayland_1.13.0.bb => wayland_1.14.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.13.0.bb => wayland_1.14.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.13.0.bb b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.13.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.14.0.bb
index b9396b6c75..2a2489d658 100644
--- a/meta/recipes-graphics/wayland/wayland_1.13.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.14.0.bb
@@ -14,8 +14,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "cae152ed956da6de53f9727bc1c45039"
-SRC_URI[sha256sum] = "69b052c031a61e89af7cc8780893d0da1e301492352aa449dee9345043e6fe51"
+SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
+SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
 
 inherit autotools pkgconfig
 
-- 
2.11.0


