Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8899CC433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.8703.1637163332541473496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o2hsnFf4;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u1so5444444wru.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRXwZirKuofuRVlU4rliAzDmh69zN0AAFsI6RsJ6Yko=;
        b=o2hsnFf4ZvzNij1397vhRGeag2ow8zicW+eU74GGB5f5z67wsrF4nfshQ0gBiHLQP4
         QATHv+u8q2oJtPsPkP/JHkZVRlRNrt4U7j3gcBAzolOYX9xHF8mKuyMBmwY8T7lG+JbX
         Q5QUWwch9KvOMqZVfdDKQ6mYd8sHQqqMDLpohIFykEC7YMAzIuyoYQMDPyzn5CJrP00l
         sMw0UbjZzbSlh6OyK4yhKp2U2CXEb1dw900FTD161ju50dWGhopY0bmEL1Yl1tcfkxsF
         VzVvMBBQ9wZzpGTPNy5ShgHOCaT7KQxC1XLdwJKm2tahxbkzLOHMChU8ZZvIy7tFh7t7
         HNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRXwZirKuofuRVlU4rliAzDmh69zN0AAFsI6RsJ6Yko=;
        b=XIr0ud6R3NOCKtazccze09+hdx5cC0fXv26nEQYWyySw1Gzmg2mDiAvxQicK+lXzCG
         MPBAYrvT7M5k+z9UM3eVJoWWrifoDOYB5Jd7r+SZIde3BEMnsemTPUJgi7IpDyiDBXeB
         3bl0XD8HM4xrT63m7gV/0mLB++aBf9mZb4BevptfXbBauIsyzxCUBc9+9YXoRj1OxB/u
         PMyktBvP1JUTX34HpYnNpB3JtHI99Rdg+uEx5gcxvJPAjpyMKLsRLIMB7RlMmw5VXFhU
         IrJQAf73RR1XBWLjbli2sj3yIdE6BTaIrRfDzghVbY0KjwLnYUdY3B0qNw6NYQm/uRke
         mFxA==
X-Gm-Message-State: AOAM531uH4K26rIbgoWQQfZpmZACGRI6RNdfO/h32SRspWMKTXU8Fh86
	EJJ4loX/YL0zDN4Od1m5JKbT1Nr05z0=
X-Google-Smtp-Source: 
 ABdhPJxzqj/1KfNYaFbrO3bEPjXYZPg3Cx4junC9xxEYTguEBGaBqj0k8lRZQhMnrDALYaByGUoK1w==
X-Received: by 2002:a5d:588b:: with SMTP id
 n11mr21968915wrf.344.1637163331112;
        Wed, 17 Nov 2021 07:35:31 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Kumar Gala <galak@kernel.crashing.org>,
	Marko Lindqvist <cazfi74@gmail.com>
