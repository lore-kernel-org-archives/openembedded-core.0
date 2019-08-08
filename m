Return-Path: <matt@madison.systems>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA9AB7F333
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 11:56:45 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y17so64063434ljk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FJi085ueUNfqeBRSDkzODUTWw3o5GhuyWyNG+RYTxSU=;
	b=vom4G2JtsmdtxeFj04+vgtNOG5e/BDqVtbC/T160I8bWVCnrBGHV9xlRe6/fc9vgZa
	thle4UiqU/lx2EoEU5bjdiaq0yQfNU2lCxjCxWiWAxMwAyoV3M4nbvnW+XVoEQpuEsXf
	u16AvkVAqF1R2wR9AZgFtdbui3HHj2oZbJ+GB3ERUYbT/tNoarMItBiVWj3Y+9pLCH/C
	0F1XO8NZMSduiwsa1u+G4IP3MJC3yvSEGNGTeqEfzktI7bHsMqijh5cgcUWaXhk1e0CH
	JaCzE/1knlTgomeO62EazoTlet91ORAwWNyjRqhjA+dB0CSNkuB/RxAEjzTf+tf5Dq/g
	Fa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FJi085ueUNfqeBRSDkzODUTWw3o5GhuyWyNG+RYTxSU=;
	b=Kvg3ikBxYhOk6FIk86OgO7ezIrvCmyuTWOVQmQe4ZKMHAwGdAZtkPFc9HnkgU0ldCD
	RuzdJoy+y5MYgAgM332jhzc0hVG2S/5/gOol/t3RKL4PzxNXQgnwcm8S6OzUVHwkpHGD
	i/YR82xxNbwOIyJusg9m92Jt64pslPD/0aCe9Whp7z6hDSFqyW4agJG9vMD9w2XKTgFA
	RI0AlC9mkie7oIxm1MkxGSMhVAQcpBQbbsIcT7A82dEcKjMiDfGUnSglUDBq9j5WDmvv
	OUi4NhoKLI+qEBzGlHGKXpI74LessGyZ29hdYX9CqGr7RQr2/BGkPOpQS/nnK0g/EmtG
	WcFA==
X-Gm-Message-State: APjAAAXHmfYwLJqxBtxRIJIuS/m+z/NipWUEcNaCq5bncwj7CQCLBYHz
	+v+SD32W1QPg3zE2ga4k+EfKCD4Y0AoYQSS0ajmfjQ==
X-Google-Smtp-Source: APXvYqzPrJzf36r54ZUiwH5KTyOBEt2BXgtxSqs0C1Ft59rrGmdxcmyuBVvnocCNZm+ocEF9iZ7RYpyUzG2xoYVqDyo=
X-Received: by 2002:a2e:9250:: with SMTP id v16mr7897804ljg.89.1565265406339; 
	Thu, 08 Aug 2019 04:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
	<0fb7aa39fdcdc39f8a12149005f9b09d04074778.camel@linuxfoundation.org>
	<36918de5-75f3-b520-2c3d-72c3b9c1ca71@windriver.com>
	<8c974f0c0f5d98ae66c7add9646c1c840ead7951.camel@linuxfoundation.org>
	<ce3c8502-3abc-bb58-0972-513ad85ac2c3@windriver.com>
In-Reply-To: <ce3c8502-3abc-bb58-0972-513ad85ac2c3@windriver.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 8 Aug 2019 04:56:35 -0700
Message-ID: <CAGgRHJr9FUKcOzEsoU=M47hhU_8sQ2M_xfAyDn=gSNokA124Hg@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go/go-runtime: use update-alternative for zdefaultcc.go
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
X-List-Received-Date: Thu, 08 Aug 2019 11:56:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 10:36 PM Changqing Li <changqing.li@windriver.com> wrote:
>
>
> On 8/7/19 10:16 PM, Richard Purdie wrote:
> > On Wed, 2019-08-07 at 10:35 +0800, Changqing Li wrote:
> >> On 8/6/19 6:47 PM, Richard Purdie wrote:
> >>> On Tue, 2019-08-06 at 14:54 +0800, changqing.li@windriver.com
> >>> wrote:
> >>>> From: Changqing Li <changqing.li@windriver.com>
> >>>>
> >>>> fix below error:
> >>>> file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between
> >>>> attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-
> >>>> dev-
> >>>> 1.12.6-r0.core2_64
> >>>> file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go
> >>>> conflicts
> >>>> between attempted installs of go-dev-1.12.6-r0.core2_64 and go-
> >>>> runtime-dev-1.12.6-r0.core2_64
> >>>>
> >>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >>>> ---
> >>>>    meta/recipes-devtools/go/go-runtime_1.12.bb | 6 ++++++
> >>>>    meta/recipes-devtools/go/go_1.12.bb         | 7 +++++++
> >>>>    2 files changed, 13 insertions(+)
> >>> It seems odd that both of these packages should provide this,
> >>> perhaps
> >>> one version should just be deleted?
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >> These 2 recipes don't have any DEPEND or RDEPEND relationship, so
> >> they
> >> are independent from the point of recipe.
> >>
> >> Make one of dev packages empty seems not proper ?
> > Let me put this another way. What is the difference between these two
> > binaries? When should you use one, when should you use the other? Or
> > are they the same thing?
> >
> > Cheers,
> >
> > Richard
>
> go is for building go compiler,  and go-runtime only contains go
> standard  runtime library
>
> There are 2 use caes:
>
> 1.  on target, user only install go-runtime to provide libstd.so for
> other go apps.
>
> 2.  on target, user install both go and go-runtime
>
> in my opinion,  only in case2,  install dev pkg is meaningful, so maybe
> we can remove the conflict
>
> part of files from go-runtime.
>
>
> @Matt,  you have do lots of work related these recipes, could you also
> give your opinion? Thanks.

Well, those 'z'-prefixed files are ones that are generated during the
build of go to embed default flags for the 'go' and 'cgo' commands to
use when they have to call on the C compiler.  They also happen to be
generated during the build of go-runtime because go normally doesn't
separate its toolchain and runtime builds, whereas we have to for the
cross build case. So filtering those files out of the go-runtime-dev
package and leaving them in the go-dev package would probably be OK.
It's something of an artificial distinction, though.

Regards,
-Matt

>
> >
> >
> >
> --
> BRs
>
> Sandy(Li Changqing)
>

