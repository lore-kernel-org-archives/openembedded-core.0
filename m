Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632F5C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=h8r560Mr;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369057; x=1670905057;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZXNAW1b3qBW5yyEONBX93FizJNvD+5kKRD/bUBjF/y0=;
  b=h8r560Mr3ejPbbzoosoRUJiH2BUfVDfRkGuB11hIRvA5Cbd5HEGaPxX9
   LYbIOPWeodXQpNkScNVykL2oX+e11OH/vHPHBwXnL3sKZmN5FAhK+wV62
   WfLJEEoixAnpYWZEMsE9sWtQ209QlE8pW9Yn4UahSBfyZw1Feg/zuA54n
   27JAJajVnOA7c10TneUqvvXsfOB0ADGNw8zP8uziLVT/TSzSm5mz4icA8
   DwOLYwh8MhOyhwLrWNHweQoGRN3vNcHUgrwsmGkozNbozlWTK1kc6HD7K
   K/ih0x5HhRDikLUiWlrfA6XTihWaebElLZnILEx5es9ljx2UQFr8HPH2P
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602219"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602219"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589273"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/20] scripts/checklayer/common.py: Fixed a minor
 grammatical error
Date: Mon, 13 Dec 2021 12:17:05 +0800
Message-Id: 
 <f4b21b2de13834b8308ef5a247cd632ef67dc591.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159596

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


