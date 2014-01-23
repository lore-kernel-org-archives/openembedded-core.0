Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5821A6B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 15:23:17 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id z12so1669181wgg.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d+t8k7QIWGaQ1qeFb9v2mwpMgHwpKO+tCX5gltJQ5tg=;
	b=QCETLbptJyNCFqq8Yi+5luAh8Sh/vjbz5fOcRKkLK9VWgYUbZS+KzA/FQVHAaAnAFT
	IyQ19PCBoZsjhrRj6SUn7pWkasf6iZRCPz5osWZeKVKqSYL5ITuJeMS817j4N0mqHCWG
	cVHmomdSQrZlEYvMizEpVZDFOjT/wF20BTuGeUqM4Vv1sqGjzL8/zEJqGxYjjohvXcWa
	+itFEY7oEP4krMVMZImnM14rutIXQeg0vNwzPLu7pCL2E24LEUdAPPcSjHZCIPgB7C30
	z7WEq9M4gxb9LrlpcLj6cMS5Qg9clylPGQViKp9PuJNhJ3hxa3iFX0T1o0nlAFgNuKC5
	lJfw==
X-Received: by 10.180.101.230 with SMTP id fj6mr7176866wib.27.1390490597995;
	Thu, 23 Jan 2014 07:23:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id dm2sm28597429wib.8.2014.01.23.07.23.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 07:23:17 -0800 (PST)
Date: Thu, 23 Jan 2014 16:23:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140123152318.GG3704@jama>
References: <CAP9ODKpdT9yypcEReFj2mDuL4UEuj5_0xOOJqnO4Q3qfS=NcdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpdT9yypcEReFj2mDuL4UEuj5_0xOOJqnO4Q3qfS=NcdQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-alternatives WARNING
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
X-List-Received-Date: Thu, 23 Jan 2014 15:23:17 -0000
X-Groupsio-MsgNum: 49469
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mhjHhnbe5PrRcwjY"
Content-Disposition: inline

--mhjHhnbe5PrRcwjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2014 at 11:41:12AM -0200, Otavio Salvador wrote:
> Hello,
>=20
> I am seeing this:
>=20
> WARNING: The recipe opkg-utils-native is trying to install files into
> a shared area when those files already exist. Those files and their
> manifest location are:
>    /home/otavio/hacking/fsl/yocto/build/tmp/sysroots/x86_64-linux/usr/bin=
/update-alternatives
>    Matched in manifest-x86_64-opkg-native.populate_sysroot
>=20
> In todays' tip.
>=20
> Is it a known issue?

If it's incremental build, then it's expected.

/usr/bin/update-alternatives was moved from opkg to opkg-utils and
sstate doesn't know that opkg-native should be rebuilt befor opkg-utils,
because they don't have any dependency.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mhjHhnbe5PrRcwjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLhM+YACgkQN1Ujt2V2gBw1ZgCffkDmIucQeu2n+4fg/X+FO8rN
JhoAn3+zJno2OVNIY3Z0f6RvmvZ8j3JI
=7wo0
-----END PGP SIGNATURE-----

--mhjHhnbe5PrRcwjY--
