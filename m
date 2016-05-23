Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E84D60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:36:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 23 May 2016 06:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="812883071"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 May 2016 06:35:52 -0700
To: openembedded-core@lists.openembedded.org
References: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
	<5dbd238f28ac08a748bbdcd549286a8d48da9c2c.1464004128.git.jussi.kukkonen@intel.com>
	<5742FDE2.1090306@linux.intel.com>
	<1464009007.9570.21.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <57430774.7000805@linux.intel.com>
Date: Mon, 23 May 2016 16:36:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1464009007.9570.21.camel@linuxfoundation.org>
Subject: Re: [PATCH 5/5] matchbox-keyboard: Upgrade
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
X-List-Received-Date: Mon, 23 May 2016 13:36:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2016 04:10 PM, Richard Purdie wrote:
>>> -SRCREV = "ebc330eac8b9d38e9aef9f01e7241c904bd01073"
>>> +SRCREV = "69d03e2aceb79cf7a616c07f8e0be4e1f9f7976b"
>>>    PV = "0.0+git${SRCPV}"
>>
>> This is a good moment to start using git version tags instead of just
>> updating commit ids.
>>
>> Let's bring down the amount of 'unknown' upstream versions to zero or
>> close to it:
>>
>> http://recipes.yoctoproject.org/rrs/recipes/2.2/M1/?upstream_status=U
>> nknown#
>
> Sadly, "tags" need a network to resolve them and hence using them means
> the metadata doesn't work standalone. We can't do that.

I need to clarify: I would like the version number in PV to match an 
existing upstream version tag. So that the upstream version check works 
correctly.

The actual git revision for builds will continue to be determined by 
commit ids in SRCREV.

Alex

