Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 123F97921F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:48 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id w14-v6so5943462plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3nYzkTML3LkpTfybUutNp2wAEPbS1wOSwsfnGtdBfv4=;
	b=csJW/5bxQKMEc4TqztjH6sJ6bkesUn5Q9fgJrdiZy+uZ/Q4mIAzf3Za1Fz8eY9lT6c
	7eclEJ674Lm8bfak5kfBfM9TMJ4q2Z8IWiWR/l099CFG+Iad1dvIWfw3nPXQsZzGZhYt
	ksk4zjc9RMfOYbAbMqdMApWKdhtXPQDDWUt5crUylugaRHzqbMvsZHuVPLuLkJmgjCTM
	A3xFqzJ9AAUR1eH07p6RqjYwsOMMSiCyLDhs4B0ovywOuhZYBSz4JG4/g54XZBXk35Ct
	RptwzTwnhDQ66MK6S7kKnacSOS5a2m5Uym4ZvG+1qCT7HCPQecFu756o5CMJvaPxUC7x
	r03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3nYzkTML3LkpTfybUutNp2wAEPbS1wOSwsfnGtdBfv4=;
	b=pGw01jV5TirQtD3BrB8IUWd/wHsjSt813B7irEDKbu7W6tXwHrIwbZP9VkRvfntFy1
	ykJqOheDif+48MSq7/YKJ+qyu8dvBDaXTJ+es4C8HGd703uN4rovoXnkr0BRvw7JLSdn
	vkbEhF6Z7Spa1KC5RH0ivVUSSRoEnrWSziKu4Wn2Oc8dIugG09QlB308ED5cwX2/bU2H
	r3/hbhb7uxLplHUII7D/Hk20FfyG9cUDl/uSDvetm4SAnS27liIRHxleFDhQ6t0spfWb
	5buyrzdQmu30eMiDjdvKcG7yyDzmKsC+1PcTXp993Hehixf4NWEmB1a1RbW6tonWb5HR
	4i8g==
X-Gm-Message-State: AOUpUlHtmtU65abyvDob0I7oLoGjwMvGx5J+aA+53s5GOMnZ07zwLQd/
	C5d6+wquoyfrxWJvuukfZ5A8luTj
X-Google-Smtp-Source: AA+uWPz1+GM3Z9bFq08yYZNdw86zB5DiVDABzzbRt9T0bR5WOhjFa1j0blVjfUAQBYb4445vMaLDug==
X-Received: by 2002:a17:902:bd4a:: with SMTP id
	b10-v6mr42428285plx.209.1534699429680; 
	Sun, 19 Aug 2018 10:23:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:33 -0700
Message-Id: <0d484e3706a46b34f4edfc3fec906e576a29a9bd.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 1/9] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 3 ++-
 meta/recipes-graphics/mesa/mesa.inc   | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 20e0d2c92a..7347f223ff 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
+           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6aedeee9dc..2671d4de4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -47,6 +47,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
+PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
+PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
+
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-- 
2.18.0


