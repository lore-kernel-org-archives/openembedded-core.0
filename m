Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E326D73218
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:20:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2016 07:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,416,1449561600"; d="scan'208";a="649015128"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2016 07:20:08 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 17:20:05 +0200
Message-Id: <1454944806-27252-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454944806-27252-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454944806-27252-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] oe/gpg_sign: fix incorrect variable name
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
X-List-Received-Date: Mon, 08 Feb 2016 15:20:08 -0000

Prevents crash in signing if GPG_PATH is defined.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 55abad8..821787e 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -58,7 +58,7 @@ class LocalSigner(object):
                   "--passphrase-file '%s' -u '%s' " % \
                   (self.gpg_bin, self.passphrase_file, self.keyid)
         if self.gpg_path:
-            gpg_cmd += "--homedir %s " % self.gpg_path
+            cmd += "--homedir %s " % self.gpg_path
         cmd += input_file
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
-- 
2.6.2


