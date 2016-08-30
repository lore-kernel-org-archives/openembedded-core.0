Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 47D7A731BA;
	Tue, 30 Aug 2016 08:32:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 30 Aug 2016 01:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="1049053579"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2016 01:32:12 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 11:32:07 +0300
Message-Id: <25c4531d30a0b7fc5e629a5e57cc393a5de20b6d.1472467394.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472467394.git.jussi.kukkonen@intel.com>
References: <cover.1472467394.git.jussi.kukkonen@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] base-files: Add shell test quoting
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
X-List-Received-Date: Tue, 30 Aug 2016 08:32:21 -0000

tty can return "not a tt" which results in warnings when /etc/profile
is executed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index ba1b9ba..a52bf89 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -31,7 +31,7 @@ fi
 if [ -x /usr/bin/resize ];then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
-  test `tty | cut -c1-8` = "/dev/tty" && resize >/dev/null
+  test "`tty | cut -c1-8`" = "/dev/tty" && resize >/dev/null
 fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
-- 
2.1.4


