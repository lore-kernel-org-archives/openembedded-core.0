Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 753AC7FAAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:59 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y17so3790585wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bHXDuc8q2eMYwZHDwrDUH+9yyv/JbEjgYKE0Byvuq4Y=;
	b=gsSIXGsa84X61P1On0RCva/LsoE/P2T/H/Ek+j4uixqIrzb5ksU5SDaRe7lq7ZkULb
	vYhrHfq8FI7a9bC4oxloxJdndkA86sWAd1LInHD7XJG+KMxvkN2hXy+lm93ZfEo1GDMc
	4Qdmp6ltcTR2zsSoxr058oBqZxVeaGymtYt2qCH9tX/v5XznL38Os+0zmyZzyQ3AI5Mi
	jCSPj3Vo4WPr+86Acj+pqDDiBIeu0iXPCJuOLsbM7NvmQhjUZBGJAQdoc6crwfj/XviC
	JQvgG7mATTkPnjexYJ3qSwbt7TUrJxoMmSqW0Igtg1LA/4lZggiBQISh+x975Xx9hABc
	jzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bHXDuc8q2eMYwZHDwrDUH+9yyv/JbEjgYKE0Byvuq4Y=;
	b=aMi7/KAnP6zbIFQc5POcS1IMFrEU4jzUXME3gKkRspmaZP+d6yIyVbBlGNVwbMdjVa
	4gM+g3+mENQvPNce1lcaEroJAnhLBa4vy0Z1x4QBlzcYS+Rl22ivd66Hn4MSRnMlRK74
	d5ETtIDOAlOzr+E5XvczFHBXcD/k8JLBRO83OOXzC2ifgIHsuCW/lKNo7dWb+2Zo9AXP
	Q4sGGY2rc17zEBRSXRZAaxJ+nXHbJBQOTmXeuJtXnlKuLvRFMgMBbXKDWpE7PwvhWl+Q
	hu7vZTxhfFi3z5cfmHMOFcVOvTicPsDO4a4mXgWo3jjr2MtCjyi2sSCRRbHzYtQBwEE1
	v8qw==
X-Gm-Message-State: APjAAAXM0CDo9dxrquJLnjnac9EZ+CgwAbUOGFizuYjyi9+/sTNIqkvQ
	Y3atF4tA4rgjiSi/tLZbVG2Qs3bi
X-Google-Smtp-Source: APXvYqyp1pWhgejyLq2vBTLdtSrNfdevP7sPuTAJcKiFJ780z5VAdrvmw0aEkLcHzCEMVkTgMo66uQ==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr7676442wra.8.1576174499855;
	Thu, 12 Dec 2019 10:14:59 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:23 +0100
Message-Id: <20191212181436.1322-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/30] libxml2: update to 2.9.10
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...he-python-tests-if-python-is-enabled.patch | 62 ++++++++++---------
 .../{libxml2_2.9.9.bb => libxml2_2.9.10.bb}   |  4 +-
 2 files changed, 34 insertions(+), 32 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.9.9.bb => libxml2_2.9.10.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
index 2b92dbc8dcb..5e9a0a506bd 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
@@ -1,4 +1,4 @@
-From 78dbd4c09d617a9cb730d796f94ee4d93840d3cc Mon Sep 17 00:00:00 2001
+From 2b5fb416aa275fd2a17a0139a2f783998bcb42cc Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Fri, 9 Jun 2017 17:50:46 +0200
 Subject: [PATCH] Make ptest run the python tests if python is enabled
@@ -8,18 +8,19 @@ be due to the fact that the tests are forced to run with Python 3.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
 ---
  Makefile.am                  |  2 +-
  python/Makefile.am           |  9 +++++++++
- python/tests/Makefile.am     | 12 ++++++++++--
+ python/tests/Makefile.am     | 10 ++++++++++
  python/tests/tstLastError.py |  2 +-
- 4 files changed, 21 insertions(+), 4 deletions(-)
+ 4 files changed, 21 insertions(+), 2 deletions(-)
 
