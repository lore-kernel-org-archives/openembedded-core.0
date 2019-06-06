Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8137D674
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 12:55:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id m15so88813lfh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vBu7feKTstXriJn4seXbl/hnRbsUphLheHCkf1W26us=;
	b=dnVHbYOV7bEQXc/kq7Q9VKCfWxE9xuEmGiGNvSZMGDDU+MIaxZZ5jvg4VVxLdscW6G
	QZ0B4f8n3w+LDWQJzLwhFdb0/E8uAYhUohOQzoqDJut32OczUbvAau48/zPpdOg+eEah
	XcUnpWtr/rhlh1dK07SSAPcbIgkqAH8KsSPSYBMdKdf8pU0t6Fpaq9S7deop9CMDVpgF
	itvi3xm/dw+rLwzkLqWAi7TmYzZ6L4iwDBov+tjQmKf4hj90Ca3G8ucOtnt0tDIRZKIh
	mqEa0w+ALnyYrtiVAjx78Qldc99MW7SPNxP9EJrEKoH0wZtjNIZ8wG0XynncAiJP6uGT
	XJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vBu7feKTstXriJn4seXbl/hnRbsUphLheHCkf1W26us=;
	b=C5qZJfNmIetTJ+Q3omqxU5+dVPjmxTYbo3pwFwam3pAvT2cZfJkRh+3+lCnMIpZD/f
	e/Bcl/OYPrYNLFdOZ0zv/UtvXatQKZbH1RoEDDd5XaaTVSkTvOUryHdvvd1wA94M20nq
	tqvWcCu03zSoNVJYhFDDXUBCxkXQjHMSDhsJuKdEt/l0XYOmZxsrrlNPw4wXOo7C5HhU
	KxDTomW/Tvm4VggHrznjhhFGkgM+NrR1ntkaS1AMLnOxSo2ctuil4c0ULg6a5/NNlfUw
	PSbLCfvpoiCK/aDJq1fVseXXlhjdGpCNC5PCq6A8JXuYFMzRkTfBmBxeWCQFD9BA0C/k
	vUUg==
X-Gm-Message-State: APjAAAXpG1o/bZ34Lmf+4Br5+FCK+aJhH2sm+BFFAMjbR0ldRS6mv5be
	BDmAPzpVBEwQt2wqXGgLl53WTKFYdiommhiSFRc=
X-Google-Smtp-Source: APXvYqx1m83Nvtqf8wnHmSUWnlr7JbFjOSry3Zo2avdwze3h1zbj886POv5fxa7+pKRw5UQf7FydvJyBqA80/rnSCCI=
X-Received: by 2002:ac2:4111:: with SMTP id b17mr2963351lfi.31.1559825738937; 
	Thu, 06 Jun 2019 05:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
	<CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
	<CAMKF1spLF_rzm3Vet3Lq+DjCxF96koSORHLukxjmiVX2Csapzg@mail.gmail.com>
	<CAMKF1spmyDREqVp4hu5UsSmfmi5KY7MgJNficCgZmXXo00tRjQ@mail.gmail.com>
	<CAMKF1soM4-qnt9STcuV=e8T=zLx1ESR=0HT3xeCCJ4J7mxCc_w@mail.gmail.com>
	<5CF8CBDB.8010705@windriver.com>
In-Reply-To: <5CF8CBDB.8010705@windriver.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 6 Jun 2019 13:55:26 +0100
Message-ID: <CABPh3UNbZui8F_uKB3L0pMxHN3AJMVwCwXVKSvDzVPeds_75Sg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core status with gcc9
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
X-List-Received-Date: Thu, 06 Jun 2019 12:55:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Probably is not an issue for ie-core but gcc-9 is also breaking all
the openjdk8 build on meta-java

Can this be postponed a bit?

Thanks
Nicola Lunghi

On Thu, 6 Jun 2019 at 09:11, Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2019=E5=B9=B405=E6=9C=8827=E6=97=A5 15:53, Khem Raj wrote:
> > On Sun, May 26, 2019 at 10:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, May 13, 2019 at 8:39 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> On Sun, May 12, 2019 at 1:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>>
> >>>> On Sun, May 12, 2019 at 6:21 AM Richard Purdie
> >>>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>>
> >>>>> I've run some tests and think we're now down to one remaining issue
> >>>>> with gcc 9:
> >>>>>
> >>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5=
79
> >>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/1=
45
> >>>>>
> >>>>
> >>>> Assembler is not liking what gcc9 is generating
> >>>>
> >>>> HOSTCC scripts/kconfig/conf.o
> >>>> /tmp/ccnMW5be.s: Assembler messages:
> >>>> /tmp/ccnMW5be.s: Internal error (Segmentation fault).
> >>>>
> >>>> I wonder if its a common case or specific here?
> >>>> I will try to reproduce it as well
> >>>>
> >>>
> >>> I am able to get a .s file which crashes assembler on
> >>> qemu. Same file assembles ok with mips cross assembler
> >>> so next I want to get hold of a mips hardware and try
> >>> it on the real h/w, meanwhile if someone has easy access
> >>> to mips and can load core-image-sato-sdk on it then I can
> >>> provide the asm file which crashes assembler
> >>>
> >> got some more time to narrow it down.
> >> works with musl+gcc-9
> >> works with glibc+clang-8
> >> works with musl+Clang-8
> >>
> >> so only glibc+gcc-9 combo is one which exhibits the issue
> >>
> >
> > I have sent a workaound for this which we can try out.
> > https://patchwork.openembedded.org/patch/161674/
>
> Failed to build llvm with gcc9 for qemuppc as below:
> | collect2: fatal error: ld terminated with signal 11 [Segmentation
> fault], core dumped
>
> Thanks,
>
> >
> >>>>> which is a kernel "make scripts" segfaulting on target on mips and
> >>>>> hence failing to build kernel modules. If we can get that one fixed
> >>>>> we're good from an OE-Core perspective to move to gcc 9.
> >>>>>
> >>>>> I have to recognise the work Khem has put in getting us this close!
> >>>>>
> >>>>> Cheers,
> >>>>>
> >>>>> Richard
> >>>>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

