Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A746C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 19:56:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.12234.1665518176058318000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 12:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nEofVXdy;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id i3so14488522pfk.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=STzK4EnrM4FZh51Czpd+Ft6fI3jkkUv3ZjJ08UqW0OI=;
        b=nEofVXdyM7izNLM1IlHW7Cv7EwXRFrLlDGDqMo2NziXVweNVCahgi9Ujb7GsQRDMtc
         b2KPXDAyJVS1vDNnW34XKucREkS8vCxdZQKiRUrz29LEirVYrk4xFnjg0a0BQ8kQws5S
         lScBXXamBjibMSR8T+Z04b6xHAl2XCrX9aGO9zhh2Ibg14IoCRSHxgyLuzhwqrkRFy56
         3/wZ+PI+3ZbVNAa5MLeo4yahxtQEiXBT9psJ6uozLItTNHxxs4RtrZVmlZDmNQnCfWBl
         OMlknE+jo+WO6hKtHNuiSJxZb/vgt9zI6vzpO3pJUQsTn3d2Onh9wLWg2SoOiP0hYPFK
         n7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STzK4EnrM4FZh51Czpd+Ft6fI3jkkUv3ZjJ08UqW0OI=;
        b=qAb25z3M6kQYFhjPY/ikYpAMosb6Y2eX+CwhXyTwREqI7nA3Jy17lpvSRTISSw6G7K
         gNHISDdyAFmGJ5xmXSWDXw2sNqtyY5DDq8SGTlrfYQQfxw52Uo7CKQTB7i1MMafWv0kQ
         UWaRF09IALl/1PfMGuhhR9LcKlTTn0BiTmhjjHqD1Mt32d4tCWaPYVLJUkw2WJRZhgHX
         mObUSet36asVm1NMcrzctSGqSbe+eZyLhkhYbXf5Ov2I/ePgzul0Ly7N9Msw8Lncziyp
         +bzt3DJCHXhoVYL6O3MwdFY8/HorR/QftjBmJ8TsHki5NdjmbLS07K8UbYq9hGflm+hi
         BpIA==
X-Gm-Message-State: ACrzQf3pHEBCVwXb+CdtVddAfSHw1rY8vqY8NdQqlKXE5vpRZUKXBoGh
	CFyJLKitDFFAy+P29FOhCV6V/LFT6yE9lg==
X-Google-Smtp-Source: 
 AMsMyM47dGd3KUOQ/EqJadNzpQZ71/kWuU9wV5A798lnqcFabjzkytP86ZJaqdsIAXK6s78RF4WQXQ==
X-Received: by 2002:a63:4a41:0:b0:452:bab5:156a with SMTP id
 j1-20020a634a41000000b00452bab5156amr22332732pgl.486.1665518174918;
        Tue, 11 Oct 2022 12:56:14 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:5f4c:d51a:946f:edd4])
        by smtp.gmail.com with ESMTPSA id
 t64-20020a625f43000000b00562a237179esm3576777pfb.131.2022.10.11.12.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 12:56:14 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [kirkstone][PATCH] python3: upgrade 3.10.4 -> 3.10.7
Date: Tue, 11 Oct 2022 12:56:01 -0700
Message-Id: <20221011195601.871846-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 19:56:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171637

Security and bug fixes.

Drop patch for gh-92036 which was merged in 3.10.5
Refresh 0017-setup.py-do-not-report-missing-dependencies-for-disa.pathc

Fixes:
* CVE-2020-10735
  https://nvd.nist.gov/vuln/detail/CVE-2020-10735
* CVE-2021-28861
  https://nvd.nist.gov/vuln/detail/CVE-2021-28861
* CVE-2018-25032
  https://nvd.nist.gov/vuln/detail/CVE-2018-25032

For a list of changes see:
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-7-final
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-6-final
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-6-final

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64 core-image-full-cmdline

 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch | 54 -------------------
 ...report-missing-dependencies-for-disa.patch |  8 +--
 .../{python3_3.10.4.bb => python3_3.10.7.bb}  |  3 +-
 3 files changed, 6 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
 rename meta/recipes-devtools/python/{python3_3.10.4.bb => python3_3.10.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch b/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
deleted file mode 100644
index 6a58c35cc60..00000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 178a238f25ab8aff7689d7a09d66dc1583ecd6cb Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 4 May 2022 03:23:29 -0700
-Subject: [PATCH 01/40] gh-92036: Fix gc_fini_untrack() (GH-92037)
-
-Fix a crash in subinterpreters related to the garbage collector. When
-a subinterpreter is deleted, untrack all objects tracked by its GC.
-To prevent a crash in deallocator functions expecting objects to be
-tracked by the GC, leak a strong reference to these objects on
-purpose, so they are never deleted and their deallocator functions
-are not called.
-(cherry picked from commit 14243369b5f80613628a565c224bba7fb3fcacd8)
-
-Co-authored-by: Victor Stinner <vstinner@python.org>
-
-Upstream-Status: Backport
----
- .../2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst           | 5 +++++
- Modules/gcmodule.c                                          | 6 ++++++
- 2 files changed, 11 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst
-
-diff --git a/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst
-new file mode 100644
-index 0000000000..78094c5e4f
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst	
-@@ -0,0 +1,5 @@
-+Fix a crash in subinterpreters related to the garbage collector. When a
-+subinterpreter is deleted, untrack all objects tracked by its GC. To prevent a
-+crash in deallocator functions expecting objects to be tracked by the GC, leak
-+a strong reference to these objects on purpose, so they are never deleted and
-+their deallocator functions are not called. Patch by Victor Stinner.
-diff --git a/Modules/gcmodule.c b/Modules/gcmodule.c
-index 805a159d53..43ae6fa98b 100644
---- a/Modules/gcmodule.c
-+++ b/Modules/gcmodule.c
-@@ -2170,6 +2170,12 @@ gc_fini_untrack(PyGC_Head *list)
-     for (gc = GC_NEXT(list); gc != list; gc = GC_NEXT(list)) {
-         PyObject *op = FROM_GC(gc);
-         _PyObject_GC_UNTRACK(op);
-+        // gh-92036: If a deallocator function expect the object to be tracked
-+        // by the GC (ex: func_dealloc()), it can crash if called on an object
-+        // which is no longer tracked by the GC. Leak one strong reference on
-+        // purpose so the object is never deleted and its deallocator is not
-+        // called.
-+        Py_INCREF(op);
-     }
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 0ead57e4655..8c554feb4b6 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -12,16 +12,18 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
+Refresh for 3.10.7:
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 
 ---
  setup.py | 8 ++++++++
  1 file changed, 8 insertions(+)
 
 diff --git a/setup.py b/setup.py
-index 2be4738..62f0e18 100644
+index 85a2b26357..7605347bf5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
+@@ -517,6 +517,14 @@ def print_three_column(lst):
                  print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
                                                longest, g))
  
@@ -35,4 +37,4 @@ index 2be4738..62f0e18 100644
 +
          if self.missing:
              print()
-             print("Python build finished successfully!")
+             print("The necessary bits to build these optional modules were not "
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.4.bb
rename to meta/recipes-devtools/python/python3_3.10.7.bb
index 34fd2895a3a..404a5821355 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.7.bb
@@ -35,7 +35,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -44,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19"
+SRC_URI[sha256sum] = "6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


