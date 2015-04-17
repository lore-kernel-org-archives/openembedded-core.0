Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8561773D24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 15:43:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2015 08:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,595,1422950400"; d="scan'208";a="710920300"
Received: from pbrao1-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.156])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2015 08:43:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:43:06 +0100
Message-Id: <cover.1429285210.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2 0/3] Packaging / warning fixes
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
X-List-Received-Date: Fri, 17 Apr 2015 15:43:24 -0000

A few fixes for things that have been bugging me lately. (I realise
we've just changed the S warning recently, hopefully this is the last
time...)

Changes since v1:
* Adjust message for installed-vs-shipped to suggest not installing
* Add S warning improvement patch

The following changes since commit cfc43743b0e41cf168cad9cbd4e9d870b8f01f03:

  toolchain-scripts: Allow the CONFIGSITE_CACHE variable to be overridden (2015-04-15 14:29:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/pkgfixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/pkgfixes

Paul Eggleton (3):
  classes/package: clarify installed-vs-shipped message
  lib/oe/package_manager: avoid traceback with no packages
  classes/base: clarify S not set correctly warning

 meta/classes/base.bbclass      | 2 +-
 meta/classes/package.bbclass   | 3 ++-
 meta/lib/oe/package_manager.py | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.1.0


