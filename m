Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB277D40E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 23:27:48 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f22so11315957iol.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GtnxYIIP37Tc4j7RHIirjIckY8nLdFB5yTTBGo6EBAs=;
	b=u0oAZhoDJwj9yUmaS69PyNY+bjBqAMb6J6f+lZoWVlMfbuUY9luT6qtKSQn1rMS95c
	XHylE0MuWHaGU06+s1cZD00CHohaoDQh3Wor5EMQ8wV5TCbzJitlt/afyS4l8Is7w5XJ
	vRqUCtWzc0yeQMWnjbWTGnZZWldGVb6SXoc4jyLhe0oyPHcGN1oy+lzynNPDSX+QRyG8
	9gXvOzvroKunUotNVkFIcwoMNm82B56NOgBcBfIo4WG5skZEyPh9hwWxiykTRYRDLQsv
	E+zurZwVY7re3/8nO/hwSd4DBhpiRKiJaT6pFlxvQ/1FvnGfjoJ3w9yh0yYAebM760Hq
	l/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GtnxYIIP37Tc4j7RHIirjIckY8nLdFB5yTTBGo6EBAs=;
	b=n5zGPCas6xZjaZxRoxntIDwq/hKFS0odtcGCLay7DH8iQ3NPiEnWd/fd9QgmwEinhL
	c9/4+Ori0lXW6YST4KO3B3jhZc8LdHKMU26td9sFGhdHq4/ragb3XUEO8yAne3pJWnRW
	Q9JKpfchZj8maqqORPf303FTEiWWq7kvM++rMxzIPDZTeKZdbNrFtFcQ6S025Kl784BT
	w+BALazeBb3O3otErQRr7T5KPFaLf2eoVvflIoi4m6Pz2GjPs2fr4sBlyMnI73x+uX2y
	HignpQEUNR5FvxpO2/NCakassGci7k+RkSuAxFg3pbTGyfIMqVAR56HC6VUX2Pc7i2nK
	PoCA==
X-Gm-Message-State: APjAAAWam2ZaKqN7S4nqtQBnXXh+M+cj9DnBR1iiWxzo9SqHUdxu5pQh
	zFdY/9FYNtXSy74Lfh8S1Sxj9TuWWki38sMu4BYrHg==
X-Google-Smtp-Source: APXvYqzxusHxokajctaVoV8YRd44pkXnjkkg1Vs0rqgVzXvMIKy5XmsJiqeBNa3lagB+TyME4/fSCcfqoVuCEZsNa0A=
X-Received: by 2002:a05:6602:11a:: with SMTP id
	s26mr17106741iot.201.1557790070110; 
	Mon, 13 May 2019 16:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190506175136.7594-1-raj.khem@gmail.com>
	<20190506182339.GA21306@localhost>
In-Reply-To: <20190506182339.GA21306@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 16:27:38 -0700
Message-ID: <CAJTo0LY0O4Va07qZ+Nq+YXmkM7GXhSbB9e1bZ_P17vPuv657_g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 13 May 2019 23:27:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://github.com/systemd/systemd/commit/c98b3545008d8e984ab456dcf79787418=
fcbfe13
is the upstream fix, so lets use this instead.

Ross

On Mon, 6 May 2019 at 11:24, Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, May 06, 2019 at 10:51:35AM -0700, Khem Raj wrote:
> >...
> > +gcc-9 has become a bit stricter and can check all kind of formatted
> > +input/output functions which causes additional warnings when compiling
> > +networkd
> > +
> > +/src/basic/log.h:104:9: error: =E2=80=98%s=E2=80=99 directive argument=
 is null [-Werror=3Dformat-overflow=3D]
> > +         log_internal_realm(LOG_REALM_PLUS_LEVEL(LOG_REALM, (level)), =
__VA_ARGS__)
> >...
> > +         if (r < 0)
> > +                 log_link_warning_errno(link, r, "Cannot %s IPv6 for i=
nterface %s: %m",
> > +-                                       enable_disable(!disabled), lin=
k->ifname);
> > ++                                       enable_disable(!disabled),
> > ++                                       (link->ifname) ? link->ifname =
: "<null>");
> >...
>
> The fix doesn't look correct to me:
> gcc says it "is null", so checking whether or not it is null doesn't
> match the error message.
>
> If it is a compiler bug as was at some point mentioned upstream,
> a better temporary workaround would be to stop making this an error
> with -Wno-error=3Dformat-overflow (untested).
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

