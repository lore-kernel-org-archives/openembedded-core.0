Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoARf-0004YT-HK
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 11:39:55 +0200
Received: by bkcik5 with SMTP id ik5so5607586bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t0mA2AhYjAFoGNxeGj39FyoxV3PySC4J1ffT/o5cw54=;
	b=Y67PRE/vVkwxRUOLlUdH47UB9iGCRVQosflfRYkOQTKcz9pPBkH0mzsrLWQb+4XBwW
	7Kihbk/lxP/dugQFXq8a4/sjtgb/7du8tUOCcJCuVmEXXs2+IMsacZbRr7P80Fhpx1j4
	35jy+uDC+SEmLE0qWJr+J8I4jrnPactx4fSHy6sE9KoKjYT/FMhwh/GLPbeldO9nY9Xb
	HoycizqsvmPgRM+Ph6xPN5U2/X9vRZcuwjxAHgIwPcWZpZasm1g5cOax5B1vlbx4ZdKZ
	pBsQz9Bifuzyr2RmWgtC+JfFwvmxeUKjd/QpMfS+WdR87t0JH7psCOlsVZvtYeD8+EQ9
	/5UQ==
Received: by 10.204.129.14 with SMTP id m14mr2513109bks.7.1341826126509;
	Mon, 09 Jul 2012 02:28:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g6sm2266923bkg.2.2012.07.09.02.28.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 02:28:45 -0700 (PDT)
Date: Mon, 9 Jul 2012 11:28:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120709092840.GB6308@jama.jama.net>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
	<20120709092332.GA6308@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120709092332.GA6308@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
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
X-List-Received-Date: Mon, 09 Jul 2012 09:39:55 -0000
X-Groupsio-MsgNum: 24874
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 11:23:32AM +0200, Martin Jansa wrote:
> On Sun, Jul 08, 2012 at 01:59:48PM -0400, Robert P. J. Day wrote:
> >=20
> >   (most of this is sort of self-evident but it's not documented as
> > well as it could be so i just want to make sure i have it exactly
> > right.)
> >=20
> >   snippets of some layer.conf files:
> >=20
> > oe-core:
> >=20
> > BBPATH .=3D ":${LAYERDIR}"
> > BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb"
> >=20
> > meta-hob:
> >=20
> > BBPATH :=3D "${BBPATH}:${LAYERDIR}"
> > BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
> >=20
> > meta-yocto:
> >=20
> > BBPATH :=3D "${LAYERDIR}:${BBPATH}"
> > BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
> >             ${LAYERDIR}/recipes-*/*/*.bbappend"
> >=20
> >   note how meta-hob *appends* itself to BBPATH, while meta-yocto
> > *prepends* itself.  is there no possibility that this will cause some
> > confusion based on how BBPATH is used to resolve the location of class
> > or conf files?  i realize you should try to avoid that sort of
> > conflict but it still seems possible that someone might choose the
> > names of some files badly and the unpredictable ordering in BBPATH
> > will cause grief, no?
>=20
> Yes, order is important and prepending makes it harder for person
> writting bblayers.conf to influence it:
>=20
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/024914.h=
tml
>=20
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/0181=
15.html:
> BBFILE_PRIORITY controls recipe priority. BBLAYERS order controls
> BBPATH order which in turn controls bbclass/config priority, as things
> stand today.
>=20
> See also this thread for more details:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032387.h=
tml

And this one
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007387.h=
tml

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/6pEgACgkQN1Ujt2V2gBz6VACfdSTf90EEU8FlBcYXjpISWyX/
iwQAn03x98gRS8oxgvAX/9WmrjKicCvU
=YDKF
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
