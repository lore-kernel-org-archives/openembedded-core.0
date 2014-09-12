Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2E61702CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 18:26:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2014 11:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,514,1406617200"; d="scan'208";a="572426752"
Received: from new-host-2.jf.intel.com ([10.7.201.163])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2014 11:25:14 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 11:25:11 -0700
Message-Id: <1410546312-5402-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] Fix for locked sstate code.
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
X-List-Received-Date: Fri, 12 Sep 2014 18:26:41 -0000

When testing out the locked sstate patches submitted by Richard, I noticed
that tasks were running that should be locked. This has to do with
OVERRIDES as noted in the following patch.

Without this change, it's possible that a large portion of locked items
won't actually be locked.

Randy Witt (1):
  sstatesig.py: Replace '_'s with '-'s in SSTATE_LOCKEDSIGS* names.

 meta/lib/oe/sstatesig.py | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.3


