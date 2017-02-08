Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E598B71C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:16:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 08 Feb 2017 06:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="818489046"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 06:16:24 -0800
To: openembedded-core@lists.openembedded.org
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486561983.3754.4.camel@linux.intel.com>
	<a124d3f3-a46a-e84f-a30e-904e02ce8bc3@mlbassoc.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5cbb387d-3d38-a7c0-f5a8-84d0a9e98109@linux.intel.com>
Date: Wed, 8 Feb 2017 16:16:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <a124d3f3-a46a-e84f-a30e-904e02ce8bc3@mlbassoc.com>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 14:16:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2017 03:57 PM, Gary Thomas wrote:

>> FWIW I disagree. Go is a popular systems language and we're
>> increasingly supporting a wide-array of systems with OE
>> (from iot to ivi and beyond).
>>
>> Go is already in wide enough use and duplicated in enough layers that
>> we would be doing folks a favour by including it
>> in OE-Core and our build/test cycle.
>
> I agree - if ruby is OE-core worthy, go most certainly is.

Ruby is in oe-core only because it's needed by webkit.

As an oe-core maintainer, I think the bar for adding stuff to oe-core 
should be higher than "it's popular" or "various existing layers are 
causing duplication of effort and aren't cooperating". The more things 
we have to support, the less time there is to do a good job with any 
specific item.

Alex

