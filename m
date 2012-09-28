Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1THcQ9-00021Q-FF
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:24:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Sep 2012 08:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,502,1344236400"; d="scan'208";a="150309345"
Received: from costin-desktop (HELO [10.237.105.60]) ([10.237.105.60])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2012 08:11:10 -0700
Message-ID: <5065B14B.6080204@intel.com>
Date: Fri, 28 Sep 2012 17:16:43 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
	<CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
	<50656473.2040409@intel.com>
	<CAJTo0Lb7bqrjKDr-cQLSuKB2bsKoNo=zbzd3WC9cq16bKmu7LQ@mail.gmail.com>
	<5065904E.9080208@intel.com>
	<CF4AF9D3EAC5423B9F39CDED1CA5411C@intel.com>
In-Reply-To: <CF4AF9D3EAC5423B9F39CDED1CA5411C@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: fix mDNS resolving speed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 15:24:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2012 04:05 PM, Ross Burton wrote:
> On Friday, 28 September 2012 at 12:55, Constantin Musca wrote:
>> Tests:
>>
>> 1. Without fix:
>> real 0m4.461s
>> user 0m0.034s
>> sys 0m0.086s
>>
>> 2. With fix:
>> real 0m0.842s
>> user 0m0.066s
>> sys 0m0.122s
>>
>> As you can see, there is a speed improvement.
> Excellent.
>
> I'll ask it before Martin does - should we handle upgrading users from an old libnss-mdns with the old line?
>
> Ross
>
>
I'll send patch v2 which handles upgrading.

Constantin


