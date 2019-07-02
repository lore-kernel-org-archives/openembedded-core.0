Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jul 2019 04:20:06 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 46D6B7D32D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:20:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="166050078"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2019 21:12:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:12:43 +1200
Message-Id: <cover.1562040724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/4] script fixes
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
X-List-Received-Date: Tue, 02 Jul 2019 04:20:06 -0000
Content-Transfer-Encoding: 8bit

A few minor fixes for the ddimage script and one for list-packageconfig-flags.

The following changes since commit 1f8a73261c7a134821c40845da27d8edbb0763b6:

  Revert "pigz: Add debug for autobuilder errors" (2019-06-30 23:33:12 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/ddimage-fixes2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/ddimage-fixes2

Paul Eggleton (4):
  scripts/contrib/ddimage: fix typo
  scripts/contrib/ddimage: replace blacklist with mount check
  scripts/contrib/ddimage: be explicit whether device doesn't exist or
    isn't writeable
  list-packageconfig-flags: print PN instead of P

 scripts/contrib/ddimage                     | 89 +++++++++++++++++----
 scripts/contrib/list-packageconfig-flags.py |  2 +-
 2 files changed, 75 insertions(+), 16 deletions(-)

-- 
2.20.1


