Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bcZR7SbHriOGxF4NEKuU6FFj+oahOeQZVu588LVr4YHL3Ax4MbfCcbAA6gjYlmnXrqdapFw9gZ
 YunwXdgtHpdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752374"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:32 -0800
IronPort-SDR: L2soPqU83tFGd3PwlLG5HOYv0M5OgfU2IrTOSO1mIxn+1KqqVGvg7gKcLtKiFnerFH12oBBMPt
 ERl1tWNPgmZw==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670768"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/19] image_types: remove obsolete tar comment
Date: Mon, 14 Dec 2020 11:35:06 +0800
Message-Id: <22c7bbdaecd9eea52bf919e363ee68ce8256bdbd.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

We now depend on tar 1.28, so talking about older tar versions is just
confusing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f19e43dec63a86c200e04ba14393583588550380)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image_types.bbclass | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9a508a911f..286009057e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -108,16 +108,6 @@ IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4"
 
-# By default, tar from the host is used, which can be quite old. If
-# you need special parameters (like --xattrs) which are only supported
-# by GNU tar upstream >= 1.27, then override that default:
-# IMAGE_CMD_TAR = "tar --xattrs --xattrs-include=*"
-# do_image_tar[depends] += "tar-replacement-native:do_populate_sysroot"
-# EXTRANATIVEPATH += "tar-native"
-#
-# The GNU documentation does not specify whether --xattrs-include is necessary.
-# In practice, it turned out to be not needed when creating archives and
-# required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
 IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
-- 
2.29.2

