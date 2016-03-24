Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 48C7B605BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 08:03:40 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j92so7665830qgj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cIe7YWdex1YlauZDX8WspXx8cWhGn3xIH60DvhGrvRk=;
	b=UiYz3q1w2YYliJ5aeib8tAAmNsN6l6FBpf9PUhM1CUDym3UMOL1V9nBHBIOVQp4JdY
	sYKjYgzh1Mfq5dfDbmN7lseV42pO7Q1WxUPbsgNKz6XEYiiVGymk2ype8+ji2uZBj69J
	R7cEY4Jp+guw7C9gh7wSbEcPkVOMTS3t15Mt4bAj//Vp9n/l+FHunplDAaA4Zart0bSE
	wYFD5gp53OkC7rfHt9gaOhcZ9fXvY7rPEjpgv5CPvjUVb5xAi94Vr+4qZSRyf1x/1a9J
	sBJXq4fzDBSZxU9SWU1xTfOtdGMxOaBkOVFLg2T13e2lnp0R4Wq29bQZNsscWFu+IdfB
	SQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cIe7YWdex1YlauZDX8WspXx8cWhGn3xIH60DvhGrvRk=;
	b=iMBTDJYk6t6XTE95GT2KlkdLUmCR1fylH4GIEaWrRP7HUieePPMQAhaBfd5lMMkiiU
	8/H01b6bUzwe+UlOGWqTidMPSNYVKRPagY/T16N95a7tY7WKKDnUjYADyx8ErJXcKV00
	Msm0xs9hz7hsDe7Ct5pxGoh02/T1zxANcrq5pb7W+gvAlpkKSB2CsEB5g0C3ZbF/Y6OA
	UzSY690bkByapRavs9NmjtB1K4lUVwA1zUlwDNbWxw9p8ckoBiXX4JMyyg009+gt+5Vo
	5Owrw8iibvEZdG1HYWg1UYdHd7irXW9MTxF+fB8B7TntDkp0hHwCf214Mg5xcpRQ8jud
	G0sw==
X-Gm-Message-State: AD7BkJKAkuMwdvnD4ICYb61gMvDmdG4ZUu1dGnkmNmI4d/EHl+ENNKCIvaJ15W10g7eS95LGLKOHx/w0+6If8Q==
X-Received: by 10.140.37.113 with SMTP id q104mr8548989qgq.104.1458806620817; 
	Thu, 24 Mar 2016 01:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 24 Mar 2016 01:03:11 -0700 (PDT)
In-Reply-To: <CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2016 01:03:11 -0700
Message-ID: <CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	Daniel Dragomir <daniel.dragomir@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 08:03:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 23, 2016 at 10:16 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Mar 23, 2016 at 9:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mar 23, 2016 8:19 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> index f4f76bd..a7b8d63 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> @@ -65,6 +65,7 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64
>>> --with-arch-64=mips64 --with-t
>>>  EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>>>  EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>>>  EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>>> +EXTRA_OECONF_append_armv8a = " --with-arch=armv7-a"
>>
>> Armv8 is different architecture and even gcc backends for armv8 arent shared
>> with armv7. This change doesn't look right to me. What are you fixing with
>> this change
>
> In the context of oe-core machine specific over-rides, "armv8a"
> signifies that we're building 32bit code for an ARMv8-A class CPU.
> See:
>
>   http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=823af99d825375485d64fcb82c00fb85004813b8
>
> (Maybe it would have been better to use aarch32 as the over-ride in this case?).

ah I did not know this patch has made it in. I had concerns about it.
Its quite confusing to call armv8a as 32bit since thats wrong
representation. It should be renamed to aarch32 atleast.
since thats the execution state of armv8a architecture thats what this
file is doing. armv8a support aarch64/aarch32/(thumb2 in aarch2 state)

Please submit a rename patch with adjustments before starting to use
it widely in metadata

