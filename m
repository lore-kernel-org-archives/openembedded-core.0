Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3F36C241
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:58:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b13so28302405wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xrc8skmIxVqJyKXlbijwUcVjLHq4ekHFvJ2c3CNr0ws=;
	b=Cp+Sm8rE8yLKbMF15Rkb0jzC1dqPhpgm0n/qjLzEkU97zZrk8/m6q7+AKK9/S1qgMK
	g207AtjpOzPYVd0JERaspAVf3FcqYibyX1YEMtasi4bG1qIHFgGfOVwxM+aiPE7pCu+Y
	CaVdl1Dbg3oJCHeDdhFw0+nVGiAGU+8V7mFro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xrc8skmIxVqJyKXlbijwUcVjLHq4ekHFvJ2c3CNr0ws=;
	b=tkQm5Yv8hEwaj37SZqj9aLAgT+VA8ck7q3E8dGiWsCKHpC+3P2UbXQvYoLtAqY0YM3
	WaXqPSZHLy5JHDXoC4sFXrFzKLrtcNGBc4cvLCAnqcX2UbJrr2iyhrytdmjmeYc0eiEj
	WWeD1QFCNbQbi9a7ox2Ew0QkZ5wuBWGHy2OSNO9ULYde1esrtYnCjNNW9IePKLeP+AkN
	IYkgsO7hxQj+6PmemEcE0UgYKpNyuew+2omXcLOSEOBOD/thxV0Vt4EoJYLA4yjToA6l
	bnul+PjxeNfOZQMNMnJ6NrDmve7XWA7RhtfyRkxMqaXI3iY/tpNdOeNcrcMfMOLhEySU
	hE9g==
X-Gm-Message-State: AGRZ1gJpzYstMfXAUKQNDUv/ISDos5cR50WXsf9LSX5Qub1XCePrnjrg
	uZIT2De515W56+3v0WOvQHwp3UxsI/4=
X-Google-Smtp-Source: AJdET5dLKxn9sllZvgBq+BkReLiS19aGYdNAGePyM+53RTU7pmc04Gw46tJgDo3OHNMJIOrHPGsQBA==
X-Received: by 2002:adf:83e3:: with SMTP id
	90-v6mr13542007wre.278.1542495483634; 
	Sat, 17 Nov 2018 14:58:03 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.58.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:58:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:52 +0000
Message-Id: <20181117225753.15733-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/9] mtools: upgrade 4.0.18 -> 4.0.19
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
X-List-Received-Date: Sat, 17 Nov 2018 22:58:04 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mtools/disable-hardcoded-configs.patch      | 17 +++++++++++++----
 .../{mtools_4.0.18.bb => mtools_4.0.19.bb}      |  4 ++--
 2 files changed, 15 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.18.bb => mtools_4.0.19.bb} (91%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 01455f10127..464ccc4ca79 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,12 +1,21 @@
-Disabled reading host configs.
+From 5c24356762bc4274d3ca4930b0bc7754f4ffd19b Mon Sep 17 00:00:00 2001
+From: Ed Bartosh <ed.bartosh@linux.intel.com>
+Date: Tue, 13 Jun 2017 14:55:52 +0300
+Subject: [PATCH] Disabled reading host configs.
 
 Upstream-Status: Inappropriate [native]
 
 Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
 
---- mtools-4.0.18/config.c.orig	2017-06-13 12:27:38.644000000 +0300
-+++ mtools-4.0.18/config.c	2017-06-13 12:28:47.576000000 +0300
-@@ -701,14 +701,6 @@
+---
+ config.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/config.c b/config.c
+index f086883..1c3f9bd 100644
+--- a/config.c
++++ b/config.c
+@@ -701,14 +701,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
similarity index 91%
rename from meta/recipes-devtools/mtools/mtools_4.0.18.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.19.bb
index 3c31aca3ad2..09742773e08 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
@@ -24,8 +24,8 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[md5sum] = "a23646617546bf6ad56f061d8b283c85"
-SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85"
+SRC_URI[md5sum] = "f750246a65ee6f9d2e82d10b03a0aaaf"
+SRC_URI[sha256sum] = "1bc197199ea1c2c317f597879486eeb817f3199b526d94cc6841624768d910df"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.17.1


