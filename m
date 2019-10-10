Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD8A7F50D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:44 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id i32so3927749pgl.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6lvPdhX3W7qULK0Hg0TEorIDhf++QylHMU7Yv8auhYE=;
	b=uFfsVbHETHxwsO9zt/2bcMWupR0zKhHZ8JwHeWkuH+7beHvpntI+UmZac30nG6NioJ
	cy1ww63PX8+u7zyUPYswb8ZdVVjkbOVfxvBs6KCfOcVGPrNyNIUo6Mc16P/gFj/BmiSs
	wEc7jwMFgiE7+rEeTHnc7NCkIpRmPywLSYtB71ywkq17Kcf4t2hpq5c2v7HQPx2cstDV
	Feyz7FSc3b9NrZmdAS36PJPvxS2bWtMTn9UcVbZu56h9n3g1uLVQphye0p+mne3QtUZ+
	UKGgfLMK2XCGivgLMA6/dRlhKgruBo+IbCsRHmGjfHJ5lSHK1vyvyHHX6NGTwcSXgB1o
	K+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6lvPdhX3W7qULK0Hg0TEorIDhf++QylHMU7Yv8auhYE=;
	b=HWJWT6k1gXLPmL5v5IX4Ycuyi3qXn7RHvu6NMvBvso9JJv/4V46t5+ItxCDig7YFc5
	SNCzOBjkXLz42QdWLG+c1g6YZd7drPI1Q1QEoneL2zSAjxlj0BjOsGzAmefnDJBSLpMm
	xOeK/x5QTfgHOxaacVAAJ5iFDm9Rzs4HmYGumVB4LvOZSS+hH4Bcb1D7iqSC6i4wnFX0
	5uLdwU2vAioRENbw+iGOX7QtoZyvh2Oio4MzZGcKGFYUxotD3n4Uh7HaaJqK72fKK+HO
	SBjv3p93Oj8/d6ssE68JkebqlY7C4uaIaIQPfnVxjeDrVZPpEEfA9mnFUkq9+t3cGS6A
	A9nw==
X-Gm-Message-State: APjAAAVfEJZQTDW4EH+3tzJ7UqESqMwfO4zYU+8TAh6FzkWz0nbn+49R
	YGU16LSJmIE9VvazitsoM7BW98GH
X-Google-Smtp-Source: APXvYqw+1xDWksVcIqszRG2/YhvXL7k2CfVa0wq8F0VAWEY3KRWyh6gGbfhzEcepSpJoJ/HtqhDydg==
X-Received: by 2002:a17:90a:c389:: with SMTP id
	h9mr12423227pjt.11.1570722585926; 
	Thu, 10 Oct 2019 08:49:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:23 -0700
Message-Id: <e40c38afc1747d1ed71c9bd2ab3189bbb1efcee9.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:45 -0000

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


