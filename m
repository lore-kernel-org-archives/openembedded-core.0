Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6DC76DBC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:37 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 65so142174441pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PFmPMXnLhYCeeJtrnDY4krMYirY7+yDXIRX2YIyzuQU=;
	b=inA4roiLTvNFKEE8rX5BU/0Kg3oU5NWqcvnyLgIOS+ArXDT0OCKANRFnTwlI/bNUbj
	Id+UlO2VlfujSPiS/k6reyAZszC1ldxyYIPYBe5m5XlHbnJtnQTYlvEXPa0H3AwLJyON
	BwWJutfA01gUte8eyI1625KoiK1QQWO2aVtkz0X+94pGSDiV1lR7KyOPOGEV9vhrRK4t
	ZLIVptnNW8MMSuO4uAabhzPVEVgm2OZ6bIZTkp+CnKHqcUKDFizhWZE7XXZAmJhR4ivn
	a5o9zZ6tszOJE45Qs/iPWO/gFEhHDLON7TEk/XhCgqtiGKpPKzzzQvmmPwZa9siqc2vj
	3+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PFmPMXnLhYCeeJtrnDY4krMYirY7+yDXIRX2YIyzuQU=;
	b=EOaZMDsvrysKCuJPfImcc5GOlS8baekNcQXVwAaun/x9ir4EOpNwf4tKfHA+d4sLOd
	Uz8FoemUYDltTprHivwMGrjwWWrXaytD0pbBj2GBmcGjptQv3c0k+ZCs8mxkqTpKAWbm
	ArCSZ1nt8gAfNqgDCbi5go37WcPJhhs6iBfs77Ur+wuQlOAyyZ9y8mCGYoyn2erz6rV2
	vb26TKy13DE4LruOBviGzsm590JArh0jgSxmrTjwspaUe8SKvmT+mJuv67um5henisLf
	RziCcDhDAh3E1YeOn/Ap0brCUom7gIiSCnmqto7XLPlthmh4+qOsAixV6JNJIGAo0W77
	cXNA==
X-Gm-Message-State: ALoCoQlCT1zblAaWGdWJoYEXT7VWEa+HSVAZ1r8K41hQTkkw9KyBF/9HGClhh4v0h9Q/pj+0Dq+mKVKjaFOG/v/waGRTSmMGQQ==
X-Received: by 10.98.69.209 with SMTP id n78mr27839837pfi.81.1453030658373;
	Sun, 17 Jan 2016 03:37:38 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:15 -0800
Message-Id: <6dc97210679f497c730fe667a18ef03595236c1f.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 42/73] nspr: Drop older glibc code
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:37 -0000

This was not only getting included for libc5 but also for not-glibc libc
implementations e.g. musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Remove-the-check-for-LINUX-glibc-case.patch | 35 ++++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.11.bb             |  9 ++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch

diff --git a/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch b/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch
new file mode 100644
index 0000000..5b17355
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0001-Remove-the-check-for-LINUX-glibc-case.patch
@@ -0,0 +1,35 @@
+From 9b9c95e0390395c7e9ad24a882deb87a50846059 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Aug 2015 17:10:34 -0700
+Subject: [PATCH] Remove the check for LINUX == glibc case
+
+Here it does not consider the case where musl can be an options it does
+consider the bionic case with !defined(ANDROID) but musl does not define
+and musl'ism defines like that
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ pr/src/misc/prnetdb.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/pr/src/misc/prnetdb.c b/pr/src/misc/prnetdb.c
+index b86248f..dc83a56 100644
+--- a/pr/src/misc/prnetdb.c
++++ b/pr/src/misc/prnetdb.c
+@@ -61,10 +61,7 @@ PRLock *_pr_dnsLock = NULL;
+ #define _PR_HAVE_GETPROTO_R_POINTER
+ #endif
+ 
+-#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT)) \
+-	|| (defined(LINUX) && defined(_REENTRANT) \
+-        && !(defined(__GLIBC__) && __GLIBC__ >= 2) \
+-        && !defined(ANDROID))
++#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT))
+ #define _PR_HAVE_GETPROTO_R
+ #define _PR_HAVE_GETPROTO_R_POINTER
+ #endif
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/nspr/nspr_4.11.bb b/meta/recipes-support/nspr/nspr_4.11.bb
index 3048641..3dabcb6 100644
--- a/meta/recipes-support/nspr/nspr_4.11.bb
+++ b/meta/recipes-support/nspr/nspr_4.11.bb
@@ -13,6 +13,15 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
 
 SRC_URI += "file://nspr.pc.in"
 
+CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
+                                          -D_PR_HAVE_OFF64_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
+                                          -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO \
+                                          -D_PR_INET6_PROBE'"
+
+SRC_URI_append_libc-musl = "\
+        file://0001-Remove-the-check-for-LINUX-glibc-case.patch \
+        "
+
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-- 
2.7.0


