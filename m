Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SKAe6-0002KK-QC; Tue, 17 Apr 2012 17:48:46 +0200
Received: by wgbdr12 with SMTP id dr12so5435102wgb.24
	for <multiple recipients>; Tue, 17 Apr 2012 08:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/ryjIMN9i5C/64yOIlYjm8rRXaY5KvqboFN08gvXiAU=;
	b=EPuJBzAdyP3fITzhDCmIwHKZB/2tVjttLWwuFroVSNaktLezCj8FdJ37bNMB4j2NNV
	yHWLklHmyiBS0UVJD5xzhnIU1lwSvQIZlFa6mqwiMgoMZG5y66JxosBQofGf3Dr0kN4I
	tNQ/exlNKMg9nS3vJtNygKcjIeh5WLspm4qUfphr1RYl8KJcEzv21Fkodrzcazxwld4j
	daf3mdJEat2j4Rl5VEd4gG9ciw05FP7rfOPM8hK68UzIeisHtL0iRimThskUiurw/kx4
	tAGl7oVvfN8/FOgYeR4cPNEfSGV/nBt5Jz05TnZIp3vf1s5hipiGf6ozpayIgJWY+BHt
	tySw==
Received: by 10.216.132.6 with SMTP id n6mr10071381wei.26.1334677160686;
	Tue, 17 Apr 2012 08:39:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm27643084wiy.7.2012.04.17.08.39.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 08:39:19 -0700 (PDT)
Date: Tue, 17 Apr 2012 17:39:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120417153919.GG3665@jama.jama.net>
References: <4F8D8AB7.7000002@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F8D8AB7.7000002@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
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
X-List-Received-Date: Tue, 17 Apr 2012 15:48:47 -0000
X-Groupsio-MsgNum: 20891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2012 at 05:22:31PM +0200, Andreas Oberritter wrote:
> Hi,
>=20
> the following warnings keep appearing on every fresh invocation of
> bitbake since a few months, I think:
>=20
> WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is recomme=
nded to set SYSTEMD_PACKAGES as <existing-package>-systemd
> WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: it is r=
ecommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> WARNING: .../meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it is rec=
ommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

yes they are there since systemd.bbclass rework, see
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/03801=
1.html
=20
> Is anybody working on fixing them? Is anybody else also seeing them,
> or is this likely caused by some missing variable in my distro conf?

Not sure if someone is working on fixing them, but all is needed is to
add ${PN}-systemd subpackage and add it to tasks which expects to get
those apps with systemd support included.

> I am not using systemd.

It's pity that those are "parsing warnings" not QA warnings when
packaging it - so that only people building them would see them, maybe=20
Andreas M=FCller will reply why it's checked while parsing.

I'm using systemd but not cloud9|gateone|lighttpd.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+NjqcACgkQN1Ujt2V2gBwGFACfYgw8ffcjrT6g3kw3nhqEemov
lywAoLQJuvGoSn0Ym0wou4KL15MOAxzy
=2wXp
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
