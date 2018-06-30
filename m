Return-Path: <cazfi74@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id B0A5774749
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 18:43:37 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n84-v6so11332067oib.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lo6m9ZHutRKnanIZTyYBi90wUbxJjTu5wAhd8VY4z+g=;
	b=Ys/fAyXxz5P/AetIQqp++m+7bZLfhqEfR3zsywJI3J/4HopsOlGJxpRNf9KQVoU8dy
	KZCyuPORzlIqj96hXStsdNz8X02pC7PcJz4rgpxrv51BlI8x7NspE6Ss2m0GSaAGPyZq
	6zgjk/jNdHe05wltMDrVQDgxNrcQr2cHHZd+s5WTfvdItL3Irn43zpdBC951gTXsSBLF
	jo6qrlmErBzVL6NWQco+xoeTMeYk3DzJzF8aTYXN6f4eTlso5mYO5tpLgbu1gJhSHsOW
	NyRbffHLGnOs+2iY3NV1b8WrbJQGo6fPzr1Qba+37hPP41ciaVeEsX/7zn6lUzyAtVwk
	kIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lo6m9ZHutRKnanIZTyYBi90wUbxJjTu5wAhd8VY4z+g=;
	b=FnBJUW/+c6ElKD2PLEqwb8ZTTN0RweaTEguyTHkPs7gAZcQeQKLj0SrzC2z9vSpMQL
	o02VZOAPgTRaabqO4lz+BrNM05iZg48OhGeR+hb1Ut/COYzt70nyRwjlcW5B4n4CC385
	Nq7b3eD0HofeXhLu5dy0oR13R/enk6UQO3VrOyaRqoc00+5Z0m9R7w7NmFmXeeLGsL1d
	haPu3Ve+iBY/M4Dim/o/Nhr3blw/KyY9NheS5am7NKbOmK0DG/dh23qCJDY3iP86tyul
	VLYqrcxF62t2lGwz1w4ZMygodUFlesfJsbNQHBZvIdNAeXyzx25UtrTQJ6jvmC3Ahlud
	fUYA==
X-Gm-Message-State: APt69E0gH3dKqHhfUkKeUGMG70VFbq25Bud6n/PyP1qkSzh6XpsyGf+8
	x78+AHzBezHXrEY3cawjFQEvAdiUhZAmalGIRRY=
X-Google-Smtp-Source: AAOMgpcrWAAzXonjY0hN25vNK1uJYYNwpkds0+o7STuZLSQWvyhQgLovRuZWtdAgSgLlQIVQnPyQt9m8xt0pAxJLIz4=
X-Received: by 2002:aca:52d1:: with SMTP id
	g200-v6mr1888787oib.134.1530384218556; 
	Sat, 30 Jun 2018 11:43:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3574:0:0:0:0:0 with HTTP; Sat, 30 Jun 2018 11:43:37
	-0700 (PDT)
In-Reply-To: <CAKmqyKPEM707Y1aE6+1LUTJorB5o5f9e92y618gowu4ZN8B2Fg@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
	<CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
	<CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
	<CAKmqyKPEM707Y1aE6+1LUTJorB5o5f9e92y618gowu4ZN8B2Fg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Sat, 30 Jun 2018 21:43:37 +0300
Message-ID: <CAF6bG8fqn0pgfU18pWWayb4LhZA=dZjwMqGPysPNXCaM8OOr2Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Sat, 30 Jun 2018 18:43:37 -0000
Content-Type: text/plain; charset="UTF-8"

 This error happens to me with both qemux86 and qemuarm64. Haven't
tested any others yet.


 - ML

On 15 June 2018 at 20:40, Alistair Francis <alistair23@gmail.com> wrote:
> On Mon, Jun 4, 2018 at 4:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> That implies that INHIBIT_DEFAULT_DEPS is also evaluating to true,
>> which it shouldn't be in ATK.
>>
>> I'd definitely be checking if that is the case, and if you can
>> replicate the failure with e.g. qemuarm.
>
> I can't replicate it with qemuarm and checking with bitbake -e I can't
> see anywhere that the variable is set. Any ideas on what to try to
> figure out how it is set?
>
> Alistair
>
>>
>> Ross
>>
>> On 4 June 2018 at 19:46, Alistair Francis <alistair23@gmail.com> wrote:
>>> On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
>>> <alexander.kanavin@linux.intel.com> wrote:
>>>> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>>>>
>>>>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>>>>> wrote:
>>>>>>
>>>>>> So why isn't the inherit gettext sufficient?
>>>>>
>>>>>
>>>>> I'm not sure. Here is the error I see when compiling for RISC-V before
>>>>> this patch:
>>>>
>>>>
>>>> So is the error specific to risc-v? You should dig deeper in that direction
>>>> then.
>>>
>>> Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
>>> not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
>>> gettext.bbclass so we don't depend on gettext-native.
>>>
>>> Do I need to ensure cross-canadian is set for RISC-V builds then?
>>>
>>> Alistair
>>>
>>>>
>>>> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

