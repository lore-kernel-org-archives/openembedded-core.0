Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB2C606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 22:05:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 12 Dec 2016 14:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,338,1477983600"; d="scan'208";a="1080938861"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2016 14:05:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 11:05:04 +1300
Message-Id: <cover.1481579713.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 0/2] Fix log_check warnings for bb* logging functions
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
X-List-Received-Date: Mon, 12 Dec 2016 22:05:28 -0000

This patchset requires the patch I just sent to the bitbake-devel mailing
list ("lib/bb/build: enable access to logger within tasks").


The following changes since commit d62f18c39bc0ed3b0f5ac8465b393c15f2143ecf:

  targetloader.py: drop test for ClassType (2016-12-12 15:16:39 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/rootfs-log-check-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rootfs-log-check-oe

Paul Eggleton (2):
  lib/oe/rootfs: fix log_check warnings being printed twice with RPM packaging
  classes/image: suppress log_check mechanism for warnings/errors logged through BitBake

 meta/classes/image.bbclass | 10 +++++++++-
 meta/lib/oe/rootfs.py      | 31 ++++++++++++++++---------------
 2 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.5.5


