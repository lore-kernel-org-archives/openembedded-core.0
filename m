Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BCCE36FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 18:40:00 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 10 Mar 2016 10:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,316,1455004800"; d="scan'208";a="63721981"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2016 10:34:11 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 10:29:20 +0000
Message-Id: <cover.1457604105.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/2] Improve bblayers and prservices selftests
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
X-List-Received-Date: Thu, 10 Mar 2016 18:40:02 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These patches will improve some selftests that required the file
name of recipes. With these changes just the recipe is needed
and the tests will get the file names as required.

The following changes since commit bc0e99d2b165ff547e02c7169a8b0d210de54a1a:

  recipetool: create: shrinkwrap and lockdown npm modules (2016-03-09 17:00:29 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/xauth
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/xauth

Mariano Lopez (2):
  selftest/prservice.py: Sanitize package version when looking for stamp
  selftest/bblayers.py: Remove harcoded recipe files

 meta/lib/oeqa/selftest/bblayers.py  | 20 ++++++++++++++++++--
 meta/lib/oeqa/selftest/prservice.py |  2 +-
 2 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.6.2


