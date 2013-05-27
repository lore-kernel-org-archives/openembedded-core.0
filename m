Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 222DB621CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 12:20:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2013 05:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,750,1363158000"; d="scan'208";a="320184246"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2013 05:20:06 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 15:19:52 +0300
Message-Id: <cover.1369657070.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] multiple package upgrades
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
X-List-Received-Date: Mon, 27 May 2013 12:20:07 -0000

Upgrades for git, python-dbus and autogen-native.

The following changes since commit 676fd3f394a0c0576b63c77ed2184bf5f42c29b6:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bogdanm/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bogdanm/work

Bogdan Marinescu (3):
  git: upgraded to 1.8.3
  python-dbus: upgraded to 1.2.0
  autogen-native: upgraded to 5.17.4

 ...en-native_5.17.3.bb => autogen-native_5.17.4.bb} |    4 ++--
 meta/recipes-devtools/autogen/files/guile.patch     |   19 +++++++++----------
 .../git/{git_1.8.2.2.bb => git_1.8.3.bb}            |    4 ++--
 .../obsolete_automake_macros.patch                  |   14 --------------
 .../{python-dbus_1.1.1.bb => python-dbus_1.2.0.bb}  |    8 +++-----
 5 files changed, 16 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.17.3.bb => autogen-native_5.17.4.bb} (90%)
 rename meta/recipes-devtools/git/{git_1.8.2.2.bb => git_1.8.3.bb} (67%)
 delete mode 100644 meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
 rename meta/recipes-devtools/python/{python-dbus_1.1.1.bb => python-dbus_1.2.0.bb} (70%)

-- 
1.7.10.4


