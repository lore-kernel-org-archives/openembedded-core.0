Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 481E66AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:53:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2015 05:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,737,1432623600"; d="scan'208";a="774540445"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2015 05:53:54 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:55:33 +0300
Message-Id: <cover.1440420666.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/3] Upgrade lsof, libical, lsbinitscripts
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
X-List-Received-Date: Mon, 24 Aug 2015 12:53:59 -0000

Changes since v1:
* libical now does not inherit perlnative, but uses host perl
* patched libical CMakeLists.txt so it doesn't try to find perl

The following changes since commit a3d228a484cf471e999b6537987e2897d8a7bd4e:

  bitbake: main: Handle RuntimeError exception in list_extension_modules (2015-08-20 22:04:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/lsof-lsb-libical
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/lsof-lsb-libical

Jussi Kukkonen (3):
  lsof: Upgrade 4.88 -> 4.89
  lsbinitscripts: Upgrade 9.63 -> 9.64
  libical: Upgrade 1.0.0 -> 1.0.1

 ...binitscripts_9.63.bb => lsbinitscripts_9.64.bb} |  6 ++--
 .../lsof/{lsof_4.88.bb => lsof_4.89.bb}            |  4 +--
 .../libical/Remove-cmake-check-for-Perl.patch      | 33 ++++++++++++++++++++++
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb} | 12 +++++---
 4 files changed, 46 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.63.bb => lsbinitscripts_9.64.bb} (81%)
 rename meta/recipes-extended/lsof/{lsof_4.88.bb => lsof_4.89.bb} (91%)
 create mode 100644 meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (61%)

-- 
2.1.4


