Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3996A74E2F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 06:48:44 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id v17-v6so6822520uak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 23:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AJzX9c2lePwGemluJqT+K8Yt2Wkec44gkmNGv0ddprI=;
	b=NCbywQ3gSyuQ/zJI36oQhvQmn1l7hHqr1CRp0cvz9Bwtz5ejVeoIqrN5WVsLbh+vzh
	Zka/YGDakORezbwEWcGyZzclSKr/X/U+Acwt6ckyAPvL5bLXpJ44D8KUVCfP9Ila3NFZ
	L/MilOsjskiWmEQLAx8O7WfdVUVJ+nHdKG80tS5/+DxTGSY538OG2r36f4z3cAvs4+eH
	VEqNXgLg64A+xSBrB+vNbSy8IhSGkfrdwGQMQn0AIvfZO0wV7hNy1L9oaXeJdeyZyhOy
	5L7B46GHssEKwEx0xTNCQ2RPnc0XyRnREAZK/NscfPax3WQrmxdDiQ4xmwqKcTo9aMOh
	bPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AJzX9c2lePwGemluJqT+K8Yt2Wkec44gkmNGv0ddprI=;
	b=NTvGf1OwyokTayIuXXjJKnyCyzrClcCuBJk/2dHY9V1ZxdlG0ugi3J7Sn5YawRG9VN
	CKCHEKjQvJFzwjHqDYtd5JXIx0geiuWidNnC4HmoP2yfOhgEGrIJLfuC6n8oc/qBTrOr
	4iF0+d2IfjfgqMYdz9kUz/mCYPORv8zDgufVcyRs0jXGHHLT1ggCuwbBS6eef9Ol9x44
	LGMdJRdWdvOZyldqHtCbNTSvdIFZe/De4YTEPJNcpauQoDCEGl/IItkOJFe+LaVEW1X/
	Qb4U/NN99PVAgBwwuEmp41Cf4XYV+QBs9ZddDEec3iFn+T++MoGyy7MU01iduka2N/5D
	5msw==
X-Gm-Message-State: ALKqPwcegi7qHMe/Muxd371Kddpla1Zg2cMXSdfq94Ti80Ne7k9VQ5j2
	n6G6TCYEubnD20VbjXWrw8rKAUg5yPRl/IB+JbI=
X-Google-Smtp-Source: AB8JxZqcJB0DBhOUS1QtoT+f42605vWDn3v6nWE2y2MACgVrfb4QJ21hcxboWsvE9nsp0NbgzVkIBbZNGsEGRPy3fEY=
X-Received: by 2002:ab0:4c44:: with SMTP id
	d4-v6mr9471497uag.128.1526712525778; 
	Fri, 18 May 2018 23:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Fri, 18 May 2018 23:48:45
	-0700 (PDT)
In-Reply-To: <CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
	<CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 18 May 2018 23:48:45 -0700
Message-ID: <CAJ86T=WG426=cyvtG811fWViqp+Sx7u0k9sUxo88SOJzVMQ2hA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Sat, 19 May 2018 06:48:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 10:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This variable was always meant to be used from DISTRO config

I'm not sure if that's true. Do you have a reference?

>, why not add it
> to:
> oe-core/meta/conf/distro/include/default-distrovars.inc
> or
> oe-core/meta/conf/distro/include/tcmode-default.inc
>
> ?

Because then it would either apply to all ARM machines, including
those which only support Thumb1, which isn't ideal. Keeping it as part
of the machine config makes it easy to apply selectively to armv7a and
above where we know it's safe and desirable. Distros can of course
still over-ride (ie the machine only sets a weak default).

Is there a specific problem you see with the current patch?

> On Sat, May 19, 2018 at 1:40 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On Fri, May 18, 2018 at 3:50 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> Although there may still be specific cases which can benefit from the
>>> ARM instruction set, the Thumb2 instruction set is generally a better
>>> default for armv7a class CPUs. Distros such as Debian and Fedora have
>>> been targeting Thumb2 by default for some time.
>>>
>>> Note that setting ARM_INSTRUCTION_SET has no effect unless
>>> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
>>> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
>>> of tree machine configs may need to update their DEFAULTTUNE to take
>>> advantage of this change.
>>
>>
>>
>> I think this is a good change and we shoudl take it in thumb2 is default
>> ISA
>> for other major distros as well
>>
>> Oe based distros who ship feeds might be affected
>>>
>>>
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/conf/machine/include/arm/arch-armv7a.inc | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>>> b/meta/conf/machine/include/arm/arch-armv7a.inc
>>> index bad1c27..a2663d8 100644
>>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>>> @@ -1,4 +1,5 @@
>>>  DEFAULTTUNE ?= "armv7athf"
>>> +ARM_INSTRUCTION_SET ?= "thumb"
>>>
>>>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>>>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

