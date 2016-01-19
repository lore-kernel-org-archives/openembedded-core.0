Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 91D0060116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:44:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2016 02:44:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,316,1449561600"; d="scan'208";a="863671925"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.31.203])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2016 02:44:55 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 10:44:05 +0000
Message-Id: <cover.1453200108.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Remove some uses of oe_filter_out
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
X-List-Received-Date: Tue, 19 Jan 2016 10:44:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace a couple of uses of oe_filter_out() with removes override syntax,
which is much clearer and better matches modern style and convention.

Furthermore this allows us to drop two uses of immediate expansion.

The following changes since commit a42229df424552955c0ac62da1063461f97f5938:

  openssh: CVE-2016-1907 (2016-01-17 11:32:21 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/filter
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/filter

Joshua Lock (2):
  gcc-runtime: switch to removal override syntax to modify CXXFLAGS
  uclibc: remove a use of immediate expansion and oe_filter_out ()

 meta/recipes-core/uclibc/uclibc.inc       | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.5.0


