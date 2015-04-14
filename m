Return-Path: <brendan.le.foll@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9675773912
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 18:54:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Apr 2015 11:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,577,1422950400"; d="scan'208";a="695212944"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2015 11:54:59 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 19:53:47 +0100
Message-Id: <1429037628-5803-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][dizzy] This patch fixes x32 builds broken since openssl update
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
X-List-Received-Date: Tue, 14 Apr 2015 18:55:00 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

I made a mistake rebasing the patch, this is a fix

Brendan Le Foll (1):
  openssl: Fix x32 openssl patch which was not building

 .../openssl/openssl/openssl_fix_for_x32.patch      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.3.5


