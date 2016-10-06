Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93B7F600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 21:44:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Oct 2016 14:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="1061481328"
Received: from jliao12-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.216])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2016 14:44:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2016 10:43:03 +1300
Message-Id: <cover.1475790060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Support Eclipse plugin usage with eSDK
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:24 -0000

The following changes since commit 97e526ca10a00010987ffa3b90ec48337503a573:

  scripts: Rename 'native' to 'oe-run-native' (2016-10-06 07:53:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-eclipse-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/esdk-eclipse-fix

Paul Eggleton (1):
  classes/populate_sdk_ext: add symlinks and unfsd to support Eclipse plugin

 meta/classes/populate_sdk_ext.bbclass           | 14 ++++++++++++--
 meta/recipes-core/meta/meta-extsdk-toolchain.bb |  2 +-
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.5.5


