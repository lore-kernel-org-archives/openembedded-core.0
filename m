Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F08FD6A9CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 15:06:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Jun 2013 08:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="315907296"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 12 Jun 2013 08:06:55 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7BF516A4091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 08:06:44 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 18:07:18 +0300
Message-Id: <cover.1371049273.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] Small fixes for the build perf script
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
X-List-Received-Date: Wed, 12 Jun 2013 15:06:56 -0000

The following changes since commit b87429fdb45f82ebe4060fea8c4ecd6e4bc1ae52:

  bitbake: Add missing file that went out of sync (2013-06-12 13:13:21 +0100)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib stefans/perf-test3

for you to fetch changes up to 18d3270bff2b2d28d879db0c9646a588d457b688:

  scripts/contrib/build-perf-test.sh: fix passing arguments (2013-06-12 18:00:17 +0300)

----------------------------------------------------------------
Stefan Stanacar (2):
      scripts/contrib/build-perf-test.sh: add branch name and sizes to results
      scripts/contrib/build-perf-test.sh: fix passing arguments

 scripts/contrib/build-perf-test.sh | 60 +++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 24 deletions(-)

Stefan Stanacar (2):
  scripts/contrib/build-perf-test.sh: add branch name and sizes to
    results
  scripts/contrib/build-perf-test.sh: fix passing arguments

 scripts/contrib/build-perf-test.sh | 60 +++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 24 deletions(-)

-- 
1.8.1.4


