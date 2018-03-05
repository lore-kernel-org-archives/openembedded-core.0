Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C27E6789DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 10:45:02 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l43so16730874wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=j9okQu4PDAOmvg+VIRBCaVq7+tp8njxxYoltX96dK/Y=;
	b=KXNuxiJiawe0nVwfo+PhE+f94gswwBaskNYS/eV0e4XMRhCE2+KjrS6GcMfLnOFj8J
	YfktThtsA6otFiF5l2DWkuNqRKnS25xpATWvNwYPD8hpWg7KpXKul87T8MMVcu3+IWLG
	GBBOlJLM4pAexW1xyTSQUOG3exTKR8CeuP5xsUzaxUMraETnyFwDcHCBFBX8bc7eEiVq
	wUTlvfnPZFJHGLWIsRu5cg3ogqVCOpOzs8zRDsrt+ynw2G+NgLm92BC7K1uXd6bZk7H+
	Ls/YMsbjIrGVTbifH9/vqqwJxhLFjBUMdhM61VnBNTuYl6/cz/bC4ZphtZwWhPjBHGVQ
	mSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=j9okQu4PDAOmvg+VIRBCaVq7+tp8njxxYoltX96dK/Y=;
	b=nrDolI/nv9s2ONaQLATpgPhfHhf6xslbEm0n/r5EZDGpPZwu7xoHvW7S4T9Sag3pTa
	7ilLiKvgxRZ3y7lUkvmpBQ2ftJUwRzOwOwBzgyNHkeD+W+Ck2ebuXqO47q7ghKhjepgU
	ZTnt92UepGOZ9qzDSsxdvs6JgLbHc6lJPeFU2K39moXi5++c36e+Nw05aOlbfG8YlJxR
	FIeXKbxe9ZEbuI+d+jopdpsLPCy7QRmzbzxTIO2PU64Y9Bny8wGaFXpc+F1wDWfbaDKt
	RMfsKxGkoWfNamkR2flZgWGosJkXjlR/ZB4fRaHWJ3VS+X3Ahbogy6gBbpEFxV/KFmab
	cz5w==
X-Gm-Message-State: APf1xPBrAUymsmDHiNKBux4rbpzoyYKD9/hGBn7JXHWL3x26mgyO6Z6c
	vo2xodMBZVSUUzDEp5pDVW0=
X-Google-Smtp-Source: AG47ELvbhgj3XK64WqriKz1BwQXqDaFj9EU2dQ5ABC6ji5gH5M5TtBh/H40f8fJhJ7KHvt0/obCMMA==
X-Received: by 10.223.136.164 with SMTP id f33mr12005013wrf.77.1520246703595; 
	Mon, 05 Mar 2018 02:45:03 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m190sm9151959wmb.6.2018.03.05.02.45.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 02:45:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Mar 2018 11:45:06 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180305104506.GA19075@jama>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20180304141538.GB1370@jama> <20180304162216.GC1370@jama>
	<CAJ86T=VPkRT06Jg7i7CK=mZBWZM_Ssn4a0-8+zf9RQyu-NXQLA@mail.gmail.com>
	<CA+chaQf3SPQZ3UequDT7BOzUGUx0ZcSyow_pgzw-MQwFXnFHLg@mail.gmail.com>
	<CAJ86T=VFg7cfFhUJYssODc5KwdfnBLG9VLbENU+j8ExKmkB57w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VFg7cfFhUJYssODc5KwdfnBLG9VLbENU+j8ExKmkB57w@mail.gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Mon, 05 Mar 2018 10:45:03 -0000
X-Groupsio-MsgNum: 108879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2018 at 01:51:59AM -0800, Andre McCurdy wrote:
> On Mon, Mar 5, 2018 at 1:19 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > Thanks Andre!
> >
> > I've seen another failure probably caused by this gcc upgrade in morty-=
next:
> >
> > python-matplotlib triggers ICE:
> >
> > src/_png.cpp: In function 'void init_png()':
> > src/_png.cpp:497:25: warning: variable '_png' set but not used
> > [-Wunused-but-set-variable]
> >      static _png_module* _png =3D NULL;
> >                          ^~~~
> > src/_png.cpp: In member function 'Py::Object _png_module::read_png(const
> > Py::Tuple&)':
> > src/_png.cpp:272:1: internal compiler error: Segmentation fault
> >  _png_module::read_png(const Py::Tuple& args)
> >  ^~~~~~~~~~~
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <http://gcc.gnu.org/bugs.html> for instructions.
> > error: command 'i586-oe-linux-gcc' failed with exit status 1
> > ERROR: Function failed: do_compile (log file is located at
> > python-matplotlib/1.1.0-r1/temp/log.do_compile.15213)
> >
> > I'll try to build it with Khem's and Andre's patches only to eliminate
> > hjl/indirect/gcc-6-branch/master changes.
> >
>=20
> FWIW, I see the same error with my OE 2.2 + gcc 6.4.0 based distro.
> The ICE only happens if I build with -O2 though (the build is clean
> with -Os, which I use by default).
>=20
> In case it's useful to anyone, my branch of morty with a gcc 6.4.0 backpo=
rt is:
>=20
>   git clone https://github.com/lgirdk/openembedded-core.git --branch oe22b

You're right with 14 cherry-picks from your branch instead of 6.4
upgrade from Juro

8e6e2e3 gcc6: enable FL_LPAE flag for armv7ve cores
756e8f2 gcc6: Fix unaligned STRD issue on ARM
33e717b tcmode-default.inc: update GCCVERSION 6.3 -> 6.4
bb03bfd gcc6: Upgrade to 6.4
cf3be39 gcc-runtime: Disable libitm on riscv
8e0fa79 gcc-6.3: Backport patch to fix ICE on ARM
a77c5c4 gcc-6.3.inc: Use ucontext_t not struct ucontext.
c5376cb gcc-6.3: backport fix of check for empty string in ubsan.c
322dd7f gcc: Remove unused patch
07e888e gcc: Fix CVE-2016-6131 in libiberty
8c5205d gcc-6: Add fix for missing no-PIE flags
cf3da73 gcc-6: Sync gcc stddef.h with musl stddef.h
953f3e2 gcc6: Upgrade to 6.3.0
60ded51 Revert "gcc-6.2: backport fix of check for empty string in ubsan.c"

I can still reproduce it with -O2 and doesn't fail with -Os.

It also doesn't fail with matplotlib 2.0.2 version if I cherry-pick:
commit 10c8c39c25d902ab5268fa48ac2bc0e42e65b179
Author: Khem Raj <raj.khem@gmail.com>
Date:   Fri Sep 1 15:27:20 2017 -0700

    python-matplotlib: Upgrade to 2.0.2

=66rom meta-oe/rocko as well.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWp0fsQAKCRA3VSO3ZXaA
HB3uAJ9fNDT7tjYDkg/haZ8MG9uF9oGBbACdFHa+jM/wgyfLL817yiY7YeFAMW8=
=RTS7
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
