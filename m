Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1TRlGp-0008IP-0r
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 16:52:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Oct 2012 07:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="211222132"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2012 07:37:47 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.54])
	by linux.intel.com (Postfix) with ESMTP id B1A052C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 07:37:46 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 17:37:18 +0300
Message-Id: <c5cc66e7f91378f3be392b0637ed3c655c60bfff.1351261721.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
Subject: [PATCH 2/2] distro_identifier: replace slash with hyphen
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 14:52:23 -0000

Use "-" instead of "/" in "n/a" strings ("Distributor ID" and/or
"Release"), provided by `lsb_release`.
This leads to directories and subdirectories created in ./sstate-cache/
e.g. Distro-n/a/ where "Distro-n" is dir and "a" is subdir.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/lib/oe/lsb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index c8852a2..9133356 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -31,4 +31,4 @@ def distro_identifier(adjust_hook=None):
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
         return "Unknown"
-    return '{0}-{1}'.format(distro_id, release).replace(' ','-')
+    return '{0}-{1}'.format(distro_id, release).replace(' ','-').replace('/','-')
-- 
1.7.12.4



