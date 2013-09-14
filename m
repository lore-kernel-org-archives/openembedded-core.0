Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 739E760648
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 08:04:25 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1013936eek.12
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ttbSoGUq9n+F7sPNXWUQd8iCLFPYf0RqripPSQ6KCvU=;
	b=NhgzTlOnH43e61AiIcZnq9ptkC6CZuNPlsdjmD+IoqEQbL90G8iIehIYDrRAWE1Ust
	FmY5Lz5cMDcBphd9EWR4JpTmyMA0NKJttJL6n6ciBtSNp3g0hiF1WqOHsIUAU9X5EiUn
	hu5virlO4Asi7zVBkU6CvIbFXqgoNpMg9RilnYaZJu6hypo6QWqOnW/nOUz0IfaHU5pM
	VjCT6JY60XnmRI2akRQLoXez80902jiidXGVpUg9bpye1yvo/J+XWtmf8m1J3Pr4y5iq
	3AbQ4SSaPvO6wUDDJwzMa8rcv2w5f0aHcTpNttqXNppC+91/wPNi2Og2I+PuYuuQUGaZ
	36PQ==
X-Received: by 10.14.246.11 with SMTP id p11mr24916741eer.9.1379145866773;
	Sat, 14 Sep 2013 01:04:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm21873206eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Sep 2013 01:04:25 -0700 (PDT)
Date: Sat, 14 Sep 2013 10:05:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20130914080555.GA30637@jama>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: dvhart@linux.intel.com, Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 4/7] syslinux.bbclass, syslinux: Update to syslinux 6.01
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
X-List-Received-Date: Sat, 14 Sep 2013 08:04:26 -0000
X-Groupsio-MsgNum: 45023
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 07:09:00PM -0500, Jason Wessel wrote:
> A newer version of syslinux is required for an EFI enabled isohybrid.
> This is used for the the capability to generate 3 types of ISO images,
> all of which can be booted off a USB device or HDD if copied with dd.
>=20
> 1) PC BIOS only ISO
> 2) EFI only ISO
> 3) EFI + PC BIOS ISO
>=20
> The syslinux.bbclass required a minor tweak because ldlinux.c32 is
> dynamically loaded and needs to be in the created media as of syslinux
> 5 and up.

Hi Jason,

can you please look at
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3944
?

>=20
> [YOCTO #4100]
>=20
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/syslinux.bbclass                      |    1 +
>  .../{syslinux_4.07.bb =3D> syslinux_6.01.bb}         |   26 ++++++++++++=
--------
>  2 files changed, 17 insertions(+), 10 deletions(-)
>  rename meta/recipes-devtools/syslinux/{syslinux_4.07.bb =3D> syslinux_6.=
01.bb} (63%)
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI0GOMACgkQN1Ujt2V2gBxaEQCcCrZjqhirZXABbZyEnsLmw7rV
2IwAn3+AYJGua0i+rg95xjD8x6eC5WtE
=ZOY1
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
