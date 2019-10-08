Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id DC3997F39E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:27:00 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x10so10432894pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6lvPdhX3W7qULK0Hg0TEorIDhf++QylHMU7Yv8auhYE=;
	b=LZg9O6H+C+FcR6/KmKP1Cut1dIlXP0PUTEeSqvP+uvumB5xd/xNxmis7TNZBwUs6kK
	Vx+HLqMXlE28s2PPUPQjdB9bhkWYr2+4j49vZrC2RxN0S0vlxP2dxvznm8tJYEw0He+/
	H2WCn+EeQJ1pop2gveJTt6TTTvAggUKZKOQ0XA7zz8/IE3OeuqbsWji8RhZWbM0HQyUX
	tJS4l5bSnM8fpC9ri03RNO0fHxPp4JV8HimGIsWFOXNKGR4lWcchtx6LhUjsCUOuhfp8
	d1D+tece+UCASXfeeAvcxJoM1ckPRVDUib2FWkITDz/1u6vbpfSuvxhDvLpcBXv3zFr9
	4rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6lvPdhX3W7qULK0Hg0TEorIDhf++QylHMU7Yv8auhYE=;
	b=gK7C12Jao0La17RJI+5J2vqfPuGAqRcATPCLptzUVtR4qC05ItFxtLITtqEnensAgX
	onsfQwGtK6OHz2M4tB4+gHAeBmJAscMD1ygdz+ejGsIrCDbaBn0ERo8toYGOGOPAY1Kw
	p01wNKMSAoC+kbFuhn2FLTK+ssl2TrSN7+lhI6zc8VbduCNq53p+2uj3zcHNu0pJyRo3
	mqTAg6I50+N08Ajag8tOvIo5DlaaCWmmfA8bhjMvVTojWkPrAcu+2DoYsm2iim1WExnp
	jYivB2kYkYjvpPVLtCllHjdKIz4iNwESJWztEeWeNfJ5oy+Fk9wm20bCLXZ//lNFM93h
	2Q2A==
X-Gm-Message-State: APjAAAWADiZeY+w7K8iEW+3nUEuJ0SWtfnsqSrkjCGzWMX2q5EK7fCHb
	Mf6tY4zvzjbhYushtU9bVo5B8gd/yn4=
X-Google-Smtp-Source: APXvYqwI1lH8+tdvc6u0LSQdW5uHVFNceusG7tKlHVp5sXZoSy+//X4XWZuaPyV14IdRyEM1QUGr/w==
X-Received: by 2002:a17:90a:3524:: with SMTP id
	q33mr6251291pjb.37.1570548421873; 
	Tue, 08 Oct 2019 08:27:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.27.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:27:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:43 -0700
Message-Id: <e40c38afc1747d1ed71c9bd2ab3189bbb1efcee9.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 11/12] gnupg: Do not apply -Woverride-init guard for gcc >= 9
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
X-List-Received-Date: Tue, 08 Oct 2019 15:27:01 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-Woverride-init-is-not-needed-with-gcc-9.patch | 31 ++++++++++++++++++++++
 ...c-use-a-custom-value-for-the-location-of-.patch |  6 ++---
 meta/recipes-support/gnupg/gnupg/relocate.patch    |  2 +-
 meta/recipes-support/gnupg/gnupg_2.2.12.bb         |  3 ++-
 4 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
new file mode 100644
index 0000000..4a280f9
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -0,0 +1,31 @@
+From 0df5800cc2e720aad883a517f7d24a9722fe5845 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Dec 2018 17:37:48 -0800
+Subject: [PATCH] Woverride-init is not needed with gcc 9
+
+Fixes
+| ../../gnupg-2.2.12/dirmngr/dns.h:525:16: error: lvalue required as
+unary '&' operand                                                 |
+525 |  dns_rr_i_init(&dns_quietinit((struct dns_rr_i){ 0, __VA_ARGS__
+}), (P))
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dirmngr/dns.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dirmngr/dns.h b/dirmngr/dns.h
+index 30d0b45..98fe412 100644
+--- a/dirmngr/dns.h
++++ b/dirmngr/dns.h
+@@ -154,7 +154,7 @@ DNS_PUBLIC int *dns_debug_p(void);
+ 
+ #define dns_quietinit(...) \
+ 	DNS_PRAGMA_PUSH DNS_PRAGMA_QUIET __VA_ARGS__ DNS_PRAGMA_POP
+-#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || __GNUC__ > 4
++#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || (__GNUC__ > 4 && __GNUC__ < 9)
+ #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
+ #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
+ #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 3f1c3ab..c43ecdf 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 8eb4d25c25a1c1323797d94e0727a3e42b7f3287 Mon Sep 17 00:00:00 2001
+From c69c3a49f3295179c247db5ceb3ef8952928a724 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4d66af9..b9ef235 100644
+index 919ab31..cd58fdb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1848,7 +1848,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1855,7 +1855,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index c494ef8..1a5ea4a 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From f9fc214b0bf2f67b515ca8a5333f39c497d1b518 Mon Sep 17 00:00:00 2001
+From 6d31b04d7a75f1d73c3518bf043b5b0a2dc40cb1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.12.bb b/meta/recipes-support/gnupg/gnupg_2.2.12.bb
index 1f381c2..a02c66a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.12.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.12.bb
@@ -14,7 +14,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
-          "
+           file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 
-- 
2.7.4


