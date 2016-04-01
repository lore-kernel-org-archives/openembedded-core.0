Return-Path: <armccurdy@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7840060043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 22:03:12 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u8so79837277lbk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=RPgShNCq2zyJ14Xj3hzR8ye9eKMPrEASjESEiQYADC8=;
	b=M8zDFi2O8P4FeHq3g1MIPLo1wYLKQMKWSSPEgzFuQbHUnNF3jQmRNQ0MvKSAW8IKYu
	dr/Nn/KMu/FoU8QtePRPTtz0LVg9CBdd6qZxqfjsVcX9IExPIisnos5i0D+kLfYmrp0K
	YJ5zgfehqMzs1t9iNPGUKxBf5qmmrLSbWJGzbyRon/+mX946iztz8dnFGqXMeR81xnu6
	xZIEVAZFFQmmLgtC5PxhhfXfb1aTLtITV4guLmK/D8mBT4NdsOTZe4nwgIP9lD5+atnP
	nkOdjqzT1DAwzUpu/r/8XqSF+E10Dzg+/fHfg3ObbNeyZcbE8mpl1HubNidnDSIPbpZp
	5dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=RPgShNCq2zyJ14Xj3hzR8ye9eKMPrEASjESEiQYADC8=;
	b=dkxN/vJI+Xmp/PvsgkH2GKa0bUDTGj3LGriUI0JRGIlZIvf/s+NULRDmCrFwf6mcRn
	jxdMmGESZUs+kYbnAD0Ak98VZpDNZL+2L5ewFhq+e3vdmwllartwDJDgrAqf5KMqby9r
	PJJIr14rwZahGwssHU0CZe1h6ZZVsQ+1yO6GkBH7JRWhYlehtCkJif14TR/f/GdOg0k9
	MotVbenFQBDILrccD2+O/NeXP1mvYkcT/dqhM1VQpNmhj2fxdQ3F0BTVR2CdQO7c9vOp
	BvkU2W+hBRxRF2mD+Mn10HUqqRtmhemeXyjxDtqYO3Jp0CxL9vNKn7JexZFtg/v0Dkju
	5fsg==
X-Gm-Message-State: AD7BkJInHYo0YxA+9/7sZ/gSbrlD8/BOUZu1A1oorbMwcVmL8fLxCGq9ownGF9IATpN7nO7dpPZjxe44xNGe1w==
MIME-Version: 1.0
X-Received: by 10.28.229.132 with SMTP id c126mr763701wmh.72.1459548192595;
	Fri, 01 Apr 2016 15:03:12 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 1 Apr 2016 15:03:12 -0700 (PDT)
In-Reply-To: <CAP9ODKpWv6eEGqnnAoqog822avKJLWLErh0aaJfZ1uhBy4d8SA@mail.gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
	<1459377982.2322.57.camel@pbcl.net>
	<CAJ86T=XShqiCRiZan9s4kimpBdejqjRYCHei7aXfv5xfbcpUmA@mail.gmail.com>
	<CAP9ODKpWv6eEGqnnAoqog822avKJLWLErh0aaJfZ1uhBy4d8SA@mail.gmail.com>
Date: Fri, 1 Apr 2016 15:03:12 -0700
Message-ID: <CAJ86T=VQxvgYomwYScxG3Ht__bnJT5nysJeAiKVKWSeJ_6=NDw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Fri, 01 Apr 2016 22:03:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2016 at 12:13 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello folks,
>
> On Wed, Mar 30, 2016 at 8:59 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> On Wed, Mar 30, 2016 at 3:46 PM, Phil Blundell <pb@pbcl.net> wrote:
>>> On Wed, 2016-03-30 at 11:53 -0700, Andre McCurdy wrote:
>>>> Either way it shouldn't be a concern for the CPU tuning files.
>>>> Building Thumb2 for an armv8a CPU is really just an extension of
>>>> "optimise for size" and we don't include -Os, -O2, etc options in the
>>>> CPU tuning files.
>>>
>>> Yes, agreed.  In principle there's no reason that the compiler couldn't
>>> choose between A32 and T32 instruction sets dynamically for each
>>> compilation unit (or each function) according to which it thinks would
>>> give the better result.  And from the user's point of view, the outcome
>>> should be equivalent apart from minor performance differences.
>>>
>>>> >> For most cores from Cortex A9 onwards NEON and VFP are optional, so
>>>> >> hardcoded assumptions won't work.
>>>
>>>> Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s Gu=
ide for
>>>> ARMv8-A mentions:
>>>>
>>>> "Both floating-point and NEON are required in all standard ARMv8
>>>> implementations. However, implementations targeting specialized
>>>> markets may support the following combinations:
>>>>
>>>>  - No NEON or floating-point.
>>>>  - Full floating-point and SIMD support with exception trapping.
>>>>  - Full floating-point and SIMD support without exception trapping.
>>>
>>> Is there any evidence that anyone is actually building ARMv8-A (as
>>> opposed to -R or -M) cores that lack VFP and/or NEON?  Unless there is =
a
>>> fairly clear indication that such cores do exist and are likely to be
>>> used with OE, I think we should not complicate the tuning files with
>>> support for such things.  Anybody who wants them can always add
>>> appropriate tunes later, either in oe-core or in their own layer.
>>
>> I can't find any evidence of real ARMv8-A cores without NEON or VFP,
>> so if any "new approach" to ARM CPU tuning files is limited to armv8a
>> then hardcoding support for NEON and VFP is probably going to work out
>> OK (at least until someone wants support for the half-precision
>> floating point extensions added in ARMv8.2-A).
>>
>> Personally though, I'd like to see a comprehensive cleanup and
>> restructuring which could be applied to all ARM tuning files,
>> including armv7a where NEON certainly is optional in the real world.
>
> Could you, Phil and Khem summarize the remarks in a succinct way? To
> be honest I am a little lost on what changes you all are expecting on
> top of the last patch version.

I think the last comment from Richard was:

"I'm planning to drop the patch triggering this from -next and
defer it until 2.2. The discussions can happen in the meantime to get a
patchset we're all happy with."

So I don't think anything is expected for 2.1.

The floor is still open for discussion for 2.2. One initial question
seems to be whether we're aiming for a point solution for armv8a or a
wider ranging cleanup?

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

