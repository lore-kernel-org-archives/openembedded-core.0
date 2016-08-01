Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 04CAB65CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 11:00:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 01 Aug 2016 04:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,454,1464678000"; d="scan'208";a="1006219463"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.213])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2016 04:00:33 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 12:00:25 +0100
Message-Id: <cover.1470049100.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Pseudo performance regression
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
X-List-Received-Date: Mon, 01 Aug 2016 11:00:35 -0000

The following series includes changes from upstream to mitigate a performance
regression in pseudo 1.8.x, most notable when building images which make heavy
use of extended attributes.

Regards,

Joshua

The following changes since commit b32d430c3c7dccf3a8d06ab492d648893a05950f:

  dpkg: use snapshot.debian.org for SRC_URI (2016-07-26 08:56:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/pseudo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/pseudo

Joshua Lock (2):
  pseudo: backport patch to fix xattr performance
  pseudo: update git recipe to include xattr perf fix

 .../pseudo/files/Fix-xattr-performance.patch       | 117 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   2 +-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch

-- 
2.7.4


