Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 424EE7700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 21:41:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 07 Sep 2016 14:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="165579052"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2016 14:41:29 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 14:42:37 -0700
Message-Id: <1473284559-187471-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2][PROPOSED] libcap fix and update
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
X-List-Received-Date: Wed, 07 Sep 2016 21:41:30 -0000

Need some experts to review this patch series. I am not really
sure for if what I fixed is a valid case or if fix is the best
answer. The validation before submission is very limited too.

I ran into the compiling issue when build an application and
found this recipe cannot be built without specifying anything.
I don't feel the existing options are passed to make with test,
and guess EXTRA_CONF won't work with this makefile-based project.

The second patch is a following-up when I saw there is another
option in the similar situation and seems to be obsolete now.

Jianxun Zhang (2):
  libcap: fix compiling issue when not having libpam
  libcap: remove dependency on attr

 meta/recipes-support/libcap/libcap_2.25.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.7.4


