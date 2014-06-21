Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1F56FE88;
	Sat, 21 Jun 2014 08:51:53 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id a1so4675782wgh.12
	for <multiple recipients>; Sat, 21 Jun 2014 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b1R3J44pCJZcMmuArk7tvZu6rb3t0k+RQeqZOrpJ5uI=;
	b=pEteyTgoxVs8hsKLjoO1O3dS+5r1CmNDxh+RAd/9BRMbpk92zSwRGPj6w3Tg1Wm7Y3
	nanIkr4sDmEl2tRfrKtydnNKIfx2gd90M8vYsTPogqnFOKabtVGCqtOWqeRQQvd3T76N
	FIwtyA0dqh/vFPJmDlmRMNiDq4uikzsjhchjhWKaJO3Ap1DdgK0r28kn7ELZGRG59A/Y
	iRHhTiDfAIw65Xr35mXJi9A8cdxGEyN5MwnPHAcS4KM5vBUUD+X5Mm33zCEFDvsuyGPJ
	CTiNGkcgmRUTvTMciucCA1AYjiiqHYlsL5Ez8sMyeodr4ACR/InzWoVYU59hm7abyG7+
	jtiA==
X-Received: by 10.194.10.130 with SMTP id i2mr10781411wjb.70.1403340714193;
	Sat, 21 Jun 2014 01:51:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm12146633wjb.18.2014.06.21.01.51.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 01:51:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jun 2014 10:51:55 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140621085155.GF2117@jama>
References: <20140610100722.GC2433@jama>
 <1403258272.2104.87.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1403258272.2104.87.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Sat, 21 Jun 2014 08:52:00 -0000
X-Groupsio-MsgNum: 54299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="656hIAUFSU7Oh46B"
Content-Disposition: inline

--656hIAUFSU7Oh46B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 10:57:52AM +0100, Richard Purdie wrote:
> I know that with some of the changes in oe-core, meta-oe is suffering a
> little. I've been working on fixing up some of a world build of meta-oe
> with patches including the problematic autoconf one applied.
>=20
> My WIP is:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drpurdi=
e/meta-oe&id=3D9ece5e493b7844a7282eb883effa9d9a5b56d20e
>=20
> I appreciate its a huge patch and needs splitting up but there are only
> so many hours in the day.
>=20
> Of note are a few sepbuild fixes in there and one for the binconfig pcre
> issue that apache2 has, introduced by the binconfig change in OE-Core. I
> took the opportunity to clean up the -native recipe a bit, it should be
> closer to the main recipe and allow it to be converted to BBCLASSEXTEND
> in due course.
>=20
> There are some fixes for talloc which I know has caused some headaches
> too.
>=20
> I will try and find the time to clean this up and submit it piece by
> piece but if anyone beats me to it, great and hopefully nobody will
> duplicate the work.

Thanks RP!

I'll split some parts from this for merge today and will send the rest
as separate changes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--656hIAUFSU7Oh46B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOlR6sACgkQN1Ujt2V2gBzb3wCfVhCtRIDIdWNbll4l8fvRlGBU
PWcAnRdG2ak3V+9v2SAIHoFi0zp5jIly
=6Plz
-----END PGP SIGNATURE-----

--656hIAUFSU7Oh46B--
