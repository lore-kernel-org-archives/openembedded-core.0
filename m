Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 300146AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:45:09 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v186so84990452wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 08:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=E7JYKiZPWQ0pzQTkj5YoW2ouu2x6fwdjUoZiEGRkKio=;
	b=cKFw9n90r1WTkmUlcbwKkMXM/+UnrjNpKQwniLLKxAkx0PgnQ1hrS7GYWRpdu8yKjl
	TKGQ91Rga+43RhDjbG6XhjYnim4cYlYyYvUnkrsr73K9chd9IfaG80zppA+VUcx+L3JB
	jSQmQVULHX2ibV60ryIzNbUUJyIowToDyQHjLH0TIneQk0bYmKGcUtKotNwB3XNPN2wW
	PYL7V/KiqxBAaKGNbaptX1Gjohc6wZDJJHZ4ymRF5FV6Utj2uuN1OPYH7L8dJPFtAszb
	icziCc4aXy3QUlIor7OQxTn8IziY+n6R4J4dO6zM+4lSCnBO3lhFrStJE5oG0TLnGgUN
	UG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=E7JYKiZPWQ0pzQTkj5YoW2ouu2x6fwdjUoZiEGRkKio=;
	b=PnKy+xw44w2Ub7Gqp4GWYsaRceSr9/ZXl2xYhopuIj8WX45D42aAZlPxP1MC4TwsSe
	3Lc0J/aAqsZaHc2x9DKhbMceOfvAxw20uHBUKY2zTU6nMx5zAXaLbHRg8SaolE+77XTc
	rLUKQl/lE4K8j//a+KGhUt6rt7pQiEYKvCVRRxwex43rKgM+gIUgS9oBxyxKKKU3pmc/
	P5m3s3znsfKEWcYyDOCs0dawoCNfMjcg8aT06E7CUMVLyKEzFeA5BoKgth05noDCJ60u
	UldEGmIOyJyfSn7jxLQnuRgvygEKIwmi6PyYG9FAGocRAdwpLf3uzs2RFJTQ8uNvfyIH
	Z3qw==
X-Gm-Message-State: AMke39n7B4u8dp+dgKcH6PnBiQgXIKDw4k1Vx0qTks7bOwZmJHzKaSLDQG8YIXJfsLEmoc6Q
X-Received: by 10.28.137.203 with SMTP id l194mr20049057wmd.63.1487609109085; 
	Mon, 20 Feb 2017 08:45:09 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	48sm25479710wrt.54.2017.02.20.08.45.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 08:45:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 16:44:58 +0000
Message-Id: <1487609098-26531-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer1.0-vaapi: inherit upstream-version-is-even
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
X-List-Received-Date: Mon, 20 Feb 2017 16:45:10 -0000

These plugins follow the GStreamer versioning, so inherit this class to ensure
we don't get notified about development releases.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
index 59b0324..c73ecf8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
@@ -16,7 +16,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 
-inherit autotools pkgconfig gtk-doc distro_features_check
+inherit autotools pkgconfig gtk-doc distro_features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
-- 
2.8.1


