Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 25A4B60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 16:02:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 17 Aug 2015 09:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,695,1432623600"; d="scan'208";a="750223991"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2015 09:02:58 -0700
Message-ID: <55D20605.6050008@linux.intel.com>
Date: Mon, 17 Aug 2015 19:04:21 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
	<55CEC72D.4060702@windriver.com> <55D1D9E7.6070309@linux.intel.com>
	<D110DB7D-32DE-4EA4-9BDF-AAF02AD5C7F1@gmail.com>
In-Reply-To: <D110DB7D-32DE-4EA4-9BDF-AAF02AD5C7F1@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/22] midori: remove the recipe and replace references to midori with epiphany
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
X-List-Received-Date: Mon, 17 Aug 2015 16:03:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2015 06:48 PM, Khem Raj wrote:

>>> Mips64 support using the newer webkitgtk may be better.
>>> Wenzong please check on that once this code is in master-next
>>> and reply here.
>>
>> Latest Webkit (2.8.5) actually does build for MIPS64 (where 2.8.4 failed), but I couldn't find a way to test the n32 variant using poky - any suggestions?
>
>
> may be you can use multilib on same mips64 configuration and build libn32-epiphany ?

Thanks, I'll also try to see if powerpc64 build can be tested the same 
way, because it was not, for the same reason (poky has a configuration 
for ppc, but not ppc64).


Alex

