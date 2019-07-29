Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5927F284
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 21:54:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jul 2019 14:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="174023907"
Received: from jsithir-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.189.107])
	by orsmga003.jf.intel.com with ESMTP; 29 Jul 2019 14:54:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 09:54:41 +1200
Message-Id: <cover.1564437221.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/2] A couple of fixes for create-pull-request
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
X-List-Received-Date: Mon, 29 Jul 2019 21:54:54 -0000
Content-Transfer-Encoding: 8bit

Fixes for a couple of minor issues with the create-pull-request script.

The following changes since commit a62d60fc3741aa5eaeccaaa562afda624c3e8a04:

  weston: upgrade 6.0.0 -> 6.0.1 (2019-07-27 22:45:24 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/create-pull-request
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/create-pull-request

Paul Eggleton (2):
  scripts/create-pull-request: improve handling of non-SSH remote URLs
  scripts/create-pull-request: fix putting subject containing / into cover letter

 scripts/create-pull-request | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

-- 
2.20.1


