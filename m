Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 89AB777277
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:55 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79692851pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+bynX730E5hY0KrVCosFhirKwRrwwUZNgXWhYAAGBRw=;
	b=Ypk2wTKH/gfH26SDpMJOeeMvhfQ1gOQ42ZJ8J0LzYIzKcHafHTlIc2TMmQkuRrMmJR
	hbWHdeuso3l9NEyNEnouTkLVxLWHQd82gcERy5XiI06WGlrWPML7nZR7EYCW6w9PvvtC
	jjKoSFlTeucD9QlDsDW+w0zFl464SHf32Eqx+ke4Ke16QumYgGNmCGpaG+TU75c4UhL0
	XKidh5/KcFlVF/MSezvTKgnYXkQnd8c/QQD4VwmXziF++qIN+f/eK+bWNK1EGkGCZAHo
	RkfYVxkPqAJpTA+3L6D4YhKdiHGLi0TeDPGLxvalg5GMpNdqkShGHCzuLlbcz0DFgw27
	aoUQ==
X-Received: by 10.68.143.106 with SMTP id sd10mr27684279pbb.62.1447371596112; 
	Thu, 12 Nov 2015 15:39:56 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:54 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:17 -0700
Message-Id: <63b4eae5462584cd8965eb7620e76f9934b7beff.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 06/11] latencytop: obey LDFLAGS
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

Patch update courtesy Abdur Rehman <abdur_rehman@mentor.com>.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
index 0cf217f..af19b37 100644
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
@@ -12,7 +12,7 @@ index 16a2369..fa797a2 100644
  SBINDIR = /usr/sbin
  XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
 -LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncursesw 
-+LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncurses
++LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncurses $(LDFLAGS)
 +CC ?= gcc
  
  OBJS= latencytop.o text_display.o translate.o fsync.o
-- 
2.2.1


