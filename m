Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 453E0618B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 15:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154926"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:21 -0700
Message-Id: <cover.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/8] Updates and util-linux fix
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:29 -0000

The util-linux configure was finding pam in the 
core-image-basic image and there was a timing issue with 
and rebuild.

Other are standard updates

Sau!

The following changes since commit 3e1dbabbf33a2e461abc92ff10cd970fe604ee38:

  sysstat: backport a patch to fix a parallel building error (2013-07-02 07:58:10 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (8):
  packagegroup-core-basic: Only build libpam if it's enabled
  util-linux: disable runuser by default since it depends on PAM
  help2man: Update to 1.43.3
  boost: Update to 1.54
  dtc: Update to  1.4.0 Git Tag
  swabber: Update to latest head
  remake: Update to latest 3.82_dbg-0.9 Tag
  resolvconf: Update to 1.72

 .../resolvconf/{resolvconf_1.72.bb => resolvconf_1.73.bb}           | 4 ++--
 meta/recipes-core/util-linux/util-linux.inc                         | 3 ++-
 .../{help2man-native_1.43.2.bb => help2man-native_1.43.3.bb}        | 4 ++--
 meta/recipes-devtools/remake/remake_git.bb                          | 4 ++--
 meta/recipes-devtools/swabber/swabber-native_git.bb                 | 3 +--
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb      | 2 +-
 meta/recipes-kernel/dtc/dtc.inc                                     | 1 -
 meta/recipes-kernel/dtc/dtc_git.bb                                  | 5 ++---
 .../boost/{bjam-native_1.53.0.bb => bjam-native_1.54.0.bb}          | 0
 meta/recipes-support/boost/{boost-1.53.0.inc => boost-1.54.0.inc}   | 6 +++---
 meta/recipes-support/boost/{boost_1.53.0.bb => boost_1.54.0.bb}     | 2 --
 11 files changed, 15 insertions(+), 19 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.72.bb => resolvconf_1.73.bb} (92%)
 rename meta/recipes-devtools/help2man/{help2man-native_1.43.2.bb => help2man-native_1.43.3.bb} (80%)
 rename meta/recipes-support/boost/{bjam-native_1.53.0.bb => bjam-native_1.54.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.53.0.inc => boost-1.54.0.inc} (76%)
 rename meta/recipes-support/boost/{boost_1.53.0.bb => boost_1.54.0.bb} (89%)

-- 
1.8.1.4


