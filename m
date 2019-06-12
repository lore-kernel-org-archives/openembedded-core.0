Return-Path: <compudj@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 76C2E7E77D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:29:50 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 4101E246627;
	Wed, 12 Jun 2019 07:29:51 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id RfwgDi1956Ss; Wed, 12 Jun 2019 07:29:50 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 964F0246620;
	Wed, 12 Jun 2019 07:29:50 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 964F0246620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1560338990;
	bh=ZUhT/P24nrFEuZN85ojLdL+6sv+rshZlTU4TQlnhlHo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=s+4dFgCfV3UnNanhZX+WSRMm9AP7BXyToAlSJpujXpOW/TgeFfxiYac+H7BwJrgXO
	NN3HtPxTRaAXx2ASAKWN5gV7QLanIuWyGQRkWA3+YQY39DErqfBc7dQWae5m5908UJ
	QWw0LobTwMWvwgm4c02UXD4JqBinZ8oWeeX/3PwXbXQI0RDnD+0YrjxGiLxTUB/YC2
	97bBGDzpaBkD62rIlyOuzI//n+LDA951hhFZ8Itii3MjzBM2zj8SgkMjDwjEakE4kQ
	wY3emw4VTxmLf5q3GaLkSt4pN4ucDWZih2+/VfSBCggTKP2EYpLivJCMIlCdAOGeq5
	UP2gGgFzX3XXQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id nHhw4mrqB1bX; Wed, 12 Jun 2019 07:29:50 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
	by mail.efficios.com (Postfix) with ESMTP id 7D1CA24661A;
	Wed, 12 Jun 2019 07:29:50 -0400 (EDT)
Date: Wed, 12 Jun 2019 07:29:50 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: zhe he <zhe.he@windriver.com>
Message-ID: <928433718.42889.1560338990358.JavaMail.zimbra@efficios.com>
In-Reply-To: <0ea3a599-7adb-a001-dbdd-3843d0fa8b6e@windriver.com>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<20190612105114.GA23143@localhost>
	<1859381600.42862.1560337102909.JavaMail.zimbra@efficios.com>
	<0ea3a599-7adb-a001-dbdd-3843d0fa8b6e@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.12_GA_3803 (ZimbraWebClient - FF67 (Linux)/8.8.12_GA_3794)
Thread-Topic: lttng-modules: Backport patches to fix compilation failures
	since kernel v5.1
Thread-Index: +p6sXcRQWD07cSSIAbyL81pBWAYowg==
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Jeremie Galarneau <jgalar@efficios.com>,
	lttng-dev <lttng-dev@lists.lttng.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Wed, 12 Jun 2019 11:29:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- On Jun 12, 2019, at 1:10 PM, zhe he zhe.he@windriver.com wrote:

> On 6/12/19 6:58 PM, Mathieu Desnoyers wrote:
>> ----- On Jun 12, 2019, at 12:51 PM, Adrian Bunk bunk@stusta.de wrote:
>>
>>> On Tue, Jun 11, 2019 at 11:49:34PM +0100, Richard Purdie wrote:
>>>> On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
>>>>> From: He Zhe <zhe.he@windriver.com>
>>>>>
>>>>> For the moment,
>>>>> 0001~0004 are on master branch only.
>>>>> 0005~0007 are on stable-2.11 branch, but v2.11 has not been released
>>>>> yet.
>>>>>
>>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>>> ---
>>>>> v2: Correct a typo in SOB for 0001*.patch
>>>> I just discussed this with lttng upstream maintainers a little. We're
>>>> going to have continual tension between keeping lttng-modules up to
>>>> date and new kernel versions.
>>>>
>>>> How about we also have a git version of this particular recipe which
>>>> has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
>>>> PREFERRED_VERSION when using newer kernels?
>>> Yocto stable series will ship a _git AUTOREV recipe?
>>>
>>>> That should keep people using very recent kernels happy, let us use a
>>>> stable release version and avoid us adding/removing large patchsets on
>>>> a semi regular basis?
>>>> ...
>>> The semi regular basis is only slightly moved, or how and when will
>>> replacing the already EOL kernel 5.0 with 5.1 in Yocto be handled?
>>>
>>> IMHO it would be better to acknowledge that this is a case where staying
>>> at stable release versions is sometimes not the best option, and upgrade
>>> the normal recipe to -rc releases or even a git snapshot from a more
>>> recent stable branch when necessary.
>>>
>>> E.g. right now it seems clear that the next Yocto release will have
>>> to use lttng-modules >= 2.11 in any case for kernel 5.2, so upgrading
>>> from 2.10.9 to 2.11.0-rc5 would be logical.
>> Please don't base distributions on -rc tags. They are not meant for this.
>>
>> We always integrate support for newer kernel versions instrumentation back
>> into our current stable release. So as soon as 5.2 final comes out, we will
>> release a 2.10.x version including support for it in lttng-modules.
> 
> I'm one of the people who need to use lttng-modules on rc kernel.
> 
>>
>> The current 2.10.10 has commits to support the currently known 5.2-rc
>> instrumentation changes.
> 
> Seems v2.10.10 does not contains the 7 needed patches in my v1 for kernel v5.0+.
> $ git pull
> Already up-to-date.
> $ git tag|grep v2.10.10
> v2.10.10
> $ git tag --contains 92da05ce1f73488a57e7fd79e9c03113cefdb76f
> $ git tag --contains d88e2fe5c3ea0d2c3055fba824be17223c418854
> $ git tag --contains d6cd2c9598a06f0ba1ba885bbe754e8836528310
> $ git tag --contains 2ca0c84f0b4a915c555a0b83102d94ac941619ca
> $ git tag --contains da00122ccfae6a73ec859826a0be1cf0902cfd11
> v2.11.0-rc5
> $ git tag --contains da00122ccfae6a73ec859826a0be1cf0902cfd11
> v2.11.0-rc5
> $ git tag --contains df0e746a05a267384785d66c9fca947eb4a9e517
> v2.11.0-rc5
> $ git tag --contains 9f70b60c19abc6dc0811e427ed5da4aa74620aca
> v2.11.0-rc5

You're aware that the commit ID changes when we cherry-pick
a commit right ?

Please double-check with the commit names...

Thanks,

Mathieu


> 
> Thanks,
> Zhe
> 
>>
>> Thanks,
>>
>> Mathieu
>>
>>
>>>> Cheers,
>>>>
>>>> Richard
>>> cu
>>> Adrian
>>>
>>> --
>>>
>>>       "Is there not promise of rain?" Ling Tan asked suddenly out
>>>        of the darkness. There had been need of rain for many days.
>>>       "Only a promise," Lao Er said.
> >>                                        Pearl S. Buck - Dragon Seed

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

