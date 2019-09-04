Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id A97F37F27D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:23:40 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l21so11349147pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=kKjZGz91rQv1oALJ4sj1G7zqzS+cknQqFxmWasXSB2o=;
	b=aq6rKsRM+npXponlXu7r2imfiITIqBGKpA70uNj2jreTK1B6aUEauv3tiy9jFi8njR
	+YS6wYkm9VKYPiHfkWhvGtZKCqoac3awY8SxDONb9a3Vs/UZ74ptdY6wAenTQTgUuzB7
	oP/ofCC61DHBTFILmKiWbHEU9aRlmgkqYPSXeSTg6ZEtGD5REjVqNJ2I+k2xhn7/5ICZ
	F7CPP7kIi4INfpB4JDyXLHXgXIN1z09oFta0tY4dubm+swEDb8saYh0Vc8Du/IUEEGnR
	1XixLA212BMk+sgnQ1WY/hVeD6Pr4gyyWZ2dIRIU3Ja0hHBKI4BMGlKcUe2OBdqFqj4F
	j8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=kKjZGz91rQv1oALJ4sj1G7zqzS+cknQqFxmWasXSB2o=;
	b=oSZP6YUQsH5PP81hzqTzXr1yFJ9HydEqxmqS+zR6Op1AQ3JdVvJhdu2MpgAp9ZFoF3
	d7wgiry4xWZzf9gDIfV2Tph0i4BMCyEa1sJp/kQHWNQZB/dmM0Y0RtXnwIVAJBgAQqyR
	19r0rynDb653ttfrNC6GFIoW1V07KjLedkALjbI1X99n1/Jb+vXIrQvjPYib42l/Gxdr
	Z4GRH+/OqLbq97j7IwJkgWrGiKBlGll8AJR/bZoBmsBxUiYRMCGk+zw+GE+sgVxBoPgP
	JuAhRoDkfZYxs4GmowqrLChGlEVsI6BEAerV4KsxDZn8qE5eDvN08Wlj72NZeILuE3um
	n/1w==
X-Gm-Message-State: APjAAAXaQZ1qOVeKWQjTIenaOEso2foRrSJQTRDEQK3vTtxqq6ZUR1L6
	qLKz1lIJNP1zUXFwGjFkPdMYVXqwwP79BA==
X-Google-Smtp-Source: APXvYqzegQyJk0awtCPOZbYKCSZmtSzcOKCaTA0sqhWVyOdoWVSsdVuRsUOJ6t4ynBlyd21M71HF7g==
X-Received: by 2002:a17:90a:f98e:: with SMTP id
	cq14mr5334533pjb.43.1567607021754; 
	Wed, 04 Sep 2019 07:23:41 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	e192sm22243985pfh.83.2019.09.04.07.23.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 07:23:41 -0700 (PDT)
Date: Wed, 04 Sep 2019 14:23:23 +0000
Message-Id: <20190904142323.21781-3-nathan@nathanrossi.com>
In-Reply-To: <20190904142323.21781-1-nathan@nathanrossi.com>
References: <20190904142323.21781-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/4] maintainers.inc: Add entries for toolchain related recipes
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
X-List-Received-Date: Wed, 04 Sep 2019 14:23:40 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add entries for the added toolchain related recipes including
binutils-cross-testsuite and glibc-testsuite setting the maintainer as
Khem to match existing definitions. Also and entry for dejagnu setting
Nathan Rossi as the maintainer.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/distro/include/maintainers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0757230b1a..aaae55ac86 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -66,6 +66,7 @@ RECIPE_MAINTAINER_pn-bind = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-binutils-cross-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-bjam-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -142,6 +143,7 @@ RECIPE_MAINTAINER_pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-test = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -219,6 +221,7 @@ RECIPE_MAINTAINER_pn-glibc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Ross Burton <ross.burton@intel.com>"
---
2.23.0.rc1

