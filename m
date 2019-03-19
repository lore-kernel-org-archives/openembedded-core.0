Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 631687CE41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 18:13:52 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id e15so6778184uam.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C3vvKIYbaUdJosZQ27+GmVklLvFASFh9TAo/xSSJFrk=;
	b=usOASOJBf09qceVoNaRTE3jYVDQshAImXZrzxI6UvnSAp3ZtmwspzL6p3y09taEAD2
	njW7F8PcR3M4t/g3zj6yT6NWbK10qB3wEf/szItbf7OKptc029+BF7xOoMwabp59YP7e
	sn0WafMydEMXNLooSjwSbsEaaH0h7+IsbmiOsvugb1QU/Btavci3XhFPaINnXOPexoIY
	s0MTqRiCxc2QjxVvKxrbSOIocyKHNJeVSMPtG1j8Jf0AuB+j2GAYD726WnF2glK6rJd6
	vREaREjpuASOsfId9kWbULmuqpcTWIKJg6GKJjoTbsL/jbCL+sxLWtt4DGrKl5i2uIJQ
	0o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C3vvKIYbaUdJosZQ27+GmVklLvFASFh9TAo/xSSJFrk=;
	b=BO8bCdK23ctcYysthrfglt6ffqLX7SCgyiyxUeqTN6dIjDUYEOZ4XM7PV2B6s82VLx
	yihaoymqeJ/zVyacO72sUGXqPmMVqtDTZbto4wJub01Ooi1eOUSSvSNccS93IivVQ+5i
	s+qv+zkWrA0HswEOol6HfmQ1vL5Jk4pcTA7Be3km3dkPQmDa3xgQHPa55IK6PottFvTg
	v3DTnISKQNc/j9nY45Rkuz37tzLfjVPgrhyFWaS39BHyVMVxECqT+99oEocS9b0rgMSh
	gZZPUrOfB4m4lMEjVoomxlJQmVj0am/q8ydrFlFylwLNm15dRsQFWiDnTKkynM4+OTEo
	kkog==
X-Gm-Message-State: APjAAAWnVlJtI672ngYdIg3LWgPb1L/LES4ASZLDdFTfeFML9mgUKoaG
	XIbv1AB8Ffi/4afZmWszYYh360Z36jfBrnzTiei/Ug==
X-Google-Smtp-Source: APXvYqwzWJBl30Aggl0OGhzmeotPL1dLMUm0sidXwsmVYGHAgcRioph0ecfsBGNvzucHDzuXEqmosH9AYWc+TQbflfc=
X-Received: by 2002:ab0:164a:: with SMTP id l10mr2063530uae.116.1553019233084; 
	Tue, 19 Mar 2019 11:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190319135727.31246-1-otavio@ossystems.com.br>
	<CAJ86T=XEpJ2AB_3azYJi9+Lm=RnVxQMHTrOg4NL941850zcH3w@mail.gmail.com>
	<CAP9ODKrcLgW5UBxzyw5g=PsnzfV4HJiwDn1FL6ck1Z5yfKRCAQ@mail.gmail.com>
In-Reply-To: <CAP9ODKrcLgW5UBxzyw5g=PsnzfV4HJiwDn1FL6ck1Z5yfKRCAQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Mar 2019 11:13:41 -0700
Message-ID: <CAJ86T=WNXpW8U87T7f9tCwhixm-TcCQ7tYwMhgP7ucTSeLkTGw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/2] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 18:13:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 11:11 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Tue, Mar 19, 2019 at 2:38 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Tue, Mar 19, 2019 at 6:57 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > >
> > > We had a c_rehash shell re-implementation being used for the native
> > > package however the ca-certificates now uses the openssl rehash
> > > internal application so there is no use for the c_rehash anymore.
> > >
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> > >
> > > Changes in v4:
> > > - remove perlnative requirement
> >
> > You actually removed hostperl-runtime-native, not perl-native. It's
> > not really correct though - the hostperl-runtime-native dependency is
> > there to ensure we can run the openssl Configure script, not because
> > of c_rehash.
>
> Yes; this was fixed on v5.

Yes, I saw that right after posting :-) Sorry for the noise...

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

