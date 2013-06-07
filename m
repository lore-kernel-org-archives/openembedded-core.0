Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3483D6A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:37:11 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so1189673eei.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4iQKKYKZRfgiexefaUWt7goUYUVye0VNwPl6h4ImzZQ=;
	b=L0XafUwpF3gzk4Btf7LaY0GJrgG5nqVUmxgk8RQOTF7kOxdCPoc//4nMiGesvd7Qt6
	KqQ7WLLLaxN865Dt+MxPIyQKE4s/TqS9LgAcEbUHoJSOOJQIPeBDNXJ2Nr1CBwhE8P7n
	ITdLzWQLtGiauL4MlS6CrpKaFHbrP+KNfprIdGhOf7SZWxOv5qpxuvggCma2L4HSwkQT
	RoQGiBZW8p2CnkjnB17fULI/sR8WXnaVT7wpOjPivWE1W9e4L+d3UWuGWy6OBqReTqlF
	x2thPuzY1ILHiSfgsNoll9QgLn9iFfVC5QzRSzwgRnwh9XYF9S0te8WOIszOrLGS913G
	v5hg==
X-Received: by 10.15.35.129 with SMTP id g1mr40290825eev.110.1370630231645;
	Fri, 07 Jun 2013 11:37:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id y10sm46253eev.3.2013.06.07.11.37.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 11:37:11 -0700 (PDT)
Date: Fri, 7 Jun 2013 20:37:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Felipe Tonello <eu@felipetonello.com>
Message-ID: <20130607183730.GK22710@jama>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
	<CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
	<CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Fri, 07 Jun 2013 18:37:12 -0000
X-Groupsio-MsgNum: 40330
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KM+e2hnYAO+MCJ5e"
Content-Disposition: inline

--KM+e2hnYAO+MCJ5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 10:51:14AM -0700, Felipe Tonello wrote:
> I got this:
>=20
> valgrind/usr/bin/ms_print
> 1:#! /usr/bin/perl
>=20
> valgrind/usr/bin/cg_diff
> 1:#! /usr/bin/perl
>=20
> valgrind/usr/bin/cg_annotate
> 1:#! /usr/bin/perl
>=20
> valgrind/usr/bin/callgrind_annotate
> 1:#! /usr/bin/perl -w
>=20
> valgrind/usr/bin/callgrind_control
> 1:#! /usr/bin/perl -w
>=20
> valgrind-doc/usr/share/doc/valgrind/html/manual-core.html
> 165:<code class=3D"filename">/usr/bin/perl</code>, or whatever interpreter
>=20
> valgrind-doc/usr/share/doc/valgrind/valgrind_manual.ps
> 55978:(/usr/bin/perl) 77.7083 Tj
>=20
> Do you know if these "binaries" are part of the main package or can be
> extra? I'm not that familiar with valgrind.

Neither am I, but from filenames I would guess they are not mandatory to
run valgrind binary, hopefully someone who is using valgrind daily will
respond soon...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KM+e2hnYAO+MCJ5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyKGoACgkQN1Ujt2V2gBx5swCfanm4pLmPvh+9sm45q3eJwLW4
/1YAoLUOvYH4+1hoOsoC7Ladc6CI3PCC
=cXoU
-----END PGP SIGNATURE-----

--KM+e2hnYAO+MCJ5e--
