Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE0C6057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 20:53:19 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id x79so159493788lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4psRAo9LQeXPnQd9Kg/wCQ2K5Jnc2sloMXqrwQiEiSk=;
	b=v9/Hhym+dqQDRG5zVkOfUkO0puAEfxJyHtHON13bo8WmnVYDubBT9+XKnuC9fwd+MG
	jxF+ROReSgkq9w4cBPhNKyaoDM9eXUewTqlfE4mMC5axxg3X3AAOTXxMjlsHT6lY670J
	G7xzncPEHyVvK54gUs5LxPgQNbw4y3EzyxC8qMylqkWaKgCqfZFAQjMOBXZGdINPiS1X
	0m0a/ky2Wx0P0w6blRWFeQbGEmiwiPG/CAsyNs3SDc2znxLF0pJ9m88e2BKr1nmSOHCr
	mJJBELr6t/R6k1GQYEKrdPRwWF8ccby0+gSraKlKUsYDAlYjI49NKc4f7bySPs64oq3d
	7kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4psRAo9LQeXPnQd9Kg/wCQ2K5Jnc2sloMXqrwQiEiSk=;
	b=ZPHQ1MZNLcjTeNfb3sFtep4rpKqYVMadi6mBlkFTUGYm0B32/wDBOFkT0tlqBDIJu2
	g9HRG8ZkyTWNTrdJMjde4Vx3quxMsSIbvK6gRt7j56vOed/NJzbQ55Yh0rk4UiEqlAw2
	02jDGo0HnWzSSh2Nx3loJ913YYucqL0b0YaB1F55eSNnA2Pn/r2tjyrarb2aDY76b8/L
	SnzTCuD5fa1fmHdweONvIxeRBy5f7pB3wlfDFdytfOEJ9RGb5dI/OMhTqz+asDNsttBx
	X5SDBg15soTbeJpHk3ePBoHt6bUUV4cDsRoklmcX6f5BGA6nSWNkfJmi9/U9Avk+Xkcp
	4HFg==
X-Gm-Message-State: AA6/9RkD7q4+TjwlG2gsC/rvpZrtz2SI/AdHhTo5ESvVfW689HYYwH67Tw2+SA+uyEqbENEY
X-Received: by 10.28.175.2 with SMTP id y2mr3362314wme.106.1476391999992;
	Thu, 13 Oct 2016 13:53:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	a1sm25558815wju.41.2016.10.13.13.53.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 13:53:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2016 21:53:14 +0100
Message-Id: <1476391995-17730-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] librsvg: remove redundant assignment
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
X-List-Received-Date: Thu, 13 Oct 2016 20:53:21 -0000

PIXBUFCACHE_SYSROOT_DEPS was removed in oe-core b41108, so remove this
assignment to avoid confusing people reading the recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.16.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
index ed54d9d..49243c8 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.16.bb
@@ -41,5 +41,3 @@ FILES_rsvg = "${bindir}/rsvg* \
 FILES_librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
-
-PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:do_populate_sysroot_setscene"
-- 
2.8.1


