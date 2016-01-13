Return-Path: <trini@konsulko.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id A25E073189
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 22:09:25 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id x67so506665529ykd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 14:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0Sl03Mz5Kpk9r43zFpEXq6N5qRNQhZxeqYm8Hx6K6/s=;
	b=KOwcuRH1ucawAWOLLTnOmGPrOGd3M5X/imDP3L3APzKRXgM6snRv7l9zfjhsVpFi8O
	gZBCaydQ6Nv53CMozh80LYc6K+EK9Et44xCXCF/xWJOF9U8TRH8OaDIlntDUST+2Dm/y
	vj8US3W/LFxXN4mgHc7TBK43PeH/I5QDzQqlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0Sl03Mz5Kpk9r43zFpEXq6N5qRNQhZxeqYm8Hx6K6/s=;
	b=UCPMnTYWTghr/utbgkrcPeRxNKrw1wW8osO7OPZShE8i/2g8e36OgNHqmd7yw8XzGS
	s3H5sm1ijmJVOvG4BtIEz1s/oN1+QrXXNV08bUwsUO5MjiFaVBLFe097igAdVZIMyuXX
	QSNRCoUYX0sShRINHRchZTFgESRP8O0t8XeX07qtgoD/XMugNqDNjN38wAxN8LfUwVo3
	cIKDOscbSRU15oGYY/Aq1wHf9MVlhECmq5Pn6jPUJ/J++HNPOk3TQacSXWIxLJGwRvtT
	GSMLd36eP4XgZeddixa5vArlqA4r4vr3p8i2f+B889EHJqdoDPotnguhbuSDAod2TssL
	4oCQ==
X-Gm-Message-State: ALoCoQmO262/z5Uy34XB0C6YHDaZqRRlNLYTjEMNN2LQa3sPJw5ImoJRowrbNjdv/nJ1KKmv1sXdSK5ipc2jg0vrEBWUc8p5pw==
X-Received: by 10.129.50.199 with SMTP id y190mr615338ywy.147.1452722966164;
	Wed, 13 Jan 2016 14:09:26 -0800 (PST)
Received: from bill-the-cat ([2001:470:8:32a:14ba:bb3a:a7c5:c7e8])
	by smtp.gmail.com with ESMTPSA id
	r198sm2232703ywg.38.2016.01.13.14.09.24
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 13 Jan 2016 14:09:25 -0800 (PST)
Date: Wed, 13 Jan 2016 17:09:43 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160113220943.GS3359@bill-the-cat>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131534.58933.marex@denx.de>
	<CAP9ODKohVDvN=bnowqXaHa_3yNvOf70EevWwV6T9rrNLbEHxOA@mail.gmail.com>
	<201601131653.11865.marex@denx.de>
	<CAP9ODKo4fvFS0wWtQJfO_kVOZMyNqfNohHw=wRC5z2M19Bu9kQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo4fvFS0wWtQJfO_kVOZMyNqfNohHw=wRC5z2M19Bu9kQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 22:09:27 -0000
X-Groupsio-MsgNum: 76026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rCSNDbWtzOodvTSV"
Content-Disposition: inline

--rCSNDbWtzOodvTSV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 01:55:56PM -0200, Otavio Salvador wrote:
> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
> >> >> >
> >> >> > Repair configuration of U-Boot during build. It is no longer
> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
> >> >>
> >> >> Please drop this config suffix, from u-boot.inc. The config value
> >> >> should be used as is and the respective BSP ought to be fixed to
> >> >> change _config to _defconfig.
> >> >
> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in my
> >> > machine file, it will call "make machine", which no longer works.
> >>
> >> I know and the right fix is to use the right value to UBOOT_MACHINE as
> >> we do for KERNEL_DEVICETREE.
> >
> > So what is the right value ? UBOOT_MACHINE :=3D "foo_defconfig" ? This =
does
> > not sound right at all.
> >
> > And what is the right value of UBOOT_CONFIG then ?
>=20
> foo_defconfig.
>=20
> This is what we pass for make to configure the board and should be the
> given value.
>=20
> As we does for device tree, where we pass for KERNEL_DEVICETREE:
>=20
> foo-bar.dtb
>=20
> and this is also given for the make, for the kernel.

This is not the same thing in my view.  In the kernel you're also
getting that as the output file.

What we should do, and I've wanted to do for ages but always never get
around to it is:

do_configure() {
	oe_runmake ${UBOOT_MACHINE}_config
}

do_compile() {
	oe_runmake
}

As _config has worked for forever.  And modify the above as-needed for
the env recipes and so forth.

--=20
Tom

--rCSNDbWtzOodvTSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWlssmAAoJEIRElH1W1v7NOq4P+wejDLfmH9Op7J/7Q/9I8Lts
NU94nV5holAglBDzGuZthHNLJiwJ9dIFPRcodTxpy9eBSzhmifpobSoV9HDmAQPt
m4b57+HM/Ftpng/e4BX1n0fu+yLWVOZ6w+W+hTz/sGpwY3fi7tYzqGlLabrrPoSZ
qApJBDV8G+Xk6qWXk/3YL6+4rNpEqX5orDipxW64zYXSnb5vFHAh8kcOv8E4ZB+Y
eh1y+1Qwz51ubAXDwEIIP//I9jlFgyKKpGObnGgiZCb0em3XTukRCxZkyAaveJlw
wU4e9CtnDdeV5HQdPmUVIP1+kO+o1az8eHFIu7Ks+3iV/Grn1WPZpvPvkXrU9Y4+
MWMKff7Kx+kZ6AIOTUCuETCudCZDkRA2mC0f0XUSwMO0raX2CFn7jjZSfbtj1jk6
V/VH9TQpRxA93KnCgh6ZINdWmye1IIE7hC/tgxmHhSqJoQIl1NULfH7hUKehTffO
sRqNcYwTejB4NPDdjtDclgE3/kngR/JF+YuNHddK3s9hHUSQhvFVxxMqh4dSL362
ucE7HvP0m5WsowYcfqAdp5DpJwuc03A471JYu3GSRWiAexrFMcJ7KxU/GcsSS3hD
7J472sGh/SKERbUEdCfAi5EfQrGnHUWcQCwc7Y+3aoHQYtsc1hpmowJ8dBu3V2Z7
7JHM6ssHIihJpBFQlMdp
=YQa4
-----END PGP SIGNATURE-----

--rCSNDbWtzOodvTSV--
