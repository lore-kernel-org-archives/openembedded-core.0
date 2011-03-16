Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1PzxuX-0005PR-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 22:05:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2011 14:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,195,1299484800"; d="scan'208";a="613859225"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2011 14:03:56 -0700
Message-Id: <cover.1300309327.git.nitin.a.kamble@intel.com>
Old-Date: Wed, 16 Mar 2011 14:02:07 -0700
Date: Wed, 16 Mar 2011 14:03:55 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/2] GPLv2 versions of m4 & bison
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 21:05:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These commits adds GPLv2 versions of m4 & bison recipes.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (2):
  bison: bring back GPLv2 version 2.3 of bison recipe
  m4: bring back GPLv2 version 1.4.9 of m4 recipe

 .../bison/bison/bison-2.3_m4.patch                 |  590 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_2.3.bb           |   35 ++
 meta/recipes-devtools/m4/m4-native_1.4.9.bb        |   12 +
 .../m4/m4/fix_for_circular_dependency.patch        |   75 +++
 meta/recipes-devtools/m4/m4_1.4.9.bb               |   18 +
 5 files changed, 730 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
 create mode 100644 meta/recipes-devtools/bison/bison_2.3.bb
 create mode 100644 meta/recipes-devtools/m4/m4-native_1.4.9.bb
 create mode 100644 meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
 create mode 100644 meta/recipes-devtools/m4/m4_1.4.9.bb

-- 
1.7.3.4



