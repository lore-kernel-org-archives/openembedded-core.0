Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 49F0771989
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 21:34:08 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 11 Oct 2016 14:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,330,1473145200"; d="scan'208";a="19062437"
Received: from umukherj-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.96])
	by orsmga004.jf.intel.com with ESMTP; 11 Oct 2016 14:34:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 10:33:46 +1300
Message-Id: <cover.1476221600.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Fix for re-running do_configure with externalsrc
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
X-List-Received-Date: Tue, 11 Oct 2016 21:34:09 -0000

The following changes since commit 806a910927f479207d47b06c20a0497e91203266:

  sysklogd and busybox: ignore return code from init script stop (2016-10-11 22:18:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/externalsrc-configure
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/externalsrc-configure

Paul Eggleton (1):
  classes/externalsrc: re-run do_configure when configure files change

 meta/classes/autotools.bbclass   |  2 ++
 meta/classes/cmake.bbclass       |  2 ++
 meta/classes/externalsrc.bbclass | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

-- 
2.5.5


