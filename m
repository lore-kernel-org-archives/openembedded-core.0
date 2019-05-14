Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16CC77DE91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:56:50 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g71so2524859ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8SMn9SFxfMsUAByiaMato5KX96jq/oNeeN5bNvpCRto=;
	b=krKH6/TpKVqdfU7Qs+M9G+/yTMWtoWJwaattVEw5fobHELpzqkRf6xbV34HrSrDE3L
	uwpsCdJYouvz9jS95vgnJjNF/4e1VdIl0ZTeFK3A78FchoN6RR5+S5mkrSm/c1M5W2rT
	++2qVMbdXJGoR2vZzSAEM3h9FS471cpfDxIjDzFLAHdJk+V8J9gN04aETBF4imeJEKZz
	uY4ZNmoAL6qTMYkue628ZRKp53vi7hTBfdVlbFOxm4Ucr5xwue9bqgUZGh1eEv29b/K+
	NyyPbtJM4kSZoJpOy5pI45WzzUG0C8trfgGBhl8mobixaokFdUIF4gqxMBS7gg617TIW
	bTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8SMn9SFxfMsUAByiaMato5KX96jq/oNeeN5bNvpCRto=;
	b=F5+2CKVKKqQFzF3T2VxWb1rMUGt41fSYhNmsx1OiHe0kKBIAsowxHQgOM2eEvWGO68
	wMCHO38ZnSETOaAr4TNrVuugT2weh/l7AFeLFXu53CF3sNBA3Qy2tECF05CVxUytgxZp
	wW5v7+p19tZnOBzeWSxS/LijWNGiVqS7wI3U09fIikG5lkKRA5BKjp0QGA5YRZY5vYZt
	+drsf7hTXfyJgrqwjSf1SsNRhWa82FDiOa3Pa6OgeozJDTLhI4BFgEi04PbAzFU/K4c9
	uqT42+TcL6lYp4Tkf7/qKm0W7gavcioapi6UPAdpu2o0thZnVWtU17cLsL55P6maUPuH
	q7sA==
X-Gm-Message-State: APjAAAX/S9nobI6NFWq9OS91HnQ/ONabZPv+/oKP7BJQJwrr6IpJFb1l
	8M74U68Bj89zy5PP6BUpxAGA/HYXgvAkYB8Dlt0g9w==
X-Google-Smtp-Source: APXvYqwEAl33Au4xbTGeXmpOKYSCgreUnprfQoI9VuiSBjGZB0q27Df2a41LKMoIQQ/d5D1U1nqNDm70jXg3lnyLRZE=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr1866747itj.62.1557806211905; 
	Mon, 13 May 2019 20:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190506175136.7594-1-raj.khem@gmail.com>
	<20190506182339.GA21306@localhost>
	<CAJTo0LY0O4Va07qZ+Nq+YXmkM7GXhSbB9e1bZ_P17vPuv657_g@mail.gmail.com>
	<CAMKF1sphAThZQNBwaNo3tP8v8G+cmimD8SiteCbgBEyQEL_q8g@mail.gmail.com>
In-Reply-To: <CAMKF1sphAThZQNBwaNo3tP8v8G+cmimD8SiteCbgBEyQEL_q8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 20:56:40 -0700
Message-ID: <CAJTo0Lb1T2dXC+2Cr-hocUe0nuK6OH+bE_8Lua_5E8DQho9NuA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 1/2] systemd: Fix build with gcc9
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
X-List-Received-Date: Tue, 14 May 2019 03:56:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Huh I checked git too.  Obviously not well enough!

On Mon, 13 May 2019 at 20:22, Khem Raj <raj.khem@gmail.com> wrote:
>
> you are late to party but its already applied see oe-core/d5e999616e
>
> On Mon, May 13, 2019 at 7:27 PM Burton, Ross <ross.burton@intel.com> wrot=
e:
> >
> > https://github.com/systemd/systemd/commit/c98b3545008d8e984ab456dcf7978=
7418fcbfe13
> > is the upstream fix, so lets use this instead.
> >
> > Ross
> >
> > On Mon, 6 May 2019 at 11:24, Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Mon, May 06, 2019 at 10:51:35AM -0700, Khem Raj wrote:
> > > >...
> > > > +gcc-9 has become a bit stricter and can check all kind of formatte=
d
> > > > +input/output functions which causes additional warnings when compi=
ling
> > > > +networkd
> > > > +
> > > > +/src/basic/log.h:104:9: error: =E2=80=98%s=E2=80=99 directive argu=
ment is null [-Werror=3Dformat-overflow=3D]
> > > > +         log_internal_realm(LOG_REALM_PLUS_LEVEL(LOG_REALM, (level=
)), __VA_ARGS__)
> > > >...
> > > > +         if (r < 0)
> > > > +                 log_link_warning_errno(link, r, "Cannot %s IPv6 f=
or interface %s: %m",
> > > > +-                                       enable_disable(!disabled),=
 link->ifname);
> > > > ++                                       enable_disable(!disabled),
> > > > ++                                       (link->ifname) ? link->ifn=
ame : "<null>");
> > > >...
> > >
> > > The fix doesn't look correct to me:
> > > gcc says it "is null", so checking whether or not it is null doesn't
> > > match the error message.
> > >
> > > If it is a compiler bug as was at some point mentioned upstream,
> > > a better temporary workaround would be to stop making this an error
> > > with -Wno-error=3Dformat-overflow (untested).
> > >
> > > cu
> > > Adrian
> > >
> > > --
> > >
> > >        "Is there not promise of rain?" Ling Tan asked suddenly out
> > >         of the darkness. There had been need of rain for many days.
> > >        "Only a promise," Lao Er said.
> > >                                        Pearl S. Buck - Dragon Seed
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

