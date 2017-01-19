Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0589E719AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 20:36:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2017 12:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,255,1477983600"; d="scan'208";a="1096386089"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2017 12:36:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 09:35:59 +1300
Message-Id: <cover.1484858091.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] devtool: check locale and refuse to start if it isn't UTF-8
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
X-List-Received-Date: Thu, 19 Jan 2017 20:36:08 -0000

The following changes since commit a7cb408dd784178197687a2129e936620bf6a0d3:

  sanity.bbclass: Improved error message (2017-01-17 11:31:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-utf8
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-utf8

Paul Eggleton (1):
  devtool: check locale and refuse to start if it isn't UTF-8

 scripts/devtool | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.5.5


