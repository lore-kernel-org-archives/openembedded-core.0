Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB32F780BD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 17:55:20 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l12so11343866qke.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KA14MKmb/fmhLUewU64k90kANijLiRj5ywDKBDjyy4A=;
	b=iVeWxLq9Qv5Ns31VPieMHRJTKxjLk2jNqEjb6xFj2Sx00wa7qfvwPDzsBs1wLAcHtE
	JzF3JFnfpkojaAjeGL8heTsaYzjtwOB4AyCUmZA51BwdmtEQU7qGZtkXeV4Cbva24o7e
	Mzd9Rr22ZwURk/xVuCXcO713gCt3YCgnsbnOr5jZzvP6Gf6jFdYEA6jRwW40gu+3BY2y
	R8H/H4VFentjL6fgam+i8fGjHcsG/D9SvZ0Tlp5QVYZM80R9dCosOtdc6B56UmhPXNXF
	0x0XKK6Ugl9K+dtzroXEDwPMqsPci1GfzZBz36osb84EHwHKYf1tdTROx1brVpvl3Yf3
	ql0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KA14MKmb/fmhLUewU64k90kANijLiRj5ywDKBDjyy4A=;
	b=fPv/jj4Sok/pcGNEoWlgXQRwVi54ioRRCiHMACP+aRBDlAD3kS9p31CVH4ix/zs+UL
	vdib6iXHvHKI05/yMHNr6OhdVJ6aRgLMbfPcguCbZPawuNjOOJlVAs6Wm3kQNfeyLro8
	+QLpIUIEJN/tN/aVx9OdWKUs3hmHbuwxIF2aJCqQX2S8lznOoaEeuoH963N8DhpFrDeb
	Bi1cLmmgrYPN5O09ru8Kcn2Cm9FsgCTiE7r4atMkVlfXoFu+JBo6tvzgztvQWTlV9bln
	kSPLgsE9zm85xfuwTDkCJmaUJgmHs4h0Z+8CuMLHi30ltHnsg/0qst34g5gxWVdRAvHx
	hMhQ==
X-Gm-Message-State: AKwxyte3Bqo+xP2niUt7OXPzw7yEz7FjQDbNtRenvEunEiWwGbd+7iVc
	1d3jBvOH8kuigTlLNmoYQDtJ/IcPjRsqQNSvgC5aOQ==
X-Google-Smtp-Source: ACJfBosF7nZvr6iBjksMt8t15c0rRLrEqh1YOvuN17tUg2TPo00klc4oUwarA/ePUKwQFdh/72ca8loLeB+UtI5e+Mg=
X-Received: by 10.55.203.92 with SMTP id d89mr12028256qkj.218.1515347721690;
	Sun, 07 Jan 2018 09:55:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 7 Jan 2018 09:55:21 -0800 (PST)
In-Reply-To: <2c1c48a3-5355-b3eb-fab0-765a007b8475@denx.de>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
	<CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
	<2c1c48a3-5355-b3eb-fab0-765a007b8475@denx.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Jan 2018 12:55:21 -0500
Message-ID: <CADkTA4NAvZVW_dNbOi_2OgyNxkQXDj9XJtbDpSztXSfaYRxP=Q@mail.gmail.com>
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
X-List-Received-Date: Sun, 07 Jan 2018 17:55:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 12:53 PM, Marek Vasut <marex@denx.de> wrote:
> On 01/07/2018 05:42 PM, Bruce Ashfield wrote:
>> On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote:
>>> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>>>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
>>>>> Add additional task, do_patch_xenomai, inserted between do_patch and
>>>>> do_configure tasks. This task applies the cobalt patch to the kernel
>>>>> sources for a specific machine. This is disabled by default, so use
>>>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>>>>>
>>>>> You will also need a kernel recipe for a kernel version with ipipe
>>>>> patch applied.
>>>>
>>>> This doesn't make any sense to me.
>>>>
>>>> Why on earth would this be in kernel.bbclass ? and part of a xenomai
>>>> recipe ?
>>> Do you have a better suggestion how to make this easily available for
>>> every kernel recipe ?
>>
>> There's no need to make it available for every kernel recipe. If someone
>> wants to build xenomai, they need to have a specific kernel recipe and
>> configuration to make it work. By providing that patch and allowing it to
>> be applied to any kernel doesn't mean it will actually work .. so you aren't
>> doing anyone any favours.
>>
>> The same thing could be said for the -rt patch, aufs, etc, any patch could
>> be made available for any kernel, but they aren't, since they will either fail
>> to patch, or won't work at runtime.
> We actually have a -rt patch available in the kernel recipes, so why not
> xenomai patch ?

As a separate recipe, not as something in a common bbclass, which implies
that it applies and works everywhere.

Anyone that is trying to apply -rt against a generic kernel .. is very mistaken.

Bruce

>
> --
> Best regards,
> Marek Vasut



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

