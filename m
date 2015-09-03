Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 86AAB76DEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:02:04 +0000 (UTC)
Received: by ykdg206 with SMTP id g206so2152718ykd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=U/AOH04p0aAJuL83bMcCHIpnwB75YTgudwwUgx3oLUk=;
	b=GyQggyPw0moYPlmF3KV/LEQHAv72L9vh0B3pWPFhWLo4Nhg3sf2bkdeGArlEAI6yAr
	G4y55nOoUW3rUnr25ImNdr0npEB/Xtbow3oUICGRgOp7BzcP0/E1OLE3ZY++WBQyOiuP
	PWgSeefkH4g1bIDNNsBNdR7umet52xT8qNxw3GNRXUgTVuRkFglYP8roBTLHY158i1Ey
	URKw0lu6y8I1BUkAEk1UhC8U4I4g1495aDpHosiOqCI1GgTr6Nza0kq8M93juup8qfML
	nCOiShSidy+lwtZc27N5O+4EuzEKCgzHx2zOTpR3g/9sDHwWGDeiHaaJdrcJ9OSBUWT8
	OmTQ==
MIME-Version: 1.0
X-Received: by 10.13.245.135 with SMTP id e129mr42005158ywf.13.1441314124264; 
	Thu, 03 Sep 2015 14:02:04 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 3 Sep 2015 14:02:04 -0700 (PDT)
In-Reply-To: <CAP9ODKrgg8vAT2c6iEkU3THqpqrCYiEz=d61mr3tNwa9P6HGmA@mail.gmail.com>
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
Date: Thu, 3 Sep 2015 17:02:04 -0400
Message-ID: <CADkTA4P0WbBagTyDbTJRxb1m7wXX2EMN+c0QAOxn3i8pxqSLQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Joe Slater <jslater@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 03 Sep 2015 21:02:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 4:32 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Sep 3, 2015 at 5:27 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
>>> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>> >> To put this another way, I think it is probably reasonable that we
>>> >> should be able to build an image from OE-Core with basic functionality
>>> >> like networking without busybox?
>>> >
>>> > That's what I'd support. If everything you need for the functionality with busy
>>> > box is in oe-core, to me, it doesn't make sense to go outside core to get that
>>> > same functionality without busybox.
>>>
>>> irrespective of this change. I see yet another configuration with this
>>> into OE-core, overall OE-Core should get smaller
>>> and case does not sound convincing to me. You dont want to use busybox
>>> in a fairly large image which has other GPLv2 software in
>>> it. Thats fine but doesnt look like a common usecase to me
>>
>> Nobody mentioned GPLv2, that isn't relevant here.
>>
>> I have heard OE being dismissed since it can't produce an image without
>> busybox in it. The implication is we can't build "big" Linux, only small
>> embedded things. The pieces we need busybox for are tiny and should be
>> easy to replace (like this does).
>>
>> So I can see a fairly compelling argument for OE-Core to be able to
>> generate a busybox free image with standard functionality just from a PR
>> perspective. From what I gather we have people willing to test and
>> maintain it too...
>
> If people were demanding it, it would have been moved for
> meta-networking ages ago, it seems it is not the case.

... or they were just holding it elsewhere, since not everyone has the
time to get things merged to core. In particular if they think it will be
a battle.

>
> So my vote is:
>
>  - move to meta-networking

And what if the use cases don't want/need meta-networking ? We have
the submission and one use case, and one of the reasons it was sent
to core was to keep a finite set of layers and recipes to build such an image.

Joe/Randy ?

It is this sort of thing that forces use of combo layers or the whitelist
classes :)

>  - for 2.1 we see if it goes to core or not

But without criteria for success .. what does that get us ? What is the
case that needs to be made for a move to core in 2.1, that isn't being
made now ?

Yes, I'm playing devil's advocate on this thread .. since I want to see
this sort of thing clearly defined.

Cheers,

Bruce

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

