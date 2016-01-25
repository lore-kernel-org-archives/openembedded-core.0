Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF4A76FFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:47 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id e32so116245492qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OalM4FZAC5e5HxigmJoFBSQCYJe/E40S/W+e+OtFN28=;
	b=ZXtC2ODYp2OWDCs9MUlb6HvZ/aQUEQH7mZDo+2w6uu85LXBgCw8z+Up0tMhOoGRw6Z
	ufX8W7yk46VOjJdcEWFmvBA+192sSkLPCGrepYzfG5K1X0nqMQ5rD+kbHwy3L3J9Ftwi
	W2I7EBMkCtQcg8SR/9Mcju4YgbH8KkKwLqerZpKprq1MNaLF3jJqYGR5x9jgXOgKpe4k
	WExzpAmED3ss6/UUQAd15WwKZ23QmY9Dfbi+eWx/QWy8xXeEA2a8mAjrokxoRu+0Cz+W
	U+2yWX/pgyPDB4NbZOYYMrCujvVxbs5vvTJMPA+yOD2LBlL1qxf+yUqdPYECdIST/u2A
	OfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OalM4FZAC5e5HxigmJoFBSQCYJe/E40S/W+e+OtFN28=;
	b=GM+WHfiaFYrGsxhV++j8qXr+gynYYXgo1LzPFFwqxC7yl89WN6Ec9NTlfyFbMgln6f
	PpT1f/5XeHCf7eB0H6fd+SE7HEB86sGa/05NNUo9Y6YTFuCPZpiVCvuUjoBb96gp3uk4
	u4y0QtbMvYHQJ3rLut1hnO/pRGTnbd9rqDxmmBKjGgUYKGbHUcpQgUQUR2lJ5DOqq/AI
	9ttJ4g0t3Sa13vi8KkN1AuPz5KCPkdGoZA47sE4gZWOUVRM+HtIshqaQ33hCyfQCz6x3
	vtHEZTk6lhUcUGgQlpPmbRZN3eof3ariO7ynwWbztr6hyG5dEYks+t1vVoRzYUIKTcXv
	t5CQ==
X-Gm-Message-State: AG10YOQpIe8K72zU1GsYqAo3QrIWiM5wU6B2le//mQ6XHWn0nCn08wUtzJvM4RRMxlM1Iw==
X-Received: by 10.140.251.11 with SMTP id w11mr23145963qhc.7.1453746768315;
	Mon, 25 Jan 2016 10:32:48 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:27 +0000
Message-Id: <26ccf038c7ba8c9f3f1baa3e07bb58fcaa8dbef2.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 11/11] libdrm: Refresh patch to match upstream submission
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:48 -0000

The version submitted upstream has been updated to this one
after feedback

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tests-kms-steal-crtc-Include-sys-select.h.patch | 83 +++++++++++++++++++---
 1 file changed, 73 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch b/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
index c18228e..e4ecbac 100644
--- a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
+++ b/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-sys-select.h.patch
@@ -1,33 +1,96 @@
-From 46fb5516fb0ab17bcf46a0306a11e8966bb36e14 Mon Sep 17 00:00:00 2001
+From fb53d7a1be116a172b56625f290fcf88b6d158ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Dec 2015 22:17:21 +0000
-Subject: [PATCH] tests/kms-steal-crtc: Include sys/select.h
+Date: Wed, 20 Jan 2016 05:23:00 +0000
+Subject: [PATCH] tests: Include sys/select.h
 
-Fixes errors e.g.
+Used in compliance with POSIX 2001/2008
 
+Fixes errors e.g.
 error: implicit declaration of function 'select'
 
-and missing definitions of FD_* defines
+and helps with missing definitions of FD_* defines
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
 ---
 Upstream-Status: Submitted
 
- tests/kms/kms-steal-crtc.c | 1 +
- 1 file changed, 1 insertion(+)
+ configure.ac                     | 2 +-
+ tests/kms/kms-steal-crtc.c       | 3 +++
+ tests/kms/kms-universal-planes.c | 3 +++
+ tests/modetest/modetest.c        | 3 +++
+ tests/vbltest/vbltest.c          | 3 +++
+ 5 files changed, 13 insertions(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index 057a846..258e2f6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -53,7 +53,7 @@ AC_USE_SYSTEM_EXTENSIONS
+ AC_SYS_LARGEFILE
+ AC_FUNC_ALLOCA
+ 
+-AC_CHECK_HEADERS([sys/mkdev.h sys/sysctl.h])
++AC_CHECK_HEADERS([sys/mkdev.h sys/sysctl.h sys/select.h])
+ 
+ # Initialize libtool
+ LT_PREREQ([2.2])
 diff --git a/tests/kms/kms-steal-crtc.c b/tests/kms/kms-steal-crtc.c
-index 2f7f327..24d70ab 100644
+index 2f7f327..497772e 100644
 --- a/tests/kms/kms-steal-crtc.c
 +++ b/tests/kms/kms-steal-crtc.c
-@@ -31,6 +31,7 @@
+@@ -31,6 +31,9 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#ifdef HAVE_SYS_SELECT_H
++#include <sys/select.h>
++#endif
+ 
+ #include <drm_fourcc.h>
+ 
+diff --git a/tests/kms/kms-universal-planes.c b/tests/kms/kms-universal-planes.c
+index 9151231..d8e5fc4 100644
+--- a/tests/kms/kms-universal-planes.c
++++ b/tests/kms/kms-universal-planes.c
+@@ -32,6 +32,9 @@
  #include <stdio.h>
  #include <string.h>
  #include <unistd.h>
++#ifdef HAVE_SYS_SELECT_H
 +#include <sys/select.h>
++#endif
  
  #include <drm_fourcc.h>
+ #include "xf86drm.h"
+diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
+index 22e3e81..d5a4062 100644
+--- a/tests/modetest/modetest.c
++++ b/tests/modetest/modetest.c
+@@ -55,6 +55,9 @@
+ #include <errno.h>
+ #include <sys/poll.h>
+ #include <sys/time.h>
++#ifdef HAVE_SYS_SELECT_H
++#include <sys/select.h>
++#endif
+ 
+ #include "xf86drm.h"
+ #include "xf86drmMode.h"
+diff --git a/tests/vbltest/vbltest.c b/tests/vbltest/vbltest.c
+index 1833321..086407e 100644
+--- a/tests/vbltest/vbltest.c
++++ b/tests/vbltest/vbltest.c
+@@ -37,6 +37,9 @@
+ #include <errno.h>
+ #include <sys/poll.h>
+ #include <sys/time.h>
++#ifdef HAVE_SYS_SELECT_H
++#include <sys/select.h>
++#endif
  
+ #include "xf86drm.h"
+ #include "xf86drmMode.h"
 -- 
-2.6.4
+2.7.0
 
-- 
2.7.0


