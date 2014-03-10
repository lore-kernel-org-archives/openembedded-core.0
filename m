Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 52B266F66B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 03:48:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 09 Mar 2014 20:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,621,1389772800"; d="scan'208";a="488936389"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.212])
	by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2014 20:48:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Mar 2014 20:48:05 -0700
Message-Id: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 10 Mar 2014 03:48:40 -0000

These are some core packages for larger systems that had updates
that should be included in 1.6.

The bind update provides CVE fixes

Sau!

Saul Wold (3):
  util-linux: Update to 2.24.1
  dhcp: Update to 4.3.0
  bind: Update to 9.9.5

 .../bind-9.8.1-CVE-2012-5166.patch                 |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch  |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch  |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch  |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch  |   0
 .../bind-Fix-CVE-2012-4244.patch                   |   0
 .../bind/{bind-9.8.1 => bind}/conf.patch           |   0
 .../{bind-9.8.1 => bind}/cross-build-fix.patch     |   0
 .../bind/bind/dont-test-on-host.patch              |  13 ++
 .../make-etc-initd-bind-stop-work.patch            |   0
 .../mips1-not-support-opcode.diff                  |   0
 .../bind/{bind_9.8.1.bb => bind_9.9.5.bb}          |  20 +--
 meta/recipes-connectivity/dhcp/dhcp.inc            |   2 +-
 .../dhcp/dhcp/fix-external-bind.patch              | 115 +++++++-------
 .../dhcp/{dhcp_4.2.5-P1.bb => dhcp_4.3.0.bb}       |   6 +-
 meta/recipes-core/util-linux/util-linux.inc        |  12 +-
 .../util-linux/util-linux/fix-configure.patch      |  20 +--
 .../util-linux/util-linux/util-linux-native.patch  | 173 +++------------------
 .../{util-linux_2.23.2.bb => util-linux_2.24.1.bb} |   6 +-
 19 files changed, 123 insertions(+), 244 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-9.8.1-CVE-2012-5166.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-Fix-CVE-2012-4244.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/cross-build-fix.patch (100%)
 create mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/mips1-not-support-opcode.diff (100%)
 rename meta/recipes-connectivity/bind/{bind_9.8.1.bb => bind_9.9.5.bb} (76%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.5-P1.bb => dhcp_4.3.0.bb} (65%)
 rename meta/recipes-core/util-linux/{util-linux_2.23.2.bb => util-linux_2.24.1.bb} (83%)

-- 
1.8.3.1


