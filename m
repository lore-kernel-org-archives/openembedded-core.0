Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id AF54979485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 23:18:50 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id m13-v6so10263554qth.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Oa4higVcMegcj8vPD83ewZSDHptYgKRz8D0N26zTgvk=;
	b=faODe24Qo7r2YPvzfgaJLqeZrlH5pcZhu+suyn65HJ+/uLvSrAGfA4TGSlTihG2IUw
	XSbMBbG2oz6O4gw/aHoupzewqlP3BgGRU0HNpKaPmhh21a+Z08yIktdWwWguBzXsfIkZ
	qquBZB3nibHIGSKrSWEAmPbxK88mIELL09CBVklfPUCrlP2TuV+L/bSAmlgAeyPppyhJ
	QPInmXmsNs52gKwS0gP7+iaLiW7auk1YSy4n6+gU2O94FX3zwooclRHjhBTV51eq2+00
	dCBZFcMLcl4QfD/JwZWn80wRnoBzapqcb16A5caaRMQacn5P/LGajfMtCxboFedvgNOa
	rsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Oa4higVcMegcj8vPD83ewZSDHptYgKRz8D0N26zTgvk=;
	b=r5km+jmumVCYr04rbGjec6N1Hihqv1UmFfKxN2gsYOZFKDFMp6u+wTnDIzM0fWryB6
	8N20PjucCS4+kRpx2zRNvDPRhRqLrjFYqEUpFLRRucX2X+4Mr4+cuPRDK/It2+/6Hr6+
	TY1E1u2SZeRdlALpHHv1OF/RHPB4koxgIDadW95b5aUSw/atpyhidn7Cv/CWHlQagMKO
	BjsVjXvHvJ6sFL5VXQzqQwCia+xFjSdtRQLoxcNm/ZLjez1B3cK9qudyB1zhyxbOXMI6
	fESVW/5VrguHvQuzrxNeBt3mH0nEpHjsOjm87L1faJizbxdVfCL47/HQ+5+VzXzwSEWA
	ziKw==
X-Gm-Message-State: APzg51Dxy36koDyqWlm3nPW10ptGLWFFbD2VtJIZoG6IPO2acYwK74Hm
	uS7CL5VyPp1fIBdSMppbyBe5irgVSBH9nXm0Vzw=
X-Google-Smtp-Source: ANB0VdbPVynNYpR+X5ki/vPb3DWOyAdLWYIgpwhAjQXaN7/Y2yY0vdH9XhQqGZufpPNx43JjtwLIB2ZgFsEb9W8Xc1s=
X-Received: by 2002:aed:3848:: with SMTP id j66-v6mr20925qte.218.1536189531350;
	Wed, 05 Sep 2018 16:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
	<CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
	<CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
	<CAMKF1sq7UQMb7qGtEZhXiB5W09sTxYQdt1ZMq6cEUic6UcCd_g@mail.gmail.com>
	<CAP9ODKom3jT=M_X6wrz5WKRat3yRxtukm5Hrg3FnEtJUiis_vA@mail.gmail.com>
In-Reply-To: <CAP9ODKom3jT=M_X6wrz5WKRat3yRxtukm5Hrg3FnEtJUiis_vA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Sep 2018 16:18:25 -0700
Message-ID: <CAMKF1sp0rF18CtGd3NZigqtqAnrpot+kgNzd2zWQ1LQezzBVUw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Wed, 05 Sep 2018 23:18:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 3:38 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Wed, Sep 5, 2018 at 12:18 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Sep 5, 2018 at 6:42 AM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > >
> > >
> > >
> > > On Tue, Sep 4, 2018 at 8:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> Here is one failiure that is seen in meta-oe with updates cmake
> > >>
> > >> http://errors.yoctoproject.org/Errors/Details/190510/
> > >
> > >
> > > I am looking at it...
> > >
> > > Seems not related. I built poco using cmake bump and OE master.
> > >
> > > Seems related to the musl update on master-next.
> > >
> >
> > here is glibc failure log
> > http://errors.yoctoproject.org/Errors/Details/190886/
>
> I did build against master and master-next and couldn't reproduce it.
> I saw you are using 'bec' distribution and I used 'oel' so it might be
> changing the end result.
>

did you try poky ? we now build with security flags turned on. Soon
to be propagated to nodistro in oe-core as well.

BEC distro policies are same as poky with few additions
see

distro
https://github.com/cbrake/meta-bec/blob/master/conf/distro/bec.conf

local.conf
https://github.com/cbrake/oe-build/blob/master/conf/local.conf

> Any idea what might be causing the problem?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