-Index: libxml2-2.9.7/Makefile.am
-===================================================================
---- libxml2-2.9.7.orig/Makefile.am
-+++ libxml2-2.9.7/Makefile.am
-@@ -207,9 +207,9 @@ install-ptest:
+diff --git a/Makefile.am b/Makefile.am
+index ae62274..bd1e425 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -203,9 +203,9 @@ install-ptest:
  	install $(check_PROGRAMS) $(DESTDIR))
  	cp -r $(srcdir)/test $(DESTDIR)
  	cp -r $(srcdir)/result $(DESTDIR)
@@ -30,11 +31,11 @@ Index: libxml2-2.9.7/Makefile.am
  
  runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
            testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
-Index: libxml2-2.9.7/python/Makefile.am
-===================================================================
---- libxml2-2.9.7.orig/python/Makefile.am
-+++ libxml2-2.9.7/python/Makefile.am
-@@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 34aed96..ba3ec6a 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class.txt $(BUILT_SOURCES)
  
  $(GENERATED): $(srcdir)/generator.py $(API_DESC)
  	$(PYTHON) $(srcdir)/generator.py $(srcdir)
@@ -51,10 +52,10 @@ Index: libxml2-2.9.7/python/Makefile.am
 +.PHONY: tests test
  tests test: all
  	cd tests && $(MAKE) tests
-Index: libxml2-2.9.7/python/tests/Makefile.am
-===================================================================
---- libxml2-2.9.7.orig/python/tests/Makefile.am
-+++ libxml2-2.9.7/python/tests/Makefile.am
+diff --git a/python/tests/Makefile.am b/python/tests/Makefile.am
+index 227e24d..021bb29 100644
+--- a/python/tests/Makefile.am
++++ b/python/tests/Makefile.am
 @@ -59,6 +59,11 @@ XMLS=		\
  CLEANFILES = core tmp.xml *.pyc
  
@@ -67,24 +68,25 @@ Index: libxml2-2.9.7/python/tests/Makefile.am
  tests: $(PYTESTS)
  	@for f in $(XMLS) ; do test -f $$f || $(LN_S) $(srcdir)/$$f . ; done
  	@echo "## running Python regression tests"
-@@ -68,8 +73,11 @@ tests: $(PYTESTS)
- 	   export LD_LIBRARY_PATH; \
- 	   for test in $(PYTESTS) ; \
- 	   do log=`$(PYTHON) $(srcdir)/$$test` ; \
--	   if [ "`echo $$log | grep OK`" = "" ] ; then \
--	   echo "-- $$test" ; echo "$$log" ; fi ; done)
-+	   if [ "`echo $$log | grep OK`" ]; then \
-+	   echo "PASS: $$test"; else \
-+	   echo "$$log"; echo "FAIL: $$test"; fi; done)
+@@ -70,9 +75,14 @@ tests: $(PYTESTS)
+ 	    if [ "$$?" -ne 0 ] ; then \
+ 	      echo "-- $$test" ; \
+ 	      echo "$$log" ; \
++              echo "FAIL: $$test"; \
+ 	      exit 1 ; \
++            else \
++              echo "PASS: $$test"; \
+ 	    fi ; \
+ 	  done)
  else
 +install-ptest:
 +
  tests:
  endif
-Index: libxml2-2.9.7/python/tests/tstLastError.py
-===================================================================
---- libxml2-2.9.7.orig/python/tests/tstLastError.py
-+++ libxml2-2.9.7/python/tests/tstLastError.py
+diff --git a/python/tests/tstLastError.py b/python/tests/tstLastError.py
+index 81d0acc..162c8db 100755
+--- a/python/tests/tstLastError.py
++++ b/python/tests/tstLastError.py
 @@ -25,7 +25,7 @@ class TestCase(unittest.TestCase):
          when the exception is raised, check the libxml2.lastError for
          expected values."""
diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.9.9.bb
rename to meta/recipes-core/libxml/libxml2_2.9.10.bb
index 5a7e098f382..2c833fa7a2c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-execution-of-ptests.patch \
            "
 
-SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
-SRC_URI[libtar.sha256sum] = "94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871"
+SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
+SRC_URI[libtar.sha256sum] = "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.17.1


