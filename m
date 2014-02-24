Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 933A46F33F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:17:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1OHH8TT019801
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:17:08 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 24 Feb 2014 09:17:07 -0800
Message-ID: <530B7E92.9090109@windriver.com>
Date: Mon, 24 Feb 2014 11:17:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>	<52C0CDD6.4030904@windriver.com>
	<5014991.yOqVctVWSl@helios>	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
	<1393261200.31769.17.camel@ted>
In-Reply-To: <1393261200.31769.17.camel@ted>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Mon, 24 Feb 2014 17:17:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/24/14, 11:00 AM, Richard Purdie wrote:
> On Mon, 2014-02-24 at 16:38 +0000, Paul Eggleton wrote:
>> On Monday 30 December 2013 12:59:26 Paul Eggleton wrote:
>>> On Monday 30 December 2013 09:35:18 Robert Yang wrote:
>>>> I'm afraid that the standardlinux maybe a little confused with
>>>> linuxstdbase, bu I don't have any better idea about it.
>>>
>>> You could be right. I've thought for a long time about renaming this and
>>> haven't been able to come up with anything better. On the other hand, in our
>>> current configuration we are actually using the basic/standardlinux
>>> packagegroup as part of our LSB images; although that might not be the
>>> right thing to continue doing - LSB probably ought to be independent.
>>>
>>> FWIW, let's consider this particular patch as RFC, maybe someone else has a
>>> better idea of what to name it. I am very much convinced that "basic" is not
>>> the right name though.
>>
>> So, has anyone got any better ideas for the name of core-image-basic and
>> packagegroup-core-basic?
>>
>> The idea is that these are meant to contain things that you might have on a
>> more traditional or full-featured Linux system. Somehow "-traditionallinux"
>> doesn't really work either.
>
> "fulllinux"?
>
> "linuxcmdline"?

I've resolved this naming conundrum in the past by simply having a document that 
explains what the name means.  "basic - basic command line utilities"

I agree basic isn't the most descriptive name, but I'm not sure what is.

--Mark

> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


