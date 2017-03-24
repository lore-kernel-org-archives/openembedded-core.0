Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62A7572F4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:55:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2O8tcwf009784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:55:38 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 01:55:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 01:55:32 -0700
Message-ID: <de7ddacb8dd4f72739dd46ce3aee5b610de8b430.1490345691.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1490345691.git.liezhi.yang@windriver.com>
References: <cover.1490345691.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] scripts/wic: fix typo
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
X-List-Received-Date: Fri, 24 Mar 2017 08:55:38 -0000
Content-Type: text/plain

roofs -> rootfs

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/wic | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 8e9c05c..a5f2dbf 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -146,7 +146,7 @@ def wic_create_subcommand(args, usage_str):
         raise WicError("Wrong number of arguments, exiting")
 
     if options.build_rootfs and not bitbake_main:
-        raise WicError("Can't build roofs as bitbake is not in the $PATH")
+        raise WicError("Can't build rootfs as bitbake is not in the $PATH")
 
     if not options.image_name:
         missed = []
@@ -223,7 +223,7 @@ def wic_create_subcommand(args, usage_str):
         kernel_dir = options.kernel_dir
         native_sysroot = options.native_sysroot
         if rootfs_dir and not os.path.isdir(rootfs_dir):
-            raise WicError("--roofs-dir (-r) not found, exiting")
+            raise WicError("--rootfs-dir (-r) not found, exiting")
         if not os.path.isdir(bootimg_dir):
             raise WicError("--bootimg-dir (-b) not found, exiting")
         if not os.path.isdir(kernel_dir):
-- 
2.9.0


