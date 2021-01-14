Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CGaz41PaGjM+fpdRKcJ7mNX1IdNEBywZfay8EIvnCQie6JYOEk9CNudbFnGhpepUI7+Df6VwGg
 5KddFOoLUSAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062659"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062659"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:04 -0800
IronPort-SDR: Q0UAgOEVimHO/wPybbrNoSKxit/M2Plgrxm2neyrQGz/hFqEPaNsb5944bPF5KwmQuu24FT1xF
 uikZmfbvXk7w==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986572"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:03 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/14] pseudo: Add lchmod wrapper
Date: Fri, 15 Jan 2021 00:09:41 +0800
Message-Id: <cac0ad6f82c0f10b9ad6a656ef728e894096049a.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

New versions of glibc have an lchmod function so we need to wrap it.

Identified through a reproducibility issue in initramfs-base where
/dev/console created by mknod from coreutils changed permissions
depending on the host distro (mknod used the gnulib wrapper on most
hosts but newer ones used the libc call).

[YOCTO #14162]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20a645664977530e602e1ac97e8dc0962e730e6c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 78c6b01f09..7fa11a54e7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "6fd57da7b1de1a2b6cf530e336d58bb5f8bdd015"
+SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

