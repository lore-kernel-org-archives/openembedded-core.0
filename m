Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id D10FE731EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:58 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id oj9so1833387obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s20VMv1xijifNTNDApViAw2o2VtwBGbORoQ04iyV1LU=;
	b=KZVd0alGtjjCVtDHGt8YnrSsMx4/BS6ROq9HBF5ueS3VGNJa0dIbj+f6qDgVWrwRJs
	uR73LYqUIkPMTsE7j9PwzZ/sOzbslJe/0ZVh55Kc3t8vZGPgFXADjK/eqbApFWl6z1aj
	cUB55NvvCyxyRK+pcwvKCkDugPjh3x9GsD6P9GhmGw3dMD//fFu4808y8jNrpi1aMqtb
	sXLxkWfqg8O06b2Qy+46153n9QjkBV4JA1TQJL2fgfjP0+IX9i5gHYWmLo1JvtC1ekgm
	kwibeyAaETPjUWVJGwn7fVhnBQNxDfGYA8AKXzuXGZBY87eXTA9juxVxi4Hyc+DPu7Fj
	jXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s20VMv1xijifNTNDApViAw2o2VtwBGbORoQ04iyV1LU=;
	b=CJELhGWlm7HWEAMGCtYOCi1jl/sbPidEIY99ws/Jp7pGHEc4cE/4TG39vdHKKh7wNC
	JV0332EkjK55P0EzhTsZhh5ntsd3g5Bxos5S7LvIWyyDoQg57/z4tuFmb02BSWv86wMe
	YREgcCiJueL6ToJ4zLhvoZ4fARSQQ2M1kJGv85bZXmHWNhCVowUqT02sdNnDXy5InwvG
	AeXDOz5Wgg4LiWOXXsmR2zUVeBpPsBJkJ3cu1VeqbWawFk/h+MPjGAHRE6YIQGa47f+W
	ceWDwXop6iBEZNkVFEckHOaS2W3ukVSF4xRCmiCnXVfZdav3/JUrHIoL7HgUWL72kP3k
	7jpA==
X-Gm-Message-State: ALoCoQmZbuWA1EnlUptpQan4CL2/2pIe4BofVchBS+jbBe/6ZH63Qzw/s8jGdT2iTGfbv92FPhPc2AtWQBip23gQyh4ushWY/w==
X-Received: by 10.60.159.105 with SMTP id xb9mr31445039oeb.26.1453344239760;
	Wed, 20 Jan 2016 18:43:59 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:12 -0800
Message-Id: <1453344203-7118-15-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 14/25] gstreamer1.0-plugins.inc: convert GSTREAMER_1_0_DEBUG to a PACKAGECONFIG
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:59 -0000

gstreamer1.0.inc has been updated to contol debug via a PACKAGECONFIG
option, so apply the same change to gstreamer1.0-plugins.inc as well.
Control valgrind support via a PACKAGECONFIG option too.

  http://git.openembedded.org/openembedded-core/commit/?id=81636555fa7f18407efc172c0d5b9f466b2d4014

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index d8532ac..a552653 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -7,18 +7,21 @@ DEPENDS = "gstreamer1.0 glib-2.0-native"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples "
-
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 LIBV = "1.0"
 require gst-plugins-package.inc
 
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc orc-native"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
 export ORCC = "${STAGING_DIR_NATIVE}${bindir}/orcc"
 
+EXTRA_OECONF = " \
+    --disable-examples \
+"
+
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
 # apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-- 
1.9.1


