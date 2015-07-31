Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 78CAD76424
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:09:13 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so6546126wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 01:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0SzLEM2RkbeoIf5MfbLQ7LBhgLT+cWZs5NYjqOXJVO8=;
	b=Uv+XB13evC0bure0um2kojH/V43ummTI9TrAOtgkA5oW1gyRUQPTiCiR0wJAEpkO+l
	nnAHG7RIMupIi/B7RveVLv/rbBbp8TP7uX/xHZBcyzxPUwrnTuHuwbVCc7dM/8rgEFcK
	yEN6KGkgyIy8IvCV+qdr16Qfa2WGjCLMPxrHEvzp4Oq5GPRNQBdAr9nV6KIBNpUWKOu9
	Ypt0XuvhCaYLZWUR9cBqhvgTCgNp4nRWPIKsndq+KcOhw1IV6+sL+NRfuShAsRpElahz
	6Lrqt9PK1ob65vBL9SX5VYywuIYwFYGUJ5q3zy3GIhHe6LkAYTvRvKldSyFpCL1B8dja
	f43g==
X-Gm-Message-State: ALoCoQmx5LLg49ezKgHLtbOHAsMhcCr5BAQTPXpt202UZWsAQGZqEf572Z2B6Mu7nBj9DlP4snBs
X-Received: by 10.181.25.234 with SMTP id it10mr4287363wid.41.1438330153949;
	Fri, 31 Jul 2015 01:09:13 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	yu4sm5847127wjc.43.2015.07.31.01.09.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Jul 2015 01:09:13 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 09:08:52 +0100
Message-Id: <1438330132-1599-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.3.5
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH] mesa: upgrade 10.5.8 -> 10.6.3
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
X-List-Received-Date: Fri, 31 Jul 2015 08:09:15 -0000

Tested with X11 :

* xf86-video-freedreno (and w/ XA) on IFC6410 and DragonBoard 410c
* softpipe on DragonBoard 410c
* using meta-qualcomm BSP

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb => mesa-gl_10.6.3.bb} | 0
 meta/recipes-graphics/mesa/{mesa_10.5.8.bb => mesa_10.6.3.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb => mesa-gl_10.6.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.5.8.bb => mesa_10.6.3.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb b/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_10.5.8.bb b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_10.5.8.bb
rename to meta/recipes-graphics/mesa/mesa_10.6.3.bb
index 072cde9..8c55064 100644
--- a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "5332a3576c5e3a0c3947ee6668dd4157"
-SRC_URI[sha256sum] = "2866b855c5299a4aed066338c77ff6467c389b2c30ada7647be8758663da2b54"
+SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
+SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.3.5


