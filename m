Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 060F76D2C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 16:57:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2013 09:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="397431996"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2013 09:57:31 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2013 19:59:37 +0300
Message-Id: <cover.1382547468.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] glib-2.0 and bluez5 upgrades
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
X-List-Received-Date: Wed, 23 Oct 2013 16:57:31 -0000

The following changes since commit ffb440c37c3491fa5d9a1408341f7c15eacdc9ce:

  midori: exclude from self-hosted for mips64 (2013-10-23 07:18:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (2):
  glib-2.0: upgrade to 2.38.1
  bluez5: upgrade to 5.10

 .../bluez5/{bluez5-5.7 => bluez5-5.10}/bluetooth.conf                | 0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb                      | 5 +++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb                       | 5 -----
 .../recipes-core/glib-2.0/{glib-2.0_2.38.0.bb => glib-2.0_2.38.1.bb} | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.7 => bluez5-5.10}/bluetooth.conf (100%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.0.bb => glib-2.0_2.38.1.bb} (93%)

-- 
1.8.1.2


