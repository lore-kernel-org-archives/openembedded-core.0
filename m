Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0tf1-0004pb-AG
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:54:36 +0100
Received: by mail-pb0-f43.google.com with SMTP id jt11so1603815pbb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=w41B5m9rn7ex2PTPCo0J3NZcdoaQ1iAHI2NSN2iGRdE=;
	b=S9mmG1zm5e4Cnm5NwXTXC//dpiXsDxSq6trgjgFX4wHvhC50FmzYY+eJsCPASPZTXp
	jehzLIzc+SGLc5ifdLBBiRf0qXf6SZ4EnDwUozgokwoUHgzLGipdSslkyDDKOpH+ztxZ
	GcoQyJli4Cyyu3rn4aEIpQ65RRGYo4j08xHdbKtSQ5qQSjvW01vIGaH2tIswSyrzkHbQ
	W1uT8uN8jliC4V4A5MpmW+JYZP8wyakm2JFH1lhbK+sIwiYYb/kPk0tnjRewenJHmJUm
	pP7DaXogqFAm7P45/EHmmYjZod5F61pvJbpKLDwE0oxeKATxUrKHTCUOIEhu4TwKjPAx
	tyAQ==
X-Received: by 10.68.130.195 with SMTP id og3mr22095454pbb.10.1359635932066;
	Thu, 31 Jan 2013 04:38:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oj1sm4928007pbb.19.2013.01.31.04.38.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 04:38:50 -0800 (PST)
Date: Thu, 31 Jan 2013 13:38:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130131123847.GC2102@jama.dyndns-home.com>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301310711320.6796@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 12:54:38 -0000
X-Groupsio-MsgNum: 34744
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 07:19:20AM -0500, Robert P. J. Day wrote:
> On Thu, 31 Jan 2013, Eric B=E9nard wrote:
>=20
> > Hi Robert,
> >
> > Le Thu, 31 Jan 2013 05:37:59 -0500 (EST),
> > "Robert P. J. Day" <rpjday@crashcourse.ca> a =E9crit :
> > >   ok, what have i done wrong?  i thought the whole point of
> > > BB_SRCREV_POLICY was to make the above possible.
> > >
> > no idea if that the solution but did you do a cleansstate and removed
> > the initaly downloaded sources to fetch again the sources ?
>=20
>   i did not ... that's necessary?  that's kind of important to know.
> let me describe the situation i have to see if BB_SRCREV_POLICY is
> actually going to do me any good.
>=20
>   here's my global site.conf file:
>=20
> SCONF_VERSION =3D "1"
> SOURCE_MIRROR_URL ?=3D "file:///home/rpjday/oe/dist/tarballs/"
> INHERIT +=3D "own-mirrors"
> BB_GENERATE_MIRROR_TARBALLS =3D "1"
> # BB_NO_NETWORK =3D "1"
>=20
> so, as you can see, whenever i end up fetching any new source, it ends
> up as a tarball and i copy it into my long-lived own-mirrors
> "tarballs" directory.  obviously saves me buckets of time.
>=20
>   now say i've started a new build and i've done all the fetching
> without involving BB_SRCREV_POLICY.  i suddenly realize i need to move
> to somewhere without network access, so i quickly add
>=20
>   BB_SRCREV_POLICY =3D "1"

BB_SRCREV_POLICY =3D "cache"

right?

>=20
> and do another fetchall to cache all the SRCREV stuff.  it *appears*
> that that does nothing for me since all my fetching had been done.
>=20
>   you're saying i need to cleansstate first, then do the fetchall
> *again*?  i might be misunderstanding this but, at this point,
> BB_SRCREV_POLICY is starting to look like more trouble than it's worth
> since it requires planning, *knowing* that you'll be without a network
> later and, worst of all, if you start a fresh build, it does you no
> good since all that cached SRCREV content is in the other build
> directory's tmp directory.
>=20
>   given that all of this can be avoided by just avoiding tag names,
> i'm liking that option more and more. :-)
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEKZdcACgkQN1Ujt2V2gBxjawCeJU5tPBgZJaK+x06k3BTskGq0
CIkAnj+ZmhJQQMwg0m0ayhoyHeCXm0po
=U1KH
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
