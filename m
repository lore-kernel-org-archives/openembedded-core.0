Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1A00173E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:10:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 01:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772278358"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 01:10:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:10:15 +0100
Message-Id: <cover.1440058148.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Another fix for phonon being disabled by default in Qt4
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
X-List-Received-Date: Thu, 20 Aug 2015 08:10:33 -0000

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt4-toolchain-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-toolchain-fix

Paul Eggleton (1):
  packagegroup-qt*-toolchain-target: fix hard dependency on phonon
    library

 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.1.0


