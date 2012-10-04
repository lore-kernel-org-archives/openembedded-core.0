Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJkiu-0006JF-R9
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 14:40:16 +0200
Received: by mail-wg0-f41.google.com with SMTP id ds1so1863038wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0q4AcdvfoFKCUanXyaFjsKo/7IpZMnTQn4Z0zyqbeAk=;
	b=WwuVnIqwxM9ZAArllZtbczAc3x2ljqj2EdamyxtQ2PgP3Og6bqVexg1VihzJwhF7hv
	WyTVSI6W8RT5btdy4zq9pn+gcal69IJlv4hcWLG9UeUKHpt3ua2mMzwP2dvKjVMTuhZ5
	zLmiAIb8ddlg144ArxKYXn1aWTWzb/DncEctHOyqiXqi+5NQY35iOxCryEZ0XDw2oL3h
	JQiC5lqugzHcfsV615LtQDCsezKKPylewtqGXBkSkfyUsOPrpSQl8ZpRrHFuw0YrznlY
	08jGj3njxTxl/BzpJeH+6kbU1H5pU2Pgui8xF5xLrRSsJw3G4b+RzYumYdFBTz61TZyQ
	vvnA==
Received: by 10.216.216.220 with SMTP id g70mr3036926wep.83.1349353635944;
	Thu, 04 Oct 2012 05:27:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f1sm14610533wiy.2.2012.10.04.05.27.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 05:27:13 -0700 (PDT)
Date: Thu, 4 Oct 2012 14:27:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20121004122716.GE3005@jama.jama.net>
References: <1349352468.32611.164.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1349352468.32611.164.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Only one copy of bitbake should be run against a build directory
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
X-List-Received-Date: Thu, 04 Oct 2012 12:40:16 -0000
X-Groupsio-MsgNum: 30365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline

--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 04, 2012 at 01:07:46PM +0100, Phil Blundell wrote:
> Since updating my copy of bitbake to one which does this extra locking,
> I've come to realise that the constraint of having only one copy of
> bitbake running is a bit of a nuisance when making use of devshells.  I
> used to quite often have one or two long-running devshells for packages
> that I was actively working on, and then in parallel with that would use
> bitbake to recompile other things.  With the new locking mechanism, as
> soon as I have a single devshell open I am now prohibited from using
> bitbake for anything else in that same build directory.
>=20
> Would it be reasonable to exempt devshells from that locking or is there
> some compelling reason why they need to be serialised?

The same does apply to bitbake-diffsigs now after IIRC this patch
http://git.openembedded.org/bitbake/commit/?id=3Dcc70181659c07e04c205e17832=
846acf1ff31d28
before that I could use bitbake-diffsigs from any directory (not only
TOPDIR) and also when build in the same directory was still running.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBtgKQACgkQN1Ujt2V2gBx3oACfege3UEQ/0cuL5LqLutGN3Nfo
0u4An03L0BwyxnYRBaNjlcxdYKFom2aj
=GhBn
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
