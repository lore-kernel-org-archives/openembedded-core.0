Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D09FC77F6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 02:02:59 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 28 May 2017 19:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,412,1491289200"; d="scan'208";a="107709373"
Received: from iho2-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.160.82])
	by fmsmga005.fm.intel.com with ESMTP; 28 May 2017 19:02:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 14:01:55 +1200
Message-Id: <cover.1496022724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [pyro][PATCH 0/1] scriptutils: fix fetch_uri() to work with RSS
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
X-List-Received-Date: Mon, 29 May 2017 02:03:00 -0000

Backported from master.

The following changes since commit 3195f7e68eb5cfb2af3506fe4b0dcb2f8cd9ee10:

  cryptodev-linux: update SRC_URI (2017-05-27 14:51:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fetch-fix-pyro
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-fetch-fix-pyro

Paul Eggleton (1):
  scriptutils: fix fetch_uri() to work with RSS

 scripts/lib/scriptutils.py | 65 +++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 24 deletions(-)

-- 
2.9.4


