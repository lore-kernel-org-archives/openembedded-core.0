Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBDA60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:12:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2013 03:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,768,1367996400"; d="scan'208";a="372816670"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2013 03:12:37 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 13:20:33 +0300
Message-Id: <cover.1375092836.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Fix recipes' name
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
X-List-Received-Date: Mon, 29 Jul 2013 10:12:38 -0000

The recipes have the local version of the packages appended to the
recipe name.

The following changes since commit 67864ca79da08df752487a3a4e1a975546da123d:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-24 11:35:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/docbook-sgml-dtd-name-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/docbook-sgml-dtd-name-fix

Emilia Ciobanu (2):
  docbook-sgml-dtd-3.1-native: fix recipe name
  docbook-sgml-dtd-4.1-native: fix recipe name

 ...ative.bb => docbook-sgml-dtd-3.1-native_3.1.bb} |    0
 ...ative.bb => docbook-sgml-dtd-4.1-native_4.1.bb} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-3.1-native.bb => docbook-sgml-dtd-3.1-native_3.1.bb} (100%)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-4.1-native.bb => docbook-sgml-dtd-4.1-native_4.1.bb} (100%)

-- 
1.7.9.5


