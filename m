Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B83C66C5C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r11-v6so9360717wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bxw/g5Bi8odYNvZXBkx83w3Gfq7mbnX5i1JaURjX8UA=;
	b=Ext3DAKUXOQdvD0DvJMh1Rmk0d3Z5NK9yly3TUFRJjGgjYtFcPKbUOy6fmEHwu48Tz
	DfX0Vls+aWWnaC4qAKYvEbdOZ3e2V8PUTwvxoR4fOpeGOHnVw/DXzPjsF3krk7dt190h
	apYSuPvjn/sHaNGzVmA6qb/XrdIYo34GCqw5QNL3cxKhnUlOEw1kXZomn6+0RhIR/Imr
	4s+5YD5kpX9IwklhqOsvTCWPzjAM99kWwgDQ0mt8Bs9RD56TNjhMuFcpf0HEc+6GAmXp
	/w+KqL+D0W6Rsk1TfO0Agur96Cdlu6FklmVdJ3RimWfaz2ikxK714BtgKAHvEszq+j88
	7IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bxw/g5Bi8odYNvZXBkx83w3Gfq7mbnX5i1JaURjX8UA=;
	b=Ge/zLzaFKPgIeChM+PPUqYSF2Pt/dHsWWkOUyWqvamXlb35+dWqwfVVlHVA6VgAm1D
	Ye3wroiLQFAqbWlXhpqpVm6qKLVOddphemIRY2xU+v23Pp37PAWTHSCi8jhaL4FCzxdd
	GMZC8tEsbuJtCra9GEEnZdoEB/7xLsISt/y0mT31wHmP7f3YX2vZeDnj+U1/OS4nbkfU
	whJUMZJ7TLSNybcZ9+rbpnYkVV30Kb3ukIWUQEWoDT++beWN3gLE+bLxms7E5x3vYAy/
	9Ko3eCQi/w4q10g8D+tmw7eW41y8F7+vVG1N5/d3xcvk+5nH5wR9dJpU0cUAR4ftPQR+
	6PwA==
X-Gm-Message-State: AA+aEWYUOsmo18CQPmf74xUYUoEpDaPzuxRKIfvId9HJOLQDZ5WLLNFQ
	U1Xm0OSi58WRPrvb0+iG2+x0ousc
X-Google-Smtp-Source: AFSGD/U88bbFr4L9ifQOrbBCt+jyqiAlpDXRQnKS9wi8mDEIVDFei/a9s16c2Gudq1GLkxpzKmVJgw==
X-Received: by 2002:a1c:a5c8:: with SMTP id
	o191mr10684633wme.150.1542901316227; 
	Thu, 22 Nov 2018 07:41:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:27 +0100
Message-Id: <20181122154136.121480-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/16] icu: update to 63.1
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:56 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../icu/icu/fix-install-manx.patch            | 21 ++++++++-----------
 .../icu/{icu_62.1.bb => icu_63.1.bb}          |  4 ++--
 2 files changed, 11 insertions(+), 14 deletions(-)
 rename meta/recipes-support/icu/{icu_62.1.bb => icu_63.1.bb} (85%)

diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 8186fb41227..925b064ebd5 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -1,7 +1,7 @@
-From 3063a9211669bee673840ee81f81d30699b9b702 Mon Sep 17 00:00:00 2001
+From a6ddabc8cadb76bfe2d2e374a6702442cfe51cce Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 9 Oct 2015 17:50:41 +0100
-Subject: [PATCH 2/4] icu: fix install race
+Subject: [PATCH] icu: fix install race
 
 The generic recursive target calls target-local so also adding it to the
 dependency list results in races due to install-local being executed twice in
@@ -18,11 +18,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  source/Makefile.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/source/Makefile.in b/source/Makefile.in
-index c1db15b..4948deb 100644
+diff --git a/Makefile.in b/Makefile.in
+index be9435b..ada20d7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -73,7 +73,7 @@ EXTRA_DATA =
+@@ -77,7 +77,7 @@ EXTRA_DATA =
  
  ## List of phony targets
  .PHONY : all all-local all-recursive install install-local install-udata install-udata-files install-udata-dlls		\
@@ -31,7 +31,7 @@ index c1db15b..4948deb 100644
  distclean-local distclean-recursive doc dist dist-local dist-recursive	\
  check check-local check-recursive clean-recursive-with-twist install-icu \
  doc install-doc tests icu4j-data icu4j-data-install update-windows-makefiles xcheck-local xcheck-recursive xperf xcheck xperf-recursive \
-@@ -84,9 +84,9 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
+@@ -88,9 +88,9 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
  
  ## List of standard targets
  all: all-local all-recursive
@@ -43,15 +43,12 @@ index c1db15b..4948deb 100644
  dist: dist-recursive
  check: all check-recursive
  check-recursive: all
-@@ -350,7 +350,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
- 
+@@ -357,7 +357,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
  install-manx: $(MANX_FILES)
  	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
+ ifneq ($(MANX_FILES),)
 -	$(INSTALL_DATA) $? $(DESTDIR)$(mandir)/man$(SECTION)
 +	$(INSTALL_DATA) $^ $(DESTDIR)$(mandir)/man$(SECTION)
+ endif
  
  config/%.$(SECTION): $(srcdir)/config/%.$(SECTION).in
- 	cd $(top_builddir) \
--- 
-2.14.2
-
diff --git a/meta/recipes-support/icu/icu_62.1.bb b/meta/recipes-support/icu/icu_63.1.bb
similarity index 85%
rename from meta/recipes-support/icu/icu_62.1.bb
rename to meta/recipes-support/icu/icu_63.1.bb
index 4e3750b997a..e593dc1bdbd 100644
--- a/meta/recipes-support/icu/icu_62.1.bb
+++ b/meta/recipes-support/icu/icu_63.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "490ad9d920158e0314e10ba74ae9a150"
-SRC_URI[sha256sum] = "3dd9868d666350dda66a6e305eecde9d479fb70b30d5b55d78a1deffb97d5aa3"
+SRC_URI[md5sum] = "9e40f6055294284df958200e308bce50"
+SRC_URI[sha256sum] = "05c490b69454fce5860b7e8e2821231674af0a11d7ef2febea9a32512998cb9d"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.17.1


