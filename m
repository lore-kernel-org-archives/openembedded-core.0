Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B2FC2731E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 19:53:37 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f206so225812101wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kycOdd1UwyQyBUMaz0/4fRJIlUkf0X7++UynO7b2PfI=;
	b=IxsMssIfarr9xwHJTj+oY/9aWfGssL/knnH3EIou0QmBmqBRHs6gQmmm29BKzQ58nh
	peSBhdd94MPyx/0aeFsp8A/xxxnmHXhTVPb/1cDdHdzotwJYrHwT2vLZn6H3V5DMEoF5
	t72grPWWC/kALlobAZfwKWIdEDajSYEDwEGPvWEKQvbsOCoE1Cyz4quW6eUKTJGX2haV
	G1NC8C0ovYcdk0L/kv9eW/5BGNICvisk+smMQHWgF2xzlC8Ih5iUAyYpa9I398FQYsra
	fkGtu3qkpeF82acMUVGAzcthtquCUfHLBRgKZo4d5QXQn3G9hPg7M0E99JV1HGbEKO6v
	c1Rw==
MIME-Version: 1.0
X-Received: by 10.194.156.199 with SMTP id wg7mr136147083wjb.114.1452542017981;
	Mon, 11 Jan 2016 11:53:37 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 11 Jan 2016 11:53:37 -0800 (PST)
In-Reply-To: <4A8643CE-5D1C-45E5-8E89-891B18CDE7A6@gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
	<20160108170054.GB2573@jama>
	<CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
	<4A8643CE-5D1C-45E5-8E89-891B18CDE7A6@gmail.com>
Date: Mon, 11 Jan 2016 11:53:37 -0800
Message-ID: <CAJ86T=XJ--oY1oJDKh1ZjKc36-_oS=8=9gdpWbcOwavs6B5Mgw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Mon, 11 Jan 2016 19:53:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 11, 2016 at 11:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 8, 2016, at 10:24 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Fri, Jan 8, 2016 at 9:00 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Fri, Jan 08, 2016 at 08:24:36AM -0800, Andre McCurdy wrote:
>>>> On Fri, Jan 8, 2016 at 4:44 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>> * in all cases we currently have we consider armv7ve to be compatible with armv7a
>>>>
>>>> Is this a short term workaround or a long term solution?
>>>
>>> It's just RFC for discussion.
>>>
>>>> If it's a long term solution then how will armv7m and armv7r be
>>>> handled? They are likely to need to duplicate a lot of the current
>>>> armv7a over-rides too.
>>>
>>> armv7a and armv7ve are much closer than armv7a and armv7m or armv7r as
>>> Khem said in earlier discussion.
>>
>> I'm not sure what the definition of "close" is here. An armv7a CPU can
>> not run armv7ve binaries.
>>
>> Saying armv7a and armv7ve are close is like saying armv4 and armv5 are
>> close. True in some respects, but they don't define each other's
>> over-rides.
>
> What I was trying to say is that code generated for ARMv7a would run just fine on armv7ve while
> ISAs were not incremental between m and r variants.
>
> So I was asking was what improvements do we get if we choose armv7ve as tune
> and I did not get any definitive answers. Why shouldnt we keep using armv7-a
> and tune the handful of apps to armv7ve where it is required. In this case it becomes
> less attractive to add yet another tune. We should strive to reduce this tuning mayhem
> on arm especially.

armv7ve basically adds integer division instructions to armv7a. It
would be difficult to characterise which apps really benefit from
that.

I agree that tuning options for ARM have turned into mayhem, but it's
more down to supporting nonsense configurations like "an armv7a CPU
without thumb" than it is about armv7ve.

Part of the mayhem also comes from DEFAULTTUNE being over-loaded. It's
used to encode not only CPU features (ISA level, neon -vs- no-neon,
vfpv3 -vs- vfpv4, d16 -vs- d32, big -vs- little endian, etc) but also
distro features which have no business being selected by a machine
config (hf -vs- softfp). That over-loading of DEFAULTTUNE with distro
options isn't specific to ARM though (x86-64 uses DEFAULTTUNE to
select between x32 and the regular ABI), so it's going to take more
effort to fix.


>>> And maybe it's because fewer people use
>>> armv7[rm], but currently these 2 aren't used anywhere as overrides (in
>>> layers I've in world builds).
>>>
>>>> Maybe adding a generic "armv7" over-ride which can be enabled by all
>>>> armv7 variants is a better option?
>>>
>>> Maybe, but that will change how armv7r and armv7m are currently built, I
>>> cannot say if for better or worse, I don't use either.
>>
>> I doubt that armv7m or armv7r are buildable at all. Perhaps we should
>> drop the tune-cortexm1.inc, tune-cortexm3.inc and tune-cortexr4.inc
>> files completely and stop pretending that they might work?
>>
>>>> Either way, I'd like to continue cleaning up of the existing armv7a
>>>> over-rides (e.g. the libav armv7a specific optimisation is likely
>>>> bogus and should be removed, etc).
>>>>
>>>>
>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>> ---
>>>>> meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
>>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>>> index 79e1ef6..d0fdff7 100644
>>>>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>>>> @@ -3,7 +3,8 @@ DEFAULTTUNE ?= "armv7ve"
>>>>> TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>>>>> TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>>>>> TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
>>>>> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
>>>>> +# In all cases we currently have we consider armv7ve to be compatible with armv7a
>>>>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:armv7a:', '' ,d)}"
>>>>>
>>>>> require conf/machine/include/arm/arch-armv6.inc
>>>>> require conf/machine/include/arm/feature-arm-neon.inc
>>>>> --
>>>>> 2.7.0
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

