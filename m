Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9bgL-00069L-BX
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:55:09 +0200
Received: by bke11 with SMTP id 11so1694069bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zsB2IZPoT3Z5l1YYzUGJgUthfdk2Qs+++MVKLPdGJXA=;
	b=iSP8Kj5viBg4VWMWxt0jqO0MNqN4H9FyWbUWmqrsBphXen0NNiXHlTpo8uVV4BmqEy
	N2YfdKzFN7u09Pv0TYHcPGpbmlvTBv60qOGvdhGP2x381pGu24TyFRRGRrraIHi2mXiN
	Z7EsnXKhb/MlKuql2nJlOt/Fn/6wuthhONCX4=
Received: by 10.204.152.26 with SMTP id e26mr7872116bkw.342.1317383380482;
	Fri, 30 Sep 2011 04:49:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm4700610bkt.4.2011.09.30.04.49.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 04:49:39 -0700 (PDT)
Date: Fri, 30 Sep 2011 13:49:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930114932.GD15856@jama.jama.net>
References: <1317382380.12332.171.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317382380.12332.171.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Slight change to merging procedure - master-next
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
X-List-Received-Date: Fri, 30 Sep 2011 11:55:09 -0000
X-Groupsio-MsgNum: 10282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline

--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:32:54PM +0100, Richard Purdie wrote:
> One of the issues I've been having is that I read through patches once
> doing review and then have to wait ~24 hours before merging any patches
> I think are acceptable in case others have comments. This means I have
> to go through emails twice and its a bit of a pain.
>=20
> I'm therefore going to start maintaining master-next with patches I
> think are ready. They'll sit there for 24 hours before being merged if
> there aren't other issues raised by anyone else.
>=20
> I could just do this in private but I'm choosing to make it public. I
> want to be clear that branch can rebase and change, its not definite
> until it hits master. I hope some people find it useful.

I do find it useful, thanks for that.

/me already rebasing remaining changes from xorg patchset on top of
master-next ;)

BTW: is there any plan to give some information when something is
dropped from master-next? Like: "dropping this from master-next, because
of feedback from Joe, please send updated patch"

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6FrMwACgkQN1Ujt2V2gBycqwCfZ+lK0IVvmmD3K1H4xeCoEXwj
4IAAoLDxZiTmkikaVvetozGXnbZQc0n8
=nNM5
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
