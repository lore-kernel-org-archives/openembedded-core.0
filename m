Return-Path: <william.c.randle@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 54DE0608B7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 22:45:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 04 Jun 2016 15:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,419,1459839600"; d="scan'208";a="116139496"
Received: from wcrandle-mobl.amr.corp.intel.com ([10.254.180.184])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2016 15:45:25 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jun 2016 15:45:00 -0700
Message-Id: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/3] perl: fix perl-ptest failures
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
X-List-Received-Date: Sat, 04 Jun 2016 22:45:26 -0000

Perl-ptest reports several failures when run. These occur when Perl is
cross-compiled and run on a target machine.

[YOCTO #8656]

Bill Randle (3):
  perl: set proper perl subversion number in config files
  perl: some perl tests require libssp
  perl: fix several perl test failures

 meta/recipes-devtools/perl/perl-ptest.inc          |   2 +-
 meta/recipes-devtools/perl/perl/config.sh          |  10 +-
 meta/recipes-devtools/perl/perl/perl-configure.sh  |   2 +-
 ...erl-fix-conflict-between-skip_all-and-END.patch | 181 +++++++++++++++++++++
 .../perl/perl/perl-test-customized.patch           |  61 +++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   2 +
 6 files changed, 251 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
 create mode 100644 meta/recipes-devtools/perl/perl/perl-test-customized.patch

-- 
2.5.5


