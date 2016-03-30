Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF7262136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 23:59:04 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p65so92358050wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 16:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=XhrCckdpMu9TA6Pm/ug/BM61tkFKnWQIT/QVCgV+Rms=;
	b=N/3jkyc+C93Gz0/XigsnCUg0QfiGOC2nBYWixOAGjn5NHLGRm7UfPp9mv0vpPDSrtk
	mlt77YFLtTdwST2ixWFqNvD46VfKuYqeZAvv6lgzpG4fPyN1giT48k0vO4ljqEGN06VR
	t2Yc9ii3CUgPU0C5y7o1pRC9aNj/smawNHjT/TgMafyFmNu2patbRWvDjVGpNVgIXBmN
	kvzk8mzChOM5//TuX5OfSkL1+VOdKGrRLq+5rItcty2QZ8NceviaY4wH7RAQ4+Nr/WyV
	D8+6lB6iSFQ7DTUgnZJEYpBH6U/Zw7ripzH688WecRD5+RhedVmyspf3GF+NB1sLK7z/
	qSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=XhrCckdpMu9TA6Pm/ug/BM61tkFKnWQIT/QVCgV+Rms=;
	b=TM6rbW6tgVKdJb0tX7L47Hclrm0Iz0WB87k0TnvqJBwfGVtFKeHuWRKpQ0sv2r+aTQ
	6xLN5/SYRsqGgsXSIPaWKv5UyKOVqcPAyPSaN+Mb34hUu4JlKsPdSUwvgUrniqzrbUq8
	so8qKOQP0EowDUTaHNdIirUYEuCu1tYQ9vfIxsogFvbWF/rDKbVutZa6/u88RYscz+jT
	srjFeLXuxxVGpb63go+x7Wu/yOxCeZ9YQvtoMsWX0apz60IpxevRnstxyYrnQYdPEd9e
	L1VLEeX5IXKFE10GtvVRtsPtL7fhhTSOgcWdHx3cuMXt+XjQAy6OJinhM+P7nS70Zi5n
	fXKQ==
X-Gm-Message-State: AD7BkJIeK6Q1EJoJQbgCFW1aHgqymXC5o3caKvqTBp6pV11fag9PLQewNL+6VIcCuY88QdzAnzDhnj3KEA80YA==
MIME-Version: 1.0
X-Received: by 10.28.49.3 with SMTP id x3mr12697287wmx.4.1459382344781; Wed,
	30 Mar 2016 16:59:04 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Wed, 30 Mar 2016 16:59:04 -0700 (PDT)
In-Reply-To: <1459377982.2322.57.camel@pbcl.net>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
	<1459377982.2322.57.camel@pbcl.net>
Date: Wed, 30 Mar 2016 16:59:04 -0700
Message-ID: <CAJ86T=XShqiCRiZan9s4kimpBdejqjRYCHei7aXfv5xfbcpUmA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Wed, 30 Mar 2016 23:59:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 3:46 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2016-03-30 at 11:53 -0700, Andre McCurdy wrote:
>> Either way it shouldn't be a concern for the CPU tuning files.
>> Building Thumb2 for an armv8a CPU is really just an extension of
>> "optimise for size" and we don't include -Os, -O2, etc options in the
>> CPU tuning files.
>
> Yes, agreed.  In principle there's no reason that the compiler couldn't
> choose between A32 and T32 instruction sets dynamically for each
> compilation unit (or each function) according to which it thinks would
> give the better result.  And from the user's point of view, the outcome
> should be equivalent apart from minor performance differences.
>
>> >> For most cores from Cortex A9 onwards NEON and VFP are optional, so
>> >> hardcoded assumptions won't work.
>
>> Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s Guid=
e for
>> ARMv8-A mentions:
>>
>> "Both floating-point and NEON are required in all standard ARMv8
>> implementations. However, implementations targeting specialized
>> markets may support the following combinations:
>>
>>  - No NEON or floating-point.
>>  - Full floating-point and SIMD support with exception trapping.
>>  - Full floating-point and SIMD support without exception trapping.
>
> Is there any evidence that anyone is actually building ARMv8-A (as
> opposed to -R or -M) cores that lack VFP and/or NEON?  Unless there is a
> fairly clear indication that such cores do exist and are likely to be
> used with OE, I think we should not complicate the tuning files with
> support for such things.  Anybody who wants them can always add
> appropriate tunes later, either in oe-core or in their own layer.

I can't find any evidence of real ARMv8-A cores without NEON or VFP,
so if any "new approach" to ARM CPU tuning files is limited to armv8a
then hardcoding support for NEON and VFP is probably going to work out
OK (at least until someone wants support for the half-precision
floating point extensions added in ARMv8.2-A).

Personally though, I'd like to see a comprehensive cleanup and
restructuring which could be applied to all ARM tuning files,
including armv7a where NEON certainly is optional in the real world.

> p.
>
>

