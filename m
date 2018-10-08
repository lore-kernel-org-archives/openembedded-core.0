Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 151C379202
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 15:13:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 185-v6so8710941wmt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=d+kHr3Tk7oQp3dIApy7Wif1y0ZtSK8Ya1jyAHEwFukk=;
	b=QpeknDDsleJNkk9LpI9ggiglW4Lm12zGJ1ONyDvZSHGKRDNzFM/9ZGtjsBUAcCsQVd
	mzHSnk2RgZ8azFOplwn1RUD0ZxXxNuvV44FNWAqxFKV7SxrQtDccdoROP5NYojwc/XyR
	wWnFdkmISfpLLkgDNbKrkgcQ0RQGuMvZTVx2MiNiNPMHgC08V3d3BuqOL9hEb9HlmPBH
	M/HQGqa36PvkB1DaFcTnHjAuYinmSX+XY+aPQjvRDpevw677UkdfNVL5wwaoVxkK66NW
	Mvfjam84MpsUSh7Ha8CvsUpCMJq1w5tiNDjCsIeGZLHdUvXAx1R35fTd/TATKXCpYpqu
	82Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d+kHr3Tk7oQp3dIApy7Wif1y0ZtSK8Ya1jyAHEwFukk=;
	b=XNJ+nYon7IKcCW+2+Ky35aGZEWNxXf3QGouHh4FbVhOlR5VyUeAu6i1pRyP2RlxI2u
	mUVleZ1pB5HHRPDN7znMZ/4gl7CYbkKrxYGtHH+SV+2E0x7EfEMcB5nSgFCDBy4T8JBA
	eDuXdb3zrlBR8K5H8hMvd1fENPIHaYU0WLblkZ9X4+pPdVE0Qp5Yhjm+t9exB75gf7m2
	VO7FT67bQDcBMHSNqQwdKzvk7tkNwxUlB+UwrevvX2xCVhJXpj5yECqOwWd25TJHsbWH
	CqSc76c/xW+dV9TtQiIyK+Vb0w0sqYxWmcvYMJNlDnvmTIo/zfbOYDoZDxGUvcUfyFDb
	8/ZA==
X-Gm-Message-State: ABuFfoiBWa8S+3NPylROHuxcNeS55wFYNXOQIJ755icjQq6JSUkJJu3l
	gsjeCuQvaGsYevKfEg9MuS64FrT75Jg=
X-Google-Smtp-Source: ACcGV62/fg/F67pFR/JgICJTn8o2uWcQO9+wrv66BlKACpiSceAjXJICAHSzkRmiLSafxxlLCzyemA==
X-Received: by 2002:a1c:ee0c:: with SMTP id
	m12-v6mr16680506wmh.112.1539011637302; 
	Mon, 08 Oct 2018 08:13:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r128-v6sm8189502wma.40.2018.10.08.08.13.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 08:13:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 16:13:54 +0100
Message-Id: <20181008151354.10511-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lib11: fix patch headers
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
X-List-Received-Date: Mon, 08 Oct 2018 15:13:57 -0000

devtool doesn't like patches without subjects, so add meaningful subjects.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch          | 2 +-
 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch   | 2 +-
 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
index c4c9396675a..c1172147a6e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
@@ -1,7 +1,7 @@
 From 62005ad019d6afb81da100b3113292a16472d241 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:08:27 +0800
-Subject: [PATCH] 
+Subject: [PATCH] Stub out x18n
 
 Update patch to version 1.6.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
index 559250f9576..09cf74fff4c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
@@ -1,7 +1,7 @@
 From 5c1693028ef12ab767d7cdbc349c27efa1ada87a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:13:38 +0800
-Subject: [PATCH]
+Subject: [PATCH] Fix build when xlocale disabled
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
index c077639f895..0b57e0b068c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
@@ -1,7 +1,7 @@
 From 046703373055c7029c19d171e415ff3caaa87372 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:16:33 +0800
-Subject: [PATCH]
+Subject: [PATCH] Disable unicode
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
-- 
2.11.0


