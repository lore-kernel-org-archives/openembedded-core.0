Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 359D465CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:09:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2016 15:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="674045719"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 15:09:14 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 14:03:59 +0000
Message-Id: <cover.1458655100.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/4] Fix some errors in archiver class
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
X-List-Received-Date: Tue, 22 Mar 2016 22:09:28 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There were some errors in the archiver class that are fixed with
this series:

- Don't expand python functions in dumpdata
    Fixed a datastore expansion for python functions
- Fix use of ARCHIVER_WORKDIR and ARCHIVER_OUTDIR
    In unpack and patch task the outdir was used as workdir
- Fix gcc-source corner case
    gcc-source doesn't have do_configure task used for do_ar_configure
- Fix tar name for git repositories
    For git repositories the file generated for the original
    source had the domain in the file name.

The following changes since commit 8debfea81e69d038bd2d56314b272cb74f5582ed:

  local.conf.sample: Disable prelink by default (2016-03-13 22:09:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9245
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9245

Mariano Lopez (4):
  archiver.bbclass: Don't expand python functions in dumpdata
  archiver.bbclass: Fix use of ARCHIVER_WORKDIR and ARCHIVER_OUTDIR
  archiver.bbclass: Fix gcc-source corner case
  archiver.bbclass: Fix tar name for git repositories

 meta/classes/archiver.bbclass | 76 +++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 36 deletions(-)

-- 
2.6.2


