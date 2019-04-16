Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 32B917D2A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 18:01:10 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id e13so18390505ioq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qm4l0R2Bix9O9g8fki82GY81i1rqjCVOvbb35xT+t14=;
	b=lFH7/9AnZq6WibtzqXnQoew8pgp8UvI1Ku9VOih20cQyOSKydqQg9JCH5ULk0oijGy
	G6EX1ABHMH5/oQaV8hEI2LLl5dJV2mWka7BLIUqT1h2qFEpVyJFDTJfOJFM8eDreY7id
	SHWaDWnWgHZWOIP+LGu1ivnP3fXuhgD8ElQVWE7irL4uL3WERL9huRE6z13tNG49oEmn
	jMwOWBux2sG3AFyoJRura3L4qGvPShgqoSkZjt35lMPLAUXtGd046zINEC6zILAzyM8P
	2UhXeeoeyet+crn3mdIpJ9hpPWX+nbZna/bmmioDRe6K0v05fEnKyGHHC8ejSKlKuKy8
	Ax9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qm4l0R2Bix9O9g8fki82GY81i1rqjCVOvbb35xT+t14=;
	b=gVufnkgrSa9irt1/Od9eitzKnuCNpOJ3GBXCp5q4PzOTnNqpqeeQK9CoWXc/8ec9n5
	FJ43yPTOoqEgEN3qxflxjVIcdz25sXHKBST23dfmvtFgi9na1N1KcPWdgbCBEfpBW2lc
	/ojjMbdSMY9vwN/FlYza/8ZpemdNcP51dm7omSawDW0P80Dmo4i0BioxIRBSkCICXEs4
	5u0GMrevFAcL0zIRWiRG1DA6vuBkQKaTRqUnao8OITpX2y2gYrmZKYAY+N5ToYGyPHL4
	1odv1zq7FwGzWQblwH9q6/kKhs0VaeGmFLA0rWt7KaDIQHlj4Cpa9ggvmI07O08JmrRn
	ox6w==
X-Gm-Message-State: APjAAAXycNApTNY1cbMuMTJCrpuER3Jhb/Zj600kCXX0TTUtPVJ4EP+a
	dbv9iOZIaRQOG+hbDqKPBJ1jF1CacHx4rW1wErM=
X-Google-Smtp-Source: APXvYqwJIPzj21Di0uDkHao+XmW3bMjtx2pY/nkQ+8QXSC17amMEswBdaTfuxXkFRjzL4BbQkxrZvHIT56koUho0ZyQ=
X-Received: by 2002:a6b:e307:: with SMTP id u7mr52404901ioc.208.1555437670795; 
	Tue, 16 Apr 2019 11:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
	<20190415093825.GB4317@localhost>
	<CAMKF1sps-k6m=ZrpuMmhj23ZkmF8C=17hGPscRH-V0cagV-2rw@mail.gmail.com>
	<20190415162156.GA16706@localhost> <5CB5960C.2030408@windriver.com>
In-Reply-To: <5CB5960C.2030408@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Apr 2019 11:00:44 -0700
Message-ID: <CAMKF1soGYt5qNKtQMuCDmjvqgsc5B=qfjrt-3jSvUR4PmY1UsA@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Apr 2019 18:01:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 1:40 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2019=E5=B9=B404=E6=9C=8816=E6=97=A5 00:21, Adrian Bunk wrote:
> > On Mon, Apr 15, 2019 at 07:19:13AM -0700, Khem Raj wrote:
> >>
> >> What are you trying to convey ? That=E2=80=99s what I mentioned before=
 I began my
> >> reply however to reiterate my point was if a package is not usually bu=
ilt
> >> and tested with this combination which is evident because it fails to =
build
> >> then how good would it be if we fix this error especially complex pack=
ages
> >> like compilers so is it worth to fix them or disable Og for them
> >
> > Packages that usually get built and tested with -Og should be pretty ra=
re,
> > and these specific build failures are better at finding the rare packag=
es
> > that use -Werror than pointing at potential miscompilations.
> >
> >>From a distribution point of view, a package build with -Werror by
> > default is arguably a bug since this frequently breaks when something
> > is changed (usually the compiler version).
> >
> > -Og is better suited than the -O that was previously used for debugging=
,
> > but are we talking about debug builds or production builds?
> > If users would be using DEBUG_OPTIMIZATION in production builds that
>
> Thanks Adrian and Khem's response!
> We indeed don't use DEBUG_OPTIMIZATION in production build.
>
> But still comes question: how to silence gcc-sanitizers build failure
> when debug build enabled?
>
> Thanks,
>
> > would be wrong - this will always be a mostly untested situation
> > with an increased probability of hitting bugs noone else has seen
> > before.

disable warning as errors.

> >
> > cu
> > Adrian
> >

