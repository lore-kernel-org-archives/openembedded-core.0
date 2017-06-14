Return-Path: <yin.thong.choong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6C46278288
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 00:42:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 14 Jun 2017 17:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,341,1493708400"; d="scan'208";a="274434868"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2017 17:42:01 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 10:31:16 -0700
Message-Id: <1497461477-151292-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: otc-pg-team@eclists.intel.com, paul.eggleton@intel.com, saul.wold@intel.com
Subject: [PATCH] ubi and ubifs image compression failed
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
X-List-Received-Date: Thu, 15 Jun 2017 00:42:09 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Default argument added into bbclass for 
ubi and ubifs image creation

Choong YinThong (1):
  image_types.bbclass: Added default argument for ubi and ubifs    
    image creation

 meta/classes/image_types.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.7.4


