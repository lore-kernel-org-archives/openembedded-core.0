Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9487B61219
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:16:06 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m2so1285321qka.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mP+zsB51jla8tfkBzVX5o2ndS+lQ8yU2W/8YUBO09Mc=;
	b=WFOqhi3S8GBbE8wVT4AursrRDqMn6LP05IqYZ7jq6TXYainlV+4cikB8Opvx9B/lsY
	gOXrFFad5jERuJTRtYzqrodjT4u3IY3XSp5XBeGJ84V9s+o06dimNjTNh+6E7IpptTXB
	Q1PW6fFp1u9D+BoTztox0PWjGHyyTtzsa7KMrnI38BlfgagMgsDDi0UDGsAlBqzIWS8o
	qHTcWAftKCGnxYlfyIv+HnW1ry4ucO4esGbKCdJfcuY5XLpT0C8p8DAmd3JZuEQYN/xU
	g9s4quf0Tv+SzA9UrCGs4JxYKTJWM70yBokiXI3JGXJ1tAp7HyR/hUQkSvjXjo9MfbOE
	m3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mP+zsB51jla8tfkBzVX5o2ndS+lQ8yU2W/8YUBO09Mc=;
	b=T5oMXSMR1CqYKRxUYXpdItf/8+OGQceRMSJXf8o5KZzkeofvSWAl+2Jfl2cW3Lz9Ao
	IY2CtIJqUgWb6ZLH4vHMA71QPlfeSCSx0jJ7La3OSqUw7kB02s4r3EedBJLRRtWRSYq1
	TX6rr25eabpY/TuKp1FC3Q75ukGA7v+AJKdgwLvpd8wA5KbPLAeoNVokUuwnS9bMaXCr
	eS03bE2t6LhiNxyaM6CUtFKHpxrqoV9v00iyv9xQUSy2DUDjdsNB6Es/+UuaQO2YgbIb
	nWJDnz/+Wtz5tXERoQzjvSBaM+sOLa5g41L1Z7ZJKRgVBjMYlOhdimoJ1c9UeFy5gkvK
	AbmA==
X-Gm-Message-State: APjAAAVs3SGEn/zimHw4Fg0ls+u5q6x+YXUkq3qqftgxiTwsjY7bZWkz
	9BUxhPIlqZiZ3asjxAP4yXa29Dkx2Z0bSSUTdBE+b8hl
X-Google-Smtp-Source: APXvYqxtGtgF2f+sCOLBB+xpD7VlrGrHZdZKPuH1liv+epEPQui9kNqrEDGau1AJ0GMqHOzXh7uXMa/AQ1Kv5fUZQOI=
X-Received: by 2002:ae9:eb8d:: with SMTP id b135mr6617880qkg.215.1582730167154;
	Wed, 26 Feb 2020 07:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-5-zboszor@pr.hu>
	<CAMKF1soh5mSvuVC8zhven1QwAPPU7DqiOr2Gw8TB4wmW8K3cYw@mail.gmail.com>
	<62608f92-9730-bbec-20cf-e0219a8d9ffb@pr.hu>
In-Reply-To: <62608f92-9730-bbec-20cf-e0219a8d9ffb@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 07:15:40 -0800
Message-ID: <CAMKF1srxrC601bdMe05J3e3YOTP0bQ_ofUrWqDHmCXci8ah0xw@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 5/5] mesa: Enforce TOOLCHAIN="gcc"
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
X-List-Received-Date: Wed, 26 Feb 2020 15:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 7:14 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> 2020. 02. 26. 16:00 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Wed, Feb 26, 2020 at 6:08 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
via
> > Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
> >>
> >> When meta-clang is used, for example to build chromium-x11 from
> >> meta-browser, a linker error occurs in Zeus.
> >>
> >> See: https://gitlab.freedesktop.org/mesa/mesa/issues/2533
> >>
> >> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> >> ---
> >>   meta/recipes-graphics/mesa/mesa.inc | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
> >> index 800e8813c7..b8f09a2ed3 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -24,6 +24,8 @@ PROVIDES =3D " \
> >>       virtual/mesa \
> >>       "
> >>
> >> +TOOLCHAIN =3D "gcc"
> >
> > lets fix the linker error instead.
>
> The linker errors were similar to reports I found on some forums
> from a couple of years ago and they all pointed to RTTI needed
> to be enabled in LLVM/CLANG. But it didn't help.
>
> This is a good workaround until meta-clang is fixed to build Mesa.
>

workaround  is needed to be applied in meta-clang not in core

> >
> >> +
> >>   inherit meson pkgconfig python3native gettext features_check
> >>
> >>   # Unset these to stop python trying to report the target Python setu=
p
> >> --
> >> 2.24.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

