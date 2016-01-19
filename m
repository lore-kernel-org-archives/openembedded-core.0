Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ADDCE6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b14so22695707wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0/DQUb7atpi38hhxO4+iEMr30gXsTvkAosDk+Xu2s/w=;
	b=vbPJ+72RgDcd7ymHgvtQshPMPdrp2w1iTw1ROcAqncEte5XBxOYhRLa1vo9ZvMAEps
	Cv8LlktKi9MLUoPyeKnZTbA8XBwIIp1ekopzSlJbfexs5+UeBkur1j+wwB/gGNmSlro4
	ueHs0icw8xCEraLhH9l34LskqtUmkWl5fQFDwV5QJszydt2Ja9jJosMNQ2nqoFxJJkKw
	vo3noOrNwaO+PP7X/UXGj7s5BLq/gOuCawM23u1TNH7FEH4ex2/3AuVgXbtVOQzOTsUI
	CpdHFtTqoCyudFdbh0nmez9vDMu2b966eET5CK+SqTTZ1nTYblaLIbauoi7bi2eNBkgN
	011A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=0/DQUb7atpi38hhxO4+iEMr30gXsTvkAosDk+Xu2s/w=;
	b=CGNt+oe1tYgNrtAFgqIb4bEUZW/kECxcTQrn0J29PlXzNRg46aNsMtwkeiYKgCfx61
	Tu4knGGPzkY0hQ5APdEoVVzaeH/miyDlhunTQkZnLL3KpzUjcecswfz2F1dsbCpG4Nmf
	be2lm34eAC0Vbl0MSqrMAq1j5zNRPdXmiYTgFS2PaGfuJyuK+rehhNr6BzU3zApdrDYs
	OyWd3Cz2kehFlgsDGMmBhYwzsIQICyc8+5CApKhV3lLVn8LSbiVniflAtXRYgLevlFej
	Lg4emDVNGIXorlY9q3TFIDYxSocqt2ekNIsOz4UHv0LjQe96xQXWzQ/oUm9mmCUp9loB
	S6vQ==
X-Gm-Message-State: AG10YORFt/8Z1S/iRNctjIxNyiBs7jvGqbimPI+5b+4mX5cZVQYnNdGEGSTOXgX3k3TcUw==
X-Received: by 10.28.6.213 with SMTP id 204mr18277858wmg.47.1453203378580;
	Tue, 19 Jan 2016 03:36:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i63sm20023738wmf.24.2016.01.19.03.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 03:36:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jan 2016 12:37:42 +0100
To: Jian Liu <jian.liu@windriver.com>
Message-ID: <20160119113742.GB2611@jama>
References: <1452754008-158464-1-git-send-email-jian.liu@windriver.com>
	<1452881834.27999.0.camel@rpsys.net>
	<569DA992.4030806@windriver.com>
MIME-Version: 1.0
In-Reply-To: <569DA992.4030806@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-libc-headers: set ALLOW_EMPTY
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
X-List-Received-Date: Tue, 19 Jan 2016 11:36:18 -0000
X-Groupsio-MsgNum: 76389
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2016 at 11:12:18AM +0800, Jian Liu wrote:
>=20
>=20
> On 2016=E5=B9=B401=E6=9C=8816=E6=97=A5 02:17, Richard Purdie wrote:
> > On Thu, 2016-01-14 at 14:46 +0800, Jian Liu wrote:
> >> If setting IMAGE_INSTALL +=3D "linux-libc-headers", do_rootfs will
> >> cause
> >> error.
> >>    ERROR: linux-libc-headers not found in the base feeds
> >>
> >> This is because that there is no linux-libc-headers.rpm generated.
> > There is no point in generating an empty package just for the sake of
> > it. Surely you just shouldn't put that in IMAGE_INSTALL?
> >
> > Cheers,
> >
> > Richard
>=20
> Yes, I submit this patch just considering that someone who is not=20
> familiar with yocto may be confused
> by this behavior. There is linux-libc-headers bb file so IMAGE_INSTALL=20
> +=3D "linux-libc-headers" is taken for
> granted.
>=20
> This is really not a bug and it is just a usage problem.

And you're making it worse, by allowing such person to install
completely useless empty package assuming that (s)he installed
linux-libc-headers to the image.

Error message is _much_ better than empty useless package.

> >> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
> >> -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
> >> -headers.inc
> >> index 2ba6ed5..403360b 100644
> >> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> >> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> >> @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D
> >> ${EXTENDPKGV})"
> >>  =20
> >>   INHIBIT_DEFAULT_DEPS =3D "1"
> >>   DEPENDS +=3D "unifdef-native"
> >> +
> >> +ALLOW_EMPTY_${PN} =3D "1"
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaeIAYACgkQN1Ujt2V2gBxFLgCdFK7cfArQlndlEvqGN6VtfmZF
vzEAni1HqHGHJEQzZWPuHTve5hz4fYyH
=K2Ts
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
