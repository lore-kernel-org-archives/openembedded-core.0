Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BCF6976DE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:01:30 +0000 (UTC)
Received: by wmww144 with SMTP id w144so41390891wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cn2HjIc1dWOHVYXr0whzYF1kLMJJ3CnFt4XJD+Clm7Y=;
	b=BVFvYB61Wfeu9kMIzwl4lRULZQ84PaOSPbzOQKjj44CwCsVWi3qOK2bO4AsYuxw+W9
	254ivhK6vA+YiOa84ggDxCbZ3tv49Hs80wttWgZKIsG1kTjocDuEmBYFgeYY1eX4jX6t
	pI14r9jEy34WzUuOLHXYKSlbYHgrX7ScWF7Tjom0+NWYyWEZHplwvdic+NiOVEfAy/c+
	FT8bnzGVsJkiYZ2Iv2bmPNH6VIeFzuRdUxY0/0PF9ft1AjL+YXauu3waaT5UU6c66cSB
	SEAkLZ4oLxE1euf47CNfV+bOa5wRTQZvHy9eCmd5VhFOSq2bjKLlOpulkdV16NwDRUn6
	OtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cn2HjIc1dWOHVYXr0whzYF1kLMJJ3CnFt4XJD+Clm7Y=;
	b=RD0ml5k65wD0C9v1KrBbK1Tp1SKnk/9pX8i+tYCb928XGvbrq1j16wWM3hl5JQRz7F
	COOE2VTzVpZt07Ib+1wIZnZGtATZcTYphnP4kGK/gT5RKGwsa9fBQ7ldp5HB17QWraFn
	7LczgaAwo34qb6WOJEQgZv/u9ORfYqsrI0/Z+qh078G6PxcYuiM4vS/Pz6PpYD5SptHf
	1nm13R/JVUQq3KYw/C4a+PJeVoRCsm1wn/Qn0xoTlPqkS+3ahkPN6eHAjJYZcETq68sA
	H9Fkq7AANF8Ts+oSaBb84cgJFg6308sr6bCILA3FcOSEIURWcAOI7NPjaMl10iA3sSE6
	/+9w==
X-Gm-Message-State: ALoCoQlAzpTL70Z0NNtAD0R0xY8+UD48WKNse6u127NHIM2Y9n/freVTfgj8qyDjcMtkbGdp+HY5
X-Received: by 10.28.23.141 with SMTP id 135mr11101253wmx.84.1447243290621;
	Wed, 11 Nov 2015 04:01:30 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v192sm8131895wmv.5.2015.11.11.04.01.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 04:01:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 11:53:11 +0000
Message-Id: <1447242791-5023-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447242791-5023-1-git-send-email-ross.burton@intel.com>
References: <1447242791-5023-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] meta: add some missing Upstream-Status tags to patches
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
X-List-Received-Date: Wed, 11 Nov 2015 12:01:34 -0000

Where Signed-off-by statements have been added they were sourced from the
original commit where the author claims creation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch                | 1 +
 meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch            | 3 +++
 meta/recipes-extended/watchdog/watchdog/watchdog-init.patch            | 3 +++
 .../0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch    | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch b/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
index 9c72a1b..6fbc636 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
@@ -4,6 +4,7 @@ aliases. As a workaround we use "sunprc" instead of "portmapper"
 ported from alpine linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 
 Index: rpcbind-0.2.2/src/rpcbind.c
 ===================================================================
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
index 36f2968..e68ad54 100644
--- a/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
@@ -1,3 +1,6 @@
+Signed-off-by: Diego Rondini <diego.ml@zoho.com>
+Upstream-Status: Inappropriate
+
 --- watchdog-5.13.orig/watchdog.conf	2013-02-01 12:15:44.000000000 +0100
 +++ watchdog-5.13/watchdog.conf	2014-11-13 10:59:43.233943000 +0100
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch b/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
index 0fa8ee9..b2765f1 100644
--- a/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
@@ -1,3 +1,6 @@
+Signed-off-by: Diego Rondini <diego.ml@zoho.com>
+Upstream-Status: Inappropriate
+
 --- watchdog-5.13.orig/redhat/watchdog.init	2014-11-12 17:18:39.125943000 +0100
 +++ watchdog-5.13/redhat/watchdog.init	2014-11-12 18:27:36.189943000 +0100
 @@ -7,7 +7,7 @@
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch b/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
index c96af12..09054cb 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
@@ -4,6 +4,9 @@ Date: Wed, 9 Jul 2014 14:30:33 +0200
 Subject: [PATCH 2/9] Correctly implement with AC_WITH(glut) so that
  --without-glut works.
 
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Submitted (https://patchwork.freedesktop.org/patch/64417/)
+
 ---
  configure.ac | 26 +++++++++++++++-----------
  1 file changed, 15 insertions(+), 11 deletions(-)
-- 
2.1.4


