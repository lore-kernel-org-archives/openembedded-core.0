Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 45E9C606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 12:54:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Aug 2015 05:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="785616578"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2015 05:54:45 -0700
Message-ID: <55D1D9E7.6070309@linux.intel.com>
Date: Mon, 17 Aug 2015 15:56:07 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org, 
	Wenzong Fan <wenzong.fan@windriver.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
	<55CEC72D.4060702@windriver.com>
In-Reply-To: <55CEC72D.4060702@windriver.com>
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
X-List-Received-Date: Mon, 17 Aug 2015 12:54:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2015 07:59 AM, Randy MacLeod wrote:

>> -# midori depends on webkit-gtk which could not build for mips64
>> -MIDORI = "midori"
>> -MIDORI_mips64 = ""
>> -MIDORI_mips64n32 = ""
>> +# epiphany depends on webkitgtk which could not build for mips64
>> +EPIPHANY = "epiphany"
>> +EPIPHANY_mips64 = ""
>> +EPIPHANY_mips64n32 = ""
>
> Mips64 support using the newer webkitgtk may be better.
> Wenzong please check on that once this code is in master-next
> and reply here.

Latest Webkit (2.8.5) actually does build for MIPS64 (where 2.8.4 
failed), but I couldn't find a way to test the n32 variant using poky - 
any suggestions?

I'll drop the above lines for now.


Alex

