Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA88C7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b3so4157177plr.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L/Tkp6ylzGZyx508umRgUCdJYzYlHK3Hc48IY2AqoDQ=;
	b=EnLtbfCgBfLyWYHR8tti3O0TKt3vacna9z6t+e+SLsSWoA6ERfqF5dE4x18WxtR1Ob
	0kBSw6jqU9f36q8azsvop5J4iCJ4mCL2DLleCsTY4S3yoKcMjrjV9hY1nfuSPtDtOmX3
	e9aXme0nA5TGR4Y0WU2FzMl4y+d/qrLdrGsj+29Ijnw2i7dQ+YkxKCsqEEOXyYsIMvbl
	rM2QmtyZDMRlB2+ChHAplrbLD69FP+9aUncetZlVrjw76aL/d4Lr94a5LIkFLCIjQU5w
	llukb63tB6L5p65Xrn+hk2kHgIaHwS3bJANw4p389pEJI/J2pUKN3rzQKYQAuCx6GMcd
	bDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L/Tkp6ylzGZyx508umRgUCdJYzYlHK3Hc48IY2AqoDQ=;
	b=EtF/4cKq2d0AERSNQekDSxROMt7jgP13bRy9I9qAzuDkXMZ+SEmZ25DFS7qrBTgRD3
	WCwOz8BJmSAd0p9+uRjzfmucT7wM/HsJXMMgUI5su6V4bR2dbuUoIwT9wNm4F/+Xw11X
	dXAYDtL2NJ2cnLop5UQQNJrPi127M1CdAF+ZdsBlQh7bVeGk7x23PhVdxFcXorsIJ+9M
	CuhioIhMO2HoTUlubcjHNyA/Ws2BphGVH4sveiFLQ/FOFRqaRjAxxCpn9PHrbi9C+gb1
	zVlDrEwg72dzXDYBrEn6oJG3H4yt7xcZE1F/sFw44rXBdN/XqW7tc6EAOtPcvVy0gYd7
	43PA==
X-Gm-Message-State: APjAAAX8CigG6VxK4D+Nvhr9XdpJuYgSFxT+zKpehcuwyxAxqUVK3rj2
	lTEgXSrn1Nl7U3rP9sJE0UCuJotJ
X-Google-Smtp-Source: APXvYqzQbx6kReDezv05ngNULiCjwIRhszrimZaTUOMj7PIL6/6rFcfG1fk5pWBr73ex6MwKSkoryg==
X-Received: by 2002:a17:902:7b97:: with SMTP id
	w23mr19706733pll.335.1556983657923; 
	Sat, 04 May 2019 08:27:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:48 -0700
Message-Id: <c0f789569813403fa61feded6a4530ff0cf3eb8c.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 12/43] python3: add another multilib fix
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
X-List-Received-Date: Sat, 04 May 2019 15:27:37 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ig.py-fix-another-place-where-lib-is-hard.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.2.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
new file mode 100644
index 0000000..b975836
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
@@ -0,0 +1,31 @@
+From a21f4f8fa5e5c0601898740b4ac08ec84f41e190 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Apr 2019 17:11:06 +0200
+Subject: [PATCH] Lib/sysconfig.py: fix another place where 'lib' is hardcoded
+ as the library path
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Lib/sysconfig.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index d15cec8..87fa5e6 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -20,10 +20,10 @@ __all__ = [
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'stdlib': '{LIBDEST}',
++        'platstdlib': '{LIBDEST}',
++        'purelib': '{LIBDEST}/site-packages',
++        'platlib': '{LIBDEST}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+         'platinclude':
diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 6464aaf..a1d7ace 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://ptesthack.patch \
+           file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


