Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4D95A73176
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:05 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y7so4253406pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=81YxJ2PmsriUbgMvKsVxuj0JbzfYL2Y3a3ZxRWEDZ4Y=;
	b=D91tbXt30Vw9zg7mEO89x4BDDWCIn4qSDXZx3r57IMG8fsQRgkyzDR8f8a3o5f7EY1
	yLgfc6ZyzCVFfaMe/Tl47OFv+sfjIKS7cJ9QfCgkSqUw4+Cs1QuV4N/vDo8cm5iTVKLp
	cEtOm5FvI4D483PyGi6LDNOy/dLiEqiIc20PUSleySfzl4HiYmRyufbSqDcw03bTklBe
	WzliEMDsJ4YICdTUUUcxvvTsMWSJkxmFIP2TMloRUMYoDj4FqMAMcasH1U1wdeKZlEBi
	0sdPMG8aPka3ZuCPrhrq/+lHNqL8oUKNECEEbMLDqJ9ShBSDwWiS9gBLDfyZ3t3xg2MN
	ObVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=81YxJ2PmsriUbgMvKsVxuj0JbzfYL2Y3a3ZxRWEDZ4Y=;
	b=gTf1kLdCcJ112tJbvSJWOTP3kbB1VnJaeF3BWIytradymJL4oS03kxk4towJH0Bv9e
	2iWXx7AOEKTWbl143esItJhwUY2zJnfeSVJ0xal6tBdN19M0jp80Zb0dk977RRZzBE1d
	/c60IPurWn3yp3+nX/r1pdePkMaCVIF9trRsTWUHYnKEh1X0BchW5g/zPAtdQCk7ZMrS
	v6I9QL3vb+4rbrX7dYOgFu9yGQyHHw+m2quOYp4gp4mJ30bj+TyeVuPtHQ1C+dXIWFTa
	bNszkFw2at/NC+vrk8R4OE+GElyJqgPHFlzFvhRYjEw99vj7nTdKtULoBCY7AQciqoXz
	RcNA==
X-Gm-Message-State: AOPr4FUUmhUsmmi0BNgBrn6aiAV3oSLaD97UjOAMGvIoFG4VuD04Zz0y7TFkn1IBnxnSUg==
X-Received: by 10.98.79.213 with SMTP id f82mr6682184pfj.65.1462988166287;
	Wed, 11 May 2016 10:36:06 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:15 -0700
Message-Id: <f43026942116101aca5ddb8a08c4b1734e832aaf.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH 12/42] pkgconfig: Fix build with gcc-6 and upgrade to 0.29.1
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
X-List-Received-Date: Wed, 11 May 2016 17:36:05 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

glib patch is backported from glib-2.0 upstream
eventually we will throw it away once pkgconfig
moves to newer glib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Move-warning-pragma-outside-of-function.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
new file mode 100644
index 0000000..14c8293
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
@@ -0,0 +1,39 @@
+From 946d36266d8a30f04fe34d3183bf4929141934d2 Mon Sep 17 00:00:00 2001
+From: coypu <coypu@sdf.org>
+Date: Wed, 2 Mar 2016 19:38:48 +0200
+Subject: [PATCH] gdate: Move warning pragma outside of function
+
+Commit 0817af40e8c74c721c30f6ef482b1f53d12044c7 breaks the build on
+older versions of GCC, which don't allow pragma inside functions.
+
+https://bugzilla.gnome.org/761550
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ glib/glib/gdate.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/glib/glib/gdate.c b/glib/glib/gdate.c
+index 1978cf7..20e6c4a 100644
+--- a/glib/glib/gdate.c
++++ b/glib/glib/gdate.c
+@@ -2439,6 +2439,9 @@ win32_strftime_helper (const GDate     *d,
+  *
+  * Returns: number of characters written to the buffer, or 0 the buffer was too small
+  */
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
++
+ gsize     
+ g_date_strftime (gchar       *s, 
+                  gsize        slen, 
+@@ -2549,3 +2552,5 @@ g_date_strftime (gchar       *s,
+   return retval;
+ #endif
+ }
++
++#pragma GCC diagnostic pop
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index d7634e3..86503b5 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -18,6 +18,7 @@ PV = "0.29.1+git${SRCPV}"
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
+           file://0001-gdate-Move-warning-pragma-outside-of-function.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.2


