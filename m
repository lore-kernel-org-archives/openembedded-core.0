Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09D8C60017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:09 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040325"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:09 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:27:57 +0300
Message-Id: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 00/11] Improvements to scripts/buildstats-diff
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:10 -0000

Improve the buildstats-diff in different ways:
- slightly improved error handling and output
- make it possible to compare other attributes of the buiildstats than just
  cputime (block io statistics and wall clock time added)
- support averaging over multiple buildstats


The following changes since commit cdaafc3729700778d95afc2413553d7b41c1317b:

  oeqa/sstatetests: Ensure we cover deb packaging backend for sstate test (2016-09-28 10:15:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildstats-diff
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildstats-diff


Markus Lehtonen (11):
  scripts/buildstats-diff: check that the given directory exists
  scripts/buildstats-diff: rename --min-time and --min-timediff args
  scripts/buildstats-diff: implement BSTask class
  scripts/buildstats-diff: do not hardcode field widths in output
  scripts/buildstats-diff: introduce --diff-attr
  scripts/buildstats-diff: add read_bytes and write_bytes to --diff-attr
  scripts/buildstats-diff: add read_ops and write_ops to --diff-attr
  scripts/buildstats-diff: add walltime to --diff-attr
  scripts/buildstats-diff: use exception for internal error handling
  scripts/buildstats-diff: make logger msg format a bit more readable
  scripts/buildstats-diff: implement --multi option

 scripts/buildstats-diff | 397 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 275 insertions(+), 122 deletions(-)

-- 
2.6.6


