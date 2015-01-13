Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7D672334
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:50:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 14:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440187481"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.162])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2015 14:38:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 14:50:43 -0800
Message-Id: <cover.1421189008.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] Updates
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
X-List-Received-Date: Tue, 13 Jan 2015 22:50:56 -0000

Richard, Ross:

A few more updates, the rxvt-unicode is additional since it
moved to GPLv3 so keep the older version around.

Sau!

The following changes since commit 2d305cab23e64b83ce9a0e0922c24143c4305992:

  glibc: Fix up minimal build with libc-libm (2015-01-09 14:37:28 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ed5de0c5a61b2542a462629e9c51b2ad80901548
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates2

Saul Wold (3):
  msmtp: Upgrade to 1.6.1
  dtc: Upgrade to 1.4.1 (git based)
  rxvt-unicode: Add Upgraded version 9.21

 .../msmtp/{msmtp_1.4.32.bb => msmtp_1.6.1.bb}      |  6 +-
 meta/recipes-kernel/dtc/dtc_git.bb                 |  4 +-
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb | 65 ++++++++++++++++++++++
 3 files changed, 70 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.4.32.bb => msmtp_1.6.1.bb} (80%)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb

-- 
2.1.0


