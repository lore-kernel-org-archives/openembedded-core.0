Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F65E7CB4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:21:28 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id n8so363439qvg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D8ugcPDcFlWk4aie41kAr2YdXELvyAIE1PDTanKdGWE=;
	b=GoOLoKssG0fV7sEYhZqE69+tlrfV7EjVqtJV7d2EtDfwSAu4SkGElfXegnjIFJUgFf
	qJMVPov64qAr8/AewZ2Za1sS8hp559Um2qvU2UjFp0BBBu5xyYG5R2fCjcHdgMSlSjy3
	ZsbotYqdDhej5ejIkl5lN36vpOR8f8KbK8bs1zkv05L+mDrXMDsfomvcRPA1h0OQefXB
	QcGD0lnYJpWztdXO33itDIek5upSuoNTKpg5GzGhzmWCDICFhCogY4Fq2QwVoCG0jE9w
	9X6Sceab+4SNg8qp/ic3lxvcIjAVDU94sJx388Ox21wOBw7g2ZT2ar6p6XyFCZ7sWHg5
	ykzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D8ugcPDcFlWk4aie41kAr2YdXELvyAIE1PDTanKdGWE=;
	b=eeGfusoXKZ3zLKogaG1b+iuo3DIgbXmLCfS3uwuZjZnjrYMRmVVRuJC2f0/syWrAIV
	mrk0T3XDtcKNlnO3O1NAJQbpPOFXLr+gX+/9++sdEhXdxSQH/BVbvfYUQTIAn+jHc2fv
	nhwMF26vltrjpkq56JN0FJceEQdD3IrKpgoyhdzyfeyhvbhpJrCl31Idc2kbTEhqq39x
	WH7BZ970vRKAGeBesxrM2BL8/yGPpg4EIXfobaaSqJ8DX2+KaXhHt3cD3ImLwzr/oxun
	aJoZ+XBsEr+qSbpV7nMtUV5ZWG1uIyQgd3gYbgQ2nj6QHJP/3qEcJKhL+S7DNq8WdTlZ
	WKOw==
X-Gm-Message-State: APjAAAUinynryWmv4vXJ55JjuF1F5nYZhUQjtADpQEbUWKLwRKM3+XKt
	qOWds94RlaWa1TDD9/Xg2ROrdjHHqcHZNe+E/WQ=
X-Google-Smtp-Source: APXvYqyMznh1t9u0+5fGs1w1nro3pZLsQTh9ZdHiCvBWiuTbMFL7TL6cz39nXnaW7NMQ7ObCZauUeZwqdYpNptvaYWQ=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr4346229qva.109.1575490888665; 
	Wed, 04 Dec 2019 12:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20191204193254.2418208-1-raj.khem@gmail.com>
	<ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
	<CAMKF1sp29T-e0=5BBoX_=ZtUEs7fh3qAU9P__dXQH6NxCL+6hw@mail.gmail.com>
	<6cada1f180fe4bad594d71033573ff9fba3a30e9.camel@linuxfoundation.org>
In-Reply-To: <6cada1f180fe4bad594d71033573ff9fba3a30e9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 12:21:02 -0800
Message-ID: <CAMKF1srBqMDRHTDr9uKg4VLwNnFqPrnOwcv7S=8EfzvHDBZxuQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Dec 2019 20:21:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 4, 2019 at 12:18 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-12-04 at 12:12 -0800, Khem Raj wrote:
> > On Wed, Dec 4, 2019 at 12:00 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2019-12-04 at 11:32 -0800, Khem Raj wrote:
> > > > Use PCRE, this enables using posix extended Regexps on cmdline
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/util-linux/util-linux.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > > > b/meta/recipes-core/util-linux/util-linux.inc
> > > > index 1fa82363b1..8f867aa9b4 100644
> > > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > > @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "
> > > > file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
> > > >
> > > >  #gtk-doc is not enabled as it requires xmlto which requires
> > > > util-
> > > > linux
> > > >  inherit autotools gettext manpages pkgconfig systemd update-
> > > > alternatives python3-dir bash-completion ptest
> > > > -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> > > > +DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
> > > >
> > > >  MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > > >  SRC_URI =
> > > > "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.t
> > > > ar.x
> > > > z \
> > >
> > > Given it works today without that, shouldn't it be a PACKAGECONFIG?
> >
> > its default with other main linux distros. I thought since what we
> > were doing was not
> > default, I did not see a need for packageconfig. I can certain do a
> > v2 with packageconfig and enabling it by default, is that better ?
>
> We're embedded so we're supposed to expose this kind of config and tend
> to the more minimal ;-)

I was more looking into native and nativesdk variants where this could
be more important.

>
> Cheers,
>
> Richard
>

