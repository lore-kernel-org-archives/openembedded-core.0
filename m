Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 61DF26A57D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:32 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id n57so1295341wev.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=YcUoQ4dDt4YsU6sUuSIMHK+ayx/i8ULi2eDnxpWdYzc=;
	b=W40ujvwTSW6D4fAf5opoKcvIcO/naS8L68ecv9yjiUkNmgNodONtidaxAs/oDZqNP7
	5Xe0KlSQS6lPjlk2+SmYyg7WLk4t9Y0vtWLRuprqG5rfmO512bfZO5+UDpcENsC4Axe0
	GxJPFnlHkcQMk8p9XBBRC2h68A03AGo4l3HsQ/NqUXzO2knv7Pr1QB+Pb+HpCPpCVLUq
	570x0q5tM4u3OFG+y5U7wQSxbcOm2KCuEk2QNRTMfRoMPzUdwvowrvgcQGamVwqNTXKd
	MOs+3bcQnAGj4x2+zQ3//aVIWw8R08FFO0DrjK0+jo3+mfBWnoKP9cmOer/W3DE6jpup
	Vtbg==
X-Received: by 10.180.39.233 with SMTP id s9mr3797757wik.25.1370013093174;
	Fri, 31 May 2013 08:11:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:06 +0100
Message-Id: <b09f0d332eeb981a851c828442fabfd7c0d36843.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkfZ3bx8hgLVFTctg+CzD/EYDbv6urBfyJrNNa5guV++qk6MAQdOUT/z3F8nL8k9UTrFr5e
Subject: [PATCH 3/7] wayland: update to 1.1.0
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
X-List-Received-Date: Fri, 31 May 2013 15:11:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb}               |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.0.6.bb b/meta/recipes-graphics/wayland/wayland_1.1.0.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland_1.0.6.bb
rename to meta/recipes-graphics/wayland/wayland_1.1.0.bb
index 7c18979..a71402e 100644
--- a/meta/recipes-graphics/wayland/wayland_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.1.0.bb
@@ -10,11 +10,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-PR = "r1"
-
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "936a2590aea69fa3c0cf234d54b9137c"
-SRC_URI[sha256sum] = "f52a012df699eff434b0f49e56000d6978b5f781048402ca8e0232242970fc49"
+SRC_URI[md5sum] = "d2dc9398a83692cafc16eba6e45f85d8"
+SRC_URI[sha256sum] = "2ef587cf1a0e52b6dee44eeb9c288110e8180819abf4e419d247dfe234867a5c"
 
 SRC_URI_append_class-native = " file://just-scanner.patch"
 
-- 
1.7.10.4


