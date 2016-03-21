Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 40C4D73193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122222"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:08 +1300
Message-Id: <407626bac78aa11a3541c26b703605df53825109.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 9/9] oe-publish-sdk: fix remote publishing
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:43 -0000

A typo in the command prevented the last part of the publish from
succeeding.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-publish-sdk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 5dbd1e5..1729a0d 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -115,7 +115,7 @@ def publish(args):
     if not is_remote:
         cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir-p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.5.5


