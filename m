Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 2B57A711D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:33:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5A4A3F811FD; Thu, 28 Aug 2014 08:33:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id CCFF3F811F6;
	Thu, 28 Aug 2014 08:33:08 -0600 (MDT)
Message-ID: <53FF3DB5.2000004@mlbassoc.com>
Date: Thu, 28 Aug 2014 08:33:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1409210206.29296.129.camel@ted>	<53FED7DC.6050707@pseudoterminal.org>
	<1409235837.29296.143.camel@ted>
In-Reply-To: <1409235837.29296.143.camel@ted>
Subject: Re: 1.7 release feature freeze deadline this Friday
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
X-List-Received-Date: Thu, 28 Aug 2014 14:33:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-28 08:23, Richard Purdie wrote:
> On Thu, 2014-08-28 at 09:18 +0200, Carlos Rafael Giani wrote:
>> On 08/28/2014 09:16 AM, Richard Purdie wrote:
>>> If you've been in the various calls or read the minutes you'd know about
>>> this but it was mentioned to me that it has not been highlighted on the
>>> mailing list.
>>>
>>> The M3 milestone close is the end of the week and this marks the feature
>>> freeze point for the 1.7 release. We do have M4 after this but that is a
>>> bug fixing and stabilisation milestone.
>>>
>>> There are some things I may still consider into M4, particular if
>>> they're related to the stated objectives of the release, specifically
>>> the developer workflow enhancements which is running behind schedule. As
>>> time progresses, it will be increasingly unlikely things of that nature
>>> will merge though.
>>>
>>> So if there are things you are after to see in 1.7 time is running out,
>>> I at least need to be aware of them ASAP.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>> Has the GCC 4.9 situation been solved? At least Chromium was failing to
>> build with it. Other packages were affected as well.
>
> We merged in various gcc updates including a fix for the infamous kernel
> bug afaik. I don't know the situation with chromium but that did sound
> like a chromium issue rather than gcc...
>
> If we're missing patches to gcc please do shout out but I'm not seeing
> bugs which suggest we should default back to 4.8 at this point.

It's not just chromium - midori (at least on ARM) also fails
miserably with 4.9 (I've not tried it with the recent changes)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

