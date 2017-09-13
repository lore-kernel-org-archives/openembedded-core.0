Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59F7E783E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 01:25:19 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d8so6943491pgt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 18:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YNGOXMrxsqLzA3LJDX3flcwWOHrMfLPUpmsT+HF/X+Q=;
	b=onleYFl+eq68DXXCavAqpaR3uakodvxXtaoqUez0t0U3uS/j1XVA+kOJoNYrawZ1jv
	MeAZsri+kpYGP/pyQC8W3CnDtpPxGpMwS8uVhb6A8ffjGgMSiZyeSz97JCB7nXCQJGdy
	3qsCpyYJ8rM1uXbfVIc7Ty87vszXsR+bxjunVWb5iNN7JKIZ2yMegx5NQDq48041hNJ8
	i6VCDIuz4muGTe09AMM2OvEc/dpkmlQg98jb5zmMMOtWk01L4RFXRa27pgMh8uYf+dTS
	qpY4hgIiZwWlMGetOdI3DnLbDg94xILaabRbYBBn877jGgmrWb62dVVS9sxQXn3rx3vg
	1uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YNGOXMrxsqLzA3LJDX3flcwWOHrMfLPUpmsT+HF/X+Q=;
	b=T74nMjvsUDwakpO/gNS3QVi5zkGyXI/LfzlyAQip2L1KRp23ng8bD58MZ4d+XOhKux
	4NE7k5K4UEIoSi0dFpAoYdE/lcryhq9WlzAQlafc46q4byYAvhhl3Ne5+yrfGNqmReLP
	0s3jsIZzOO4zF71itSDagJkEvxrPtq2rUy0VKN44kSQhnZchoeLMvOjG3MzJ6SyfP2iv
	kkQE2dcCsXlF59a2bwdp2DfthsIHbW89WyQw43eOB02rAY2tBJFllAH3tzjayqn3xowk
	QA2Amw9iJQTqjqVFxQ1ZOd0I/7rdiyGoVtO0fYw51EpQn0DGjI3Gl94ZlNtxu6vA0b6g
	YR8g==
X-Gm-Message-State: AHPjjUjV/KBOpdZ5zmH1j9VdvQ45lGt7ngf3soVQNbgZcpnJamHG0/mR
	BLf1WnknwaQKMOBI9UTJDiORNo0eQYOCetlsvg4=
X-Google-Smtp-Source: AOwi7QD0rywjhr4ZLohNX2rGi2r2e/E92YFN2KS9jFKkBfRy39qdsxdixNSQl40hRFxgpacEJTnkvbJgstdN5YynRws=
X-Received: by 10.159.244.21 with SMTP id x21mr4028441plr.440.1505265920529;
	Tue, 12 Sep 2017 18:25:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Tue, 12 Sep 2017 18:24:48 -0700 (PDT)
In-Reply-To: <CAHUNapT0zPy9SUv+g7OBKp86BF_s8_=_RPrmNhMJQa7S8LbM8w@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
	<CAMKF1sp1R_wnW6Zkh96WWJKgC9zzgtbO-__JvqgEYWp_B6whzw@mail.gmail.com>
	<CAHUNapT0zPy9SUv+g7OBKp86BF_s8_=_RPrmNhMJQa7S8LbM8w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Sep 2017 18:24:48 -0700
Message-ID: <CAMKF1sry4fSRQa-wqcdcds0U8tN3jQhRdLZbtU1OzBG-4rSVTA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Wed, 13 Sep 2017 01:25:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 4:42 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Tue, Sep 12, 2017 at 4:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>>
>>>> Please note whilst this series is sent for oe-core it may be better
>>>> located in another layer? (e.g. meta-oe). However since the recipes and
>>>> the tools they build are not specific to a single BSP it did not make
>>>> sense to keep in a BSP specific layer.
>>>
>>>
>>> Sounds like a dedicated FPGA layer would be ideal.
>>>
>>
>> I think a layer for 2 recipes might be too much. Put it under recipes-devtools
>> in meta-oe for now.
>
> 5?
>
> Am I reading this patch correctly? There are 5 recipes?

2 or 5 doesnt matter I just meant "too few to be a layer of its own"
engineers minds :)

