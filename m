Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 485076025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:22:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 13:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="1086248641"
Received: from fsantes-mobl2.amr.corp.intel.com (HELO
	jalamego-MOBL2.zpn.intel.com) ([10.219.5.141])
	by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2016 13:22:17 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:22:12 -0600
Message-Id: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] python-git and 3 more upgrades
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
X-List-Received-Date: Wed, 16 Nov 2016 21:22:18 -0000

The following python recipes needed to be upgraded to latest upstream
version.
These changes were tested using qemux86 with core-image-sato.


Jose Lamego (4):
  python*-git: upgrade to 2.1.0
  python*-mako: upgrade to 1.0.6
  python-pexpect: upgrade to 4.2.1
  python-scons*: upgrade to 2.5.1

 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python-git_2.0.7.bb => python-git_2.1.0.bb}               | 0
 meta/recipes-devtools/python/python-mako.inc                          | 4 ++--
 .../python/{python-mako_1.0.4.bb => python-mako_1.0.6.bb}             | 0
 .../python/{python-pexpect_4.2.0.bb => python-pexpect_4.2.1.bb}       | 4 ++--
 .../{python-scons-native_2.5.0.bb => python-scons-native_2.5.1.bb}    | 0
 .../python/{python-scons_2.5.0.bb => python-scons_2.5.1.bb}           | 4 ++--
 .../python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb}             | 0
 .../python/{python3-mako_1.0.4.bb => python3-mako_1.0.6.bb}           | 0
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python-git_2.0.7.bb => python-git_2.1.0.bb} (100%)
 rename meta/recipes-devtools/python/{python-mako_1.0.4.bb => python-mako_1.0.6.bb} (100%)
 rename meta/recipes-devtools/python/{python-pexpect_4.2.0.bb => python-pexpect_4.2.1.bb} (81%)
 rename meta/recipes-devtools/python/{python-scons-native_2.5.0.bb => python-scons-native_2.5.1.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.5.0.bb => python-scons_2.5.1.bb} (78%)
 rename meta/recipes-devtools/python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-mako_1.0.4.bb => python3-mako_1.0.6.bb} (100%)

-- 
1.9.1


