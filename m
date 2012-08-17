Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T2LsZ-0004Vs-5o
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:42:19 +0200
Received: by wibhn17 with SMTP id hn17so1424869wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IrSo04tlwtztymiac9kb5/9+AZUSpJUUJF8rwYGliQU=;
	b=nB8JimIf8OQxsUC0RURX/+WtX3mdMRtMSr//qadzpngRSNVacle4gvgsxQa6rXdNMd
	D+Ye/OTtQuHtfNXeh3Rj4U1ToqxiklEPgdRkBRHzirBeSc2Vs34N1RgIJqlNKmtFUvws
	Dyu3yMQGopJYkfR7xiHEPUnyuQFzqRfv90IwAlt/Pa9DaNTtBzqY8SIgKPMcQVudGsW4
	SCy5B4Zs6RoGxbYaSdf9amAM624kmoaZrpz9JOboInEvF4/0teHUzZA3/5xtw8/gne0f
	Y1MMTnHL4zq3Rfn/DTtR5B27BNtqam49XSFUJpeYmuE6V6IO3YClT2/Ql39NuHsnRUJF
	TKzw==
Received: by 10.216.15.73 with SMTP id e51mr2610568wee.37.1345206620660;
	Fri, 17 Aug 2012 05:30:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm14239862wib.3.2012.08.17.05.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 05:30:19 -0700 (PDT)
Date: Fri, 17 Aug 2012 14:30:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120817123017.GI3625@jama.jama.net>
References: <cover.1345203203.git.ross.burton@intel.com>
	<4141908.n3IAyUAFPz@helios>
MIME-Version: 1.0
In-Reply-To: <4141908.n3IAyUAFPz@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/2] Remove older GTK+ versions
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
X-List-Received-Date: Fri, 17 Aug 2012 12:42:19 -0000
X-Groupsio-MsgNum: 27709
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oxV4ZoPwBLqAyY+a"
Content-Disposition: inline

--oxV4ZoPwBLqAyY+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 01:27:20PM +0100, Paul Eggleton wrote:
> On Friday 17 August 2012 12:35:07 Ross Burton wrote:
> > If someone still wants to use them, meta-oe is a better place for them =
to
> > live.
>=20
> As a general note, personally I'd rather that no more alternative version=
s of=20
> anything be added to meta-oe.

Yes especially with DEFAULT_PREFERRENCE not working between layers.. so
everyone with meta-oe and without P_V set, would get this old version..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oxV4ZoPwBLqAyY+a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAuOVkACgkQN1Ujt2V2gBx37ACfRkEfePWPYG8DBbwPwl/rJoQX
1fAAnjTMLFgMgB5/iU0sCdHOZyiuP5WS
=lDU8
-----END PGP SIGNATURE-----

--oxV4ZoPwBLqAyY+a--
