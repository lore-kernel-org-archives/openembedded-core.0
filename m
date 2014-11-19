Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3397712A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 10:02:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2014 00:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="418556644"
Received: from gcwannia-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.103])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2014 00:44:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 08:53:19 +0000
Message-Id: <cover.1416386960.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/4] Patch cleanup
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
X-List-Received-Date: Wed, 19 Nov 2014 10:02:55 -0000

I've been doing some work with patch mangling lately, and it turns out
that quilt ignores some things in patches that git/patch won't - in
particular, certain types of already applied patches as well as patches
that add .orig files. This series cleans up those patches which failed
to apply with git am / git apply / patch for those reasons.


The following changes since commit e7b731a1a358e0007dba1038ad504888bec5916e:

  docbook-xsl-stylesheets: fix do_configure typo (2014-11-12 15:36:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/patch-cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/patch-cleanup

Paul Eggleton (4):
  openssh: drop already applied patch
  cmake: drop already applied patches
  xmodmap: drop already applied patch
  gtk+: drop part of patch adding useless file

 .../openssh/openssh/openssh-CVE-2014-2532.patch    |   22 -
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |    1 -
 meta/recipes-devtools/cmake/cmake.inc              |    2 -
 .../cmake/cmake/aarch64-cmake.patch                |   37 -
 .../cmake/cmake/aarch64-kwsys.patch                |   40 -
 .../gtk+/gtk+-2.24.24/hardcoded_libtool.patch      | 1779 --------------------
 .../xorg-app/xmodmap/gnu-source.patch              |   60 -
 meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb    |    2 -
 8 files changed, 1943 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-cmake.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/aarch64-kwsys.patch
 delete mode 100644 meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch

-- 
1.9.3


