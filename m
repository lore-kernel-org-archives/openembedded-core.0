Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 256DB6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 21:39:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 13:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,285,1449561600"; d="scan'208";a="889200382"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 13:39:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 10:39:02 +1300
Message-Id: <cover.1452634698.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Additional extensible SDK fix
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
X-List-Received-Date: Tue, 12 Jan 2016 21:39:30 -0000

This should have been included in my earlier series (and should be
applied on top of it).


The following changes since commit b12177a5a627861a191addeec5294548c38949ba:

  classes/populate_sdk_ext: check that extensible SDK prepared correctly (2016-01-13 07:44:58 +1300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes4-oe-addendum
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes4-oe-addendum

Paul Eggleton (1):
  classes/populate_sdk_ext: avoid unnecessary sstate being brought in

 meta/classes/populate_sdk_ext.bbclass | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

-- 
2.5.0


