Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD36B79AE7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 11:42:02 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m14so1313549ion.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vaG7ITmNnvXXs10DtaFaaQeas7UweJyQr5VW7L1Judo=;
	b=Mk3ZBbP+jWVBiDgDaSxTIc0dWUM4lrx16eQR2S8c+Fvbi4c9xMY0SpDDcfDsgBg9Ek
	lPhSHvZlBLad78vGnbVTmMPfx2cxduB9ANbqFLUq0PPjBi6mQ8Z/VXJhzZug8ItVFUNK
	rC8ynkorQxf1+jakRNWqbsjGoFAU8o4jaE2uYf+fm2pNDB4laGktPjqe+0dCxVSkcYHz
	r2MI7zSOtEcm7VjklXtqVCvvcp5OiR/naUPXL70x1TLUugK3i6K2DU3MWJIG12U6kn0j
	BgwC3Tb67uGwTLC5BgWDuzqEjZiE4h2YuNath4zYxuqh58yCMHyC52pR4LMbBFwFQH7M
	kIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vaG7ITmNnvXXs10DtaFaaQeas7UweJyQr5VW7L1Judo=;
	b=lGmszXfVOmxh9C3o66vNv9XSWadIHJRQHUcHckd6twcJtFpCvM727ZPJdMb1Htmz2m
	DneYqAkqogvRVIAIPDcMolXzig1uW8s6XPq0D4N7yqRQBWmBWzMUKNUhI3Pt66FYHFNS
	/Wjgto4PDs/rgy6RO9xAYS5wXPZni5lIv8Rg+lRbXHaoBeO+poJ5Wd8+wfrSYtGpfLMz
	7XZn+UF9YYXpsy1D12V1V5ar9oSzH7kaE+f61WWfdEDSWbtDhC7RKhjDyOlGLBt/o1yF
	lx5wp0nuHcBpd2EG5KR9V7VhbBzOraTSF/DacevWsZg+76RcQcOE6QRKU8r4M6wkOvw7
	yaGg==
X-Gm-Message-State: APjAAAUda66dAb1/i45AnZh2rPoIeXI8LPL1Y+Sd6UlRv3sHRT12q2ZY
	OS6un07Wxdx0UCuPFbf13rNFQ6k8gYuc82XpM6w=
X-Google-Smtp-Source: APXvYqzFehKGL5FIMAdPHFVxcTmls14gl8+S791uahP4ZjxV+JSJkK/hVGnXF/Q2g3D51A/Slc6HWi2HAYE1LamNBDo=
X-Received: by 2002:a6b:c38d:: with SMTP id t135mr2189181iof.284.1557402123869;
	Thu, 09 May 2019 04:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190508201335.1732-1-schnitzeltony@gmail.com>
	<CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
In-Reply-To: <CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 May 2019 13:41:50 +0200
Message-ID: <CALbNGRRzzJQVM7-bt6hsq_FQzHxJ+QTjrwfj9NFgmuUWKvQKZw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: add MESON_CROSS_EXTRA_PROPS to inject properties into meson.cross
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
X-List-Received-Date: Thu, 09 May 2019 11:42:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2019 at 1:04 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 8 May 2019 at 21:14, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> > Some projects rely on (cross)specific properties e.g [1]. By setting
> >
> > MESON_CROSS_EXTRA_PROPS=3D"var1=3D'value1' var2=3Dtrue"
> >
> > the required properties can be passed to meson.build. The contents of
> > MESON_CROSS_EXTRA_PROPS behave same as known by e.g EXTRA_OEMESON.
> >
> > [1] https://gitlab.gnome.org/GNOME/tracker/blob/master/meson.build#L91
>
> Or see https://git.openembedded.org/openembedded-core/commit/?id=3De04e0a=
20cab04966698c50dc79195a8f159248d3
> for an example of how this is done already.
>
Sometimes the sending of patches is the secret attempt to gather informatio=
n :)

Thanks

Andreas

