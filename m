Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 225E3793BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 17:13:44 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id h1-v6so10797415uao.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i0wDKq989JtYd6HV0WZjItgNSq5PfOWE4MVjhOpRioA=;
	b=NgCBYfG3S1JOaaWM0ocGkVj4cO8JiiOVtuHy2WXo/gb07K/4EOcXBMGQKXCDxfGHFw
	wANYsHK1IYKHqGQGlfxhOppF0VyeIijYVq0cGV3e0WyuorG4XxcqKXDuAFOw2hIoV6IV
	CTkOjI13SywFE4ckIm6io8ZkFmXdbURaQ5GTGojDhgtAEN4zf6mONkc5uLnkrdQIJBaz
	wAOJ8bmqrgYA4LH2qcOS0Yrb9NQKBo+OCe3wYc4u9edZ1lQEoA27WLR2X2v6CBaz9Jo2
	w7jjF4KH7Dd36ZkVN4tvahvvzG3o09YJIFWXZAXPsdUw4R7b3+dTs4fgMxu9xrTHF5Ok
	u+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i0wDKq989JtYd6HV0WZjItgNSq5PfOWE4MVjhOpRioA=;
	b=HNGAVrNizmpw4TMAIl0tjvADsVVepUY6oMpVe7MOzn9mgRY32X0q0TaeRR7NQps+AE
	KDzBv+zZTDJ1c+J9iDuho7kgSaUdwCnP6nE365ANaqY5aHWF+Dnz7a6D7YZuuM1qF3XQ
	9FTTtNB0fzV6BpLfw/7LGkweENlY//8xnbGVdLea7lBPW/q5xUMqK1mIkvui4LC4aG6X
	KV0ewbQ2NMej8CzdUq881Y4UDtXtZuPGEOGRIQcKahVOHW5jdfQ+Bacw6BXU1IVGiiYd
	BjfzynHxLydxFj45vXVHwmE8FspNGREtwIV/otP/tEf6GM760DvAQ/1w0MK37tl5GRTV
	lDlw==
X-Gm-Message-State: APzg51ADLoMCbQ8Omi05WNm2R58UYqVLDtPIAAm6pfVTBXQb9/sqg56S
	IGRyP9PlLUJSSGFux1RUeZ45pwhKMpl/HvjY6Zo=
X-Google-Smtp-Source: ANB0VdbbHeJEhHuKm+wyjrJLBWrqy2ZWISKS0QhbmGcNcXT03ktK4JoV8k6zzjTM/y0ayMl2X2ZAibcBlCCHZoWyr3c=
X-Received: by 2002:a9f:33ee:: with SMTP id
	y46-v6mr7647681uab.90.1537204424986; 
	Mon, 17 Sep 2018 10:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535478536.git.raj.khem@gmail.com>
	<62f7c23173a051958c2cf6e8d7a4fce9bd0ef279.1535478536.git.raj.khem@gmail.com>
	<CAO5Uq5SZ0hfF_zNcP9c0ntOwmCVbeKBqiApV6AOR2GkVSNOz+A@mail.gmail.com>
	<CAMKF1sqsO0b2uAmia7ko5qoZZRYReqaBYj-pDkjzR9v4Yif76Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqsO0b2uAmia7ko5qoZZRYReqaBYj-pDkjzR9v4Yif76Q@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 17 Sep 2018 18:13:33 +0100
Message-ID: <CAO5Uq5QpMKbO_Fj=bm9MouA38LVrUrAHF-xAkP1XGq4rVN-=vw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gpgme: Inherit distutils3-base
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
X-List-Received-Date: Mon, 17 Sep 2018 17:13:44 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, that works for me. I'll get a patch posted.
On Mon, Sep 17, 2018 at 3:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> No, it doesn't. but
> inherit distutils-common-base python3native
> together will work and also drop the runtime dep on python
> On Mon, Sep 17, 2018 at 2:27 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Hi Khem
> >
> > On Tue, Aug 28, 2018 at 6:51 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > its building a module therefore its important to provide correct cross
> > > build environment, distutils3-base automatically inherits python3native
> > > this is seen when using clang where it tried to link with gcc since the
> > > environment falls back to builtin LDSHARED variable
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > With this change I'm getting python3 pulled into images when using
> > gpgme, which I really don't want. If I add:
> >
> > diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > index ac9fccf..8b34aa3 100644
> > --- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > +++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > @@ -50,6 +50,8 @@ LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG',
> > 'python3', ' python3', '', d
> >
> >  PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', '
> > distutils-base', '', d)}"
> >  PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', '
> > distutils3-base', '', d)}"
> > +PYTHON_INHERIT_class-target = "${@bb.utils.contains('PACKAGECONFIG',
> > 'python2', ' pythonnative', '', d)}"
> > +PYTHON_INHERIT_class-target .= "${@bb.utils.contains('PACKAGECONFIG',
> > 'python3', ' python3native', '', d)}"
> >
> >  EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
> >                   --disable-gpgconf-test \
> >
> > I avoid that runtime dep, but does that still work for clang?
> >
> > > ---
> > >  meta/recipes-support/gpgme/gpgme_1.11.1.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > > index 151fc03f55..ac9fccf133 100644
> > > --- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > > +++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > > @@ -48,8 +48,8 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES}"
> > >  LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
> > >  LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
> > >
> > > -PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
> > > -PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
> > > +PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' distutils-base', '', d)}"
> > > +PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' distutils3-base', '', d)}"
> > >
> > >  EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
> > >                   --disable-gpgconf-test \
> > > --
> > > 2.18.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > Alex Kiernan



-- 
Alex Kiernan

