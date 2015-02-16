Return-Path: <brendan.le.foll@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEBA60556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 11:18:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 03:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,587,1418112000"; d="scan'208";a="455223141"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2015 03:03:41 -0800
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 11:18:28 +0000
Message-Id: <1424085509-25433-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.2.1
Cc: Brendan Le Foll <brendan.le.foll@intel.com>
Subject: [PATCH] openssl: disable SSLv3 by default
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
X-List-Received-Date: Mon, 16 Feb 2015 11:18:40 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

SSLv3 should be disabled because of POODLE, this patch disables it completely

Brendan Le Foll (1):
  openssl: disable SSLv3 by default

 meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.2.1


