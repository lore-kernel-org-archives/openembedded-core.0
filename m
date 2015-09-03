Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4BF76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:37:59 +0000 (UTC)
Received: by ykek143 with SMTP id k143so3014007yke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ktU8i4+WcdGxMrcmbcfXs92IFRMthLvLFbpIfp5/I94=;
	b=YAvgP3JBCAY0Zgl/Ucg29SlcaTgGUI4Zd3j4JBcquFbSxeXHF6b88TtWezK4MFz0gD
	eUgmqpR/xm/Ssj5UhH/byPYpTXyuQvpj83jWKqS3tPeOUz3cY/lkouImU9Osmd1P+3T3
	aJGx9xZqXGwXhMhC1nMx3d1noQarV9NFXD74Xg8Dr0L+aVdFZe6bYavwkx8+/Hud7jQb
	BhkXOmiKPXOD+KgO+bZX41q6lbVKt2izdv4X8bgBwfpY3/GBl+qothGvC14zraTM9ZUs
	nxXWJvoJ0yAiC8EZ8jeRqlBNnvt5dKfdKQXKF3uBARexzLY8IdbgR9pIKnurLJ7Xenej
	4mKA==
MIME-Version: 1.0
X-Received: by 10.13.229.197 with SMTP id o188mr156832ywe.30.1441316280139;
	Thu, 03 Sep 2015 14:38:00 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 3 Sep 2015 14:38:00 -0700 (PDT)
In-Reply-To: <56097049-FAE4-42F5-8BD7-30A7010DEE7C@gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441312024.24871.135.camel@linuxfoundation.org>
	<CAP9ODKrgg8vAT2c6iEkU3THqpqrCYiEz=d61mr3tNwa9P6HGmA@mail.gmail.com>
	<CADkTA4P0WbBagTyDbTJRxb1m7wXX2EMN+c0QAOxn3i8pxqSLQg@mail.gmail.com>
	<56097049-FAE4-42F5-8BD7-30A7010DEE7C@gmail.com>
Date: Thu, 3 Sep 2015 17:38:00 -0400
Message-ID: <CADkTA4ObdYoHgxUAnBvtKhDCN8QDTeDGYH1LJH-eP8jxaMNi+A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 21:38:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 5:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 3, 2015, at 2:02 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> On Thu, Sep 3, 2015 at 4:32 PM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Thu, Sep 3, 2015 at 5:27 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
>>>>> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>>>>> To put this another way, I think it is probably reasonable that we
>>>>>>> should be able to build an image from OE-Core with basic functionality
>>>>>>> like networking without busybox?
>>>>>>
>>>>>> That's what I'd support. If everything you need for the functionality with busy
>>>>>> box is in oe-core, to me, it doesn't make sense to go outside core to get that
>>>>>> same functionality without busybox.
>>>>>
>>>>> irrespective of this change. I see yet another configuration with this
>>>>> into OE-core, overall OE-Core should get smaller
>>>>> and case does not sound convincing to me. You dont want to use busybox
>>>>> in a fairly large image which has other GPLv2 software in
>>>>> it. Thats fine but doesnt look like a common usecase to me
>>>>
>>>> Nobody mentioned GPLv2, that isn't relevant here.
>>>>
>>>> I have heard OE being dismissed since it can't produce an image without
>>>> busybox in it. The implication is we can't build "big" Linux, only small
>>>> embedded things. The pieces we need busybox for are tiny and should be
>>>> easy to replace (like this does).
>>>>
>>>> So I can see a fairly compelling argument for OE-Core to be able to
>>>> generate a busybox free image with standard functionality just from a PR
>>>> perspective. From what I gather we have people willing to test and
>>>> maintain it too...
>>>
>>> If people were demanding it, it would have been moved for
>>> meta-networking ages ago, it seems it is not the case.
>>
>> ... or they were just holding it elsewhere, since not everyone has the
>> time to get things merged to core. In particular if they think it will be
>> a battle.
>
> thats how we bloated oe-classic. Oh people might need it because I need it therefore slam it in
> I have written a packagegroup to replace busybox but I never thought it was so core.
>
>>
>>>
>>> So my vote is:
>>>
>>> - move to meta-networking
>>
>> And what if the use cases don't want/need meta-networking ? We have
>> the submission and one use case, and one of the reasons it was sent
>> to core was to keep a finite set of layers and recipes to build such an image.
>>
>> Joe/Randy ?
>>
>> It is this sort of thing that forces use of combo layers or the whitelist
>> classes :)
>
> You can also help in making those layers meet the quality criteria you need instead of being
> pick what I need throw the rest out approach.

Agreed. No arguments there .. and hopefully we can also finally break the layers
up into smaller parts / separate repos.

I've had the issue that I can't just update meta-networking .. I get everything.
I can help with quality in layers that I use (which I do), but when
versions change
underneath you (and you have a specific requirement), there's little that can
be done ... except copy and pin.

>
>>
>>> - for 2.1 we see if it goes to core or not
>>
>> But without criteria for success .. what does that get us ? What is the
>> case that needs to be made for a move to core in 2.1, that isn't being
>> made now ?
>>
>> Yes, I'm playing devil's advocate on this thread .. since I want to see
>> this sort of thing clearly defined.
>
> if its required by more than 1 distro. Is duplicated in other layers because the layer it resides in
> is not used by a distro. It replaces a core functionality in OE-Core. It has to be a building block and not a leaf package e.g. These Would be some of things that may be thought of.

Agreed.


Bruce




-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

