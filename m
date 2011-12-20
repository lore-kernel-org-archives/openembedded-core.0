Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rcuix-0003eN-Dw
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 09:06:59 +0100
Received: by eeit10 with SMTP id t10so2337400eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CLpJ0w7eD6fQ+N2vz8NKz3n1LU+IhP7TVeWEUb/Dq+E=;
	b=IHdqS1ytR6PTG5Am++jdSDFFRQrIa0lkG1OYMtuZSL1HG9EUfC8VGTFkWoCFx4L5I5
	HLfsJeawntpZ/1iRYklam97nhVwslhVC4l0m2m+ihL/hdGQn6xs8xzC2MXJOraBn2kM0
	cI31PT0UUwyUXqO29RxyF+YL2iqxYIPLUEYY8=
Received: by 10.213.108.84 with SMTP id e20mr304664ebp.16.1324367995821;
	Mon, 19 Dec 2011 23:59:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm3641950eeh.5.2011.12.19.23.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 23:59:54 -0800 (PST)
Date: Tue, 20 Dec 2011 08:59:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111220075952.GB3946@jama.jama.net>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Tue, 20 Dec 2011 08:06:59 -0000
X-Groupsio-MsgNum: 14510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 04:16:17PM +0100, Koen Kooi wrote:
> ping

I've tried it with older midori-0.4.2 as well as with newer 0.4.3 (which
I'll send to meta-oe later) but both does segfault, probably not caused
by this newer webkit-gtk because even with older webkit-gtk 0.4.2 was
segfaulting (maybe gcc-4.6 issue if you're still using gcc-4.5).

I've tried to get usable backtrace.. but webkit-gtk-dbg is huge (>300MB)
and opkg died twice already when I was waiting for midori-dbg to install
:/.

BTW: it happens on armv4t as well as armv7a-vfp-neon.

> Op 30 nov. 2011, om 15:58 heeft Koen Kooi het volgende geschreven:
>=20
> > tested on beagleboard/angstrom with midori and epiphany browsers
> >=20
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > meta/recipes-sato/webkit/files/GNUmakefile.am |   37 ++-
> > meta/recipes-sato/webkit/files/autogen.sh     |    1 -
> > meta/recipes-sato/webkit/files/configure.ac   |  395 ++++++++++++------=
-------
> > meta/recipes-sato/webkit/webkit-gtk_svn.bb    |    9 +-
> > 4 files changed, 232 insertions(+), 210 deletions(-)
> >=20
>=20



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7wQHgACgkQN1Ujt2V2gByieQCgu+rWf8YjyS70aYBbuvKQAA18
k8cAn0vo7Xtks6/FPGgQpWWStIuEHYWr
=5mp+
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
