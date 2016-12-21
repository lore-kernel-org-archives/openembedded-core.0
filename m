Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1EF56FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:17:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBL6HGbD008383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:17:16 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:17:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 22:17:11 -0800
Message-ID: <60279392c49b7453f761c057bdd0ca19cbe037d2.1482300982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1482300982.git.liezhi.yang@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] guile: 2.0.12 -> 2.0.13
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
X-List-Received-Date: Wed, 21 Dec 2016 06:17:15 -0000
Content-Type: text/plain

Remove 0002-Recognize-nios2-as-compilation-target.patch which is already
in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...002-Recognize-nios2-as-compilation-target.patch | 32 ----------------------
 .../guile/{guile_2.0.12.bb => guile_2.0.13.bb}     |  5 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
 rename meta/recipes-devtools/guile/{guile_2.0.12.bb => guile_2.0.13.bb} (95%)

diff --git a/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch b/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
deleted file mode 100644
index 8e847477043..00000000000
--- a/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 76155065c70b5ab65c6c805423183b360141db84 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Thu, 28 Jan 2016 04:46:23 +0100
-Subject: [PATCH] Recognize nios2 as compilation target
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Submitted [ http://debbugs.gnu.org/cgi/bugreport.cgi?bug=22480 ]
----
- module/system/base/target.scm | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/module/system/base/target.scm b/module/system/base/target.scm
---- a/module/system/base/target.scm
-+++ b/module/system/base/target.scm
-@@ -65,7 +65,7 @@
-       (cond ((string-match "^i[0-9]86$" cpu)
-              (endianness little))
-             ((member cpu '("x86_64" "ia64"
--                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "sh4"))
-+                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "sh4" "nios2"))
-              (endianness little))
-             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
-                            "mips" "mips64" "m68k" "s390x"))
-@@ -108,7 +108,7 @@
- 
-           ((string-match "64$" cpu) 8)
-           ((string-match "64_?[lbe][lbe]$" cpu) 8)
--          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "m68k" "sh4")) 4)
-+          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "m68k" "sh4" "nios2")) 4)
-           ((member cpu '("s390x")) 8)
-           ((string-match "^arm.*" cpu) 4)
-           (else (error "unknown CPU word size" cpu)))))
diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb b/meta/recipes-devtools/guile/guile_2.0.13.bb
similarity index 95%
rename from meta/recipes-devtools/guile/guile_2.0.12.bb
rename to meta/recipes-devtools/guile/guile_2.0.13.bb
index d2fe511ae40..dd38b479931 100644
--- a/meta/recipes-devtools/guile/guile_2.0.12.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.13.bb
@@ -22,11 +22,10 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://arm_aarch64.patch \
            file://workaround-ice-ssa-corruption.patch \
            file://libguile-Makefile.am-hook.patch \
-           file://0002-Recognize-nios2-as-compilation-target.patch \
            "
 
-SRC_URI[md5sum] = "081fdf80cd3a76f260a2a0d87f773d6b"
-SRC_URI[sha256sum] = "de8187736f9b260f2fa776ed39b52cb74dd389ccf7039c042f0606270196b7e9"
+SRC_URI[md5sum] = "d50bbb19672b72aa1e1c96e8f024bf00"
+SRC_URI[sha256sum] = "3744f2addc282a0de627aaef048f062982b44564d54ac31ff5217972529ed88b"
 
 inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
-- 
2.11.0.rc2.dirty


