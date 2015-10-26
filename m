Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CDAB476EB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 13:28:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 26 Oct 2015 06:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,201,1444719600"; d="scan'208";a="803198976"
Received: from randjicd-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.7])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2015 06:28:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2015 13:28:25 +0000
Message-Id: <cover.1445866022.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for oe-selftest failure
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
X-List-Received-Date: Mon, 26 Oct 2015 13:28:52 -0000

Fix an oe-selftest failure seen testing master-next on the Yocto
Project autobuilder.


The following changes since commit 73f8a0bf3b99d480bf97e266da0fb048714b4caf:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/deco-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/deco-fix

Paul Eggleton (1):
  oeqa/utils/decorators: fix missing keyword arguments on decorators

 meta/lib/oeqa/utils/decorators.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.1.0


