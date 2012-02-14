Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxCOB-0006TR-Ck
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 08:01:23 +0100
Received: by eaal10 with SMTP id l10so1710921eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 22:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EaXS+pQJWwnI//TzuyMp1S5hL9Pp/+CgbCBfHpEmjck=;
	b=IaofqxORxWbisojK87lNUgy38Jd/NRgSHd5eLWU73nmgVMA3mGI4RJ5cw0pHGn7mdY
	E+kgUdX6uNge3W7M+GbExmNvrIF3+XuhIufCA8OrfkI+evqOjFZxLeoCZPA25imKbsZ4
	POQx3VaVAheX8g0xkMVBSTZ3kipz/CIIHZHrc=
Received: by 10.14.17.26 with SMTP id i26mr6311814eei.115.1329202393036;
	Mon, 13 Feb 2012 22:53:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm70024648eei.0.2012.02.13.22.53.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 22:53:11 -0800 (PST)
Date: Tue, 14 Feb 2012 07:53:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120214065309.GA29437@jama.jama.net>
References: <4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 14 Feb 2012 07:01:23 -0000
X-Groupsio-MsgNum: 17481
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2012 at 04:52:30AM +0000, Lu, Lianhao wrote:
> >>>>=20
> >>>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, =
fontconfig, gtk+, etc
> >>>=20
>=20
> I tried rpm-native after "-c cleansstate", but it still asks for libz.la?=
 Anyone has the clue?

one .la still with libz.la in dependency tree is enough to pollute all
=2Ela files even when they get rebuild thanks to PR bump.

That's why I sent another wider round of PR bumps to oe-core and also to
all layers (oe-core, meta-openembedded/*, meta-smartphone/*) I'm using at o=
nce,=20
because ie libsoup-2.4 from meta-efl wasn't PR bumped and was still pulling=
=20
libz.la to all .la files depending on libsoup :/.

And even my wider PR bump round isn't 100% complete for everybody,
because it's based on sysroot popultated by my builds and you can have
different .la files there (from different recipe versions or different
layers).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk86BNUACgkQN1Ujt2V2gBzJXgCfeYDugvhp7TVkMePeclB+6+SF
Wv0An18atvsuxyJKQ/2uN/jraG5Pkz/3
=zXuI
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
