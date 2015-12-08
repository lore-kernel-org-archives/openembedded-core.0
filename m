Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 346BD606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 02:42:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2015 18:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,397,1444719600"; 
   d="scan'208";a="9286396"
Received: from schan8-mobl7.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.63])
	by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2015 18:42:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 15:42:37 +1300
Message-Id: <cover.1449542331.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Fix ext SDK installer regression
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
X-List-Received-Date: Tue, 08 Dec 2015 02:43:02 -0000

The following changes since commit 687e5ef86361a16d6c411386939d4ba96a5909ea:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:31:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sdk-env-fix3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdk-env-fix3

Paul Eggleton (1):
  toolchain-shar-extract.sh: ensure cleaned environment will work for ext SDK

 meta/files/toolchain-shar-extract.sh | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.5.0


