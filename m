Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002079"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478652706"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/37] parted: fix ptest RRECOMMENDS
Date: Mon,  2 Aug 2021 15:52:05 +0800
Message-Id: <09be83e7f575c0c271d76c6805f8f782701f48b3.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

The recipe was using =, which replaces the default RRECOMMENDS from
ptest.bbclass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cebcb4ae46b0860179edfe480e8e4d924f931436)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/parted/parted_3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index eea3d91d56..6f9f0a3106 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -51,7 +51,7 @@ do_install_ptest() {
 }
 
 RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup util-linux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-core dosfstools"
-RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
+RRECOMMENDS_${PN}-ptest += "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
         glibc-utils \
         locale-base-en-us \
-- 
2.31.1

