Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF8561824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:51:21 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j17so16321679edp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iTnxX5T+RUWhlnOpcbgNVM8DaLg5pzjK6ZnLyIHlE1Q=;
	b=bcxLFqncDIQpagQcMR5w5OxN1phvfs1EOtwgIh2uvQ2znKdWu4k7q2i6NaAjxWe7na
	V/jusolMhDDw3D9/l+G+327Ft9+g0StCiP5akJE51h6gJRJ9ZqMT5ZFy7YYoaF8CRtek
	DWWP4FlmxPy2Td1gklQAbbl7BVCxSUau7gOVZ3XzmUnetm4z3t/FWxWKMiIL3uHMkbFW
	ypRuELBMNiGhc6uGRHyKjP21dxmRBRz6RKu2Z4iGI3XZx+rOLhWMBCGa5QNn45T/R8Yl
	+B02tKnXTqs9sGiv/rQAaaYHqjm8vZDRVwwgs/TTKjvj3LTt6q5cIRvYvmtro7Wpw01B
	NHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iTnxX5T+RUWhlnOpcbgNVM8DaLg5pzjK6ZnLyIHlE1Q=;
	b=GEHYbLufmkxg2iZ1MaZ5k3AjhaiBnVUIG/4oiHc4Iofu9Y/jolrl4+AcTYBYrkGkgt
	e0TpnonKgck/eM/TuELzUTCkwo/R9Gjcc4dX6sNDu/wUPPHtIf67TWBknJ0DrbdKXlR+
	642/PXkZSukw2xanwpeLM/I97GhVDGVdYgoEK/p3BNeEqxV3dRRLMKqNctbIXl30vuty
	25OyoBJCo/qjPDIpIcA3/yUHw1tawqeAY6i8bgc76rWrj8+Msl496YhQbtzLMR2l1jZj
	6Wx7IkgKTJZ11cW1xFeer9LuVcsMdU7//5XB5/fPMLVgu2V4iPY8GpqNAM2LZSBUDHxb
	R8dw==
X-Gm-Message-State: APjAAAVTRRlt00io/Oh31bu62tB+fq6oRWm+KmQModDire3wTtYmZ8FR
	me5leWwQVwjA8wKuR/T2LVkD1W2sJAg/clQiBCaP64c/
X-Google-Smtp-Source: APXvYqw9a9E8V6m8sfsaV5qbINmL/4/cPhz2z6RPPQD2z650CnONBZiFpFFKm9cquiN/eJ9rLqAZQbs8OT56zoLALqE=
X-Received: by 2002:aa7:c616:: with SMTP id h22mr48743946edq.352.1582638681852;
	Tue, 25 Feb 2020 05:51:21 -0800 (PST)
MIME-Version: 1.0
References: <1581991613-30949-1-git-send-email-li.zhou@windriver.com>
	<CADkTA4Oo=uvRps0UUcbrk+eZDhaN3Fi8M-RDcdKuLz-zAOGM3A@mail.gmail.com>
	<342f0a1b-aec2-932a-2a49-cd2b896d8822@windriver.com>
	<CADkTA4Mp8rTZf2z3cCehWipMT66BXhyhkzfZQaB1LGqS88OEXw@mail.gmail.com>
	<e817eb26-13ce-efb3-288f-09c654628971@windriver.com>
In-Reply-To: <e817eb26-13ce-efb3-288f-09c654628971@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Feb 2020 08:51:10 -0500
Message-ID: <CADkTA4PXijN_vkuWGd6bSxyrUGRi227xZYe+v8HGiLUMRMzv4Q@mail.gmail.com>
To: zhou li <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix missing generated files from the packet
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
X-List-Received-Date: Tue, 25 Feb 2020 13:51:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 25, 2020 at 3:18 AM zhou li <li.zhou@windriver.com> wrote:
>
>
> On 2/18/20 9:36 PM, Bruce Ashfield wrote:
> > On Mon, Feb 17, 2020 at 10:58 PM zhou li <li.zhou@windriver.com> wrote:
> >>
> >> On 2/18/20 10:12 AM, Bruce Ashfield wrote:
> >>> On Mon, Feb 17, 2020 at 9:07 PM Li Zhou <li.zhou@windriver.com> wrote:
> >>>> The file arch/arm/include/generated/asm/unistd-nr.h is needed by some
> >>>> external kernel module. Error occurs when building the module with
> >>>> the SDK.
> >>>>
> >>>> Add arch/${ARCH}/include/generated dir and files under it to
> >>>> kernel-devsrc package to solve this issue.
> >>>>
> >>>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >>>> ---
> >>>>    meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> >>>>    1 file changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>> index b6f2dbc..8621fe1 100644
> >>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>> @@ -108,6 +108,12 @@ do_install() {
> >>>>           fi
> >>>>
> >>>>           cp -a include $kerneldir/build/include
> >>>> +
> >>>> +       if [ -d arch/${ARCH}/include/generated ]; then
> >>>> +           mkdir -p $kerneldir/build/arch/${ARCH}/include
> >>>> +           cp -r arch/${ARCH}/include/generated $kerneldir/build/arch/${ARCH}/include
> >>>> +       fi
> >>> This is just papering over the real problem.
> >>>
> >>> Anything that is generated, should be regenerated when the headers are
> >>> used/prepared.
> >>>
> >>> What is missing and/or why isn't that happening with this ?
> >>>
> >>> Bruce
> >>
> >> In some old version yocto, the file
> >> arch/arm/include/generated/asm/unistd-nr.h can be directly used from our
> >> sdk. So now it isn't permitted any more? And we should figure out how to
> > Anything in the generated subdirectories of the kernel build should be
> > regenerated when we do the make prepare/scripts/modules_prepare steps.
> > If it isn't being regenerated, then we are missing something in devsrc
> > that can regenerate them (either a step in the preparation, a
> > Makefile, a script ..).
> >
> > If we start pulling bits and pieces out of generated, we'll end up
> > constantly having to take more and more, when the right thing (by the
> > way our minimal devsrc is designed) is to have it regenerated.
> >
> > It's valid to use it, but we shouldn't need to copy it if it can be
> > generated. If it can't be generated, we should document why with a
> > comment in the code and in the commit message of the change.
>
>
> Hi, Bruce:
>
>         Thank you for your reply. I try and find that <make archprepare>
> can generate the header file mentioned.
>
> Then do you mean that the user should run <make archprepare> to generate
> the header files needed first, and then make their own code using those
> header files?

Yes. That's the model that we follow with devsrc, if it can be
generated, it should be. It keeps the source as small as possible,
prevents people from patching transient files and guarantees we'll
never get the packaged and development environment files out of sync.

If "make modules_prepare" or "make scripts prepare" isn't
automatically triggering archprepare, then we should make sure it is
documented.

Cheers,

Bruce

>
> Thanks a lot.
>
>
> >
> > Bruce
> >
> >
> >> generate it again when developing the external kernel modules? Thank you.
> >>
> >>
> >>>> +
> >>>>        )
> >>>>
> >>>>        # now grab the chunks from the source tree that we need
> >>>> --
> >>>> 1.9.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >> --
> >> Best Regards!
> >> Zhou Li
> >> Phone number: 86-10-84778511
> >>
> >
> --
> Best Regards!
> Zhou Li
> Phone number: 86-10-84778511
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

