Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 78zQg9z9YNfKqoBe1jpYRglok+pixfS3NBCRjl9R08qV96OH7ZRBKHhKbqE4DrCK1cBQ4wuo2P
 pFLx91lJCnVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876912"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876912"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:31 -0800
IronPort-SDR: 7oPqFmLVbN07AX2Y/zye3TbyhII/FwJJtF472KRgg8m0Fzl5n/7Slq9HNJ81B1LnV7jXFRiW0w
 zeNEda6qHw5Q==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360959"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:30 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/25] pseudo: Update to include passwd and file renaming fixes
Date: Tue,  2 Feb 2021 13:33:58 +0800
Message-Id: <0fc140e6aeba27afc5bd7c4e8d486d73fa6e3f2e.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:
  pseudo_client: Ensure renames update open fd file paths
  pseudo_client.c: Rebuild passwd paths after chroot

which should fix issues seen in apt package index creation, new
binutils and other autobuilder race issues in pseudo amongst other
issues.

(From OE-Core rev: 44d11b56001f40622c055069b0901cc4ae15c76c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1caf4f305b2f96eb73c9eaba6a2f0bf2158d5be)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 29fa9152e2..0ba7b50355 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
+SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

