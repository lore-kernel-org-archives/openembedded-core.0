Return-Path: <yin.thong.choong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE976079E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 03:34:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 20 Jun 2017 20:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,367,1493708400"; d="scan'208";a="101840890"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2017 20:34:24 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 13:23:37 -0700
Message-Id: <1497990218-94260-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: otc-pg-team@eclists.intel.com, paul.eggleton@intel.com,
	core-dev@eclists.intel.com, saul.wold@intel.com
Subject: [PATCH v4] Prompt error message on missing setting for
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
X-List-Received-Date: Wed, 21 Jun 2017 03:34:25 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Prompt error message on missing setting in machine.conf for 
UBI and UBIFS image creation.

Choong YinThong (1):
  image_types.bbclass: Prompt error message on missing setting     in
    UBI and UBIFS

 meta/classes/image_types.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.7.4


