Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E97CE60DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 11:07:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 04 Aug 2014 04:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="367604364"
Received: from unknown (HELO roxana-OptiPlex-9010.rb.intel.com)
	([10.237.105.58])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2014 04:04:00 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 14:07:44 +0300
Message-Id: <cover.1407150413.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6538
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
X-List-Received-Date: Mon, 04 Aug 2014 11:07:22 -0000

The following changes since commit c1ee6cdfde5d1fe5f38a1e8eef5b7b0dd086df95:

  README: add required version for django-nvd3 (2014-03-06 13:43:30 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6538
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6538

Roxana Ciobanu (1):
  error page/search result page: Display submission date/time
    information

 Post/createStatistics.py      |  4 ++++
 Post/getInfo.py               |  3 +++
 Post/parser.py                |  3 ++-
 templates/error-details.html  |  2 ++
 templates/home.html           | 13 +++++++++++++
 templates/search-details.html |  2 ++
 6 files changed, 26 insertions(+), 1 deletion(-)

-- 
1.9.1


