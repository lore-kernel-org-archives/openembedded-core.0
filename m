Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F0BCC61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:00:09 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2013 08:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="287368486"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 08:00:09 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 17:59:34 +0300
Message-Id: <cover.1377613447.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Add midori and dependencies
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
X-List-Received-Date: Tue, 27 Aug 2013 15:00:10 -0000

The Midori web-browser can be used to more easily test the functionality
of webkit-gtk.

* The midori and libnotify recipes are from meta-gnome.
* The python-docutils and vala recipes are from meta-oe.
* The midori and python-docutils packages have been updated to the latest
upstream version.

Midori also depends on ca-certificates. A patch set was sent by Christopher
Larson that adds the recipe in oe-core. This series depends on his addition.

The following changes since commit b467b99a5d25efe5eadfb07dbecba608575256ac:

  linux-yocto: switch genericx86 to use common-pc (2013-08-24 09:37:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/midori
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/midori

Mihai Prica (5):
  python-docutils: add version 0.11 from meta-oe
  libnotify: add version 0.6.0 from meta-oe
  vala: add version 0.16 from meta-oe
  vala.bbclass: add class from meta-oe
  midori: add version 0.5.5 from meta-oe

 meta/classes/vala.bbclass                          |   18 +++++++
 .../python/python-docutils_0.11.bb                 |   18 +++++++
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |   53 ++++++++++++++++++++
 meta/recipes-devtools/vala/vala.inc                |   20 ++++++++
 meta/recipes-devtools/vala/vala_0.16.0.bb          |    8 +++
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |   17 +++++++
 meta/recipes-sato/midori/midori_0.5.5.bb           |   43 ++++++++++++++++
 7 files changed, 177 insertions(+)
 create mode 100644 meta/classes/vala.bbclass
 create mode 100644 meta/recipes-devtools/python/python-docutils_0.11.bb
 create mode 100644 meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
 create mode 100644 meta/recipes-devtools/vala/vala.inc
 create mode 100644 meta/recipes-devtools/vala/vala_0.16.0.bb
 create mode 100644 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
 create mode 100644 meta/recipes-sato/midori/midori_0.5.5.bb

-- 
1.7.9.5


