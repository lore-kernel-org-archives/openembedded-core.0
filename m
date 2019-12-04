Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF697F7BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:26:07 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d124so1241072qke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZkhD/vLsy8bnAuf7GyCptqw7Tyke+oMkvo/HyyHctPA=;
	b=fH1hZRTz5hJwzwrWP6bN/8PfuiY/Jtahx7quZCzxVVzH7Rmk0ZwHXh3sLVsg3yYO3W
	vzd0UAIQQEb6mnq0ainHwMDV2MjTqLjNkieicuLse+tD0S123lbdvX6HbxhD66uoZvBI
	J91T8yuZQ/9YscS6PFINPgp37OkLaxGkE5b5/lMaqQh2ArApPvoP8zrL+O4kRalCq8uv
	cbtXSobaMuAMvbnur7W6fTgtxx7yK01/+xTfyupVRD3UFcYWdTt2XbdmEPG2YOEjCNaV
	3fJeBnMs3rYVOlpV83ekmvJa4gPF/2RcQyjk7gE8LXnJDoTPhhxqb/vNczogiRQ0DMus
	RKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZkhD/vLsy8bnAuf7GyCptqw7Tyke+oMkvo/HyyHctPA=;
	b=k6RSBvfFTjDTrrQfjo3nkzwXzB7sj0KIo5GY3E9CPoA+xjWlODI8PG+prBMncfz1Xy
	Onkd/NSD4nIlZyyqykknT5qjvgu7K2/uMSEJcPaCgK9Vz1Wp9iQMlEcjebTlU0w22n0P
	YRuRyKpgwIpzt84771YugEvq/228N4HBnAPzeqPA2QS5Lf91z7n8iCm/XYJ7pUVVQNJq
	LrMTD+xg/WrGMnMZkQKZeswzzYYTgRDuZPMS5tbk1hC72bjyIBlWiKyGP5MR2cOgHhOI
	+xJmEwEtrKislVw9sGlR7m5R5ZYqmJHKV3UN6nQbqd89+fQZ/CvpelODuPIvaLrHMmpp
	gvJQ==
X-Gm-Message-State: APjAAAV9jwyvBT4eSb6vN1lEGGSkA8WdA6FJgoCaP4aEYONLK9INEFnN
	Mo5xu7h3+ayjXFsZ8g4EYL/TDLgg3K4CVPsK16V03LGJ
X-Google-Smtp-Source: APXvYqx/SmmkWM74tfuXuujZYazo2wnZy/zGmBtz6cz0mKw5cYcUvAFq8HakGsPfzmOULM7+Vq6jp1xJUc83HtE6EkY=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr5014563qkf.337.1575491167957;
	Wed, 04 Dec 2019 12:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20191204193254.2418208-1-raj.khem@gmail.com>
	<ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
	<CAMKF1sp29T-e0=5BBoX_=ZtUEs7fh3qAU9P__dXQH6NxCL+6hw@mail.gmail.com>
	<6cada1f180fe4bad594d71033573ff9fba3a30e9.camel@linuxfoundation.org>
	<CAMKF1srBqMDRHTDr9uKg4VLwNnFqPrnOwcv7S=8EfzvHDBZxuQ@mail.gmail.com>
	<da22a596541e5c77ada413de5b90898c6f180fe8.camel@linuxfoundation.org>
In-Reply-To: <da22a596541e5c77ada413de5b90898c6f180fe8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 12:25:41 -0800
Message-ID: <CAMKF1soCoGxxxvA3mdA1FUjCBQ6b+utmNYde_ff_H=BLSD9cKg@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Dec 2019 20:26:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 4, 2019 at 12:22 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-12-04 at 12:21 -0800, Khem Raj wrote:
> > On Wed, Dec 4, 2019 at 12:18 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2019-12-04 at 12:12 -0800, Khem Raj wrote:
> > > > On Wed, Dec 4, 2019 at 12:00 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Wed, 2019-12-04 at 11:32 -0800, Khem Raj wrote:
> > > > > > Use PCRE, this enables using posix extended Regexps on
> > > > > > cmdline
> > > > > >
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > ---
> > > > > >  meta/recipes-core/util-linux/util-linux.inc | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > > > > > b/meta/recipes-core/util-linux/util-linux.inc
> > > > > > index 1fa82363b1..8f867aa9b4 100644
> > > > > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > > > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > > > > @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "
> > > > > > file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
> > > > > >
> > > > > >  #gtk-doc is not enabled as it requires xmlto which requires
> > > > > > util-
> > > > > > linux
> > > > > >  inherit autotools gettext manpages pkgconfig systemd update-
> > > > > > alternatives python3-dir bash-completion ptest
> > > > > > -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> > > > > > +DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
> > > > > >
> > > > > >  MAJOR_VERSION =
> > > > > > "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > > > > >  SRC_URI =
> > > > > > "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${B
> > > > > > P}.t
> > > > > > ar.x
> > > > > > z \
> > > > >
> > > > > Given it works today without that, shouldn't it be a
> > > > > PACKAGECONFIG?
> > > >
> > > > its default with other main linux distros. I thought since what
> > > > we
> > > > were doing was not
> > > > default, I did not see a need for packageconfig. I can certain do
> > > > a
> > > > v2 with packageconfig and enabling it by default, is that better
> > > > ?
> > >
> > > We're embedded so we're supposed to expose this kind of config and
> > > tend
> > > to the more minimal ;-)
> >
> > I was more looking into native and nativesdk variants where this
> > could be more important.
>
> Sure, but your patch changes the target version too...
>

sent a v2

> Cheers,
>
> Richard
>

