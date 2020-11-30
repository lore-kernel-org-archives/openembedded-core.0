Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web08.62887.1606755148167615985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 08:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RmYEn6bM;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id 7so8638368qtp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uhI03sRBpz2WZUL0hh+q1q5jPafKF4SPq2PdaSigM8c=;
        b=RmYEn6bM2dcn+56qeMgxinTQVIhZjB080jsXw1WkzyzRYmmlIgQz1Qt4PWM+Rn0SuC
         VTiDqoQScbVaZcCgD94EOnlMmD0HAm7JQMJtyT+F4XyFvcTtdbOqd/oBg7O2uizyitYk
         FVAsmd0Ltqhpw+jcKAkW1s6S3TTaK8y9nn+/Sb6BmQTQHd8nxXVvyfvZakyHxYev73t3
         EcZul34xmzEkl25VIMFnASWLFzeWeQ8+eTnSvqF0wuyvj1B0tj7/4mYfT/farRAXCBaT
         h8aqaA0Q4xeEpTU8hLTzPfVcf0ew9srBOQOTAkMUeFCxUoM6uAnguR52SO2miafUAXb1
         sPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uhI03sRBpz2WZUL0hh+q1q5jPafKF4SPq2PdaSigM8c=;
        b=DtuYfxGs908ALufCy3WFPJ7urVENOrIy8MpfMXSOanhFMc8CaeqQaqOHLr59/vNyhG
         n5e88cxsyHUaVXxNONNU6v143UGa8YQC39qZm/SbAYZNFQ7jBSsVscwcJaaE6YtaPtNz
         6MsanCsACbWzYBG2RkThwzgMQ6MIEkeIgR/cOvDFjcCrRVNyUlOC6XXZog315LlFNkSc
         UF9Kyln4nNFubvoSilDLmnG0DGiNeFVAF+yMuF6gUPKju8RtH/Ur8r9gbJFqIwOz9epd
         475hsAl8KvPCc3ONJbGWnFXbhknYHX4SGjSLTkNBkV6q0OtNPiwrwwTIDdwEwup8UFO+
         MzpQ==
X-Gm-Message-State: AOAM532AvqUui8aswbPsUA3Ei9vI0tUxN317RZzyyJUkouHVsMYz+RMJ
	wfIoBz4kcFfA0uOsz6rNsU1O2AxNzo6apCbNQS8=
X-Google-Smtp-Source: ABdhPJxUBSkKKArZQxe07dILUiGSNtrvxXng6gUB9CVjlotPAzgXZE+fRzFJpIXmYDBxS+8tdk15ofnO3uz28bkOHqM=
X-Received: by 2002:aed:2962:: with SMTP id s89mr22829658qtd.88.1606755147171;
 Mon, 30 Nov 2020 08:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20201129074802.1493537-1-raj.khem@gmail.com> <20201129074802.1493537-2-raj.khem@gmail.com>
 <CAAnfSTsTrHve_H+WMKdt7d2bYWC+mBKoTcWwa0sZ-Mo=xWWs6g@mail.gmail.com>
In-Reply-To: <CAAnfSTsTrHve_H+WMKdt7d2bYWC+mBKoTcWwa0sZ-Mo=xWWs6g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 30 Nov 2020 08:52:01 -0800
Message-ID: <CAMKF1sqa2JaqT2p7-5G7Bug9Rug-oZQPycaqp0HOwrzFpbU+mA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/5] python3-numpy: Add ptest
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 6:11 AM Ross Burton <ross@burtonini.com> wrote:
>
> Why are all the patches from this not squashed into this?  We don't
> need to see the bugs you fixed.

Right.
heh its better to eat the sausage than to see it being made.
Richard did it before pushing to all is set.
>
> Ross
>
> On Sun, 29 Nov 2020 at 07:48, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Since 1.15, numpy have replaced nose with pytest testing framework
> > it additionally needs hypothesis and sortedcontainers modules
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
> >  meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest
> >
> > diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python-numpy/files/run-ptest
> > new file mode 100644
> > index 0000000000..9a1c72aeb1
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python-numpy/files/run-ptest
> > @@ -0,0 +1,5 @@
> > +#!/usr/bin/env python3
> > +
> > +import numpy
> > +numpy.test(label='full', verbose=2)
> > +
> > diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> > index d54f2f6c18..b484e7cddc 100644
> > --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> > +++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> > @@ -8,6 +8,7 @@ SRCNAME = "numpy"
> >  SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
> >             file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
> >             file://0001-numpy-core-Define-RISCV-32-support.patch \
> > +           file://run-ptest \
> >  "
> >  SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
> >
> > @@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> >
> >  DEPENDS += "python3-cython-native"
> >
> > -inherit setuptools3
> > +inherit ptest setuptools3
> >
> >  S = "${WORKDIR}/numpy-${PV}"
> >
> > @@ -30,7 +31,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
> >                    ${PYTHON_PN}-pprint \
> >                    ${PYTHON_PN}-pickle \
> >                    ${PYTHON_PN}-shell \
> > -                  ${PYTHON_PN}-nose \
> >                    ${PYTHON_PN}-doctest \
> >                    ${PYTHON_PN}-datetime \
> >                    ${PYTHON_PN}-distutils \
> > @@ -39,6 +39,9 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
> >                    ${PYTHON_PN}-netclient \
> >                    ${PYTHON_PN}-numbers \
> >                    ${PYTHON_PN}-pydoc \
> > +                  ${PYTHON_PN}-pytest \
> > +                  ${PYTHON_PN}-hypothesis \
> > +                  ${PYTHON_PN}-sortedcontainers \
> >                    ${PYTHON_PN}-pkgutil \
> >                    ${PYTHON_PN}-email \
> >                    ${PYTHON_PN}-compression \
> > --
> > 2.29.2
> >
> >
> > 
> >
