Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5C471A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:51:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 23:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,367,1493708400"; d="scan'208";a="870166554"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2017 23:50:56 -0700
From: Choong YinThong <yin.thong.choong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:41:12 -0700
Message-Id: <1498002073-168422-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@intel.com, core-dev@eclists.intel.com, saul.wold@intel.com
Subject: [PATCH] Update script yocto-bsp for custom linux kernel creation
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
X-List-Received-Date: Wed, 21 Jun 2017 06:51:05 -0000

Update script/yocto-bsp to fix missing file 
{machine}-user-feature.scc when execute 
script/yocto-bsp custom linux kernel creation.

Choong YinThong (1):
  script/yocto-bsp: Fail to add kernel feature in custom     linux
    kernel

 .../target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb        | 1 +
 .../recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc    | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom/machine-user-features.scc

-- 
2.7.4


