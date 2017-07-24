Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AD5E171BA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 12:01:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 05:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,406,1496127600"; d="scan'208";a="128576456"
Received: from mwidmer-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.43.109])
	by orsmga005.jf.intel.com with ESMTP; 24 Jul 2017 05:01:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: stanley.cheong.kwan.phoong@intel.com
Date: Mon, 24 Jul 2017 14:01:27 +0200
Message-ID: <1662782.hHM3NLgNj3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1500884703-154582-4-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1500884703-154582-4-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 3/3] recipetool: create: handle git URLs specifying only a tag
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
X-List-Received-Date: Mon, 24 Jul 2017 12:01:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 24 July 2017 10:25:03 AM CEST Chang Rebecca Swee Fun wrote:
> Also, during the
> creation of recipe, it seems that the automation for replacing
> ${PV} at the SRCURI for tag, (e.g mbed-tls-${PV}) is causing some
> issue due to PV assuming it's a git source. A fix is implemented in
> this patch as a workaround for this issue. This fix will be submitted
> in a separate patch as a separate issue.

This patch seems to include the complete fix for this, which we'd discussed 
being a separate patch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

