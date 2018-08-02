Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5366278D99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 12:28:35 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e139-v6so938391vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8lv2qvbvs1K8CVH+QUEwX185HkTmYSNihZ+8tH+LtKw=;
	b=D0NrS0kq1nkUf7rkb0hXA563Q5+0eEL9FfEDF1k6UjFv+D7bPjfcYmv3x/hnEw5IcQ
	rFQt7v2PsVg7qQQdJRQrzMgqXSBMcWPMUqzHShJ4A7P5HPoAsUcOp2vNp23GK9RMRVnu
	1pGDF/g3Jr2QhVeXbW26jQSo+yEuovvEpuMsnrPYtf13DuMmGsvKOxvrCaB9LpCuqJ64
	qk00Ag/jhp7msP07MwSYozeGCjna7w5hX4YztX2wW0w5LUBnOJoVxF3En5b7c1XPMuni
	s0VLp8JZnQ54MIU97oo7g3csvu8Pgz2a+YbWm9U9Q0QOapI2MHrHl5eB+76y+p3rgnM6
	Ydgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8lv2qvbvs1K8CVH+QUEwX185HkTmYSNihZ+8tH+LtKw=;
	b=pNiyMEnlaacWqeS1NAhHG+2zZJSFVaWShPAp0+IfAcZ5XmeiUwUz1hqqrPxKIGULbl
	gSKvG/HxRnUcxXDdA5ADKtpPMQOaCbmVf4IUXslcY8Bkd977Zv70LVC1covCvJDT/oCC
	t5ptJp/7UL6XeqRO+jvhHyNnP64QA8a890qdnNOxhweUuzt19VCCLtxRB57tFgsQYiHX
	Zx0mmUzmBzhMIUdyqOSSoq0fMznzen3llRNUjK4LD5UTxEmTbpU1qER1oELIyePZ8Hl2
	iYE3TgDcpmJsNxSSZVQu1geIMynNNYkuVFtzo9uSIy+suh3iybSRtRcpW5BaFETRuvcQ
	k5Pw==
X-Gm-Message-State: AOUpUlFvVJbSqeM5tG8ee2kEAZZkPv+5EXtmmcGS4P5R/WAaZ3oL6tTA
	Tfv0+3yOQQgNcZlGKXwfRkHSgqL5wuojT6VLGeU=
X-Google-Smtp-Source: AAOMgpdSZV8LkSzgCuXBTWzCS1FO4rqqjXJdbOwdVUxui/uFBaZc8gigh6/Hfq7wj3pXbVf6hYhm8mRTHQJi2DRr7vI=
X-Received: by 2002:a1f:940d:: with SMTP id w13-v6mr1622700vkd.6.1533212916078;
	Thu, 02 Aug 2018 05:28:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2497:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 05:28:35 -0700 (PDT)
In-Reply-To: <CAJ86T=W9smGsSHRinH0aQ=QpJMreagk9wXtzWRxSYv7dX-_EGA@mail.gmail.com>
References: <20180802071149.19272-1-raj.khem@gmail.com>
	<CAJ86T=U1A=NLC+oPZtB89Ckcjx9yMUrQfPHCo=Z4uBVc01zvYA@mail.gmail.com>
	<CAMKF1sostF71Wms49UQzfN803+Tpw5QGy+PzEMj4UbKywq-6fg@mail.gmail.com>
	<CAJ86T=W9smGsSHRinH0aQ=QpJMreagk9wXtzWRxSYv7dX-_EGA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 2 Aug 2018 14:28:35 +0200
Message-ID: <CAAQYJAsvHdUH3dVLDtoHeGGfO_m2qCYJiAfWbn6pG69Sutx8rA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Thu, 02 Aug 2018 12:28:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 11:49 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Aug 2, 2018 at 2:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Aug 2, 2018 at 12:47 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> On Thu, Aug 2, 2018 at 12:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > fix internal linux headers
>>> >
>>> > Full logs
>>> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8
>>>
>>> From the musl commit which fixed the dirent struct alignment issues it
>>> doesn't look like it was armv5te specific, so mentioning armv5te in
>>> the commit message could be misleading.
>>>
>>>   https://git.musl-libc.org/cgit/musl/commit/?id=b3fa0f2b1b8c267c1cbe8c62464e484f3a174a4e
>>>
>>
>> commit is in contextual to OE on a particular arch where it was
>> observed, other arches either have
>> ways to compensate for misaligned access in hardware or compiler does
>> not use 8byte alignment
>>  thats why subject says 'seen'
>

Hi,
I have seen scary align traps in dmesg and bisected back to that musl commit.

Short version: never break alignment for structures used for streaming data

Long version: afais only on armv5(t)e , with DSP feature, the code of
readdir.c is miscompiled by gcc when using O2, O3, Os.
What happens is, the arm  ldrd instruction has specific contraints on
armv5(t)e, one of them is the address must be 8 bytes aligned (
doubleword-aligned for doubleword transfers).
Interestingly, other toolchains for armv5 were patched to avoid
ldrd/strd alltogether.

Cheers
Andrea


> Great explanation. That's the kind of information which should go in
> the commit message.
>
>>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ---
>>> >  meta/recipes-core/musl/musl_git.bb | 2 +-
>>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>> >
>>> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>>> > index b56870cb3f..e7d0e1a66b 100644
>>> > --- a/meta/recipes-core/musl/musl_git.bb
>>> > +++ b/meta/recipes-core/musl/musl_git.bb
>>> > @@ -3,7 +3,7 @@
>>> >
>>> >  require musl.inc
>>> >
>>> > -SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
>>> > +SRCREV = "f2c6dbe2442027ed8fe0fa869918e41f495534d8"
>>> >
>>> >  PV = "1.1.19+git${SRCPV}"
>>> >
>>> > --
>>> > 2.18.0
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-core mailing list
>>> > Openembedded-core@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

