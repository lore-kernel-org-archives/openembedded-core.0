Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BBD066E650
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 17:53:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zF5c70wqnz1qwHK;
	Sun,  7 Jan 2018 18:53:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zF5c70kpvz1sFWd;
	Sun,  7 Jan 2018 18:53:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 2a1NNOtyPATP; Sun,  7 Jan 2018 18:53:26 +0100 (CET)
X-Auth-Info: 5MDGrR34+2bAxIlId7N59qQwpWTq4Tei7JBZQ3pf2Qs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  7 Jan 2018 18:53:26 +0100 (CET)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
	<CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2c1c48a3-5355-b3eb-fab0-765a007b8475@denx.de>
Date: Sun, 7 Jan 2018 18:53:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Add optional patch_xenomai task
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
X-List-Received-Date: Sun, 07 Jan 2018 17:53:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/07/2018 05:42 PM, Bruce Ashfield wrote:
> On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote:
>> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
>>>> Add additional task, do_patch_xenomai, inserted between do_patch and
>>>> do_configure tasks. This task applies the cobalt patch to the kernel
>>>> sources for a specific machine. This is disabled by default, so use
>>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>>>>
>>>> You will also need a kernel recipe for a kernel version with ipipe
>>>> patch applied.
>>>
>>> This doesn't make any sense to me.
>>>
>>> Why on earth would this be in kernel.bbclass ? and part of a xenomai
>>> recipe ?
>> Do you have a better suggestion how to make this easily available for
>> every kernel recipe ?
> 
> There's no need to make it available for every kernel recipe. If someone
> wants to build xenomai, they need to have a specific kernel recipe and
> configuration to make it work. By providing that patch and allowing it to
> be applied to any kernel doesn't mean it will actually work .. so you aren't
> doing anyone any favours.
> 
> The same thing could be said for the -rt patch, aufs, etc, any patch could
> be made available for any kernel, but they aren't, since they will either fail
> to patch, or won't work at runtime.
We actually have a -rt patch available in the kernel recipes, so why not
xenomai patch ?

-- 
Best regards,
Marek Vasut

