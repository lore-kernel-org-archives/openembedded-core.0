Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 40E947E3B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 17:26:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YCkY6ZZwz96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 19:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561483590;
	bh=yd8QBve+aVwc87392PAJilWQB0JqOPX6rnMCyoNooLQ=;
	h=From:To:Subject:Date:From;
	b=eQEwckH4aUpc/yNMSuYuF8WagrNZB9Ar6/6+AOZR65xVfygYv6cLDEw5O1gyXEkS/
	Eg7ZUUGyNcLQbvHg0/s9E4h05Fjjy+/TLCV3Ph6/FFSROyctEPoLk2fRt1kezP4lIN
	VT0FvUOeKC7nQc2aXQYUeRlJP2nYTZlOHR0ue4toSLLDmpwB7U+tWN4yrdnb5tQ1FH
	/7hQby/LIaRu3rg29arHv/HJaW2y5jKlAuG/JGIrpCazWwaRuiUSLkyaGRYnkZL718
	RfAvkUCj6FIjgqxfstgaE4guq7ZUlE7gwsLlTnaiMQiVMrVPPRsA186wZljDweazlS
	ys51ESbw3WSSr4eC5xNnvw3Vs6pAKsxSuCCk/7C+vbWwmj/nyNJE3bWRvi/S+JKt+9
	sz0hQ1SmjZNLSgsaM0RysrczRS2XImKSGxwX6fJ/4tnlUlh2mylgPRYwa362XjcYH5
	5SWWJUM8nK5S0ok4U5E1axjD35pOkHulxLcZDEMU7brpdeQI68cRuaEGe1sWT+S1OB
	SAMSLboBzyDmDZFgK8WEtfieui6ctSYAu/T1scDYz/JoPNy+z5rXMAOkbRXyfmV/fC
	Mcu2z4C7/vfErwZqLM0Vi8vhLxKgM9fwko8c78SLxs1/WhkFzZl/M54XA9XtJyRu+I
	my5zQCin3C7hdQg7trjyhvqA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 20:26:27 +0300
Message-Id: <20190625172627.24662-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libnotify: Remove obsolete dependency on dbus-glib
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
X-List-Received-Date: Tue, 25 Jun 2019 17:26:29 -0000

Upstream stopped using it in 2010.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
index 82c137ca33..1c9084d919 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "dbus gtk+3 dbus-glib"
+DEPENDS = "dbus gtk+3 glib-2.0"
 
 inherit gnomebase gtk-doc distro_features_check gobject-introspection
 # depends on gtk+3
-- 
2.17.1


