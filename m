Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Sep 2016 16:40:37 UTC
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 4584873695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:40:37 +0000 (UTC)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
	with SMTPS id 1473870330705129.1056351461001;
	Wed, 14 Sep 2016 09:25:30 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 11:25:19 -0500
Message-Id: <20160914162519.16212-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] e2fsprogs: configure with enable-symlink
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
X-List-Received-Date: Wed, 14 Sep 2016 16:40:39 -0000

The /sbin/fsck.ext[234] programs currently installed are all
the same binary as e2fsck.  The package provides an option to
have fsck.ext[234] be symlinked to /sbin/e2fsck instead.  This
reduces the uncompressed footprint of this package by ~1MB on ARM.

Add --enable-symlink-install to EXTRA_OECONF to enable.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index f4855bc..d6db612 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -18,7 +18,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
-                --disable-libblkid --enable-verbose-makecmds"
+                --disable-libblkid --enable-verbose-makecmds \
+                --enable-symlink-install"
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
-- 
2.9.0



