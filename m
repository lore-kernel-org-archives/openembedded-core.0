Return-Path: <jdmason@kudzu.us>
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id BE4747FDC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:47:54 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id g12so2892836ild.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vH1wRl0/PXmd5uJQA/X3tMN1gkR6IsPxufq/KPc8yqM=;
	b=Oe7o+tdb0ItjEClrHRu+MFwj08Q1UEKUWfsA1f6NcAkshnbg1S2R+NQ1p2Ymq2pimA
	R0KYBhxEoEFGhtTQMVEZVqPYvHwD5GoZ6ygQHH1EoJF1bu8mh9SweRHlb0eiGoYEhcZx
	Ev6bwFOlkIkxj1COl7gaGVRWa2of/+OhsM1W7MWqCO/UL/jxRmA23ymJAp66LVaFWnA7
	7SXiMcKH6K3hyoab83cgBiQKi5O6PtQann1b2GxuU83+UrodjI0wIJ2k2BcwsooTy9cx
	//6GqPsS3HMI1KTagkK/mi6cPG2muAUnhoJWxBOkky/IVCpompT3g5HUqnMMH5SisXv5
	Q04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vH1wRl0/PXmd5uJQA/X3tMN1gkR6IsPxufq/KPc8yqM=;
	b=VCFBo+zAwTpCCCd902HQ0Xw7Bnw/Sh6vvVaH4Sci6aCFfkoSXPqCSw3wpvHIToFzI4
	6/UtkA+MtCyh0i/veMX/7GoHTzhqXNzB/QHTprtehKAZf6EKMZp00Jff+dMPSE1syXHp
	RjBDHOWWMDGJgodcY5ByLedxD13EaRD6CuEZHZXOw4qbcnbIItNWKUCcbT5WHn3pSw1D
	wh+vgnBWaQ4m4TVsTbpfj5fl5UGFQP2l4ptjdaDxqsgnj/1+cPz2L//qupisDvC9fU2R
	w8wOSJnNWe3046TO55IB4DvXfUFnDqWVkL66QVzWYa2t4YB4L7zXdMPTr9Ezs29Thp7K
	598w==
X-Gm-Message-State: APjAAAVO5PEd3wOMIVCjSmz/62m7F1eYog+eA6kPbehFVFJ8XjqZVhxQ
	3gCOxHT0iwb7XoW0yYIt/96HCF/6HmLLmqP3HogZpg==
X-Google-Smtp-Source: APXvYqzhUh6eG2SmfIJYbheACLeYRsSGtwiE+09i/Pl38zpNeG3gWE3ExXavHZZZ/PlHZQH82hUPdKMhgynqHRtCyL0=
X-Received: by 2002:a92:d308:: with SMTP id x8mr5464016ila.42.1579906075835;
	Fri, 24 Jan 2020 14:47:55 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
	<CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
	<20200123224340.GG4735@denix.org>
	<0620f17c-53ca-7e95-1607-621507baedd8@intel.com>
	<51f70cda-9ddf-ea8c-e8a9-3a3f69db8167@gmail.com>
In-Reply-To: <51f70cda-9ddf-ea8c-e8a9-3a3f69db8167@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 17:47:44 -0500
Message-ID: <CAPoiz9xzydOq5wiSJi0nnGu_RT2q0zKP+jVxuc9xYm5yS5N=Hg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jdmason@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 22:47:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 24, 2020 at 12:05 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 1/24/20 3:42 AM, Ross Burton wrote:
> > On 23/01/2020 22:43, Denys Dmytriyenko wrote:
> >>> Such as all the various cortex etc CPU tuning files?
> >>
> >> LOL! :) Of course, since ARM is such an inferior arch to x86.
> >> Otherwise we
> >> should move everything that is not needed by qemux86 to meta-intel...
> >> JK :)
> >
> > I almost pre-empted this comment in my reply because I knew it was
> > coming. :)
> >
> > Personally, not a terrible idea.  The slight difference is that
> > meta-intel is *Intel's* BSP and we don't share stuff like
> > firmware/drivers with AMD.
> >
> > Ross
>
> it will be good to find what the overlap will be, is it something that
> BSPs can use with minimum changes, or are we providing a template that
> will be copied over and housed in form of bbappends or bbs. I am not
> familiar enough to assess that.
>
> Perhaps it would be good to limit this to arm compatible machines,
> secondly, there is a point in having it in OE-Core if meta-arm is
> limiting itself to arm provided BSPs alone. I think it will be good to
> have a platform supported in core to be able to test it, between qemu
> and beaglebone, I guess it is not used. Or pehaps it is and we do not
> use it, so that change would be good to have as well.

To be clear, we do not want this limited to Arm BSPs.  We want this
used by everyone, to make this recipe as solid as possible.  Also, we
hope it encourages everyone to contribute their TF-A source code
"up-stream" and use the generic recipe.

Thanks,
Jon

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

