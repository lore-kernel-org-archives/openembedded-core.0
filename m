Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CED366C806
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:06:42 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id f12so3936696wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jRP+jM6an56iG41kvgdXp8/COkp44bKe6tp+81gtY2Y=;
	b=OhCU7OcQYwGiIya5s3STqGc5AjBpPSIo4cIs06GKw9INspAJmaiHvUizDBbrXQMWUu
	notmavC6KmxzOtY2HaczWKrIMe4e51KxBPlcc4iVUh6qn6eE+mHiwc0Yif0KIvo70pQS
	SjOFRK54ufP7XuB08ZEBkCpsjvzaJpYG0pAtjw7lXZfTVPsx8Y3QyymWA2jeO+Ity/Hu
	OU4krXUd+8/A0qSk1mxbMe7yiX213rJ6nvasJ2gfg3RmS2/gVot4lrlqTebmbyzdIewp
	4oNXyHzbf9WvgvDTk/0m0w2vexZC+dD07Gtn4Fi+ndfkc03YvZHIrSoXibgjH8LPvQz9
	lqYg==
X-Gm-Message-State: ALoCoQmUWJqBGr+KjNgE3JzWHp2ZwT9v0/tARfPCONJk8v3SC4S/tgEV/25aJy4fU/O9YwCFMXOm
X-Received: by 10.194.175.66 with SMTP id by2mr2481686wjc.59.1379354804168;
	Mon, 16 Sep 2013 11:06:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dx7sm25399911wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 11:06:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 19:06:36 +0100
Message-Id: <1379354796-8157-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379354796-8157-1-git-send-email-ross.burton@intel.com>
References: <1379354796-8157-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 4/4] weston: change mesa dependency to virtual/mesa
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
X-List-Received-Date: Mon, 16 Sep 2013 18:06:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.1.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index b765f65..8280bf2 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa5
 inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland mesa virtual/egl pango"
+DEPENDS += "wayland virtual/mesa virtual/egl pango"
 
 EXTRA_OECONF = "--disable-android-compositor \
                 --enable-setuid-install \
-- 
1.7.10.4


