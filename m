Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9B36773237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:24:34 +0000 (UTC)
Received: by igk11 with SMTP id 11so61171657igk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SOMX10MA4lg+RKs5sXXWsw+TIyOYcHXSJVmUyCDujKE=;
	b=j4xD2FyeoBCted5U/elGxLLLwfvSQj6WvvUgnQEDxHi/zyjMriVHKlVx9xKhHovqoV
	k5RPQrGUKLFAjjCm6f0dfKVX3/SyjLsnjMkJ7w681zP96Ecp1gAVPT+/lBgdEVx4bgtj
	eFtuGpcBGe+wi58sEeWlea/6DmDdnj4hxkYlL1+KGtVxVnDMZxcs9bxU9HVW8AbgG2CS
	LwSnzbjNA+OgQ4FLnju2gQEODpAGNXKcy5ZcfSdPCKV95eng9UKZRxyvWfoYffiOuwfU
	mI2ZfTZoQPOdq3fOQujQ2XbAzfscFRhTUQoOpo2YNhqXyjHodk2k17JolRoFwM3HBnrd
	ZpCQ==
MIME-Version: 1.0
X-Received: by 10.107.153.66 with SMTP id b63mr43508666ioe.101.1438003474960; 
	Mon, 27 Jul 2015 06:24:34 -0700 (PDT)
Received: by 10.36.21.200 with HTTP; Mon, 27 Jul 2015 06:24:34 -0700 (PDT)
In-Reply-To: <55B6300F.7060104@windriver.com>
References: <1437989436.821.221.camel@linuxfoundation.org>
	<55B6300F.7060104@windriver.com>
Date: Mon, 27 Jul 2015 21:24:34 +0800
Message-ID: <CADwFkYdjUJZ+fRN+c2WbN37cc=ojN-_VsudgjxRCju_qV=2zsg@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc 5.2 failures
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
X-List-Received-Date: Mon, 27 Jul 2015 13:24:37 -0000
Content-Type: text/plain; charset=UTF-8

using gcc 5.1, the boost statechart library compile fail.

On Mon, Jul 27, 2015 at 9:20 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 15-07-27 05:30 AM, Richard Purdie wrote:
>>
>> I've run a gcc 5.2 test build on the autobuilder:
>>
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=3628c3c06fa4195003ac655bcc791acfac775173&limit=50
>>
>> 41 errors (with a few more pending).
>>
>> The good news is that if we tweak the security flags, the poky-lsb gcc,
>> elfutils, coreutils and iptables issues can be removed and I have a
>> patch for this. This leaves:
>>
>> 3.14 kernel failures for edgerouter, genericx86-64, qemuarm, beaglebone,
>> mpc8315e-rdb
>
>
> Gah. I had all these building with 5.1 .. chasing gcc is a pain
> with this older kernel.
>
>>
>> openssl issue for p1022ds
>>
>> u-boot on imx28evk, p1022ds, mpc8315e-rdb
>>
>> xf86-video-imxfb-vivante on imx6qsabresd
>>
>> linux-imx issue on imx53qsb
>>
>> Some kind of "random" qemu runtime issue (4 cases).
>>
>> At this point I think we likely need to enter bugs into the bugzilla for
>> each of these. If we want to switch 1.9 to use this (which I think is
>> desirable), we need to get this fixed as a priority.
>>
>> Bruce: How do you want to handle the 3.14 issues? Switch to 4.1? or fix
>> 3.14?
>
>
> Now that 4.1 is in place, and I can't really see a large user base that
> needs gcc 5.x with the linux-yocto 3.14 kernel (other folks using
> master with their own kernel's will obviously have to deal with the
> issue in their trees) .. join that with the fact that we need to update
> all the reference boards to 4.1 anyway, my suggestion is that we open
> bugs for the h/w reference updates (and I'll get the appropriate Wind
> River eyes on them) and walk away from burning more cycles on gcc 5.x
> and the 3.14 kernel.
>
> Cheers,
>
> Bruce
>
>>
>> Otavio: The freescale machines are looking unwell, can you help us make
>> sure the right people know about this?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

