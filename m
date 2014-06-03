Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 436506FA51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 20:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786721"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:05 -0700
Message-Id: <cover.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/7] Updates and a dependency Patch
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
X-List-Received-Date: Tue, 03 Jun 2014 03:26:35 -0000

Set up package updates and a patch for some dependency
issues with adduser and update-rc.d.

Sau!

The following changes since commit 6433f5d68eba1ce7306fbfb19265ea6786715d7c:

  diffstat: patches have now been submitted upstream (2014-06-02 21:35:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (7):
  libxkbcommon: Update to 0.4.2
  libcheck: Update to 0.9.13
  libffi: Update to 3.1
  man-pages: Update to 3.68
  cups: Update to 1.7.3
  resolvconf: Update to 1.75
  update-rc.d/useradd: Add additional dependecies

 meta/classes/update-rc.d.bbclass                                  | 2 ++
 meta/classes/useradd.bbclass                                      | 2 +-
 .../resolvconf/{resolvconf_1.74.bb => resolvconf_1.75.bb}         | 6 +++---
 meta/recipes-extended/cups/{cups_1.7.2.bb => cups_1.7.3.bb}       | 4 ++--
 .../man-pages/{man-pages_3.65.bb => man-pages_3.68.bb}            | 6 +++---
 meta/recipes-gnome/libffi/{libffi_3.0.13.bb => libffi_3.1.bb}     | 8 ++++----
 .../xorg-lib/{libxkbcommon_0.4.1.bb => libxkbcommon_0.4.2.bb}     | 4 ++--
 .../libcheck/{libcheck_0.9.12.bb => libcheck_0.9.13.bb}           | 4 ++--
 8 files changed, 19 insertions(+), 17 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.74.bb => resolvconf_1.75.bb} (92%)
 rename meta/recipes-extended/cups/{cups_1.7.2.bb => cups_1.7.3.bb} (40%)
 rename meta/recipes-extended/man-pages/{man-pages_3.65.bb => man-pages_3.68.bb} (72%)
 rename meta/recipes-gnome/libffi/{libffi_3.0.13.bb => libffi_3.1.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.1.bb => libxkbcommon_0.4.2.bb} (82%)
 rename meta/recipes-support/libcheck/{libcheck_0.9.12.bb => libcheck_0.9.13.bb} (79%)

-- 
1.8.3.1


