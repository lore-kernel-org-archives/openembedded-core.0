Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzE2R-0003TE-Ql
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 23:43:36 +0200
Received: by wgbdr1 with SMTP id dr1so997262wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 14:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q96W3DhAPP+CxKqSDq4qZVxZ2ueOEdhQkDb4No3vCRU=;
	b=TlhFhh3IUekorqBR72VxAD8dhQ/4EOyPeLoutotgZ9fMRwvqL6WfyhT0ECeFdgpLJJ
	pHkEHcHAKE5EFuD7e5ZCG4m/AswOums+64M4xvLQ8TxLeqKKHv+GbNg/SLDZzzAmG0fZ
	z21WQAF3b1Cf5418t8jRxXNnsx8H/uPXWT+0smqX9jStG/fye0CO4zJEdwkcWqnIk5aV
	Mfs1DVs+c/gFtARPvwNx4IvsFo6rYFrGP3HirEKuA7eLqzQg6Cjl0gGoBTSGhXtd5ynp
	xaWuJ148n+YggUy39hW2cha/LSxmICMUHxqtksLE/R6vh7ALRtsQP9s5FptIqFiUJafn
	v/7w==
Received: by 10.180.75.209 with SMTP id e17mr1210339wiw.0.1344461508204;
	Wed, 08 Aug 2012 14:31:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm7336604wiz.4.2012.08.08.14.31.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 14:31:45 -0700 (PDT)
Date: Wed, 8 Aug 2012 23:31:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120808213143.GC2854@jama.jama.net>
References: <CAGiJk9d7sCukgAiM=vdEJm3RKOP=6yqTW6HAGGiBb4oqBj0LqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9d7sCukgAiM=vdEJm3RKOP=6yqTW6HAGGiBb4oqBj0LqA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Qt test cases (was: Re: Replacing Web in Sato with Midori)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 21:43:36 -0000
X-Groupsio-MsgNum: 27208
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline

--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 06:14:00PM +0200, Samuel Stirtzel wrote:
> 2012/8/8 Paul Eggleton <paul.eggleton@linux.intel.com>:
> > On Wednesday 08 August 2012 17:04:16 Samuel Stirtzel wrote:
> >> > On Wednesday 08 August 2012 16:47:05 Koen Kooi wrote:
> >> >> Op 8 aug. 2012, om 16:03 heeft Paul Eggleton
> >> >> <paul.eggleton@linux.intel.com>>
> >> > het volgende geschreven:
> >>
> >> > And? KDE is far more demanding upon Qt than most Qt-based applicatio=
ns. We
> >> > had to make specific changes to our Qt recipes just to accommodate i=
t.
> >>
> >> If you're talking about adding accessibility and session management to
> >> configure -> these are set by default by Qt.
> >> Don't know why they where unset in oe-core though.
> >
> > Not specifically, I was mainly referring to changes such as providing q=
t4-
> > native; we did not need to do that before.
>=20
> While this is true, meta-kde is also the only layer using qt-mobility (AF=
AIK).
> So you implicitly want to say that Koen is right because _there are no
> other testcases_ for these recipes.

monav now in meta-oe is also using qt-mobility

> Or do I get you wrong?
>=20
> >
> > Cheers,
> > Paul
>=20
>=20
>=20
> --=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAi2r8ACgkQN1Ujt2V2gBwsWwCfXM+LNYZQIBiUf1RIHqDmFXdD
7G0Ani9mj22JAmB08lGautxjtEuG+hhB
=RYXG
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
