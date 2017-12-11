Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9BE7864F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 02:44:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Dec 2017 18:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,391,1508828400"; 
   d="scan'208";a="1424714"
Received: from madhukar-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.170])
	by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2017 18:44:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 15:44:19 +1300
Message-Id: <cover.1512960174.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] swig: add patch to support Node.js 7+
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
X-List-Received-Date: Mon, 11 Dec 2017 02:45:00 -0000

The following changes since commit ced4ac760926ce43a937dad2be3b873b1beec6aa:

  multilib_global: Handle PREFERRED_RPROVIDER (2017-12-10 22:45:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/swig-nodejs-7
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/swig-nodejs-7

Paul Eggleton (1):
  swig: add patch to support Node.js 7+

 .../0001-Add-Node-7.x-aka-V8-5.2-support.patch     | 330 +++++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb          |   1 +
 2 files changed, 331 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig/0001-Add-Node-7.x-aka-V8-5.2-support.patch

-- 
2.9.5