Subject: [PATCH 07/36] automake: update 1.16.3 -> 1.16.5
Date: Wed, 17 Nov 2021 16:34:56 +0100
Message-Id: <20211117153525.257146-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158402

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...date-for-python.m4-to-respect-libdir.patch | 83 +++++++++++++++++
 .../automake/automake/python-libdir.patch     | 88 -------------------
 ...{automake_1.16.3.bb => automake_1.16.5.bb} |  5 +-
 3 files changed, 86 insertions(+), 90 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/python-libdir.patch
 rename meta/recipes-devtools/automake/{automake_1.16.3.bb => automake_1.16.5.bb} (85%)

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch b/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
new file mode 100644
index 0000000000..d28045618e
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
@@ -0,0 +1,83 @@
+From dff74c5b19935cc11b30116a7ae9c8affdff246b Mon Sep 17 00:00:00 2001
+From: Kumar Gala <galak@kernel.crashing.org>
+Date: Thu, 11 Aug 2011 01:26:33 -0500
+Subject: [PATCH] automake: Update for python.m4 to respect libdir
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+
+Updated for automake-1.12.6
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ m4/python.m4 | 24 ++++++------------------
+ 1 file changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/m4/python.m4 b/m4/python.m4
+index 4e7de9427..40fc5b396 100644
+--- a/m4/python.m4
++++ b/m4/python.m4
+@@ -96,6 +96,8 @@ AC_DEFUN([AM_PATH_PYTHON],
+     [am_cv_python_version=`$PYTHON -c "import sys; print ('%u.%u' % sys.version_info[[:2]])"`])
+   AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
+ 
++  AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}'])
++
+   dnl At times, e.g., when building shared libraries, you may want
+   dnl to know which OS platform Python thinks this is.
+   dnl
+@@ -251,14 +253,7 @@ except ImportError:
+    else
+      am_py_prefix=$am_cv_python_prefix
+    fi
+-   am_cv_python_pythondir=`$PYTHON -c "
+-$am_python_setup_sysconfig
+-if can_use_sysconfig:
+-  sitedir = sysconfig.get_path('purelib', vars={'base':'$am_py_prefix'})
+-else:
+-  from distutils import sysconfig
+-  sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
+-sys.stdout.write(sitedir)"`
++   am_cv_python_pythondir=`echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+    #
+    case $am_cv_python_pythondir in
+    $am_py_prefix*)
+@@ -268,7 +263,7 @@ sys.stdout.write(sitedir)"`
+    *)
+      case $am_py_prefix in
+        /usr|/System*) ;;
+-       *) am_cv_python_pythondir="\${PYTHON_PREFIX}/lib/python$PYTHON_VERSION/site-packages"
++       *) am_cv_python_pythondir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
+           ;;
+      esac
+      ;;
+@@ -293,14 +288,7 @@ sys.stdout.write(sitedir)"`
+    else
+      am_py_exec_prefix=$am_cv_python_exec_prefix
+    fi
+-   am_cv_python_pyexecdir=`$PYTHON -c "
+-$am_python_setup_sysconfig
+-if can_use_sysconfig:
+-  sitedir = sysconfig.get_path('platlib', vars={'platbase':'$am_py_exec_prefix'})
+-else:
+-  from distutils import sysconfig
+-  sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_exec_prefix')
+-sys.stdout.write(sitedir)"`
++   am_cv_python_pyexecdir=`echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+    #
+    case $am_cv_python_pyexecdir in
+    $am_py_exec_prefix*)
+@@ -310,7 +298,7 @@ sys.stdout.write(sitedir)"`
+    *)
+      case $am_py_exec_prefix in
+        /usr|/System*) ;;
+-       *) am_cv_python_pyexecdir="\${PYTHON_EXEC_PREFIX}/lib/python$PYTHON_VERSION/site-packages"
++       *) am_cv_python_pyexecdir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
+           ;;
+      esac
+      ;;
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
deleted file mode 100644
index f319fc001b..0000000000
--- a/meta/recipes-devtools/automake/automake/python-libdir.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 61bd143910001aaf610416d7ca56c52c0b081318 Mon Sep 17 00:00:00 2001
-From: Kumar Gala <galak@kernel.crashing.org>
-Date: Thu, 11 Aug 2011 01:26:33 -0500
-Subject: [PATCH] automake: Update for python.m4 to respect libdir
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
-
-Updated for automake-1.12.6
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- m4/python.m4 | 27 +++++++--------------------
- 1 file changed, 7 insertions(+), 20 deletions(-)
-
-diff --git a/m4/python.m4 b/m4/python.m4
-index b2302ba..dbc6954 100644
---- a/m4/python.m4
-+++ b/m4/python.m4
-@@ -96,12 +96,13 @@ AC_DEFUN([AM_PATH_PYTHON],
-     [am_cv_python_version=`$PYTHON -c "import sys; print('%u.%u' % sys.version_info[[:2]])"`])
-   AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
- 
--  dnl Use the values of $prefix and $exec_prefix for the corresponding
--  dnl values of PYTHON_PREFIX and PYTHON_EXEC_PREFIX.  These are made
-+  dnl Use the values of $prefix, $libdir and $exec_prefix for the corresponding
-+  dnl values of PYTHON_PREFIX PYTHON_LIB_PREFIX, and PYTHON_EXEC_PREFIX.  These are made
-   dnl distinct variables so they can be overridden if need be.  However,
-   dnl general consensus is that you shouldn't need this ability.
- 
-   AC_SUBST([PYTHON_PREFIX], ['${prefix}'])
-+  AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}'])
-   AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
- 
-   dnl At times (like when building shared libraries) you may want
-@@ -146,14 +147,7 @@ except ImportError:
-      else
-        am_py_prefix=$prefix
-      fi
--     am_cv_python_pythondir=`$PYTHON -c "
--$am_python_setup_sysconfig
--if can_use_sysconfig:
--    sitedir = sysconfig.get_path('purelib', vars={'base':'$am_py_prefix'})
--else:
--    from distutils import sysconfig
--    sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
--sys.stdout.write(sitedir)"`
-+     am_cv_python_pythondir=`echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
-      case $am_cv_python_pythondir in
-      $am_py_prefix*)
-        am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
-@@ -163,7 +157,7 @@ sys.stdout.write(sitedir)"`
-        case $am_py_prefix in
-          /usr|/System*) ;;
-          *)
--	  am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
-+	  am_cv_python_pythondir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
- 	  ;;
-        esac
-        ;;
-@@ -188,14 +182,7 @@ sys.stdout.write(sitedir)"`
-      else
-        am_py_exec_prefix=$exec_prefix
-      fi
--     am_cv_python_pyexecdir=`$PYTHON -c "
--$am_python_setup_sysconfig
--if can_use_sysconfig:
--    sitedir = sysconfig.get_path('platlib', vars={'platbase':'$am_py_prefix'})
--else:
--    from distutils import sysconfig
--    sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_prefix')
--sys.stdout.write(sitedir)"`
-+     am_cv_python_pyexecdir=`echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
-      case $am_cv_python_pyexecdir in
-      $am_py_exec_prefix*)
-        am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
-@@ -205,7 +192,7 @@ sys.stdout.write(sitedir)"`
-        case $am_py_exec_prefix in
-          /usr|/System*) ;;
-          *)
--	   am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages
-+	   am_cv_python_pyexecdir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
- 	   ;;
-        esac
-        ;;
diff --git a/meta/recipes-devtools/automake/automake_1.16.3.bb b/meta/recipes-devtools/automake/automake_1.16.5.bb
similarity index 85%
rename from meta/recipes-devtools/automake/automake_1.16.3.bb
rename to meta/recipes-devtools/automake/automake_1.16.5.bb
index 1882eedcda..6a9c185e4d 100644
--- a/meta/recipes-devtools/automake/automake_1.16.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.16.5.bb
@@ -18,7 +18,8 @@ RDEPENDS:${PN} += "\
 
 RDEPENDS:${PN}:class-native = "autoconf-native hostperl-runtime-native"
 
-SRC_URI += "file://python-libdir.patch \
+SRC_URI += "\
+           file://0001-automake-Update-for-python.m4-to-respect-libdir.patch \
            file://buildtest.patch \
            file://performance.patch \
            file://new_rt_path_for_test-driver.patch \
@@ -26,7 +27,7 @@ SRC_URI += "file://python-libdir.patch \
            file://0001-build-fix-race-in-parallel-builds.patch \
            "
 
-SRC_URI[sha256sum] = "ce010788b51f64511a1e9bb2a1ec626037c6d0e7ede32c1c103611b9d3cba65f"
+SRC_URI[sha256sum] = "07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605"
 
 PERL = "${USRBINPATH}/perl"
 PERL:class-native = "${USRBINPATH}/env perl"
-- 
2.20.1


