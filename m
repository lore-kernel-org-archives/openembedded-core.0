Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9C387685E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:28:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2015 05:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="781166567"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2015 05:28:34 -0700
Message-ID: <55C8993C.2070303@linux.intel.com>
Date: Mon, 10 Aug 2015 15:29:48 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>	
	<cover.1438956967.git.alexander.kanavin@linux.intel.com>	
	<45936f059111b38f8850d5972db1ea1485dee82a.1438956967.git.alexander.kanavin@linux.intel.com>	
	<7FCE78C2-85DC-44BF-8C64-7912AB432468@gmail.com>
	<1439162974.30467.156.camel@linuxfoundation.org>
In-Reply-To: <1439162974.30467.156.camel@linuxfoundation.org>
Subject: Improving SRCPV? (was: Re: [PATCH 3/7] gptfdisk: update to 1.0.0)
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
X-List-Received-Date: Mon, 10 Aug 2015 12:28:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/10/2015 02:29 AM, Richard Purdie wrote:

>> its always preferable to have PV contain SRCPV for recipes using SCM based fetch mechanism. Don’t drop it
>
> There has been discussion about this in other threads and the conclusion
> reached is that where there is a specific version being selected, having
> PV of that specific version is a good thing. With "1.0.0+gitXXX" its
> unclear if its really 1.0.0 or not.

Yes. When SCM is used to fetch a pristine tagged release, adding SRCPV 
just adds unnecessary clutter. My understanding is that SRCPV is only 
there to enforce package version going forwards when changing one git 
snapshot for a later git snapshot, when both are based on the same 
tagged release.

Alex

