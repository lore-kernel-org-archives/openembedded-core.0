Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 75C5260796
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 03:43:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2016 19:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,523,1444719600"; d="scan'208";a="853623731"
Received: from hlee31-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.9])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2016 19:43:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:43:20 +1300
Message-Id: <cover.1451965306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] classes/buildhistory: actually use KiB in extensible SDK sizes files
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
X-List-Received-Date: Tue, 05 Jan 2016 03:43:41 -0000

Fix a minor mistake in my recent buildhistory extensible SDK changes.


The following changes since commit 1568f4fa1c8f8abd9b365ecd264841cd4f6b66b1:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-sdk-kib
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-sdk-kib

Paul Eggleton (1):
  classes/buildhistory: actually use KiB in extensible SDK sizes files

 meta/classes/buildhistory.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.5.0


