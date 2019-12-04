Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id F2B487F7BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:13:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v2so1060920qtv.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IUkkt3K/DZcHf15ms+UkH2wQniPx/9gSW2shi3nDNgg=;
	b=K28k9BzImniBE00BLMRUs4pgCUHckSLQ2O/IAuTwDoqc7EoZ9AIJBaKB+3+8bcsaN2
	c/AcaoxBOPxa0ojoP1PvQsDGdSEPuq6MM945JFmBioUdaRjv10GDn7x2r26yrqR0WqaF
	b1SgtkhL/GHs9MXA5xUupEAddB7P5dKxVb3v/0ShYGr3WI1bWQ8qlpNd2Wh3zITy+Zxs
	PtJEhnu1hwR349+rGUdpyhF1NlRH6E5DmBbwTDjcJ5g/eFUPt4+Wp7SnPp2ZjwfpqjJZ
	01EbZdWUhy2FQITI+8ACBS96clk5mBy4bBydr1A56IjsP/S4UTbFCAxjGDG3kFxXP97R
	rdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IUkkt3K/DZcHf15ms+UkH2wQniPx/9gSW2shi3nDNgg=;
	b=VV+xSBEDFNB2GDyvx0VT0QQD2lbiUH2ea4gnrZGLW7rFZWuirJz4fdsTG6RYoAGhoF
	6DpeMB4LIXqshRZKfAPKT6kcT0g2n7/ia76G1h0E9N2d1ctMV/yinzaFQMkFzrWC0vNw
	W1vQdPc2QOE/mValhIJtvYQboNeDOqZ3DObYGet4dOm8LgXpMB14aA0sULua39oM1tBy
	xLH0CT0A7dA+LP5tnYNQUXpO2L3LlPFkpeCGTVjT8mMK275Ku3mEv4Ru5LNCDWzAFY7H
	i2uY+N7PryQmVOdoLKgue0l72+fGqjwKdFhtKp/lr5LM3AHyDbhhnKdqITehv9VzgyXl
	ISIw==
X-Gm-Message-State: APjAAAV8igGiAzKs/rhCN0LDVdP/xiiA1uAPsrfEfoj6rSAa4pTfs6YN
	x93wag+Hf3bLHsHI869kelcNFFHiTybJu0cYLNE=
X-Google-Smtp-Source: APXvYqx4C83lMsXOANXCSJJw/OnuZk5x8T7A8z867E+lOmKaIhuWsC7vRSeyahoa+FLCD444xamavM8NtiOj6TTXJ+U=
X-Received: by 2002:ac8:145:: with SMTP id f5mr4549629qtg.194.1575490401323;
	Wed, 04 Dec 2019 12:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20191204193254.2418208-1-raj.khem@gmail.com>
	<ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
In-Reply-To: <ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 12:12:54 -0800
Message-ID: <CAMKF1sp29T-e0=5BBoX_=ZtUEs7fh3qAU9P__dXQH6NxCL+6hw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Wed, 04 Dec 2019 20:13:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 4, 2019 at 12:00 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-12-04 at 11:32 -0800, Khem Raj wrote:
> > Use PCRE, this enables using posix extended Regexps on cmdline
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > b/meta/recipes-core/util-linux/util-linux.inc
> > index 1fa82363b1..8f867aa9b4 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "
> > file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
> >
> >  #gtk-doc is not enabled as it requires xmlto which requires util-
> > linux
> >  inherit autotools gettext manpages pkgconfig systemd update-
> > alternatives python3-dir bash-completion ptest
> > -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> > +DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
> >
> >  MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> >  SRC_URI =
> > "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.x
> > z \
>
> Given it works today without that, shouldn't it be a PACKAGECONFIG?

its default with other main linux distros. I thought since what we
were doing was not
default, I did not see a need for packageconfig. I can certain do a v2
with packageconfig
and enabling it by default, is that better ?

>
> Cheers,
>
> Richard
>

