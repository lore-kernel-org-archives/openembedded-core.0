Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0E778A5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 188so17023558wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fIcgQP17K1Y0dgGDZpGrtFaLYYviHBysPjk6wD+hUpo=;
	b=gACRD1iwx25iNym8QKE8xCMrT9VpGV9wOQRm2Kve8bESEzY+n5Im8Pu/W1hF4KVDQh
	gzF7ckNY+yFB9S2Hgzyo9hyR3rzP1roOg6wLUbIQFqHJWI0jHY2jy9c2xhqwJawm/7Nn
	OvVVo8EXTqNyRG4h/zqYR0qVzJmdwKmLyAVS1wnUYCcLgMzFQitJi602CKCz4Imq/His
	ivtIgmlhaKKfB09Hdc2CUIc6drtx5EHxI5oI1uZk3CffnghLJPLOiM/utL1sGal4ZeXv
	34EqD8TqFBgdP/PYhZVgm3bs+f94hojoSHJybMFgGQ5jw42wGdNfP1Vzl6t5WcEtyKpi
	HbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fIcgQP17K1Y0dgGDZpGrtFaLYYviHBysPjk6wD+hUpo=;
	b=KOqZsQwBcp2WNznocOR4eMCJOV0yPZDibPab78jEJuL3y4J2PYzD5c7jJM42ip0hiT
	dnTAtfn9/mDMWTW7fCz2vseeG3vdkZn1ma/xocZTCDXJ2uVGFIg5JoiBkzbIZYyK+P8U
	6ECuG2aiVabVPa9BJ6j/Ju48gwszRbSrlatEkR2XBEXfVy3tEW07lz8h7fQYXw8z/pos
	Yn8LEAqf/9NpgL8i3MYbHHqA3kEgc9Qoh1rtamaP0fadI2mEHWmg6SUA9Xe1IP3BMsnG
	HPAx3d0hF1CD5g5zk04Tcp27iKp0nkr4yiI55MzS62bIK6/r3ylXImBJFkSU5aEh5sXQ
	VM8Q==
X-Gm-Message-State: AElRT7FxBgPZRidjdpT25TD9aUuHq20aPksKUxKXfgfLDPihFGswmsI2
	zrrUCB0KaOIhzBsmr/DX/VLUSFMH
X-Google-Smtp-Source: AG47ELuF+VllrFUZH8/OYx6FspIzMiyeLAOI9Tl4zKnKqkBp3A+qVdOYXHHWOgdPnjqYIqOpPycHhA==
X-Received: by 10.28.8.201 with SMTP id 192mr8803143wmi.47.1520270457262;
	Mon, 05 Mar 2018 09:20:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:23 +0000
Message-Id: <20180305172046.21729-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 06/29] libxml: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...run-the-python-tests-if-python-is-enabled.patch | 43 ++++++++++------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
index d1ad55116a2..2b92dbc8dcb 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
@@ -15,12 +15,12 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  python/tests/tstLastError.py |  2 +-
  4 files changed, 21 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index e181ee0..7960e7d 100644
---- a/Makefile.am
-+++ b/Makefile.am
+Index: libxml2-2.9.7/Makefile.am
+===================================================================
+--- libxml2-2.9.7.orig/Makefile.am
++++ libxml2-2.9.7/Makefile.am
 @@ -207,9 +207,9 @@ install-ptest:
- 	install $(noinst_PROGRAMS) $(DESTDIR))
+ 	install $(check_PROGRAMS) $(DESTDIR))
  	cp -r $(srcdir)/test $(DESTDIR)
  	cp -r $(srcdir)/result $(DESTDIR)
 -	cp -r $(srcdir)/python $(DESTDIR)
@@ -28,13 +28,13 @@ index e181ee0..7960e7d 100644
  	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
 +	$(MAKE) -C python install-ptest
  
- runtests:
- 	[ -d test   ] || $(LN_S) $(srcdir)/test   .
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 34aed96..ba3ec6a 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class.txt $(BUILT_SOURCES)
+ runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
+           testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
+Index: libxml2-2.9.7/python/Makefile.am
+===================================================================
+--- libxml2-2.9.7.orig/python/Makefile.am
++++ libxml2-2.9.7/python/Makefile.am
+@@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class
  
  $(GENERATED): $(srcdir)/generator.py $(API_DESC)
  	$(PYTHON) $(srcdir)/generator.py $(srcdir)
@@ -51,10 +51,10 @@ index 34aed96..ba3ec6a 100644
 +.PHONY: tests test
  tests test: all
  	cd tests && $(MAKE) tests
-diff --git a/python/tests/Makefile.am b/python/tests/Makefile.am
-index 95ebead..418e21e 100644
---- a/python/tests/Makefile.am
-+++ b/python/tests/Makefile.am
+Index: libxml2-2.9.7/python/tests/Makefile.am
+===================================================================
+--- libxml2-2.9.7.orig/python/tests/Makefile.am
++++ libxml2-2.9.7/python/tests/Makefile.am
 @@ -59,6 +59,11 @@ XMLS=		\
  CLEANFILES = core tmp.xml *.pyc
  
@@ -81,10 +81,10 @@ index 95ebead..418e21e 100644
 +
  tests:
  endif
-diff --git a/python/tests/tstLastError.py b/python/tests/tstLastError.py
-index d5f9be7..3e5bef8 100755
---- a/python/tests/tstLastError.py
-+++ b/python/tests/tstLastError.py
+Index: libxml2-2.9.7/python/tests/tstLastError.py
+===================================================================
+--- libxml2-2.9.7.orig/python/tests/tstLastError.py
++++ libxml2-2.9.7/python/tests/tstLastError.py
 @@ -25,7 +25,7 @@ class TestCase(unittest.TestCase):
          when the exception is raised, check the libxml2.lastError for
          expected values."""
@@ -94,6 +94,3 @@ index d5f9be7..3e5bef8 100755
          try:
              f(*args)
          except exc:
--- 
-2.12.0
-
-- 
2.11.0


