Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D08465CED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 06:42:39 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id bs8so9273003wib.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Nov 2014 22:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Hm0dNZqJxkgp5yyC0E7GUKVBJmCt6Nlh7gwSLF8CQqE=;
	b=eplGQuNtcbh2AemjjPFRNwGXlyT8DpHO/GsmF2ndy8HjwmggYLv2DATwFDQMWwlaVu
	FIwtMFCB+lY48vZhC5wybqaaUOo6RnspJM9157pss3v/CdwU6k0pcLU5EfPnU9EDWg0l
	3QfwMp81Eq4i01EAECtSpSrdWpfFpMf6tGmRLzJbHOp0CzJgLf2S3LMz3PqZta1oGBl9
	Qzx6If/Rslk/w/IJj5aSqxvZPIKH1CAlHOKeyb0XSBnGh+4bildIhNPeoLLq7XG7AD3H
	dVNkyTHx6XlFCzGTvx+USfdOJ+pbkAG2wDnBNvryzc84PRx3JLc4h0J+nCgEk+G+6CRC
	xblQ==
X-Received: by 10.180.188.41 with SMTP id fx9mr26882907wic.59.1415601759456;
	Sun, 09 Nov 2014 22:42:39 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fi9sm12152089wib.6.2014.11.09.22.42.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Nov 2014 22:42:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 10 Nov 2014 07:42:47 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141110064247.GB2440@jama>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
	<01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
	<54601CC7.1060000@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54601CC7.1060000@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Mon, 10 Nov 2014 06:42:43 -0000
X-Groupsio-MsgNum: 59472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 10:02:47AM +0800, Hongxu Jia wrote:
> On 11/09/2014 02:53 AM, Koen Kooi wrote:
> >> Op 7 nov. 2014, om 15:38 heeft Martin Jansa <martin.jansa@gmail.com> h=
et volgende geschreven:
> >>
> >> On Fri, Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:
> >>> The package avahi does not exist, so we use avahi-daemon as the provi=
der.
> >>> It avoids the do_rootfs failure while IMAGE_INSTALL +=3D "avahi"
> >> Why don't you fix your IMAGE_INSTALL instead?
> > I agree with Martin, this is a non-problem, please fix your IMAGE_INSTA=
LL.
>=20
> I am afraid it is not the issue of IMAGE_INSTALL
>=20
> As doc said:
> http://www.yoctoproject.org/docs/1.5/ref-manual/ref-manual.html#var-IMAGE=
_INSTALL
> Variable IMAGE_INSTALL is used to specify the packages to install into=20
> an image.
>=20
> While adding some packages to image ,the rpm based do_rootfs
> failed with '*** not found in the base feeds'
>=20
> The failure was caused by two kinds of situations:
> 1. Package does not exist (such as python3), but provided
>     by other package (such as python-core), the rpm based
>     do_rootfs could not search its provider. And the deb/
>     ipk based do_rootfs worked well, it is a defect, and
>     I have fixed it (patch sent to community, YOCTO 6918);
>=20
> 2. Package does not exist, and no other package provides it,
>     the package installation will fail in any type do_rootfs. We
>     met this issue when we set IMAGE_INSTALL =3D "recipe_name",
>     but we don't have the package with that name.
>=20
> I think what I do is to fix the situation 2.
>=20
> Further more, we should add checking at the package generating
> time, if the package *with recipe name* was empty and not created,
> trigger a warn and according the warn, we could fix the issue recipes.

The docs say that IMAGE_INSTALL is for "package_name". So I think it's
correct that it fails when you put "recipe_name" in it and sometimes
there isn't any package with the same name. It's the same as trying to
make RDEPENDS/DEPENDS entries to be interchangeable (putting
recipe_names to RDEPENDS and package_names to DEPENDS)."

Especially with that patch for xinput-pointercal, if user explicitly
asks for installing xinput-pointercal, what's the reason to create him
completely empty package? IMHO it's only hiding that issue from him and
instead of discovering the issue in do_rootfs task, he has to check
generated rootfs or even boot the device.

> We already have that checking at the package generating time,
> but it a note, not warn. I suggest we should use warn instead.
>=20
> //Hongxu
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRgXmcACgkQN1Ujt2V2gBwMXgCdHBguwyisTwqoa1PqfpTFCjHN
QFwAoJppZiZv9irkUHwrkqcDcnm1ncp+
=E+X7
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
