Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E0A046FA59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 18:08:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2014 11:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,704,1389772800"; d="scan'208";a="504049094"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.240])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2014 11:02:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 18:02:37 +0000
Message-Id: <cover.1395424859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH v3 0/2] Fix for kernel depmod postinstall
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
X-List-Received-Date: Fri, 21 Mar 2014 18:08:23 -0000

The other fixes from "Misc fixes" branch were merged; this one needed
an additional fix for the multilib changed file detection, which has
been added in v3.


The following changes since commit ef2ba0a17a4fbd0e0c43c144f43d1d40de23697e:

  gtk-engines: removed gnome inheritance (2014-03-21 17:14:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes5

Paul Eggleton (2):
  classes/kernel: move module postinst commands to kernel-base
  classes/image: ignore modules.dep changing during multilib image
    construction

 meta/classes/image.bbclass  | 2 +-
 meta/classes/kernel.bbclass | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.5.3


