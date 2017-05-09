Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C25C70018
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 00:39:03 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 17:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,311,1491289200"; d="scan'208";a="99545503"
Received: from nmaideen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.208])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2017 17:39:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 12:38:38 +1200
Message-Id: <cover.1494290288.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/1] Buildhistory fix
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
X-List-Received-Date: Tue, 09 May 2017 00:39:04 -0000

The following changes since commit 123962018251dfb1d6ca5aa5c0d02534007de3ab:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/buildhistory-fix1

Paul Eggleton (1):
  classes/buildhistory: fix failures collecting output signatures

 meta/classes/buildhistory.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.9.3


