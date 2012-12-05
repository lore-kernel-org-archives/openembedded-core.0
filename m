Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgKym-0004x2-Gz
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 20:50:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3105065eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TfFmDBujk7rk5mXloUNfliArSzunnSLt8uzSxRDQmJQ=;
	b=W9lOHRQMa4KvCQTMsTfFoWz36HHyIedoy200euVnEfE43urR16YubEJMPOPVYiwxDd
	6dXJ9tW92KQGHNHVNSbbVyMFuIJwbdESxjbPZclRfRI0m8hc713j2uvPDxdF55JZ8QsS
	4x9cBog/73WYZRYZ1b25noXLS+N1oj2UswdkD44fA3pOTF8WwGMGL7/rn8XVgr36dhsD
	9HleoFVJ58rGQN2Wv+Faw4iez9iQyDinVtd5Beeh2kjjYA6DZNL1cwlCcvkZVlHoPcXV
	XEl1JRjErcCZuyvZA/my5IhoOXjtt9r7N1vaWhvvs5wBHBMznGwLYz3QcOHrJcqNlO2+
	EiTg==
Received: by 10.14.208.137 with SMTP id q9mr63825906eeo.28.1354736126238;
	Wed, 05 Dec 2012 11:35:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm11036000eep.5.2012.12.05.11.35.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 11:35:25 -0800 (PST)
Date: Wed, 5 Dec 2012 20:35:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20121205193523.GG3396@jama.jama.net>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
	<8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
	<lyehj48gmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyehj48gmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 19:50:15 -0000
X-List-Received-Date: Wed, 05 Dec 2012 19:50:15 -0000
X-Groupsio-MsgNum: 32292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AGZzQgpsuUlWC1xT"
Content-Disposition: inline

--AGZzQgpsuUlWC1xT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2012 at 08:04:47PM +0100, Enrico Scholz wrote:
> Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
>=20
> > +WHITELIST=3D"\/var\/pseudo\/*[^\/]*$ \/shlibs$ \.pyc$ \.pyo$"
>=20
> Is it really wanted that this matches paths like '/var/pseudosomepath'?

=2E*/var/pseudo
and
=2E*/var/pseudo/somefile$

which matches also /var/pseudosomepath, I can split it in 2 regexps if
that's likely to show in sysroot, or use "\/var\/pseudo\($\|\/[^\/]*$\)"

to match:
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo/files.db
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo/logs.db
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo/pseudo.lock
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo/pseudo.log
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo/pseudo.pid
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/om-gta02/var/pseudo/pseudo.sock=
et

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AGZzQgpsuUlWC1xT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/ofsACgkQN1Ujt2V2gByFvACgoticv68E6W/6ogq8Pg2ZMNmY
PgQAoIbPKjb8CV8qoCR1RKhs/mKv6ie0
=vQcc
-----END PGP SIGNATURE-----

--AGZzQgpsuUlWC1xT--
