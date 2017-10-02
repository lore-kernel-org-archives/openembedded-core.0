Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6624A6E666
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 10:41:53 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id q4so6631896qtq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oeu+V06eGgwBhcczyC5rbBkivPFETjkQppoHPRJDefw=;
	b=gs2ZF/QCVXqpNYEqX0yuGs2AZtapnGLqHHPZjfE2BQ+wWkowD11XU2uuGw05lPEO1c
	O5+GMRcrliqTRtSWRkaJJsAoFeqa2hGZugmMnpi3t2DUlgad0ceNhv/3y+fqPtE3QUcW
	6VFcTHwlHdVaXWWpt4r3hMYCrlhitGR2Dv/OX5bxp2pYML0DBh1aGVzPXPIssMac6c//
	WbddkvjgRTaiBR15UYZxWTCrXIvt+ROAZqyNjrruIysBBkKkimv09tyP1tSv6FFpR7bW
	ioZmJxrj91nyUeg9j9WtwGUhUNukShNL5//r9lG3ve2jtraqFbmGOPHoLLntq9f0jjLf
	pw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oeu+V06eGgwBhcczyC5rbBkivPFETjkQppoHPRJDefw=;
	b=Zl6fFaZj6plVdDzb+yNOL1TH8EKxphja49u475q7EzTP7SrGvhAk7uDAPowQn7lcuc
	4a/o2v1+tZuRJgdk9qQQkC5zDtWSRp2bgPn65UvqdITK0Oqx/H44z22gpULIT//cn4oX
	Uz+bDDjgMN7WQs0Knx4nzvKIc/kDGhO793is+zu+rYoOOTBLZy2TRyWIwyi8DqFF1dwr
	dPiHyQMz7JQazrt3Yk7036IVigSYei/qPVTtRB+VDNqD0m1nbElWARaM9c1ITGfu/HKS
	UYl1EOPXqaOsaJNDm/e6Dc+/weF+Q5bwaaf6rR4CVXAqz0D6ZFKQxBdRzLEjqqhcmUEN
	1TDQ==
X-Gm-Message-State: AMCzsaVFNGMRm3YElJ8jhLk710LSBw07a85uuRwMEy/WvalO6hv8mXah
	KYLfZ1ZOXkOVcGOlKfJEaw/PN8sc2owgVpIySmKc8A==
X-Google-Smtp-Source: AOwi7QAMUTKyb9JVKUKGpa/4pUM61auIKE52+UX+UsXkJCSUckq6zR6lh8faHWthM74y1mzTH/CXmB+XcX+FjNYUNtw=
X-Received: by 10.200.23.140 with SMTP id o12mr17871836qtj.269.1506940914904; 
	Mon, 02 Oct 2017 03:41:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.157 with HTTP; Mon, 2 Oct 2017 03:41:54 -0700 (PDT)
In-Reply-To: <CA+aJhH1pOZyXvkSCfp=g6C15oe+NQD0+fMKwcTiK=bOTnsZAEQ@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
	<CAMKF1sp1R_wnW6Zkh96WWJKgC9zzgtbO-__JvqgEYWp_B6whzw@mail.gmail.com>
	<CAHUNapT0zPy9SUv+g7OBKp86BF_s8_=_RPrmNhMJQa7S8LbM8w@mail.gmail.com>
	<CAMKF1sry4fSRQa-wqcdcds0U8tN3jQhRdLZbtU1OzBG-4rSVTA@mail.gmail.com>
	<CA+aJhH1pOZyXvkSCfp=g6C15oe+NQD0+fMKwcTiK=bOTnsZAEQ@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Mon, 2 Oct 2017 20:41:54 +1000
Message-ID: <CA+aJhH1TL8pEm+PtfAsarOjjm4L583M2G2JGd9_DUQ1+uqZVrA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 02 Oct 2017 10:41:54 -0000
Content-Type: text/plain; charset="UTF-8"

On 14 September 2017 at 22:56, Nathan Rossi <nathan@nathanrossi.com> wrote:
> On 13 September 2017 at 11:24, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Sep 12, 2017 at 4:42 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>> On Tue, Sep 12, 2017 at 4:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>>>> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>>>>
>>>>>> Please note whilst this series is sent for oe-core it may be better
>>>>>> located in another layer? (e.g. meta-oe). However since the recipes and
>>>>>> the tools they build are not specific to a single BSP it did not make
>>>>>> sense to keep in a BSP specific layer.
>>>>>
>>>>>
>>>>> Sounds like a dedicated FPGA layer would be ideal.
>>>>>
>>>>
>>>> I think a layer for 2 recipes might be too much. Put it under recipes-devtools
>>>> in meta-oe for now.
>>>
>>> 5?
>>>
>>> Am I reading this patch correctly? There are 5 recipes?
>>
>> 2 or 5 doesnt matter I just meant "too few to be a layer of its own"
>> engineers minds :)
>
> That was my initial thoughts, and I was following your suggestion Khem :).
>
> Though it seems like now is probably a reasonable time as any to
> create a layer to give a home for recipes in the HDL/FPGA space. After
> all there are other projects that I would like to look at and probably
> create recipes for in time, so what is now 5 recipes is likely to
> increase.
>
> But I don't like the idea of a FPGA or vendor (e.g. lattice/etc)
> specific layer since that makes it appear like a BSP layer, and there
> is the problem of the tools 'conflicting' with proprietary tools those
> vendors provide. I was thinking of following the approach of a
> language-like layer similar to how meta-python/meta-rust/etc. are
> setup, something like meta-hdl? Which would cover the recipes in the
> language space (simulation/high-level hdl) as well as the recipes that
> translate/compile HDLs for physical targets (FPGA, CPLD, etc).

For those interested, I have setup a meta-hdl layer and published it
on github, it includes all the recipes from this patch series.

https://github.com/nathanrossi/meta-hdl

I've also submitted it to the layer index.

Regards,
Nathan

