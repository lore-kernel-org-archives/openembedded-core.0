Return-Path: <tom.zanussi@intel.com>
X-Greylist: delayed 622 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Jul 2014 19:51:06 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 848E27089F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:51:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jul 2014 12:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,759,1400050800"; d="scan'208";a="569069691"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2014 12:40:20 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 14:40:09 -0500
Message-Id: <2745180a096fee9975cfa183f57c9dc483d73278.1406662652.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
References: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1406662652.git.tom.zanussi@linux.intel.com>
References: <cover.1406662652.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/4] wic: Add documentation for --fsoptions
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
X-List-Received-Date: Tue, 29 Jul 2014 19:51:13 -0000

--fsoptions support was recently added to wic, so document it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 913947c..6d613e2 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -721,6 +721,13 @@ DESCRIPTION
              btrfs
              swap
 
+         --fsoptions: Specifies a free-form string of options to be
+                      used when mounting the filesystem. This string
+                      will be copied into the /etc/fstab file of the
+                      installed system and should be enclosed in
+                      quotes.  If not specified, the default string is
+                      "defaults".
+
          --label label: Specifies the label to give to the filesystem
                         to be made on the partition. If the given
                         label is already in use by another filesystem,
-- 
1.8.3.1


