Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THGTd-00013Q-RS
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:58:13 +0200
Received: by weyt44 with SMTP id t44so728780wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4wr7Nnw+1M1ALq6/5rbj6Hb9NPYyg5IhZ3MlY9djoF4=;
	b=qa3qkqv6DXi704XjLVzc/kxe02gJBjLG8+Zc8vdsFXwUnZza5UnAl2B1L8jW6wQBo8
	V4gukiP9oSH/fUJBPvuiDRsl5fHWj6QUrpA+gDprh63KrKuUX4YVW+KWR8Av4KljN5lJ
	ymC/mgjZ+IseaYAneT7PLBqVby+g679IrQPVHobrR1TKLk6s0d+9snl16EE9RyEZ/lBY
	UH5jcFA3wCVT7l4XYoBVPwbSlAM0TOtzDUyiGegypYpncVazKPr2AZv/wIXg65gTSjnQ
	Gs5SX8zzpBglcjjwNhj20UvyCQbiFSW+9dwNDBnrNS05Gx/6rZw5XMD4ZiDxsRwyTv9A
	LY7w==
Received: by 10.216.203.17 with SMTP id e17mr1712255weo.13.1348760721911;
	Thu, 27 Sep 2012 08:45:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm13783826wib.10.2012.09.27.08.45.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 08:45:21 -0700 (PDT)
Date: Thu, 27 Sep 2012 17:45:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120927154530.GE3454@jama.jama.net>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
	<2523654.gPkJCTUPfL@helios>
MIME-Version: 1.0
In-Reply-To: <2523654.gPkJCTUPfL@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] qt4: upgrade to 4.8.3 and cleanup
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
X-List-Received-Date: Thu, 27 Sep 2012 15:58:13 -0000
X-Groupsio-MsgNum: 30005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Content-Disposition: inline

--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 04:10:20PM +0100, Paul Eggleton wrote:
> On Thursday 27 September 2012 00:27:05 Martin Jansa wrote:
> > Please test on more architectures.
> > I've tested complete qt4-native + qt4-free-x11 on armv4t.
> > And only do_patch for nativesdk-qt4-tools, qt-mobility-*, qt4-embedded.
>=20
> So this is great work and these patches look good, although I'm still not=
=20
> particularly happy with breaking out so many of the configure options bec=
ause=20
> I'm convinced it won't stop here; but it's possible I might be overruled =
on=20
> this issue.=20

I've added that, because meta-webos layer disables more stuff then .inc
file forces enabled, so I would have to rewrite whole QT_CONFIG_FLAGS
(if I don't want to have e.g. -webkit from .inc and -no-webkit appended
after that through QT_DISTRO_FLAGS).

But it can be just 2 variables instead of 6 if it's issue.

> The bigger problem is when these patches are arriving - we're late into t=
he=20
> stabilisation period and given the choice I'd prefer not to merge them un=
til=20
> the next development cycle.

The cleanup part is formal only, so with low risk IMHO.

I have some layer with .bbappends to it which needs 4.8.3 (or 4.8.2) so rec=
ipe=20
even with negative D_P would help me to be able to use next oe-core release.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBkdJoACgkQN1Ujt2V2gByECACfV3YgLv04F36AGU71+zhd4aNQ
b6AAoKxVvPJbNeKnturMl2RNcNvqJLQt
=tybK
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
