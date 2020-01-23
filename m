Return-Path: <danismostlikely@gmail.com>
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4527FD91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 21:45:22 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id dp13so2260225qvb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ea5m40il2y/mSIN4dt3Iv2UuqA0CygkWkyLKJSWONoY=;
	b=DCeHd1T1ZeMnKyXnTyW8uPzcHtDBfX+U6pyd74lUi+tRM3U14/yOz6FE4XlLwZf4mJ
	Loxwxei8MP/qQ8tCtaOIiaoc2oEnP7eLxQIAqno+421y6M5JJL7Z1sHpjzK7h/T9xAGv
	V87mSMUuYNi8Pg0cLrBGIX+AVJrs+oEWw5+kQjLCdwr8xsBHPxDtZPM7HfuLyaMP6Ddm
	rkefO25+xTyde8AqMwdMYtwR9koVsPkfPxKP4V1jwqQiub1Pzjnt9uw06ZLP1DN0m2Zj
	Wb2BGIEUeMh4ykhRlqIQ3tmiCymvd8YejioTUPRYigRA/aoXe+JbrWsEDbOllclYInSm
	Av0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ea5m40il2y/mSIN4dt3Iv2UuqA0CygkWkyLKJSWONoY=;
	b=PtVxhGueb0WID1owhPhQR7YJqH5TB2zgOyVCtesbKSaWxBChU3zb0grTHy+zJYMknW
	13llCs4HXPU1AFkTjskAnosMsqnbv6Dfpt9Fxwuh6wLqp8/9iNhXk2ga8KFbJygVXGXs
	gMNtaQ5Jf4lC8IAbDeFqPqcV3xPRX/qu0Fm5TcOBU1Ua9ZqO/+i4F+4BzGvoMmBw1N4F
	w6dtn2zNt41uiwOS1DbIwWNZ+iWMFKO3IUZd/A1QaTQR81jQdkgndngLWLgfBgAQYITk
	PUTLZgueRxgS7ythpZmnL5KNY2mQbxZZmhNhoo9hruiW02bNZdbfgyb1hS1cZ4LT7cEM
	5pVQ==
X-Gm-Message-State: APjAAAXjt+TVNylV9G5RUeRZ1JSpiyiAuU9+FWe1Lpq3XSbHxgk4NnhZ
	aD+7gMwpEiuEble/+BFiNzQ330Y8
X-Google-Smtp-Source: APXvYqxSBXWI8UMpDBjbp319iW55MPhJkeymXgFSnSKqdoxHEXbxQPm9uBjXoIZTzyJ/vamUNMjMhQ==
X-Received: by 2002:a0c:f685:: with SMTP id p5mr18766850qvn.44.1579815922502; 
	Thu, 23 Jan 2020 13:45:22 -0800 (PST)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	d25sm1706243qkk.77.2020.01.23.13.45.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 13:45:21 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 15:44:42 -0600
Message-Id: <20200123214443.1431756-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123214443.1431756-1-danismostlikely@gmail.com>
References: <20200123203037.693694-1-danismostlikely@gmail.com>
	<20200123214443.1431756-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] cmake: prefer CMAKE_BUILD_PARALLEL_LEVEL
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
X-List-Received-Date: Thu, 23 Jan 2020 21:45:22 -0000
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

cmake 3.12 introduced this environment variable. Prefer it to passing
PARALLEL_MAKE and PARALLEL_MAKEINST on the cmake command line, because
it gets passed to second stage cmake invocations while command-line
arguments do not (for example, multi-stage clang builds)

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/cmake.bbclass |  5 +++--
 meta/lib/oe/utils.py       | 11 +++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a046daa6ea..d91cf20130 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -63,8 +63,9 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
 EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 
-EXTRA_OECMAKE_BUILD_prepend_task-compile = "${PARALLEL_MAKE} "
-EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
+export CMAKE_BUILD_PARALLEL_LEVEL
+CMAKE_BUILD_PARALLEL_LEVEL_task-compile = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL_task-install = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 652b2be145..e350b05ddf 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -169,7 +169,7 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
-def parallel_make(d):
+def parallel_make(d, makeinst=False):
     """
     Return the integer value for the number of parallel threads to use when
     building, scraped out of PARALLEL_MAKE. If no parallelization option is
@@ -177,7 +177,10 @@ def parallel_make(d):
 
     e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
     """
-    pm = (d.getVar('PARALLEL_MAKE') or '').split()
+    if makeinst:
+        pm = (d.getVar('PARALLEL_MAKEINST') or '').split()
+    else:
+        pm = (d.getVar('PARALLEL_MAKE') or '').split()
     # look for '-j' and throw other options (e.g. '-l') away
     while pm:
         opt = pm.pop(0)
@@ -192,7 +195,7 @@ def parallel_make(d):
 
     return None
 
-def parallel_make_argument(d, fmt, limit=None):
+def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
     Helper utility to construct a parallel make argument from the number of
     parallel threads specified in PARALLEL_MAKE.
@@ -205,7 +208,7 @@ def parallel_make_argument(d, fmt, limit=None):
     e.g. if PARALLEL_MAKE = "-j 10", parallel_make_argument(d, "-n %d") will return
     "-n 10"
     """
-    v = parallel_make(d)
+    v = parallel_make(d, makeinst)
     if v:
         if limit:
             v = min(limit, v)
-- 
2.24.1


