Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D73BE71AC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 06:25:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1F6PCZJ032423
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:25:12 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Feb 2017 22:25:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2017 22:25:05 -0800
Message-ID: <cover.1487139819.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/6] fixes for nativesdk, tcl and binconfig.bbclass
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
X-List-Received-Date: Wed, 15 Feb 2017 06:25:14 -0000
Content-Type: text/plain

The following changes since commit d1109378d730c5cf50240c4d1a468e3aef5208ea:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:50:54 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/6fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/6fixes

Robert Yang (6):
  python-native: PROVIDES python-io-native
  btrfs-tools: remove udev from DEPENDS
  tcl: extend to nativesdk
  gawk/json-glib/libcheck: extend to nativesdk
  tcl: fix sed in do_install()
  binconfig.bbclass: fix get_binconfig_mangle()

 meta/classes/binconfig.bbclass                         | 4 ++--
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb | 2 +-
 meta/recipes-devtools/python/python-native_2.7.12.bb   | 9 ++++++++-
 meta/recipes-devtools/tcltk/tcl_8.6.6.bb               | 6 +++---
 meta/recipes-extended/gawk/gawk_4.1.4.bb               | 2 ++
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb        | 2 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb       | 2 +-
 7 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.10.2


