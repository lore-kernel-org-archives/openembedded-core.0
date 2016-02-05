Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 644E5770EF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:58:48 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p63so43654869wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3j8+wc+GOTWY2mRstkF7cUQTAEkJXKpIyFsNyN2NgzU=;
	b=RBmZnoa/iqI0QNqrlxlv18Y+gcd6RQ/Mx3gy9MrZnWDAyS2kaCXVv3Hpm4KrS/0RpR
	3m/Tom17fyxiLQsb9unqFnl/aiFlHqvv8tWi5JWDgMIs7UT3lRGobfrh8965wgUJ1ZzE
	61ZJMoeuoQlbTQCrMwuB+a0C5WrjGm/hXKsb6edzXh9nB+kGs/xCofBcrAUVvwQy5Lg4
	zDSsbILy4216GqmG/b6+20PW56GqfROQEvHEVri0c+t16GXc1jbUWmo5/BlXSdPGya/J
	1hX/f/8RvGyiLZE7uDgPV5oEZg1dcUoGKRpjPA4ebfDc4Lue+zI98IcALoNN3qqmItKW
	hpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3j8+wc+GOTWY2mRstkF7cUQTAEkJXKpIyFsNyN2NgzU=;
	b=GB/boQQ+Yh7cwonG5gV0zPXf1JbEta73Shwe2svj9poNYruOMw6wknDie6soAjmLyX
	pMGY95gdvNRySCqXwNQfQRaQYT98y8HlV7i2U8Kr+S7s1b+Uplr2mq6LKdCoq8UTC5i9
	6Mnzo+k0dt0gQ/5KjhrnMPbAKWmaiMIWm+t7OHW4TfqC8Z+SJwR7du+Br8kRECZDfsbE
	i8K09Gn62Y1OkbpzMReUusybyA7wujQ0UzfZsdK9Jap8Xu2IhhSs74RHAl66kJ+7X1CM
	ucF4DxZYLOWWzHOsoFQWKPI3v9KlNd2hs7vwDCkeCRPnZqi37UTKpwVdKJ/f06xvWgUt
	ViGA==
X-Gm-Message-State: AG10YOSSlIaEJP7BduJ7Q8o8IV2a+Gu0dcELPwHZF26R3jeiKYzLKugtNtB+ulXsUTflZyms
X-Received: by 10.28.141.10 with SMTP id p10mr17856085wmd.83.1454705928812;
	Fri, 05 Feb 2016 12:58:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	t195sm343868wme.13.2016.02.05.12.58.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 12:58:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 20:58:46 +0000
Message-Id: <1454705926-24745-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gnome-mime-data: remove
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
X-List-Received-Date: Fri, 05 Feb 2016 20:58:49 -0000

gnome-mime-data is part of the GNOME 2 desktop, and the only dependency on it is
gnome-vfs which is in meta-gnome where this recipe should live.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome/gnome-mime-data/pkgconfig.patch             | 14 --------------
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb    | 19 -------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb

diff --git a/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch b/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch
deleted file mode 100644
index 0903425..0000000
--- a/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gnome-mime-data-2.18.0/Makefile.am
-===================================================================
---- gnome-mime-data-2.18.0.orig/Makefile.am	2009-06-11 17:27:48.000000000 +0100
-+++ gnome-mime-data-2.18.0/Makefile.am	2009-06-11 17:27:59.000000000 +0100
-@@ -1,6 +1,6 @@
- SUBDIRS = man po
- 
--pkgconfigdir = $(datadir)/pkgconfig
-+pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = gnome-mime-data-2.0.pc
- 
- NULL=
diff --git a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
deleted file mode 100644
index a31eb55..0000000
--- a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Base MIME and Application database for GNOME"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://check-mime.pl;endline=26;md5=a95b63c92c33d4ca1af61a315888f450"
-
-inherit gnomebase mime
-PR = "r4"
-
-SRC_URI += "file://pkgconfig.patch"
-
-SRC_URI[archive.md5sum] = "541858188f80090d12a33b5a7c34d42c"
-SRC_URI[archive.sha256sum] = "37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7"
-GNOME_COMPRESS_TYPE="bz2"
-
-DEPENDS += "shared-mime-info intltool-native"
-RDEPENDS_${PN} = "shared-mime-info"
-- 
2.7.0


