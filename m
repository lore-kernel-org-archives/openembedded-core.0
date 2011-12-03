Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWeVk-0004zN-Jv
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 02:35:29 +0100
Received: by wgbds11 with SMTP id ds11so1941527wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VycHqSJ9cLg5uhzwR63Wi9T38QJNY+EV+j89uaCMZ7o=;
	b=gv2aJCQeggPSiWPgGxyG1OsJYm7qHX5C0wfxkGCRc4NgtudggWXJ5yirbtd8nOxtBZ
	//cr8xNorrofePyqYyHi7OxPFZerqk9Wv6N6IrjGuANNeEc6BkD2yDcEbnmPA/+sBCCj
	BzXkfuJDI4FmwirH9kxTYXQGsouY3CZXdyPDg=
Received: by 10.227.208.133 with SMTP id gc5mr252229wbb.25.1322875724486;
	Fri, 02 Dec 2011 17:28:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 28sm10299887wby.3.2011.12.02.17.28.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 17:28:43 -0800 (PST)
Date: Sat, 3 Dec 2011 02:28:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111203012831.GA3797@jama.jama.net>
References: <201112030111.04094.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201112030111.04094.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Parse error with empty builddir
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
X-List-Received-Date: Sat, 03 Dec 2011 01:35:29 -0000
X-Groupsio-MsgNum: 13596
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 03, 2011 at 01:11:03AM +0100, Andreas M=FCller wrote:
> Hi
>=20
> after pulling latest sources (angstrom environment) I get:
>=20
> Pseudo is not present but is required, building this first before the mai=
n build
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided icon=
v=20
> library is used                                                          =
                                             =20
> | ETA:  00:01:10
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided icon=
v=20
> library is used
> ERROR: Failure expanding variable PRINC[:=3D], expression was ${@int(PRIN=
C) + 1}=20
> which triggered exception NameError: name 'PRINC' is not defined         =
                                         =20
> | ETA:  00:00:44
> ERROR: Command execution failed: Exited with 1
> [Superandy@localhost oe-core]$ grep -r PRINC *
>=20
> It seems contstructs like ${@int(PRINC) + 1}  are common and found in sev=
eral=20
> recipes (outside of oe-core). I was out last week and still checking mail=
s: did=20
> I miss something?

Apply this:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/013779=
=2Ehtml

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Zez8ACgkQN1Ujt2V2gBySowCgr2/GANXDLwWisCIfywdX+GKI
EroAn068L52nyMwCeUIpyVJB9oZWwwjz
=T2a9
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
