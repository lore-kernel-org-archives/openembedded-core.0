Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9BF65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:25:03 +0000 (UTC)
Received: by igrv9 with SMTP id v9so80251107igr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DwtbCYyuUtG3nRcWkzoqw7IaJK1PbXc2kaoXmqS/Qhw=;
	b=XMXUNKH0iieedB3GgR5zuU3W51+SIqxME2xepMRUx/Ax4iy4vz8qJ+sm/H35GT0fvr
	1i03GkSz0CmQxeYivQcOxghDBqrU7IRm3zdqlT0dXoyqzGNLzV/Y1WuWWT/X72fU8J2k
	uR4MfRCjbKP+DUy50SGfdAtXJQoErssL4ccUWuvQWXfLMkrlyuQkXaRYqmYCZRhi5hCv
	TaPYZ7E/b9IvgVDfdsbI7F865uwC1YQ2aLDcWjrbOADSqivwEV1f9PaX3Mse6b76vynF
	769AntR4rXb2JJGVLIgpz0S5XIlRS6Fbzk/gzSjrYim5Aq9pIl9XrAjVumzjjFuXD5Nk
	xPrg==
X-Received: by 10.50.61.234 with SMTP id t10mr34807459igr.19.1435775103910;
	Wed, 01 Jul 2015 11:25:03 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id p4sm2229179igg.20.2015.07.01.11.25.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:25:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:53 -0700
Message-Id: <2112607f62fe5c4abf6ff958c88c03d066a719c7.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
References: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
In-Reply-To: <cover.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] wayland: Upgrade 1.6.0 -> 1.8.1
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
X-List-Received-Date: Wed, 01 Jul 2015 18:25:04 -0000

Fetch from git, at same release revision SHA

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.1.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.6.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.8.1.bb
index 6413a0a..5b36745 100644
--- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d34c141c975084e4fb668e77b38f840e"
-SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86ba6fc7f"
+SRC_URI[md5sum] = "6e877877c3e04cfb865cfcd0733c9ab1"
+SRC_URI[sha256sum] = "f17c938d1c24fd0a10f650a623a2775d329db3168b5732e498b08388ec776fc8"
+
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
-- 
2.1.4


