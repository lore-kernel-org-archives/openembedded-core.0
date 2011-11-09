Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RO5Pe-0004vz-Hk
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 11:29:46 +0100
Received: by faat2 with SMTP id t2so1575030faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 02:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tx7Wn/NXCFvelKyW3gQpH3/i20GYFZGQ4oV2SMwk1HE=;
	b=Vq1xjYSbgXLER2qn6GUf/F8vj0QrFdM9ZBjq/dIQtJoFADpQlf7ak/Bq70Qp2pYUyY
	m72MSJJTk+tezZ8+t/2tl0yqsrdb23HVCThNp3a4QC9jJpIYtKn43zGkBLIzqjf1MX9U
	XA19GRxseLg0S/TMEAxeBfwPyKELxMEa0ipbQ=
Received: by 10.223.7.20 with SMTP id b20mr3943845fab.21.1320834211300;
	Wed, 09 Nov 2011 02:23:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a8sm6089564faa.11.2011.11.09.02.23.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 02:23:30 -0800 (PST)
Date: Wed, 9 Nov 2011 11:23:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111109102318.GF3641@jama.jama.net>
References: <4EB9DF31.7070904@intel.com>
	<19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: openssl 1.0?
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
X-List-Received-Date: Wed, 09 Nov 2011 10:29:46 -0000
X-Groupsio-MsgNum: 12194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline

--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2011 at 10:28:21AM +0100, Koen Kooi wrote:
>=20
> Op 9 nov. 2011, om 03:02 heeft Scott Garman het volgende geschreven:
>=20
> > Hello,
> >=20
> > I wanted to get some feedback from the community about OpenSSL 1.0. We =
currently only support 0.9.8 in oe-core. Specifically: should we add openss=
l 1.0 to oe-core, and should the rest of our recipes build against it by de=
fault?
>=20
> The openssl in meta-oe is working fine, just keep in mind that the SOVERS=
ION changed, so you need a PR bump for everything that links against openss=
l when switching.

FWIW I've list of packages to rebuild and manual fix for git-native needed =
after openssl upgrade.
http://wiki.shr-project.org/trac/wiki/Building%20SHR#Cannotparserecipesordo=
_rootfsafteropensslupgrade

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk66VJYACgkQN1Ujt2V2gBxs9wCbBl4scoXZhDax+H0eGpU2kGvW
oYgAn03+ws6NJwoxPjZH8ZjSKlwf43Eh
=T3BB
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
