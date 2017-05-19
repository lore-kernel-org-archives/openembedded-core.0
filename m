Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E543077F8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 04:12:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 21:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,362,1491289200"; d="scan'208";a="89357194"
Received: from baominli-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.46])
	by orsmga004.jf.intel.com with ESMTP; 18 May 2017 21:12:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 16:11:47 +1200
Message-Id: <cover.1495167095.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/1] scriptutils: fix fetch_uri() to work with RSS
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
X-List-Received-Date: Fri, 19 May 2017 04:12:14 -0000

The following changes since commit ee55b5685aaa4be92d6d51f8641a559d4e34ce64:

  cve-check-tool: backport a patch to make CVE checking work (2017-05-18 14:01:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fetch-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-fetch-fix

Paul Eggleton (1):
  scriptutils: fix fetch_uri() to work with RSS

 scripts/lib/scriptutils.py | 65 +++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 24 deletions(-)

-- 
2.9.4


