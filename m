Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2453B76967
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:12:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2015 12:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="782157893"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 12:12:01 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 22:12:48 +0300
Message-Id: <cover.1439318387.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Upgrades: openssh, nss, nfs-utils, rsvg
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
X-List-Received-Date: Tue, 11 Aug 2015 19:12:06 -0000

The openssh upgrade adds a test that currently fails: that looks
like a failure in our test setup, I've filed a bug for that.



The following changes since commit a16e0b4014173af46ef80d643bb71055219b0dab:

  bitbake: toaster: reduced amount of instance attributes (2015-08-10 13:58:02 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/nss-openssh-nfsutils
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/nss-openssh-nfsutils

Jussi Kukkonen (4):
  openssh: Upgrade 6.8p1 -> 6.9p1
  nss: Upgrade 3.19.1 -> 3.19.2
  nfs-utils: Upgrade 1.3.1 -> 1.3.2
  librsvg: Upgrade 2.40.9 -> 2.40.10

 .../nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb}    |  7 +++----
 .../openssh/{openssh_6.8p1.bb => openssh_6.9p1.bb}          |  4 ++--
 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch         | 13 ++++++-------
 .../librsvg/{librsvg_2.40.9.bb => librsvg_2.40.10.bb}       |  4 ++--
 meta/recipes-support/nss/{nss_3.19.1.bb => nss_3.19.2.bb}   |  6 +++---
 5 files changed, 16 insertions(+), 18 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb} (95%)
 rename meta/recipes-connectivity/openssh/{openssh_6.8p1.bb => openssh_6.9p1.bb} (97%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.9.bb => librsvg_2.40.10.bb} (91%)
 rename meta/recipes-support/nss/{nss_3.19.1.bb => nss_3.19.2.bb} (97%)

-- 
2.1.4


