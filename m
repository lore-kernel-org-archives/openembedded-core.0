Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5416462252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:07 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so2484858wib.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=B90ii3g5bPi72+SLcKEOXTvWTRE8oDFtJj/4NyLgq6g=;
	b=jfd4ialc2SLercb9B7EiG5mEd8Ia55/Q/f6dWcVPGAVhVt41yv8wz/bAlxcN7+Q+47
	NIlS1vyw8lkuhOQE9lHPYziQZDOia3eRNm0a042c1PcMnLcxjSrJHo6mIIw7c1d5HHzh
	vOA/RLT8MFFZOBvXQwMY+uy4qHIi04tn9Bounrg1yhhm4yfT1/nW55gJZsZd1Ik6nJvL
	OZv16yG+09eX86KsxeGi5cMpUSR3FkPtw95Ki4PjYByuKWCB0uMVtFjgnNJOKdlklH0v
	1jUiexj0AzCCbAfz3N3xKz6MdRd28RjKdLNlMYN0e/8eBRcwu3pO8LNOLQRr0avWC0Pq
	akxQ==
X-Gm-Message-State: ALoCoQkIIdhsqMLhWbQVj7zcq6ESWUJJutA8EAlucsbui8WYJVCKy2xbhBqynlorAApjB2Rf02S0
X-Received: by 10.180.12.173 with SMTP id z13mr22448793wib.53.1410177548508;
	Mon, 08 Sep 2014 04:59:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:31 +0100
Message-Id: <c237aa90d4c5c49f1306067b5243406d3e52eef5.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 13/27] libpng: drop unnecessary automake requirement lowering patch
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:08 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

Automake recipe provides automake 1.14.1 anyway

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...0001-configure-lower-automake-requirement.patch |   31 --------------------
 meta/recipes-multimedia/libpng/libpng_1.6.10.bb    |    1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch

diff --git a/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
deleted file mode 100644
index bbbca89..0000000
--- a/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fff7cbc01e061a235852f385866fe75fb17867e3 Mon Sep 17 00:00:00 2001
-From: Valentin Popa <valentin.popa@intel.com>
-Date: Tue, 26 Nov 2013 12:06:55 +0200
-Subject: [PATCH] configure: lower automake requirement
-
-We're not using parallel tests in OE-core yet
-
-Signed-off-by: Valentin Popa <valentin.popa@intel.com>
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: Inapropriate [OE specific build hack]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 28200c3..fab2515 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,7 +27,7 @@ AC_CONFIG_MACRO_DIR([scripts])
- # dist-xz requires automake 1.11 or later
- # 1.12.2 fixes a security issue in 1.11.2 and 1.12.1
- # 1.13 is required for parallel tests
--AM_INIT_AUTOMAKE([1.13 foreign dist-xz color-tests silent-rules subdir-objects])
-+AM_INIT_AUTOMAKE([1.12.2 foreign dist-xz color-tests silent-rules subdir-objects])
- # The following line causes --disable-maintainer-mode to be the default to
- # configure, this is necessary because libpng distributions cannot rely on the
- # time stamps of the autotools generated files being correct
--- 
-1.8.3.2
-
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.10.bb b/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
index babf87e..79d9122 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
@@ -9,7 +9,6 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
-           file://0001-configure-lower-automake-requirement.patch \
           "
 
 SRC_URI[md5sum] = "5f414b20f683b1d96b163c89e3eff768"
-- 
1.7.10.4


