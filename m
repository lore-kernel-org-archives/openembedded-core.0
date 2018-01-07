Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 441647893C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 19:00:14 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d202so11788209qkc.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3m9HryMEfCjfNuyaGAV+DAzVw9XndIGWwbIkfuB5Dhg=;
	b=qeGMjj1hVn9de+x0hhudLLbNf8f/3UhzbZLgly8p8pEKeoNJLLqgs0sdVNVN9wmNQB
	MiB/hqv3JNiuO8lW/HrBgSFQ/ndfKqEx3n9h2gh68jN1PnNiCiZ0LPsgi+hkFF1hg7um
	renJqn7ehiWtfpk1BDoB10MJptSOguzwugzCKLI7Lnv7p3uiBHYzo4KZsrWAjCMAzvPS
	qGgnHNi8WD1OdNiiT/vdtxdEgqp5Y/FIFGh5iqossSy14c3Gr7qR7XHzPrAZi0mFU03O
	g+cauAnYB2fYAxfPkU0tDF52v5I2m/HLHShm4m4mgKd4KTrFFaUo9i11sex2Z7rQKeER
	+73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3m9HryMEfCjfNuyaGAV+DAzVw9XndIGWwbIkfuB5Dhg=;
	b=KAldaunePtlA/DPxgHg5ym9QqDdB2zzXZczGwTU4wyLBHAoUhOJ5u0WkAXp8EuKbLJ
	SiG2S/0qycP5LgkHdwv2MrocAU86FlHJpwEpccfVFMDyPdeDbCP7e1BMjD2qWtsNnHz3
	JMYLLDeIekMSdmnfpUWTXOYb1I1nSJ/m4r/CnmT6NJc+7+9BHYzK930N4M8sROPQc8Gd
	zjDXeiy/mcYrWkWOatvvb4B5PCDgVweSHO/q+U7NfdRLA6sIu6XoXHI4DOxbhqDejr+/
	wyPwiE2Lui/OtowMPclf/n2cNDtFYIRDRsYlU8AcAj7vnvhWhirF3Jmms+LecFSve/ww
	4x2Q==
X-Gm-Message-State: AKwxytfUN6MGBD5RJM+lgRVzRx2ZpiLdQFjpF+edKGXtDM6hYLnVxReb
	WNkZI8oS1JfZ8v7qmB0Jsdwr3tIWDvCjw9cjVjs=
X-Google-Smtp-Source: ACJfBovjzEXkpYT34PbmLuYRgBXBu1pHYLWJvmQrpjskwsADsuNEGqHKwMOg1JEOss6g7+TlYo/iEFunx7y+SdmDZ5s=
X-Received: by 10.55.203.92 with SMTP id d89mr12200815qkj.218.1515351616177;
	Sun, 07 Jan 2018 11:00:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 7 Jan 2018 11:00:15 -0800 (PST)
In-Reply-To: <5ba2da95-dbe0-b65b-e2e9-8e8fff030d96@denx.de>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
	<CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
	<2c1c48a3-5355-b3eb-fab0-765a007b8475@denx.de>
	<CADkTA4NAvZVW_dNbOi_2OgyNxkQXDj9XJtbDpSztXSfaYRxP=Q@mail.gmail.com>
	<1999cffb-3890-2271-3938-ba2be97b135d@denx.de>
	<CADkTA4OQNJWyMn8tj7m8nEOjeH4M5V729uU+OBerKe5V+ns2VA@mail.gmail.com>
	<5ba2da95-dbe0-b65b-e2e9-8e8fff030d96@denx.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Jan 2018 14:00:15 -0500
Message-ID: <CADkTA4N2=CgDZYqsvP07KN9hK_P-ts91PkazBOTLiDk2n+rFSw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
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
X-List-Received-Date: Sun, 07 Jan 2018 19:00:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 1:57 PM, Marek Vasut <marex@denx.de> wrote:
> On 01/07/2018 07:55 PM, Bruce Ashfield wrote:
>> On Sun, Jan 7, 2018 at 1:49 PM, Marek Vasut <marex@denx.de> wrote:
>>> On 01/07/2018 06:55 PM, Bruce Ashfield wrote:
>>>> On Sun, Jan 7, 2018 at 12:53 PM, Marek Vasut <marex@denx.de> wrote:
>>>>> On 01/07/2018 05:42 PM, Bruce Ashfield wrote:
>>>>>> On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote:
>>>>>>> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>>>>>>>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
>>>>>>>>> Add additional task, do_patch_xenomai, inserted between do_patch and
>>>>>>>>> do_configure tasks. This task applies the cobalt patch to the kernel
>>>>>>>>> sources for a specific machine. This is disabled by default, so use
>>>>>>>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>>>>>>>>>
>>>>>>>>> You will also need a kernel recipe for a kernel version with ipipe
>>>>>>>>> patch applied.
>>>>>>>>
>>>>>>>> This doesn't make any sense to me.
>>>>>>>>
>>>>>>>> Why on earth would this be in kernel.bbclass ? and part of a xenomai
>>>>>>>> recipe ?
>>>>>>> Do you have a better suggestion how to make this easily available for
>>>>>>> every kernel recipe ?
>>>>>>
>>>>>> There's no need to make it available for every kernel recipe. If someone
>>>>>> wants to build xenomai, they need to have a specific kernel recipe and
>>>>>> configuration to make it work. By providing that patch and allowing it to
>>>>>> be applied to any kernel doesn't mean it will actually work .. so you aren't
>>>>>> doing anyone any favours.
>>>>>>
>>>>>> The same thing could be said for the -rt patch, aufs, etc, any patch could
>>>>>> be made available for any kernel, but they aren't, since they will either fail
>>>>>> to patch, or won't work at runtime.
>>>>> We actually have a -rt patch available in the kernel recipes, so why not
>>>>> xenomai patch ?
>>>>
>>>> As a separate recipe, not as something in a common bbclass, which implies
>>>> that it applies and works everywhere.
>>>>
>>>> Anyone that is trying to apply -rt against a generic kernel .. is very mistaken.
>>>
>>> So I should pull this into linux-*-xenomai , just like the rt patch does?
>>
>> Yep.
>>
>> But how it is maintained is a RP question, oe-core has a set of reference kernel
>> versions, and those reference kernels have a similar set of functionality across
>> architectures, are actively maintained and all get the same fixes at
>> the same time.
>>
>> (and I just realized that RP isn't copied on this thread anymore, so I'm adding
>> him).
>>
>> If we introduce something like this, I'd argue that it needs to follow the same
>> kernel versions to be consistent with the other oe-core references.
>>
>> That is a question for the steering committee and the architecture mailing list.
>>
>> So while that happens, why not just put this in a meta-xenomai for the time
>> being and once all the details have been hammered out, it could merge.
> That's fine by me, although the main feedback I'm currently interested
> in is whether this has any chance of getting included in oe-core and if
> there are some other big issues with this .

There has been interest in this in the past, which is why I've gone down the
route of getting things up and running myself.

The real feedback and feasibility would be in those other forums, but if done
right, I don't see why not myself.

Bruce

>
> --
> Best regards,
> Marek Vasut



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

