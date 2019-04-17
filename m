Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E877B7D20D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 17:15:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v20so28179689qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K2vzHpgYnCtJVcyz9hWcbb+T74AFWL0TS+bYp/Q8HJE=;
	b=htHs/LfD2wuCqQPb9DxV7l/rJZUMq2oGbgP5jc5UMyCyXl5Y//cMTOmUyvtFdBinPW
	kzrRxOn0FSvZ5I9kW1l3lFEMewLhpGrdtNSfz9j6P+XdOJcHfScZdZ/MDD37AGpMIXl0
	vfNP3J6gZk+niKxNJWKuyVajvbvw9hA3/1PxWG7tdQutUDBlT+fuSxZprFCXTno8Xj80
	MlMuT4q3MzX/P5Rq69ZseCbpXczCypAKvD4fDI5oII5lcZ1Gy+OPXxWjN/kjYVsth0qP
	RfOJRY/IEIdJEso2lgiFlx57e9/fbbd4+NnTTCJ4KDdnG6Tnbd8RaeMzpfhFkn2CLXKJ
	I02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K2vzHpgYnCtJVcyz9hWcbb+T74AFWL0TS+bYp/Q8HJE=;
	b=CWyakKT7u85vvldhM6vecxBCr8Vl1dQrDRiiqAsdcQ6t6fXMNPcOOxXvgfL7nARpq/
	6EBhBfY1ikDogXOFiDvw5f0Yr7Cs/9luRuMreorgycwxu2YR3M0DsBw6/TQtM5tpY3O2
	ClL1pGJhD3aey+3/VND5LWV9TwwB7Ej0dosvbLfbuYUGsyqBnpsANV0Kq3HF8AJEgOsI
	4+l2ebwxDIAOYlxfAtSCiL7cUhg6vUUhlgCyDhU93XXlIYrCOpdLktAhbqyF0WIfurMD
	6Aac0WOjker+tD5lNszo3PzkdmcOPX4EcUY5Fjn7Y5px0CFUVYd7Qht0MKCaw/o3FP1O
	7qwQ==
X-Gm-Message-State: APjAAAW30uriRLsR/YBOTtJJl3rQYs0Wxgulr8j5EJ7vKB28zVw/Logz
	LjAhGBAlj2TXaqaQzvxwbbHBCyyr190EC5LvtWg=
X-Google-Smtp-Source: APXvYqz4zP6r1V99aFVRhIhD0b+6Y5Yo4EpSyy9Ov7v5oWKnv71KrvVadB+EDWciTzdNTp+JHGcoRfsCX+XmpTR+xKc=
X-Received: by 2002:ac8:2f59:: with SMTP id k25mr74777296qta.254.1555521304763;
	Wed, 17 Apr 2019 10:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
	<20190415093825.GB4317@localhost>
	<CAMKF1sps-k6m=ZrpuMmhj23ZkmF8C=17hGPscRH-V0cagV-2rw@mail.gmail.com>
	<20190415162156.GA16706@localhost> <5CB5960C.2030408@windriver.com>
	<CAMKF1soGYt5qNKtQMuCDmjvqgsc5B=qfjrt-3jSvUR4PmY1UsA@mail.gmail.com>
	<5CB6DA7F.3020106@windriver.com>
In-Reply-To: <5CB6DA7F.3020106@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Apr 2019 10:14:38 -0700
Message-ID: <CAMKF1srdh__hbAEe8jyDx271T831dYW+RMhZTMHkc9hzuLh32w@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Wed, 17 Apr 2019 17:15:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 12:45 AM Yu, Mingli <mingli.yu@windriver.com> wrote=
:
>
>
>
> On 2019=E5=B9=B404=E6=9C=8817=E6=97=A5 02:00, Khem Raj wrote:
> > On Tue, Apr 16, 2019 at 1:40 AM Yu, Mingli <mingli.yu@windriver.com> wr=
ote:
> >>
> >>
> >>
> >> On 2019=E5=B9=B404=E6=9C=8816=E6=97=A5 00:21, Adrian Bunk wrote:
> >>> On Mon, Apr 15, 2019 at 07:19:13AM -0700, Khem Raj wrote:
> >>>>
> >>>> What are you trying to convey ? That=E2=80=99s what I mentioned befo=
re I began my
> >>>> reply however to reiterate my point was if a package is not usually =
built
> >>>> and tested with this combination which is evident because it fails t=
o build
> >>>> then how good would it be if we fix this error especially complex pa=
ckages
> >>>> like compilers so is it worth to fix them or disable Og for them
> >>>
> >>> Packages that usually get built and tested with -Og should be pretty =
rare,
> >>> and these specific build failures are better at finding the rare pack=
ages
> >>> that use -Werror than pointing at potential miscompilations.
> >>>
> >>> >From a distribution point of view, a package build with -Werror by
> >>> default is arguably a bug since this frequently breaks when something
> >>> is changed (usually the compiler version).
> >>>
> >>> -Og is better suited than the -O that was previously used for debuggi=
ng,
> >>> but are we talking about debug builds or production builds?
> >>> If users would be using DEBUG_OPTIMIZATION in production builds that
> >>
> >> Thanks Adrian and Khem's response!
> >> We indeed don't use DEBUG_OPTIMIZATION in production build.
> >>
> >> But still comes question: how to silence gcc-sanitizers build failure
> >> when debug build enabled?
> >>
> >> Thanks,
> >>
> >>> would be wrong - this will always be a mostly untested situation
> >>> with an increased probability of hitting bugs noone else has seen
> >>> before.
> >
> > disable warning as errors.
>
> Hi Khem,
>
> I don't quite get what you mean. Disable warning as errors?
>
> As https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00315.html, gcc
> upstream thinks the build error is meaningless when compile
> gcc-sanitizers with -Og and suggests not use -Og to compile for
> gcc-sanitizers.
>
> So I send out the patch to add the workaround [DEBUG_OPTIMIZATION_append
> =3D " -Wno-error"] to silence the error when debug build is enabled for
> gcc-sanitizers.
> If the workaround isn't suitable, then how to silence the
> -Werror=3Dmaybe-uninitialized issue build error when debug build enabled?

I was meaning to say that remove -Werror from cmdline completely

>
> Thanks,
>
> >
> >>>
> >>> cu
> >>> Adrian
> >>>
> >

