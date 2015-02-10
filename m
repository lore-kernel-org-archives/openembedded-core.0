Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id BF57B601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 03:24:01 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so2349954iec.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Feb 2015 19:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8wmhcjrJ+OxAd47GrNbPo1MSjdEucfYmt9bqls5o03g=;
	b=N+qGzb3jqsLpuC7oE4oBk48qlcA7PpBuIDywo4OCvgRbseO1yeArIiCE8hdY494pOI
	yN5FA51i2Bmmc5KaWeJJkOwFsfPqzQy8PPrYyfyW/ETT58mygquAZPzlVQbWoYF+he+z
	8bofwE3ADCs21oV++O5PUXOc3mhvT+Vp1sTnp3jP09cuu0jfv1mFL3cv8FwxZ66h+uJ6
	clTT4qFkESEI5t9MePM9arc1DI1BG+qZim+LEvVbiW/KDppvk4SJTCD/BgCUd9mdK+Qv
	PkcuQftXaAdE8gtS/sGUu25siqKI+lrFI4UvijOW7RpvIB+A6sHVgxxokyvvFLNzDAYI
	nX6Q==
X-Received: by 10.107.12.13 with SMTP id w13mr6199422ioi.28.1423538642800;
	Mon, 09 Feb 2015 19:24:02 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id g4sm7746922ioe.19.2015.02.09.19.24.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Feb 2015 19:24:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 19:23:46 -0800
Message-Id: <1423538626-17248-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mesa: update 10.4.3 -> 10.4.4
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
X-List-Received-Date: Tue, 10 Feb 2015 03:24:04 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_10.4.3.bb => mesa-gl_10.4.4.bb} | 0
 meta/recipes-graphics/mesa/{mesa_10.4.3.bb => mesa_10.4.4.bb}       | 4 ++--
 meta/recipes-graphics/mesa/mesa_git.bb                              | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.4.3.bb => mesa-gl_10.4.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.4.3.bb => mesa_10.4.4.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb b/meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.4.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_10.4.3.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_10.4.3.bb
rename to meta/recipes-graphics/mesa/mesa_10.4.4.bb
index 9669bcb..8140411 100644
--- a/meta/recipes-graphics/mesa/mesa_10.4.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "be86c4ee226f8ca28b7d4c728c350b01"
-SRC_URI[sha256sum] = "ef6ecc9c2f36c9f78d1662382a69ae961f38f03af3a0c3268e53f351aa1978ad"
+SRC_URI[md5sum] = "62faf98ac79c5587f8e917e187419e6c"
+SRC_URI[sha256sum] = "f18a967e9c4d80e054b2fdff8c130ce6e6d1f8eecfc42c9f354f8628d8b4df1c"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index e554ff4..cbe8911 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -2,10 +2,8 @@ require ${BPN}.inc
 
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
-
-SRCREV = "f70e4d4afd16e66506ce3b055edb3b71b1464890"
-PV = "10.4.3+git${SRCPV}"
+SRCREV = "62eb27ac8bbd979796f50e253f6c786d7d791242"
+PV = "10.4.4+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.4"
 
-- 
1.9.1


