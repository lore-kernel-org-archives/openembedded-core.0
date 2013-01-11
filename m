Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtcTg-0001sk-5o
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 12:08:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2013 02:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,451,1355126400"; d="scan'208";a="245132548"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 02:53:30 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 12:53:36 +0200
Message-Id: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V3 0/2] connman 1.10 upgrade and qemu networking fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 11:08:57 -0000

This set of patches will:
- update connman to 1.10
- solve the issue of lost connectivity with qemu machines
    connman will clear previous configuration for a network
    interface, rendering qemu machines eth0 unusable, because
    there is no DHCP server to be used, and the static configuration
    of eth0 will be cleared when connman starts.
    connman-conf solves this.

Cristian Iorga (2):
  connman: upgrade to 1.10
  connman-conf: configures connman in qemu machines

 meta/conf/layer.conf                               |    1 +
 meta/conf/machine/include/qemu.inc                 |    2 +
 meta/recipes-connectivity/connman/connman-conf.bb  |   18 ++++++
 .../connman/connman-conf/qemuall/main.conf         |    3 +
 ...If-there-is-no-d_type-support-use-fstatat.patch |   61 --------------------
 ...If-there-is-no-d_type-support-use-fstatat.patch |   38 +++++++-----
 .../connman/inet-fix-ip-cleanup-functions.patch    |   40 +++++++++++++
 .../connman/{connman_1.4.bb => connman_1.10.bb}    |    8 ++-
 8 files changed, 91 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
 rename meta/recipes-connectivity/connman/{connman_1.4.bb => connman_1.10.bb} (71%)

-- 
1.7.10.4



