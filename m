Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id AAC526BEFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:16 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so350158ead.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=WwhmsaxOtQAkzFtSS2Xuupggnk94W+D4rNR5TCgpUlY=;
	b=UsP1QoTKE8CBeUyTNvCjA6kbfgrD2QePvuc6HSHUCvOTa0i6lBeocWqKYpu3AK8nkk
	fEW5f/1E8Ml4kuN4vL6rzo4ixNKhpb5nQvo3TzjgYMm99Lsq06s10yfdIFGwBUKl5U9q
	RR3g1okx/yUp64FBb+X5yvMAiGAxrbP8V+fOHnxsFkIa/v0wQ1tbSof7ZB5bs2oInoBv
	WyuEOU8vPTnm2RvRRxQWTnziCc9si/GssYgbSl08qee6kFsYPtNg9bME6LFKvkruR6oW
	V3a14LtZ6YtUWFPpLaj/c8KhPOwZstMFmJ+kQH0xDmv4EGjGmQIYKbduzn1xuJfdu78U
	hCmg==
X-Received: by 10.14.214.1 with SMTP id b1mr4896eep.81.1377792137150;
	Thu, 29 Aug 2013 09:02:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm47240095eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:04 +0200
Message-Id: <e77564486cce8199bd317f1ee79adb4f8b508ffa.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 17/20] librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:17 -0000

* without gtk+ or gdk-pixbuf available it gets disabled even with --enable-pixbuf-loader

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 4818422..30846bf 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG ??= "croco gdkpixbuf"
 # Support embedded CSS stylesheets (recommended upstream)
 PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
 # gdk-pixbuf loader
-PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
+PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gtk+ gdk-pixbuf"
 # GTK+ 2 theme engine
 PACKAGECONFIG[gtk] = "--enable-gtk-theme,--disable-gtk-theme,gtk+"
 
-- 
1.8.3.2


