Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 51D1271C27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:57:35 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3A58C68A01C; Wed,  8 Feb 2017 13:57:34 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E96FC68A019;
	Wed,  8 Feb 2017 13:57:33 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id AC02467400D4;
	Wed,  8 Feb 2017 14:57:33 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486561983.3754.4.camel@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <a124d3f3-a46a-e84f-a30e-904e02ce8bc3@mlbassoc.com>
Date: Wed, 8 Feb 2017 14:57:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486561983.3754.4.camel@linux.intel.com>
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
X-List-Received-Date: Wed, 08 Feb 2017 13:57:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-08 14:53, Joshua Lock wrote:
> On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:
>>
>> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>>> This is converging the recipes for go from
>>> meta-virtualization and oe-meta-go
>>>
>>
>> I'm still of the opinion that this should be in meta-go, not oe-core...
>
> FWIW I disagree. Go is a popular systems language and we're increasingly supporting a wide-array of systems with OE
> (from iot to ivi and beyond).
>
> Go is already in wide enough use and duplicated in enough layers that we would be doing folks a favour by including it
> in OE-Core and our build/test cycle.

I agree - if ruby is OE-core worthy, go most certainly is.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

