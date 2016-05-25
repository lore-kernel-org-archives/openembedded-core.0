Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9C960762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 08:23:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 67so13036489wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=2VeVLlv1nwgXuHiRi8EeaIz0FGogXeHE1YRuuaY75Bw=;
	b=oPQG9xpRbQhH/P6GeV4zbN6jezCqlL0D7EfX3ck/ij/x7rBaKbdx/lV+B4H86Eee5o
	6gYwvb+Y46uvO0DAvilQQDr3ObrrHKVaFnr2rVtYlGiIMIK47uDGGDFAc14D13ofljxJ
	Yw5Ts6PnNDIq2rVd+/DnWLg6nTvbNVXJEF70VIuHrE7icx2w1V5KfIsjfy0bCkfXK+1i
	pV5YfaOiwcG8xs/SPns0Iv9X+pv/RBzwxUw1RCoXlqkFFHFbtJuOiVL444Gp/b97azyQ
	HldRFEp9lSpuT9AyktubufqY7pQcAJlgKN43/hFR2f9TcPvfjOMrdIgr8XJ7FZsDYIwB
	Xhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2VeVLlv1nwgXuHiRi8EeaIz0FGogXeHE1YRuuaY75Bw=;
	b=KOV39+YTiMPm+5helfxu691Wgd3dayUTWn4Bm/P3+2rcm2FnvX/iGanqvJrKmFky4B
	qnMpOj9sLwxSpuiz+SAB6aSFg0fBzenpHmxxSyZjuHzqyH9UGnrzVHRMW0BQMvT8GyV0
	EgsQbjst0AyOQ10wZ/UHA3g4DI/PZGe59onmJAlilswRZgW5YgsJ7VwvgIthMHE8hAQu
	dvfN2MVWl0XQ3HxlDIjfFLY8Dprg+05LM9MabHoAM3EyiILQjwFrBka+80kDrOFfl+2k
	em0wPg/h/eZTdPZG6q4WG6Xo++ZNpD3WVOFP2L81OHpojge7/JfXwPPvC5dNVjX3mCyR
	ocuw==
X-Gm-Message-State: ALyK8tLAGhExETRSAo7Igdvm0aLw/HDVttAwdbRRFYAHij/1CkKSTO5unysKDT8bz2wgKA==
X-Received: by 10.28.232.136 with SMTP id f8mr2194524wmi.52.1464164589811;
	Wed, 25 May 2016 01:23:09 -0700 (PDT)
Received: from [192.168.1.2] ([80.106.206.238])
	by smtp.gmail.com with ESMTPSA id
	c185sm22930508wme.9.2016.05.25.01.23.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2016 01:23:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1464158362.9570.87.camel@linuxfoundation.org>
Date: Wed, 25 May 2016 11:23:02 +0300
Message-Id: <981DC38F-CE93-40C0-A028-FC6CB16CBC3B@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
	<1464158362.9570.87.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Wed, 25 May 2016 08:23:14 -0000
X-Groupsio-MsgNum: 82633
Content-Type: multipart/signed;
	boundary="Apple-Mail=_254398A4-6B6F-45CE-A884-3929B8436288";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_254398A4-6B6F-45CE-A884-3929B8436288
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 25, 2016, at 9:39 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Thanks to the patches from Bruce we're looking better, linux-yocto 4.1
> works, just 4.4 has a couple of issues. I also removed a patch which
> removed the xdg-utils failure. That leaves us with:
>=20
> qt4-x11-free:
>=20
> arm, mips, ppc, world-lsb, x86, x86_64:
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
> ds/767/steps/BuildImages/logs/stdio
>=20
> qt4-embedded:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/bu
> ilds/520/steps/BuildImages/logs/stdio


I have posted patches for this to yocto ml [meta-qt4] see
https://www.mail-archive.com/yocto@yoctoproject.org/msg29319.html

please apply them

>=20
> linux-yocto-4.4 mips:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/
> 795/steps/BuildImages_1/logs/stdio
>=20
> linux-yocto-4.4 ppc:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/8
> 07/steps/BuildImages_1/logs/stdio

It seems Bruce did not apply my patches to kernel.

>=20
> diffutils - non-gplv3:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/bui
> lds/797

I can=E2=80=99t reproduce it locally.

>=20
> Bruce: Looks like 4.4 might also need a patch you merged to 4.1?
>=20
> Cheers,
>=20
> Richard


--Apple-Mail=_254398A4-6B6F-45CE-A884-3929B8436288
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldFYOoACgkQuwUzVZGdMxSokgCffHK6XQv9So1dEH42HVnBaJ1I
6pcAnRDJF1F+AhGvKcjpG57to5+XtHit
=c5PH
-----END PGP SIGNATURE-----

--Apple-Mail=_254398A4-6B6F-45CE-A884-3929B8436288--
