Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0212F6B96C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 17:52:09 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id x25so9048094ljh.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 10:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=chvm4BldFwRhzp2UyGmqrHBE9Jw7MbzGrlI28Qidlj0=;
	b=TKoCjt2yNh1cCE2jC+YHlt1wdvUOzqWVMsVybgItXfB5dFUVkb4HF/l5wjC/y6OhLj
	j7uyYQnkRcTBcGd0cpGM6ZsTguc/NJZdv0DwV0V3dDzUuQ2wLyHsqx92rXq0UeZuW64m
	6zJf6asVpUDAPi3dFWH4M7tH7MP65etKH/J/ozPoc7OxCIaPg6VsI1TnPr57PKl//fkl
	h9s4p6dpbaaQt0CSxkPU83jPyNgnf6JrQAas4PxV8pET/Ai+lZlgwzz69gekL/RfwFam
	WzKM7TBcjWkN1XTxHl6IL7BYzB8AfH28zp3TqiJlzwoOVaTx/EgL/PZ39HO120Vc+Law
	egTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=chvm4BldFwRhzp2UyGmqrHBE9Jw7MbzGrlI28Qidlj0=;
	b=j4CzE9ePYx7QHqPrfXoJGi5tPauoIxMRRNekNt0D7kl/BUmsn3VfAxaTY4h94kmGz3
	Uc67yo1joG6v18S34R3HYElMQBORyLmhwzdkFdbupynnKs5XybKOehQyUs8EubmvqoOk
	/s5JVHlNjAMYyz0EnlPNFed9OzxxMNrcfpJqYutrt9mCpq/0uRnPKQGMexUg2TfqBW21
	JZOYHcnRf5biw8Q76jLjJOfSUecDwZhmUMSea9HW6s4PruMqsLW/s/1KfDu88t1ZOZff
	W4lPNAuw7lahYfUexzZnjPReMRH0Ni4xzT7lsyXPCGriVsV1q9HLEbU2A+CShFLWt1Ab
	3SsQ==
X-Gm-Message-State: APjAAAV2YbveAhsGGirU3drfF4dqO76foSywL6iwYmv7SiBBnUpOhEp6
	HEHspP471xY1v0XbURopgO3PDNvTzvU=
X-Google-Smtp-Source: APXvYqyhEUXU+tQw9it3quYnad7P4RPAlG+W0JhvJ+GbwUEKMi6KjQnVG4zEIimJ1OqmjOm52ZstDw==
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr9554224ljm.180.1561830730419; 
	Sat, 29 Jun 2019 10:52:10 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a29sm1479061lfi.23.2019.06.29.10.52.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 10:52:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 19:52:07 +0200
Message-Id: <20190629175207.30311-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] expat: update to 2.2.7
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
X-List-Received-Date: Sat, 29 Jun 2019 17:52:11 -0000

Removed patch is not appropriate anymore.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/expat/expat/autotools.patch | 25 -------------------
 .../expat/{expat_2.2.6.bb => expat_2.2.7.bb}  |  5 ++--
 2 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/autotools.patch
 rename meta/recipes-core/expat/{expat_2.2.6.bb => expat_2.2.7.bb} (78%)

diff --git a/meta/recipes-core/expat/expat/autotools.patch b/meta/recipes-core/expat/expat/autotools.patch
deleted file mode 100644
index 104717eabb..0000000000
--- a/meta/recipes-core/expat/expat/autotools.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Avoid using expat's m4 files
-
-Upstream-Status: Inappropriate [Other]
-Workaround specific to our build system.
-
-Signed-off-by: Kevin Tian <kevin.tian@intel.com>
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Updated to apply over expat 2.1.0
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-
-Index: expat-2.2.5/configure.ac
-===================================================================
---- expat-2.2.5.orig/configure.ac
-+++ expat-2.2.5/configure.ac
-@@ -53,8 +53,6 @@ LIBAGE=6       # CMakeLists.txt!
- CPPFLAGS="${CPPFLAGS} -DHAVE_EXPAT_CONFIG_H"
- AC_CONFIG_HEADER(expat_config.h)
- 
--sinclude(conftools/ac_c_bigendian_cross.m4)
--
- AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
- 
diff --git a/meta/recipes-core/expat/expat_2.2.6.bb b/meta/recipes-core/expat/expat_2.2.7.bb
similarity index 78%
rename from meta/recipes-core/expat/expat_2.2.6.bb
rename to meta/recipes-core/expat/expat_2.2.7.bb
index c9e6081a35..f213bc3c3e 100644
--- a/meta/recipes-core/expat/expat_2.2.6.bb
+++ b/meta/recipes-core/expat/expat_2.2.7.bb
@@ -7,12 +7,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
-           file://autotools.patch \
            file://libtool-tag.patch \
 	  "
 
-SRC_URI[md5sum] = "ca047ae951b40020ac831c28859161b2"
-SRC_URI[sha256sum] = "17b43c2716d521369f82fc2dc70f359860e90fa440bea65b3b85f0b246ea81f2"
+SRC_URI[md5sum] = "72f36b87cdb478aba1e78473393766aa"
+SRC_URI[sha256sum] = "cbc9102f4a31a8dafd42d642e9a3aa31e79a0aedaa1f6efd2795ebc83174ec18"
 
 inherit autotools lib_package
 
-- 
2.17.1


