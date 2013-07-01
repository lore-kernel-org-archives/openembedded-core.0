Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B18E06AF4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 20:48:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2013 13:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,975,1363158000"; d="scan'208";a="363055839"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.91])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2013 13:48:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 13:48:41 -0700
Message-Id: <cover.1372711267.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/4 v2] mc packaging fixes & udev cache fix
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
X-List-Received-Date: Mon, 01 Jul 2013 20:48:49 -0000

This set contains some packaging changes for mc (both gplv2 and v3)
and enables udev-cache via an RRECOMMENDS

Sau!

The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (4):
  mc: Don't remove libdir and split helpers into packages
  packagegroups: Update for split mc packages
  packagegroup-core-basic: remove hardcode udev
  udev: Add RRECOMMENDS for udev-cache to enable the cache

 .../packagegroups/packagegroup-self-hosted.bb      |  4 ++++
 meta/recipes-core/udev/udev.inc                    |  2 +-
 meta/recipes-extended/mc/mc_4.7.5.2.bb             | 22 ++++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.8.bb               | 22 +++++++++++++++++++++-
 .../packagegroups/packagegroup-core-basic.bb       |  5 ++++-
 .../packagegroups/packagegroup-core-lsb.bb         |  4 ++++
 6 files changed, 56 insertions(+), 3 deletions(-)

-- 
1.8.1.4


