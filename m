Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 98E8D60762
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:25:23 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="108115696"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 14 Jul 2017 05:25:24 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D04555807D9;
	Fri, 14 Jul 2017 05:25:23 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:25:17 +0300
Message-Id: <cover.1500034432.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Remove gnome-common
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
X-List-Received-Date: Fri, 14 Jul 2017 12:25:23 -0000

Patchset should preferably only be merged once "gnome-common: Add
recipe (from oe-core)" (2017-07-06) patch has been merged in meta-oe.
I can ping the thread once it happens.

This set removes gnome-common, an obsolete collection of m4-macros
that partially conflicts with autoconf-archive. The plan is to fix the
hacks between autoconf-archive and gnome-common once they're in the
same repo.

Thanks, 
 Jussi

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gnome-common
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gnome-common

Jussi Kukkonen (4):
  matchbox-desktop: Upgrade to 2.2
  python3-pygobject: Don't use gnome-common
  gnome-desktop: Don't use gnome-common
  gnome-common: Remove as deprecated

 ...onfigure.ac-Don-t-use-gnome-common-macros.patch | 33 ++++++++++++++++++++++
 .../python/python3-pygobject_3.24.1.bb             |  3 +-
 ...figure.ac-Remove-gnome-common-macro-calls.patch | 33 ++++++++++++++++++++++
 .../gnome-desktop/gnome-desktop3_3.24.2.bb         |  6 ++--
 meta/recipes-gnome/gnome/gnome-common_3.18.0.bb    | 20 -------------
 ...hbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} |  6 ++--
 6 files changed, 75 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} (87%)

-- 
2.1.4


