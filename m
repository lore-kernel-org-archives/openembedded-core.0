Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC76F71C9E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so665756pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7NCz4Z+FTUzV5Y4HaAgCFsV04c7Pg2fkIYS69BrwlOc=;
	b=akqQWUcQLZ2Sv0V3HS5UBHXem8TJu4XU6ouQ70v5dRcMPrSlWRbQtRmr/r0Ja+tLOD
	KsWAv77xozrVcz/3hT4Rfnj5wGlck2+nn9CcKge+RZUEAC+50FActKnkZaHB8HepjUWM
	6bIU4SoqhqoRGYdW1O1CTpV06Q5Vq/dWaNy7c/RZe1MaSeKqy5NSoFAP7ZpFWlpxCMMm
	65yRoyit+OGf7ncuzkfN+3PL1qF4goxWI0Goxou+oFCY1UGDweCGwNl3rJo9BICa3P0Q
	P+0Jj7qjGW2iBGXTnFS2dWeoKwozJr/ihlkNJYDt7HxxyX93TBll5gxPwKDRwlaSIBKz
	favQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7NCz4Z+FTUzV5Y4HaAgCFsV04c7Pg2fkIYS69BrwlOc=;
	b=XyydZDbSvJNDVFbQ/TngO1eYSvdiBSwpAbL7j9eSsPM4lBcyTkW63ZPm5hue8mhOa7
	3ZEv0uLZCwz2oqIM87+QeooL+AqNJGnZ51lwZTOJPmDAFLWbYmGJbm4SEm6J0UiwQnkx
	S3RoncEEQQkhw8Xju9wi/XVNwjPLaw13eDzLXK9VFuzovK1cR57V00XuNUpkt5uk3Wjo
	62BILiZGXmIDYux43AfeaZLzaiikU0CD+3nRIpmGcpvlXi8X406eO4ZlxerKUQotB//t
	mI/Z4mY6L+6Y61Wc//MRNth9ed9o+4+4Nzqtx59b91L67OjTL2jENsmFHpVKnMm8maPM
	yIkg==
X-Gm-Message-State: AKaTC02jum4JS7V28yQoj9nibM1WYo1+xLTNaDSOztE7+OKJ6W8Lv41ZudJ2AYmRfxE0aQ==
X-Received: by 10.99.164.9 with SMTP id c9mr139167549pgf.141.1481252293660;
	Thu, 08 Dec 2016 18:58:13 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:58:01 -0800
Message-Id: <20161209025801.20775-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 8/8] gstreamer-vaapi-1.0: check for "opengl"	feature
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:12 -0000

From: Ismo Puustinen <ismo.puustinen@intel.com>

If "opengl" distro feature is not set, libva recipe is skipped. Since
missing libva breaks gstreamer-vaapi-1.0 build, the same check has to be
done in gstreamer-vaapi-1.0 recipe too.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
index 6dea9cf..59b0324 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
@@ -16,7 +16,9 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc distro_features_check
+
+REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 PACKAGES =+ "${PN}-tests"
 
-- 
2.10.2


