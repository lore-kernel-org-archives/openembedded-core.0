Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C08C478D42
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 14:36:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11-v6so10368940wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=F3/48b69lSd810txWF76jLGue27Iz+u9ypaO5BHMZ6I=;
	b=B11H6J71gLvMOHSWNMeAzJv3MwBlFeDjQ8yl98kFcJx0UD0y05l6nc6pDVvSC+ABfJ
	mp7ppyCVNq2RDHOpOltbdP8RCywClX0h3zr+g/+15iQdVoSaJDar5SXUgusCnkEx8n46
	qmkGBoEZ+QQASvdelOxi7ghfM/rTM5uTaS0c7pG7elq+dDPtztCFflC6HOf14I7JkXnd
	9kmqbjkRL+BEau087WWUpBHPLrE6187NR82TRdEdLWDjgfWEqCEFZ1ntPRIUKP+pNmiI
	veiGAyzlUNs4BPjqXBlP4EFA+lKSiQrGZjEawbV1XU5atDxViG/8NU67npy97+0fMl8e
	LvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F3/48b69lSd810txWF76jLGue27Iz+u9ypaO5BHMZ6I=;
	b=jPfSDL7VZsts+itlq3oHPH3VLyAa94qUCo/5Zkqw4vqxUi4FT9QaIJBGSuPprsfIdU
	mdodHxh8yUR0SotSc9TlzMp6ptDWvMuKrN10lV545WP9pz5Z/r8P528fWWWLOQQH4h+k
	+Pj+xBUc79t5kGkVMjHk12O4LH7a2MjxZLcQ3V1f8pShgNY/g9HiJI3rmYzoh6q0BsDh
	naLYmDP9DUmeL9saapCweCAlyueKzJ1yh1nevlmm2jHXPx/qq3uZMSIPNLGUV6d5bgoI
	nsAE8LN2HAyMFV9tOqwcy5TKK1HHzx3qBzQBQbxao6E6/YLlw+ZIs5jSL/pdpxQ4wVsF
	33Xw==
X-Gm-Message-State: ABuFfoj6oapWF9iQUKgILfzHCUPieWUh7KdGNCT9tOETMqE/v0sycpeK
	Af/M2aXy3/0QWiYMFJovHHwzGsPVGsQ=
X-Google-Smtp-Source: ACcGV62B/FvmxicjUyYalpChsJP5zuagtYTAR0ITtHT/vuMPTkaBv5GptqNbSePvxUe+Uol+fw9heg==
X-Received: by 2002:adf:ac4a:: with SMTP id
	v68-v6mr17664614wrc.165.1539009394115; 
	Mon, 08 Oct 2018 07:36:34 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm20114631wrd.1.2018.10.08.07.36.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 07:36:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 15:36:29 +0100
Message-Id: <20181008143629.9333-1-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 08 Oct 2018 14:36:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch          | 3 ++-
 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch   | 3 ++-
 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
index 4ca2f42d4c7..c1172147a6e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
@@ -1,10 +1,11 @@
 From 62005ad019d6afb81da100b3113292a16472d241 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:08:27 +0800
-Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
+Subject: [PATCH] Stub out x18n
 
 Update patch to version 1.6.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Inappropriate [configuration]
 ---
  src/Makefile.am    |   5 +-
  src/X18NCMSstubs.c | 426 +++++++++++++++++++++++++++++++++++++++++++++++++++++
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
index 3677fb1c5ca..09cf74fff4c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
@@ -1,12 +1,13 @@
 From 5c1693028ef12ab767d7cdbc349c27efa1ada87a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:13:38 +0800
-Subject: [PATCH] Upstream-Status: Pending
+Subject: [PATCH] Fix build when xlocale disabled
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
 Update patch to version 1.6.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Pending
 ---
  src/Font.c | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
index 1a3069a9ad6..0b57e0b068c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
@@ -1,13 +1,14 @@
 From 046703373055c7029c19d171e415ff3caaa87372 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 10 Sep 2018 09:16:33 +0800
-Subject: [PATCH] Upstream-Status: Pending
+Subject: [PATCH] Disable unicode
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
 Update patch to version 1.6.6
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Upstream-Status: Pending
 ---
  include/X11/Xlib.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.11.0


