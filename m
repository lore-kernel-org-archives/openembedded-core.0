Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: olcZS6ziG0NrvWYDgYZfRdvl0622Y5ZKq50t5OXbLSdmPJNDY/KGKjxtbhYpoTO//OQApy8qD+
 lzD4KQGmxndQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752403"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:38 -0800
IronPort-SDR: vngvwv6zOxN5A/54pnB5lHFb3TSo8TFFIMkxJm+jH9dBn0EUaLA1/qJdcPC1mYiYwFei+HUoDE
 K12yRzO07c4w==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670785"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/19] meta/lib/oe/reproducible.py: gitsm:// works just as fine as git:// for timestamps
Date: Mon, 14 Dec 2020 11:35:10 +0800
Message-Id: <9010bd445740344a9a3c983e5767552eb684af12.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This in particular addresses vulkan-samples reproducibility which made me scratch my
head for a while.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a2936126f12eeacecced051fa339c32c1f16576)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 421bb12f54..0fb02ccdb0 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -47,7 +47,7 @@ def find_git_folder(d, sourcedir):
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-    if not "git://" in d.getVar('SRC_URI'):
+    if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar('SRC_URI'):
         return None
 
     gitpath = find_git_folder(d, sourcedir)
-- 
2.29.2

