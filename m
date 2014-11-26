Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
	(p3plsmtpa09-09.prod.phx3.secureserver.net [173.201.193.238])
	by mail.openembedded.org (Postfix) with ESMTP id 9878972332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 19:45:14 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-09.prod.phx3.secureserver.net with 
	id LKlD1p0030BVjqb01KlD1U; Wed, 26 Nov 2014 12:45:13 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 13:44:56 -0600
Message-Id: <cover.1417029596.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH 0/3] Miscellaneous bluez patches
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
X-List-Received-Date: Wed, 26 Nov 2014 19:45:24 -0000

These resolve the conflict for provider of hcidump between bluez4 and
bluez5, provide a new package containing the useful tools in bluez5 that
upstream doesn't think should be installed, and provides a mechanism for
enabling the experimental features such as the new GATT interface.

The following changes since commit ab63640fad50954b0440ab107c96dbd3f919ea4d:

  gdk-pixbuf: use ptest-gnome (2014-11-25 13:03:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pabigot/bluez5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pabigot/bluez5

Peter A. Bigot (3):
  bluez-hcidump: select provider as bluez4 or bluez5
  bluez5: add a package for tools left in the build area
  bluez5: support experimental through PACKAGECONFIG

 meta/conf/distro/include/default-providers.inc     |  1 +
 .../bluez/bluez-hcidump_2.5.bb                     |  2 +
 meta/recipes-connectivity/bluez5/bluez5.inc        | 29 +++++++++++++-
 meta/recipes-connectivity/bluez5/bluez5_5.25.bb    | 46 ++++++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

-- 
1.8.5.5


