Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB6FC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:42:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1835.1646178138902380434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iFXsKXEq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so215525wmp.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+MtA/sZRzIjq9v4bui7c1XamXifeyz7lcQFc5EQQV5s=;
        b=iFXsKXEqPkwogu2L7lcq4rXqMEfYjFGo4yoap1mVh21ebNnPAcANEd7RVUfZD8oS1r
         lK2MrsTMfs+I7VGduHtkURb1pFEtUh+/aTdt1m1FTZYk3hiskhPBVpbx+ZhX0kFED4Ku
         EW66S8xq9zuTBaANQlPS9kJ3QqJZP1CTdeCuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+MtA/sZRzIjq9v4bui7c1XamXifeyz7lcQFc5EQQV5s=;
        b=V2oO/0iZqvF5WpFe9nfKpbobsBnFnppBj/bCvFyyke62cTwOAvT/zf/eOKV3dk/3D0
         OYO+uOIFxdeBTZcX5ZCIAvhy/WaBu9nX98jZgK3xoiJOORwDpYHAIhA3EeFQPugTv6WX
         px9v/2kZWoTOZ3hvni/qnpSpWGi87Cm+GBe099qvwWJWh+qXablCMO2SEibWKtbhEeog
         4Z7Xq3t/WGTYRbuXgto+yFyhTIv71MK1xSHrENUgWBSJlsHi+d7qL8N5eLCFSdfLz0Yn
         ktqf9lhLi3/cJX7UvrlJhs2Y8cL5OsqkXlbi3/fw0FX2ynpyVc0O3vq1rQTWoycj/zhX
         d1Ew==
X-Gm-Message-State: AOAM531a4S6THDIfPoCjGAnQutfOVAnPYDvC4ELR2PuGaIhbSuRHQYyk
	3VndupRsinTaSA08+EoXVVnuYxLnmnOg7Cwg
X-Google-Smtp-Source: 
 ABdhPJxsmRhjN1OYcUP5KGIvAtMEksUWsj9WyxHEW7DY/G+xLrOP+kiGmAmPQG2QZ4m+XwHZiqL6JA==
X-Received: by 2002:a7b:c922:0:b0:383:e7e2:4a1a with SMTP id
 h2-20020a7bc922000000b00383e7e24a1amr252450wml.51.1646178137187;
        Tue, 01 Mar 2022 15:42:17 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b001e7be443a17sm21491351wro.27.2022.03.01.15.42.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 15:42:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] license/insane: Show warning for obsolete license usage
Date: Tue,  1 Mar 2022 23:42:13 +0000
Message-Id: <20220301234214.247172-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:42:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162579

We want to use SPDX identifiers in LICENSE variables. There is now a
conversion script to make most of the translations. Add a list of
strings which have been replaced so we can show warnings to users
if they're still used anywhere.

Add checks to the package as insane check. This is currently a warning
by default but can be turned off or made an error as per the other standard
checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass   |  6 ++++++
 meta/classes/insane.bbclass | 31 ++++++++++++++++++++++---------
 meta/lib/oe/license.py      | 10 ++++++++++
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bfc7087a189..b7869da3b38 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -597,6 +597,12 @@ python () {
 
             exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
 
+            for lic_exception in exceptions:
+                if ":" in lic_exception:
+                    lic_exception.split(":")[0]
+                if lic_exception in oe.license.obsolete_license_list():
+                    bb.fatal("Invalid license %s used in INCOMPATIBLE_LICENSE_EXCEPTIONS" % lic_exception)
+
             pkgs = d.getVar('PACKAGES').split()
             skipped_pkgs = {}
             unskipped_pkgs = []
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 29b9b3d466a..3c8d49f13bd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,7 +27,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
-            license-incompatible license-file-missing \
+            license-incompatible license-file-missing obsolete-license \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -909,14 +909,19 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
         return True
 
     recipe_lics_set = oe.license.list_licenses(d.getVar('LICENSE'))
-    unlisted = oe.license.list_licenses(pkg_lics) - recipe_lics_set
-    if not unlisted:
-        return True
-
-    oe.qa.add_message(messages, "unlisted-pkg-lics",
-                           "LICENSE:%s includes licenses (%s) that are not "
-                           "listed in LICENSE" % (package, ' '.join(unlisted)))
-    return False
+    package_lics = oe.license.list_licenses(pkg_lics)
+    unlisted = package_lics - recipe_lics_set
+    if unlisted:
+        oe.qa.add_message(messages, "unlisted-pkg-lics",
+                               "LICENSE:%s includes licenses (%s) that are not "
+                               "listed in LICENSE" % (package, ' '.join(unlisted)))
+        return False
+    obsolete = set(oe.license.obsolete_license_list()) & package_lics - recipe_lics_set
+    if obsolete:
+        oe.qa.add_message(messages, "obsolete-license",
+                               "LICENSE:%s includes obsolete licenses %s" % (package, ' '.join(obsolete)))
+        return False
+    return True
 
 QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
 def package_qa_check_empty_dirs(pkg, d, messages):
@@ -1012,6 +1017,14 @@ python do_package_qa () {
 
     bb.note("DO PACKAGE QA")
 
+    main_lic = d.getVar('LICENSE')
+
+    # Check for obsolete license references in main LICENSE (packages are checked below for any changes)
+    main_licenses = oe.license.list_licenses(d.getVar('LICENSE'))
+    obsolete = set(oe.license.obsolete_license_list()) & main_licenses
+    if obsolete:
+        oe.qa.handle_error("obsolete-license", "Recipe LICENSE includes obsolete licenses %s" % ' '.join(obsolete), d)
+
     bb.build.exec_func("read_subpackage_metadata", d)
 
     # Check non UTF-8 characters on recipe's metadata
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 29412dfe46b..99cfa5f7339 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -14,6 +14,16 @@ def license_ok(license, dont_want_licenses):
             return False
     return True
 
+def obsolete_license_list():
+    return ["AGPL-3", "AGPL-3+", "AGPLv3", "AGPLv3+", "AGPLv3.0", "AGPLv3.0+", "AGPL-3.0", "AGPL-3.0+", "BSD-0-Clause",
+            "GPL-1", "GPL-1+", "GPLv1", "GPLv1+", "GPLv1.0", "GPLv1.0+", "GPL-1.0", "GPL-1.0+", "GPL-2", "GPL-2+", "GPLv2",
+            "GPLv2+", "GPLv2.0", "GPLv2.0+", "GPL-2.0", "GPL-2.0+", "GPL-3", "GPL-3+", "GPLv3", "GPLv3+", "GPLv3.0", "GPLv3.0+",
+            "GPL-3.0", "GPL-3.0+", "LGPLv2", "LGPLv2+", "LGPLv2.0", "LGPLv2.0+", "LGPL-2.0", "LGPL-2.0+", "LGPL2.1", "LGPL2.1+",
+            "LGPLv2.1", "LGPLv2.1+", "LGPL-2.1", "LGPL-2.1+", "LGPLv3", "LGPLv3+", "LGPL-3.0", "LGPL-3.0+", "MPL-1", "MPLv1",
+            "MPLv1.1", "MPLv2", "MIT-X", "MIT-style", "openssl", "PSF", "PSFv2", "Python-2", "Apachev2", "Apache-2", "Artisticv1",
+            "Artistic-1", "AFL-2", "AFL-1", "AFLv2", "AFLv1", "CDDLv1", "CDDL-1", "EPLv1.0", "FreeType", "Nauman",
+            "tcl", "vim", "SGIv1"]
+
 class LicenseError(Exception):
     pass
 
-- 
2.32.0


