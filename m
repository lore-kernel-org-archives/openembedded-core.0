Return-Path: <brendan.le.foll@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 95B8071F05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 15:45:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2015 07:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="687944346"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2015 07:45:17 -0800
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 15:45:09 +0000
Message-Id: <1424360710-29501-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.2.1
Cc: Brendan Le Foll <brendan.le.foll@intel.com>
Subject: [PATCH v2] openssl: disable SSLv3 by default
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
X-List-Received-Date: Thu, 19 Feb 2015 15:45:17 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Does the same thing but now uses PACKAGECONFIG as discussed on this ML

Brendan Le Foll (1):
  openssl: disable SSLv3 by default

 meta/recipes-connectivity/openssl/openssl.inc | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.2.1


