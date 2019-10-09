Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 54C307F45C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 02:08:53 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id f16so780808qkl.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4npyyJnD7S0oV/WAF9zUlK8lZ8a0f9uiBUjrD0X2Fu0=;
	b=GYmbJaINwvaBl4Z04fGvXQvWkznPnb4u3T9NxV9vqnhdtP+yxugk2eVbvRa4QgkSU2
	XhjK7ZMBpoEg7kFrWWZa/se0vA5/2cYXaqmQKEVEkyt7zwtVoxILl0p9ROWRvd+EjUpr
	RSGANKgMb00APy4iISeN6QxrmhMKYVRk1qe5Xewu8OIOirTFvCfzuadDdv2BpjTilOlx
	NDXe9LWIntC9fohrKeUlfnxeHhD94TTNihU7m3ron7oIRg7MsWtTfJYDukMUxyA4Xf6Y
	f1WyIoGOMZKpRQJSz1LBaCorKhV0tE/kdPYXIzcmpwcVIzaqoQY/PV3PQtusTMuer8uG
	kUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4npyyJnD7S0oV/WAF9zUlK8lZ8a0f9uiBUjrD0X2Fu0=;
	b=pvobbkwUUG3XPadP4bGreiKj353YZNMvmjmKVPz/g3gF6x2JGAcIuQ+8GswzSlP5Rb
	Jb0Z88InlZark+vReJpVtwCUDK4VlShbu7sa8q0i8gGRVw5bNckk96VPDqfUw1f5Dh3b
	8tZzv98zN3QdwNA33pKz3kIi2C/dYqm5KjOFh+eP7Fdydu6OiIrCit1FFI0xMwu0bt9t
	FNEt861xhObHl8prg9wNr8kY0zYlwlLvzOn5jn3RSYLn3tPbv+TNEDGE5zR5M7tx4DFg
	ec8Ap8CyqneoHvPxlz7Q9jcs5pFpeSOJqoN3W5986+SmDhYKQuCQ/pPUHoqwu22baduD
	m8XQ==
X-Gm-Message-State: APjAAAVrID99sYy9vJQyUmIK7z8LwC9s7P9C+ix5z8rLLD8r4D21/nW6
	qHGSEy3Szbn+bL1H/Oh9DvdyumEynQA=
X-Google-Smtp-Source: APXvYqz+LeJh9j07GH+pnFJIxoSC95K0R3uYJ9m/KWp0PvKBHBGkrT33rLR882Pide3kqihnvtnTbQ==
X-Received: by 2002:ae9:f004:: with SMTP id l4mr1321701qkg.316.1570586933558; 
	Tue, 08 Oct 2019 19:08:53 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id r19sm342066qte.63.2019.10.08.19.08.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 19:08:53 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 22:08:48 -0400
Message-Id: <20191009020848.6499-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: andy.macleod@windriver.com
Subject: [PATCH] meta: simplify over descriptive descriptions in devtools
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
X-List-Received-Date: Wed, 09 Oct 2019 02:08:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix commandline -> command-line typo.
according to:
    https://en.wikipedia.org/wiki/Command-line_interface
    https://wiki.debian.org/Apt

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-devtools/apt/apt.inc     | 2 +-
 meta/recipes-devtools/cmake/cmake.inc | 4 +---
 meta/recipes-devtools/quilt/quilt.inc | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 6883ac865a..50c4d8484a 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Advanced front-end for dpkg"
-DESCRIPTION = "Provides commandline tools for searching and managing as well \
+DESCRIPTION = "Provides command-line tools for searching and managing as well \
 as querying information about packages as a low-level access to all features \
 of the libapt-pkg library."
 LICENSE = "GPLv2.0+"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 35d78eea17..67caa306df 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -5,9 +5,7 @@ SUMMARY = "Cross-platform, open-source make system"
 DESCRIPTION = "CMake is used to control the software compilation process \
 using simple platform and compiler independent configuration files. CMake \
 generates native makefiles and workspaces that can be used in the compiler \
-environment of your choice. CMake is quite sophisticated: it is possible to \
-support complex environments requiring system configuration, pre-processor \
-generation, code generation, and template instantiation."
+environment of your choice."
 HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 61e1c93605..d6d06c049c 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -1,8 +1,7 @@
 SUMMARY = "Tool for working with series of patches"
 DESCRIPTION = "Quilt is a tool to manage large sets of patches by keeping \
 track of the changes each patch makes. Patches can be applied, un-applied,\
-refreshed, etc. The key philosophical concept is that your primary output \
-is patches."
+refreshed, etc."
 HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
 LICENSE = "GPLv2"
-- 
2.20.1


