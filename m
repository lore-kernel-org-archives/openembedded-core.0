Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EED3773D44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:45:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 13 Apr 2015 08:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,570,1422950400"; d="scan'208";a="679381151"
Received: from padice-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.91])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2015 08:45:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 16:44:51 +0100
Message-Id: <cover.1428939870.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] A couple of package-related fixes
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
X-List-Received-Date: Mon, 13 Apr 2015 15:45:25 -0000

The following changes since commit a7d8eaef04c9dd6ede8d4efd8c4b776efbe3c767:

  shadow: split files needed for PAM use into separate package (2015-04-09 19:48:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/pkgfixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/pkgfixes

Paul Eggleton (2):
  classes/package: clarify installed-vs-shipped message
  lib/oe/package_manager: avoid traceback with no packages

 meta/classes/package.bbclass   | 3 ++-
 meta/lib/oe/package_manager.py | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.1.0


