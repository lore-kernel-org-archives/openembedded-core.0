Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 68C6D6C84B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:02:22 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ez12so3556201wid.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jRP+jM6an56iG41kvgdXp8/COkp44bKe6tp+81gtY2Y=;
	b=WpTinG3BiMZ9prfdNWEiOR0JXGrRTZxymS/Gm/7Q0rEWRwZtaYbvuAtbbZ+ICIeLY9
	C+x/LDNzf3C/YNmnXMgIYRIxv3hGHkYSQ/WSsBQ5wV/NPb1SP4UvrHgxIxseH6wXC1b1
	UVqKMLIVlXH1dA5YahdoWWrGCDyMzdp8CYINAJCwqQvXAaRkNPkclwKUkFcNN1sQEm8i
	g+fT50n9o056dc3FrzsjLoZBj4rYHlOQQWu8SVhFDjOFFQK2RAmYedNOBCk+Sky+U6Kf
	jvCN+LzWVmjCE6nic3xQwX6k38S/68xAEm32PnqMeD7wFamNQgGh9zC0fM8buoGzhCCu
	1uzQ==
X-Gm-Message-State: ALoCoQnpZK0pEMIosT2oBjiIjM/v7hE0kUQyBimjsPRRLydpoNGCiV3pNXxWFRJA/Jv7UJHYo8jP
X-Received: by 10.180.210.231 with SMTP id mx7mr13917142wic.5.1379343743848;
	Mon, 16 Sep 2013 08:02:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mz14sm24198374wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 08:02:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 16:02:11 +0100
Message-Id: <1379343731-7492-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
References: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] weston: change mesa dependency to virtual/mesa
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
X-List-Received-Date: Mon, 16 Sep 2013 15:02:22 -0000

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


