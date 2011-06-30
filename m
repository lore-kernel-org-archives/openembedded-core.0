Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCLD-0001Yu-LF
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:11:17 +0200
Received: by iym10 with SMTP id 10so1896727iym.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PvS55ZC3DsGsN++KMNz/Nk6VTVDKU7cbKqXCk7olxt0=;
	b=STu2CjkHVotHStdxHGR7UKdArhmlqNEVvfWGcgcljhrYMghuOr+yEQyWzk5/j/nkXn
	yp0txq8IPxN/vQmHkRvy4ssYNl7HBdbL9iBZ0n7AzMt/KORSSTS6x3C8sveR87CU5KoU
	B4Km1eMBQ0D4igsfW4RnILt9Uq1cl9hsx3VGo=
Received: by 10.42.97.136 with SMTP id o8mr1386279icn.222.1309421251991;
	Thu, 30 Jun 2011 01:07:31 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s2sm1093925ibe.1.2011.06.30.01.07.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 01:07:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:07:13 -0700
Message-Id: <807eda44b54f88c619302ec6f5f34b8a523e0613.1309420894.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
References: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309420894.git.raj.khem@gmail.com>
References: <cover.1309420894.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] uclibc_git.bb: Untether UCLIBC_HAS_FPU from UCLIBC_HAS_FLOATS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 08:11:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    1 +
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
new file mode 100644
index 0000000..da97d38
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
@@ -0,0 +1,29 @@
+From 06cdcd2a9dd6b46b7fbb5b3ae0a62bdb7ee6c402 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 27 Jun 2011 17:48:18 -0700
+Subject: [PATCH] Config.in.arch: Free UCLIBC_HAS_FPU setting from depending on UCLIBC_HAS_FLOATS
+
+UCLIBC_HAS_FLOATS and UCLIBC_HAS_FPU are denoting two different aspects.
+UCLIBC_HAS_FLOATS covers the floating point operations which has nothing
+to do if you have FPU or not.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extra/Configs/Config.in.arch |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
+index 5f7a2b0..c1ca390 100644
+--- a/extra/Configs/Config.in.arch
++++ b/extra/Configs/Config.in.arch
+@@ -133,7 +133,6 @@ config UCLIBC_HAS_FLOATS
+ 
+ config UCLIBC_HAS_FPU
+ 	bool "Target CPU has a floating point unit (FPU)"
+-	depends on UCLIBC_HAS_FLOATS
+ 	default y
+ 	help
+ 	  If your target CPU does not have a Floating Point Unit (FPU) or a
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 6445243..201ec93 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -29,5 +29,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://epoll-asm-fix.patch \
 	file://orign_path.patch \
 	file://rtld_no.patch \
+	file://0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



