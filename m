Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AE0C87FD2
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 12:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web11.7058.1752913739624648453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jul 2025 01:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Vg5RUHXX;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: lkp@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752913739; x=1784449739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4eRGrkNw5Cb+IWU2kFLOeD/+YDj6S0Mo45vQlVKl17o=;
  b=Vg5RUHXXW4ME51Taa8Cpk8Kb2WBKiPB32XXw4rTpsWZgRJneh/dR/0Sp
   cFNvoXJ0oAhqMltxLFN9RtstxULd0S+Yh0piTLrTCfoxo/OoJtTalJWsn
   CzUCE8AW0ZD9VM9zh+J5yFLrALvFuUg6mRjBs/QdY+IiW+sG8pO/ii9WX
   SjrffSZ5beKcRjAmRhjMhokSZBzGKo6alXArIO1bcaMLvkdHOB6ltaufH
   mqGmbSnxq5BG/o2p/hjCMCgIxlrCJHIwGfwSnSCfGURo79y/b3od1xZ8h
   Lb7mms2JuhCI6sjo59E3xlhw0inJ3jZE2UNyT6pIIFFmpA0qMyn2ez7I4
   w==;
X-CSE-ConnectionGUID: qureXXyRTOeOJx8Bs9PXbg==
X-CSE-MsgGUID: 3Aa/2aa2TfSL1/AV/C/24Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="59011642"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="59011642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 01:25:54 -0700
X-CSE-ConnectionGUID: +7S6gRYbTFKNwAB/ImkwEw==
X-CSE-MsgGUID: K0XQRP2vRl6ZkaKXZaYvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="164052562"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jul 2025 01:25:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud2t9-000FLL-05;
	Sat, 19 Jul 2025 08:25:47 +0000
Date: Sat, 19 Jul 2025 16:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openembedded-core@lists.openembedded.org, patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
Message-ID: <202507191640.Ghk47rXu-lkp@intel.com>
References: <20250718083202.654568-3-macpaul.lin@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250718083202.654568-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221067

Hi Macpaul,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core krzk/for-next linus/master v6.16-rc6]
[cannot apply to next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Macpaul-Lin/arm64-dts-mediatek-mt8395-genio-1200-evk-Move-common-parts-to-dtsi/20250718-163459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250718083202.654568-3-macpaul.lin%40mediatek.com
patch subject: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
config: arm64-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191640.Ghk47rXu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191640.Ghk47rXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191640.Ghk47rXu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts:10.1-8 Label or path ufshci not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

