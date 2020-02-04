Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id B809B61162
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:15 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id w21so4032139pgl.9
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cX5+42w5okMFV0ok81lK9zU1BlGze+AorBCOsHnqIJU=;
	b=aGTOrxRnhYsD8H/cWWYCI10Fc7FvcT2a9NZfETW9LTeB20SQI8rO9SCt8GUW8zbu5G
	hCoh8Qq1Z3P4PYMJA6vRLB84PmQQjEngxpwB6mJCsOdo780ni1kXpHl415mJelGPdQyh
	ln0QoLs5oIT78wlOidG5RHcx099qndRcGqEJaxa7peWEoVlWPU9RElOPe9elyCa4NPNH
	tctJsrOvrB8sSspGiNUvJZYKBDUhIaEIpWfbUVj/T3ypFhhFl5A045l005VBcwQbuaqX
	Tp9gx37qqzWKq0pbNzNS7ots0hVYvtlPRxWKR2ocNwEWPf8HUC8Yb7ZFir/i5/qZCnwd
	QWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cX5+42w5okMFV0ok81lK9zU1BlGze+AorBCOsHnqIJU=;
	b=tth1eNExuCDjMJhYhQ+oz8gdbF9sHHjYOJY8HD5U6F7NWQzc0qyCe3NI7PwhcEijs7
	A5zZuv7Noe3Pw7/yrHcUS4Su/BW1uEz7w/h0eWWYAeEuGRQxIpbaxPSZdJr3hMDaTSZb
	QTE3oAJurr8/fYstzyoMNQ1F34IUtu5/TsHyGZ5GT3ezyf+kgd2b8lB3iWzXox39xNzK
	0Qqjp2hBDG56hM8KyWEvtVWjt5NFzxHBXnohyLgHhXkoS/h6ER6wOi+Isl9963a+z8B3
	IhEZrY5PXkhYzyk9JmQD3D+2vu1DK8pDLe69qXg7asdqxXLb8QZDTcX6w2IYy0W6kOId
	8raA==
X-Gm-Message-State: APjAAAUaWPNfl68ASYceW8kg3VqwXoOPdyvujlIDzSSQS3thDaCRUoJ+
	6tvvgP04srRverTyQINaKBTVEwJY
X-Google-Smtp-Source: APXvYqwQUN0kRtsRWU7ROOaqw3N7mfb6NbtuUhLuejLD13rol3e6eGscEEBlGuPXr61MR+RfbYMnCA==
X-Received: by 2002:a63:b250:: with SMTP id t16mr12278693pgo.18.1580828776189; 
	Tue, 04 Feb 2020 07:06:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.15
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:03 -0800
Message-Id: <3a63d9e476f64b40978eea48e33603638137daca.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 3/8] kbd: configure.ac: Fix logic of vlock configure switch
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:15 -0000

From: De Huo <De.Huo@windriver.com>

Downstream bug report: https://bugs.gentoo.org/661650

Upstream-Status: Backport [f7f357ef079b6d185f340e716d7c72a98d82bad0]

Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
Signed-off-by: De Huo <De.Huo@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-Fix-logic-of-vlock-configure-switch.patch | 31 +++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.0.4.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch

diff --git a/meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch b/meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch
new file mode 100644
index 0000000000..c3f068f61b
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch
@@ -0,0 +1,31 @@
+From f7f357ef079b6d185f340e716d7c72a98d82bad0 Mon Sep 17 00:00:00 2001
+From: Garry Filakhtov <filakhtov@gmail.com>
+Date: Fri, 20 Jul 2018 15:58:56 +0200
+Subject: [PATCH] configure.ac: Fix logic of vlock configure switch
+
+Downstream bug report: https://bugs.gentoo.org/661650
+
+Upstream-Status: Backport [f7f357ef079b6d185f340e716d7c72a98d82bad0]
+
+Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
+Signed-off-by: De Huo <de.huo@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 87eb63c..07098cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -119,7 +119,7 @@ AM_CONDITIONAL(BUILD_LIBKEYMAP, test "$BUILD_LIBKEYMAP" = "yes")
+ 
+ AC_ARG_ENABLE(vlock,
+ 	AS_HELP_STRING(--disable-vlock, [do not build vlock]),
+-	[VLOCK_PROG=no],[VLOCK_PROG=yes])
++	[VLOCK_PROG=$enableval],[VLOCK_PROG=yes])
+ AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
+ 
+ if test "$VLOCK_PROG" = "yes"; then
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 4af3256fff..17ce6e7a9c 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -13,6 +13,7 @@ RCONFLICTS_${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
+           file://0001-configure.ac-Fix-logic-of-vlock-configure-switch.patch \
           "
 
 SRC_URI[md5sum] = "c1635a5a83b63aca7f97a3eab39ebaa6"
-- 
2.17.1


