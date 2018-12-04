Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 325316C480
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 12:02:39 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id b5so13987315iti.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 04:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a5UC3QSyh7OBD9tjvfmlSb9+V2QxZU6nAjWCwleb0yI=;
	b=UzUlrlkTlWJVVcqb0gfyJotArygpZFH15GylZcT5r0ciEUaOyuwCEvS/FQtj4aCy6c
	tzOJ5qnbDLHXy4X8Q37p+8C5mBZ2dEfR11aQq3BMDvwE3O57r/xVm+qIvGMXCvzQrp5D
	2RrR+QuHHIGuudS1HJ4I4CqviPtSnQ5pUMq1f0fgrTxF0Lfho8XvoqJEzztqIOgM+I+g
	f8qp+3RYo15e83nmKljaWjLjDV9eIgmpjCygQB1hK7mWrsHtJDkHScBcZchmSQ8K4LkZ
	WOCelUexzy7hrvqvMlwEEuzLTvxrYH++qHCmIgwjTHdV4YJA3Pf9eXsDWBDjOYJUJ7Fw
	0f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a5UC3QSyh7OBD9tjvfmlSb9+V2QxZU6nAjWCwleb0yI=;
	b=LU6bjxkeimksM8rrXYLs29+2pRTfyn7opzrmoThPp6KVu250u0L1dEgWuYsiTNcSiy
	xK9RK4glTPeaXvX3gCLLXJODpNHOmvD57TsSYfEUOkUx6GLchXnVaETvDDd7Ii74QlQi
	olJNpFB4oFGgBPEs4vO9qPqLEHbbY3Fwdg6wfTppWZ4njbnFiulQNhNEvy1tUcc5v7bk
	BHEcNBme+LhWEhQxRBKxbadAgXTmUj0sa4lgTqt+/yehhvx5aZxFIOsgFts+VWwSUPJB
	LCAcSa0lXpUYOL3iX977wN+jYO1DCSXhtjG++C49lB1qubwHlYTII7hqIB65KLgGEKBk
	XO5w==
X-Gm-Message-State: AA+aEWbclZjl0DY4XfD7PWik47HNLg5O7WRDXGNRcAOeVQZ+mqRMzklK
	4myh22BfG/xouVOmNYp6xmLkawYc2vr0dWf3FNOfU1OS
X-Google-Smtp-Source: AFSGD/V+Vhw5I8xOiDsv98P3ZrUf5cBg3zdtXH0fPeyzFmbi2aqcX+/L3TyCsnXSxoSZv/gtyFgVb7Xh2AlIk8D/Tts=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr10497548itj.62.1543924961095; 
	Tue, 04 Dec 2018 04:02:41 -0800 (PST)
MIME-Version: 1.0
References: <1543920528-21433-1-git-send-email-alex.kiernan@gmail.com>
	<CAJTo0LYsnuRBTeWZAStDNHzZHTnZt3+SH4XKgPydzDfrKF7yFA@mail.gmail.com>
In-Reply-To: <CAJTo0LYsnuRBTeWZAStDNHzZHTnZt3+SH4XKgPydzDfrKF7yFA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2018 12:02:30 +0000
Message-ID: <CAJTo0LZR+ZsT2hkszgLKELwJOQhLe=O2LV4LuTo14550QZ65xw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-docutils: Fix shebang path to point at python3
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
X-List-Received-Date: Tue, 04 Dec 2018 12:02:40 -0000
Content-Type: text/plain; charset="UTF-8"

Turns out we disable this functionality in distutils.  That patch
should be fixed to do the right thing instead.

Ross
On Tue, 4 Dec 2018 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
>
> Interestingly if you build docutils outside of bitbake, the hashbangs
> get rewritten automatically as part of the build...
> On Tue, 4 Dec 2018 at 10:49, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > By default we get a shebang path pointing at python; when building the
> > python3 version, ensure we use python3.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-devtools/python/python3-docutils_0.14.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3-docutils_0.14.bb b/meta/recipes-devtools/python/python3-docutils_0.14.bb
> > index 81a449d64604..a2880a9601d7 100644
> > --- a/meta/recipes-devtools/python/python3-docutils_0.14.bb
> > +++ b/meta/recipes-devtools/python/python3-docutils_0.14.bb
> > @@ -14,5 +14,8 @@ S = "${WORKDIR}/docutils-${PV}"
> >
> >  inherit distutils3
> >
> > -BBCLASSEXTEND = "native"
> > +do_install_append() {
> > +    sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' ${D}${bindir}/*
> > +}
> >
> > +BBCLASSEXTEND = "native"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

