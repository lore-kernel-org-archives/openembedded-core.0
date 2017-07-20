Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 96B9078265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 03:26:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 20:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,382,1496127600"; d="scan'208";a="109914880"
Received: from phoongst-mobl2.png.intel.com ([10.221.23.181])
	by orsmga004.jf.intel.com with ESMTP; 19 Jul 2017 20:26:42 -0700
From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 11:26:36 +0800
Message-Id: <1500521197-6119-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Thu, 20 Jul 2017 03:26:42 -0000

This patch depends on Rebecca's patch on Bug #11389. Her patch has already
been submitted into the mailing list.
lists.openembedded.org/pipermail/openembedded-core/2017-July/139574.html

Please patch mine together with her patch.

Stanley Phoong (1):
  recipetool: create: handle git URLs specifying only a tag

 scripts/lib/recipetool/create.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
2.7.4


