Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id C78BA787AF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 14:14:21 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id n185so1224399yba.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qvR6KD50hA9kdbOQjxV5WOk0jca0g3vAFyhE1m+D5MY=;
	b=pByPlk5Zjfaiu4+X1VrxiMq90AHiL+eHH7HCRq5GThD49v56shXzgUMCUO3v+C8vXs
	IKkY0jJI5gG8yv2P3tHlArDyRBCqGw5JW2/v2Z1vO5crHfjCS/riKTk54taMnERHeLDD
	PBDgWCDn+bCehSkq2qlUbb9+jmUtAAmYRNgUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qvR6KD50hA9kdbOQjxV5WOk0jca0g3vAFyhE1m+D5MY=;
	b=AAUo/xwElN5DOi5cXKb8ZedUr0W7n+kp/lLO+tyVsTGXKMjQBEGDro8ZXMC+9rn9iO
	PgyMZnJCTQdY7Q2Q3JnmcYAq2cu1TpvbquXX3SogGIUXZXuiCZ6xlt/M1ULZ9j2qESnh
	cnUxVMVjpQ/CxiloWoNpx6llOsra/XhdAFwWqCqcOtlwZj2W9x7oMBJlxLZrh3vnB2E1
	7STsneeNj5pUHZ250AvT8n0VAI+pg2GG9krYFRDI2j7CzGmrLO2W5SsSvhsBSlTjlJEu
	8SxvUz0hljvoTXQwOYfL/HKDFpu4uqc0H0Jk2aI/9mjwOmkfM2zegQP3FiA70M1ZwKDq
	J5WQ==
X-Gm-Message-State: AJaThX40+grRwdOv6eQT0RcCBqcr3TD3eeQoiM18WPH0xX8YIc7YcPTr
	mKork1MTRS4v9jJJr+Xwf/90Ih3AgA8=
X-Google-Smtp-Source: AGs4zMbda8iVkUu3nMC7apN4CNZaLoKSSRPBEXmOOz6NToc0XUPfuY53v1qyUK558miiQ2bWQ0ZQOQ==
X-Received: by 10.37.40.196 with SMTP id o187mr4767692ybo.244.1511014462635;
	Sat, 18 Nov 2017 06:14:22 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	k11sm2633366ywk.91.2017.11.18.06.14.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Nov 2017 06:14:22 -0800 (PST)
Date: Sat, 18 Nov 2017 09:14:19 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>, Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171118141419.GZ9986@bill-the-cat>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<c19104c9-f988-d406-650e-2c9d7d74babd@denx.de>
	<20171117205918.GX9986@bill-the-cat>
	<50bf044c-899c-cd0a-84fb-af563ee46546@denx.de>
MIME-Version: 1.0
In-Reply-To: <50bf044c-899c-cd0a-84fb-af563ee46546@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Sat, 18 Nov 2017 14:14:22 -0000
X-Groupsio-MsgNum: 105258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NeBFRwWgvjTuyTVb"
Content-Disposition: inline

--NeBFRwWgvjTuyTVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2017 at 11:19:13AM +0100, Marek Vasut wrote:
> On 11/17/2017 09:59 PM, Tom Rini wrote:
> > On Fri, Nov 17, 2017 at 08:19:07PM +0100, Marek Vasut wrote:
> >> On 11/14/2017 07:32 PM, Otavio Salvador wrote:
> >>> This upgrades the U-Boot from 2017.09 to 2017.11 release.
> >>>
> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>> ---
> >>>
> >>>  .../u-boot/{u-boot-common_2017.09.inc =3D> u-boot-common_2017.11.inc=
}     | 2 +-
> >>>  .../u-boot/{u-boot-fw-utils_2017.09.bb =3D> u-boot-fw-utils_2017.11.=
bb}   | 0
> >>>  .../u-boot/{u-boot-mkimage_2017.09.bb =3D> u-boot-mkimage_2017.11.bb=
}     | 0
> >>>  meta/recipes-bsp/u-boot/{u-boot_2017.09.bb =3D> u-boot_2017.11.bb}  =
      | 0
> >>>  4 files changed, 1 insertion(+), 1 deletion(-)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc =3D> u-boo=
t-common_2017.11.inc} (89%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb =3D> u-bo=
ot-fw-utils_2017.11.bb} (100%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb =3D> u-boo=
t-mkimage_2017.11.bb} (100%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb =3D> u-boot_2017.1=
1.bb} (100%)
> >>>
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc b/meta=
/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> >>> similarity index 89%
> >>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> >>> index 02e51242cb..bfdf1a0d8f 100644
> >>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> >>> @@ -7,7 +7,7 @@ PE =3D "1"
> >>> =20
> >>>  # We use the revision in order to avoid having to fetch it from the
> >>>  # repo during parse
> >>> -SRCREV =3D "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
> >>> +SRCREV =3D "c253573f3e269fd9a24ee6684d87dd91106018a5"
> >>> =20
> >>>  SRC_URI =3D "git://git.denx.de/u-boot.git \
> >>>      file://MPC8315ERDB-enable-DHCP.patch \
> >>
> >> This patch ^ could use a refresh , since it applies with Fuzz now.
> >=20
> > Honestly, just enable DISTRO_DEFAULTS for the board and post that
> > upstream instead.
>=20
> Or that, but someone would have to test that first and the patch author
> does not respond for some reason.

Adding in Ed..

Yes, it would be good if the MPC8315 got run-time tested more often, but
no, a build test is sufficient I think for changing a few options like
this.

--=20
Tom

--NeBFRwWgvjTuyTVb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaEEA7AAoJEIf59jXTHXZS678QAIzDgBMhydDk54SolSn8FR40
Oew9ZSZHMgenpv1EkB79FxtnIlb3uJ4wxkfkPC8RM8SCws3S8Mx28B5t9b9T7NhQ
vvuNvDh2Mx6b/Mu0TOe1bhWvbTQgeaNAlcDlJk15Sv5SmmO2F6ujDKYzlS05tLTe
5OYHfK8ysYHZSaisfaQZHB3athUms8VXmRJIoF8iz5aL1mbadYGuJY2oxf8D1GOW
b8ZyMztQWZxuy56tjfbUiMhOPyZdS4pyCN8rUdnhS+rpEc3D3T9bnvFKbvhvdsLc
NdstcB8Vm4rJDP1+61mJnW8O3AS5SNDWSJ+4b/lwRyc5290qlbCcOngqcdlTSlqO
0i70CUql7HfArSNbC1hLf771XdcfixlH9s/mAUOP73eAWNRzJ+31pAwTeNeLllZv
zoHmLayakz1XM7URALcyMI8DA7eeVeStXwB4wYtB/V4IvWG6ZqywuO0KDkECzhL+
p0Pi5b3wzgnEJvdayFA0dfwfywKyBJZMBIi+gcP94Qq4vHGb17MGZe+J3BR+qOO+
2oz7ppcygciIoFOdQOxdg9TVK5Wb8ohPXwPBtArKgx0aKmj6sBNWqaWdT7psB7bb
ZkpcyYsWTByPzMK2UrLhdOHypSuxDp4b/yNjM8HdMYD9ju8nuJ+F8ZQ0pZ9Qw1bc
rX8P3kkAloitP5ktqDoP
=dlKU
-----END PGP SIGNATURE-----

--NeBFRwWgvjTuyTVb--
