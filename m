Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1098DC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504029"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504029"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298226"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 21/33] scripts/checklayer/common.py: Fixed a minor
 grammatical error
Date: Thu,  9 Dec 2021 09:29:20 +0800
Message-Id: 
 <e760a57cb326a5b645fdcf6f3247d8adec896d9a.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159422

From: Dhruva Gole <goledhruva@gmail.com>

Signed-off-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8ea17456ae5318ed7a3b4c8f75c8441456d8b979)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/checklayer/cases/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index b82304e361..4495f71b24 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -14,7 +14,7 @@ class CommonCheckLayer(OECheckLayerTestCase):
         # The top-level README file may have a suffix (like README.rst or README.txt).
         readme_files = glob.glob(os.path.join(self.tc.layer['path'], '[Rr][Ee][Aa][Dd][Mm][Ee]*'))
         self.assertTrue(len(readme_files) > 0,
-                        msg="Layer doesn't contains README file.")
+                        msg="Layer doesn't contain a README file.")
 
         # There might be more than one file matching the file pattern above
         # (for example, README.rst and README-COPYING.rst). The one with the shortest
-- 
2.33.1


