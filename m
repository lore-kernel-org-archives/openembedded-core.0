Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /dofh9DqezHb2tfJJTXkQUkxQP6yjLkjjgeRimzW+VDzyJJq3U+FS9sWYeplOYaBRl7NtAn8Xh
 4Ubwsb0jVo8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049294"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049294"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:44 -0800
IronPort-SDR: +zV6pQyfqKxCtT1kYCZp11cAAXDgtn0au6LBcAyXk7CPatW8AotebyOec6eo0q0hlyvvvseCGv
 yCpYCEZ8tOGA==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301823"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:43 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/30] pseudo: Update for rename and faccessat fixes
Date: Tue, 23 Feb 2021 00:00:07 +0800
Message-Id: <79aba3fdce70baa2456de90ba407ce86d0f5e0f0.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:

  ports/rename/renameat: Avoid race when renaming files
  ports/unix: Add faccessat and faccessat2
  ports/access.c: Use EACCES, not EPERM

which includes a fix for rename race issues causing pseudo aborts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 330c232e4f756296331f9026e91ac26fd45f0315)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0072e0558b..4287cfcf93 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad"
+SRCREV = "d03de55845edf68908879db841834584d4724c43"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

