Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 238A0713E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:22 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id w7so10410322lbi.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=yG7MMjqjsSLscEepKdlaCfF4YH7j9qSTJkFIRPyfP4E=;
	b=cj8N4bFRaYXI4HZCWzLIbTpf9BdCVY4AtTthpW8GJdssVOX2HAP06WxVYpAcL0RcgQ
	wl2LrFtYFH67zeD19DspW7tbbbV7n/haPsrEa2+WfLGFrhh+LnUSD9ECynLI6EJaQo+j
	jJ7LUu4Kialfja74yiQ7DPa4sP3Q3GSuNDWkCuKZtQiSlPJRuNSSEgFv6/oMyfTlrfFg
	q6ijvY4+UQ5TnlovGn5SJg86pMWcTuLuj/MCH9olgndpWUkiz1u1ovpXphk+p7db4lFY
	kdTD/wL9dKPwQi/zgffyQcxATr5TLpJP99zJukx5BbDzxK/rJJLSCxWjxFbyqOrCBFnc
	He9Q==
X-Received: by 10.152.3.35 with SMTP id 3mr872158laz.5.1409791702523;
	Wed, 03 Sep 2014 17:48:22 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id cm9sm38555lbb.39.2014.09.03.17.48.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:21 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDo-0008U8-8J; Thu, 04 Sep 2014 03:48:20 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:48:13 +0300
Message-Id: <c05972d08889077609d7f0dfa2fd3def8e5debfa.1409791242.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
References: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
In-Reply-To: <cover.1409791241.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
Subject: [PATCH 2/6] libpng: drop unnecessary automake requirement lowering patch
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
X-List-Received-Date: Thu, 04 Sep 2014 00:48:25 -0000

Automake recipe provides automake 1.14.1 anyway

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 ...0001-configure-lower-automake-requirement.patch | 31 ----------------------
 meta/recipes-multimedia/libpng/libpng_1.6.10.bb    |  1 -
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
2.1.0


