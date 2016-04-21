Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2526171633
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:50:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Apr 2016 05:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="689901486"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2016 05:50:32 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 15:50:20 +0300
Message-Id: <cover.1461235563.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Add missing build dependencies
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
X-List-Received-Date: Thu, 21 Apr 2016 12:50:32 -0000

I found some build issues by running a
build/cleansstate/wipe-sysroot/re-build cycle on individual recipes.

cheers
 Jussi


The following changes since commit 6c1c01392d91f512e2949ad1d57a75a8077478ba:

  build-appliance-image: Update to krogoth head revision (2016-04-19 21:26:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/build-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/build-fixes

Jussi Kukkonen (3):
  gobject-introspection: Depend on native flex and bison
  connman-gnome: Depend on dbus-glib-native
  matchbox-panel-2: Depend on dbus-glib-native

 meta/recipes-connectivity/connman/connman-gnome_0.7.bb                  | 2 +-
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.1.4


