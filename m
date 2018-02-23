Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id E0F0C77CF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 10:56:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2018 02:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,382,1515484800"; d="scan'208";a="206452949"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.74.194])
	by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2018 02:56:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 18:55:59 +0800
Message-Id: <1519383359-1935-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] buildhistory-diff: honour report_all flag
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 10:56:07 -0000

Make sure that we're passing a bool value. Without this, buildhistory
shows all the output for all the keys/fields when it shouldn't be by
default.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/buildhistory-diff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 2797407..70805b0 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -38,7 +38,7 @@ def get_args_parser():
     parser.add_argument('-a', '--report-all',
                         action='store_true',
                         dest='report_all',
-                        default='False',
+                        default=False,
                         help="Report all changes, not just the default significant ones")
     parser.add_argument('-s', '---signatures',
                         action='store_true',
-- 
2.7.4


