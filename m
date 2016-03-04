Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5D51073219
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 03:23:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 03 Mar 2016 19:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,534,1449561600"; d="scan'208";a="757852603"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by orsmga003.jf.intel.com with ESMTP; 03 Mar 2016 19:23:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 16:22:51 +1300
Message-Id: <72b202690067b366fe727539decc7ed1bcf4a4a4.1457061745.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] conf/documentation.conf: remove BBLAYERS_NON_REMOVABLE
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
X-List-Received-Date: Fri, 04 Mar 2016 03:23:05 -0000

Hob was the only thing paying attention to this, and now Hob itself has
been removed we can remove this as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 00a69da..4234d75 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -90,7 +90,6 @@ BBFILES[doc] = "List of recipe files used by BitBake to build software."
 BBINCLUDELOGS[doc] = "Variable that controls how BitBake displays logs on build failure."
 BBINCLUDELOGS_LINES[doc] = "Amount of log lines printed on failure."
 BBLAYERS[doc] = "Lists the layers to enable during the build. This variable is defined in the bblayers.conf configuration file."
-BBLAYERS_NON_REMOVABLE[doc] = "Lists core layers that cannot be removed from the bblayers.conf file."
 BBMASK[doc] = "Prevents BitBake from processing specific recipes or recipe append files."
 BBPATH[doc] = "Used by BitBake to locate .bbclass and configuration files. This variable is analogous to the PATH variable."
 BBSERVER[doc] = "Points to the server that runs memory-resident BitBake."
-- 
2.5.0


