Return-Path: <amanda.r.brindle@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 654A87869D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 00:20:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 16:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,401,1505804400"; d="scan'208";a="174032424"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga005.jf.intel.com with ESMTP; 15 Nov 2017 16:20:53 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 16:20:08 -0800
Message-Id: <cover.1510791278.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 0/1]
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
X-List-Received-Date: Thu, 16 Nov 2017 00:20:52 -0000

For v2, I removed some dead code (recipe_bbvars(), collect_bbvars(), and 
code that handled the -m option). 

I also added the parameter variants=False to all_recipe_files() so that
the script would not scan through variant recipe files. 

I also updated the commit message to describe why the changes were made. 

The following changes since commit 65d23bd7986615fdfb0f1717b615534a2a14ab80:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/bbvars_tinfoil
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/bbvars_tinfoil

Amanda Brindle (1):
  scripts/contrib/bbvars.py: Rewrite to use tinfoil

 scripts/contrib/bbvars.py | 140 ++++++++++++++++++++++------------------------
 1 file changed, 67 insertions(+), 73 deletions(-)

-- 
2.7.4


