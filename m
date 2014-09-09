Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BDED265C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:21:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Sep 2014 09:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,492,1406617200"; d="scan'208";a="600332007"
Received: from unknown (HELO localhost) ([10.255.12.151])
	by orsmga002.jf.intel.com with ESMTP; 09 Sep 2014 09:21:58 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 11:21:56 -0500
Message-Id: <cover.1410279539.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] wic: remove all urlgrabber references
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
X-List-Received-Date: Tue, 09 Sep 2014 16:22:06 -0000

This fixes a problem noticed by a user, that urlgrabber was still
being referenced even though it had been removed from the 3rdparty
code.

The following changes since commit a44006262cf3b810ec78b4cccd8076102a7a0f3e:

  distro/poky: Add Debian 7.5 and 7.6 version as validated (2014-09-03 16:00:29 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-urlgrabber-fixes-2
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-urlgrabber-fixes-2

Tom Zanussi (1):
  wic: Completely remove all urlgrabber references

 scripts/lib/wic/3rdparty/pykickstart/parser.py  | 87 +------------------------
 scripts/lib/wic/3rdparty/pykickstart/version.py | 29 ---------
 2 files changed, 2 insertions(+), 114 deletions(-)

-- 
1.8.3.1


