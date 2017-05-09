Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81A89601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 06:54:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 08 May 2017 23:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,313,1491289200"; d="scan'208";a="1166564336"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2017 23:54:45 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 14:54:50 +0800
Message-Id: <1494312891-27807-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2] ghostscript: fix warnings when building for arduino-101-sss
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
X-List-Received-Date: Tue, 09 May 2017 06:54:46 -0000

Hi Ross,

Thanks for your feedback on the previous implementation using
anonymous python and suggesting a neater solution with
COMPATIBLE_HOST.

I have revised the fix implementation and build with meta-zephyr
to verify the WARNINGS are resolved and ghostscript should be skipped
whenever target arch is "arc".

Thanks,
Rebecca

Chang Rebecca Swee Fun (1):
  ghostscript: check for incompatible host

 meta/recipes-extended/ghostscript/ghostscript_9.20.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.7.4


