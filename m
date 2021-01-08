Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: H3FMkvAZDHx2apKOpyz35j8v3xnpzIgCj8vJkVKRn6JbM7JiGIegRzLPKq9uKUbqbIiNcSXzPT
 6vZfUJIEolfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613635"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613635"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:25 -0800
IronPort-SDR: P7MqfzQcjXMwAjBYQG+QeIIz8h8G1XM+akmU5mUt+fU1Vg3nnWw+mJcWa6IV78nZLzhLE5w9oa
 jWo011HCJp+w==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209355"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/30] devtool: gitsm:// should be handled same as git:// in upgrades
Date: Fri,  8 Jan 2021 12:17:47 +0800
Message-Id: <086584d5e60bc7daec914ab4384fdda776f27103.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7076f1742bb83e76aa4e90aad861546536166cf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0c1de8cdc7..5a057e95f5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -178,7 +178,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
     uri, rev = _get_uri(crd)
     if srcrev:
         rev = srcrev
-    if uri.startswith('git://'):
+    if uri.startswith('git://') or uri.startswith('gitsm://'):
         __run('git fetch')
         __run('git checkout %s' % rev)
         __run('git tag -f devtool-base-new')
@@ -270,7 +270,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             else:
                 logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
         if not skiptag:
-            if uri.startswith('git://'):
+            if uri.startswith('git://') or uri.startswith('gitsm://'):
                 suffix = 'new'
             else:
                 suffix = newpv
-- 
2.29.2

