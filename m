Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id C5AD8609B1;
	Tue, 29 Apr 2014 17:59:59 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id e16so421789lan.41
	for <multiple recipients>; Tue, 29 Apr 2014 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ia8V2qZJmW1VqHbSemhSxpo13pX5ygoBnXaSLNxcEgk=;
	b=tdJY3XZqutZgE8VBk1Mtjyezn7NGETL/mB2dOhEbO5sWNxyVloeL/qmKOoq4ZQFoZB
	+K1c0n/j01W80ms/CDqOOzPYVtuD8pNNpNH2LqnXiy/mh7Xl712VCM4OHoLUh1B/Lhwe
	AsadKg1Kx5gl9jNWvJCEam5wa/y8PBQtx3vqtqnlocxlqYWTLWH/8UQhW2xEQel9DdKE
	zgYUkgGYmlG4gfl0jpO/Jc/z1wJw/f49j3bORxjKH4lXc0MoLx6M+TGv9kbBqPJbFi0o
	EWhEMo9v14vpdjkS90OiD5upBULd9nincv87CFeulnAWICDzEjVrHHgJ+LTEWreC4FlK
	A0Eg==
X-Received: by 10.112.41.227 with SMTP id i3mr323629lbl.41.1398794399592;
	Tue, 29 Apr 2014 10:59:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q2sm8610205laj.9.2014.04.29.10.59.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 10:59:58 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Apr 2014 20:00:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140429180012.GK2486@jama>
References: <20140428025029.GG2486@jama>
MIME-Version: 1.0
In-Reply-To: <20140428025029.GG2486@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2014-04-28
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
X-List-Received-Date: Tue, 29 Apr 2014 18:00:02 -0000
X-Groupsio-MsgNum: 52690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IjNnXkPTMbDH1qvK"
Content-Disposition: inline

--IjNnXkPTMbDH1qvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 04:50:29AM +0200, Martin Jansa wrote:
> Be aware that qemux86-64 log is there, but it wasn't complete so it
> isn't included in this report.
>=20
> It isn't complete, because with this number of failed recipes rm_work
> wasn't able to keep tmpdir small enough for my 55G tmpfs, biggest chunk
> was eaten by chromium and mongodb:
> 593M    tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-tiny-kexecboot
> 6.8G    tmp-eglibc/work/core2-64-oe-linux/mongodb
> 20G     tmp-eglibc/work/core2-64-oe-linux/chromium
>=20
> Khem sent couple of patches for B!=3DS issues, bit thanks to him!
>=20
> I have local patch to set B=3DS/autotools-brokensep for remaining failing
> recipes, but I'll wait a bit more for people to send fixes.

Be aware that failures in this report are just small part of whole B!=3DS
issues. After setting B=3DS in them more issues were found in recipes
which were "hidden" before because of failing dependency in first run.

Now I'm in 3rd round of adding B=3DS and with ~180 recipes having this it
still fails in couple newly revealed ones - I'll send the list when it's
complete (and list of failing recipes is the same as last report before
B!=3DS or better)

It sounds terrible, but changing the default to B!=3DS was good thing, we
can easily work-around it by B=3DS/autotools-brokensep and we'll get the
advantages of it at least in recipes which aren't broken.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IjNnXkPTMbDH1qvK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNf6KwACgkQN1Ujt2V2gBz59ACeNATwefZi/HJomDt9jHwhAWsw
X9QAoIRTeXcPgcJ4cOaLi3ej5uQbtUwE
=kbys
-----END PGP SIGNATURE-----

--IjNnXkPTMbDH1qvK--
