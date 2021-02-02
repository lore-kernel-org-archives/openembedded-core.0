Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.48154.1612244094073717358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pFBJIBYCWQKgqZqdlx+JQ4QnhHt9nVXFyguSi4yr5aUWWiGC/8FPlfNjLrF64YiJTULXyn4WGH
 CYYiKaZ5bbAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876971"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:41 -0800
IronPort-SDR: BYuX2KwFtGXsWUA8loQkofQ9Ap0Mz00+Jw+XgwBe+a6i0ATRdY8InfUuSVzyc/dPebW6I06UYL
 MYBfyEq08Dmg==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370361065"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:40 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/25] ovmf-shell-image: image is only buildable on x86-64
Date: Tue,  2 Feb 2021 13:34:07 +0800
Message-Id: <8160c662722afd945b371c9840198498ceea4c38.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This image is only buildable for x86-64, so add a COMPATIBLE assignment
to ensure it isn't attempted on others.

(From OE-Core rev: bdd8208675c8a0c0232c678804a8b62cd74f1d48)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db87aab8e219d2520dcd8d15da89110aadf3d41e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/ovmf/ovmf-shell-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-core/ovmf/ovmf-shell-image.bb
index 0d2b8bf52f..fd4fb5b732 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "boot image with UEFI shell and tools"
+COMPATIBLE_HOST_class-target='(i.86|x86_64).*'
 
 # For this image recipe, only the wic format with a
 # single vfat partition makes sense. Because we have no
-- 
2.29.2

