Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rdnth-0008WL-Ih
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 20:01:45 +0100
Received: by eeit10 with SMTP id t10so4491789eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 10:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U1YMcm/7bDFUJ17UpTRWWwjCOGLZzQ70Xx+nyLJ/8sc=;
	b=pUvH0pQpR5uHw6IoQIwaSXovSeXkTN9IJfr+50lQP7iETqTpqTlf/DAONG6sNm2oTP
	ymmXYtTYhlLANZEnaDbjtOGZGZViqy4Ei1dMUNNN5UKopI3RC0dMWGUievRLe3unkhzi
	q1MJhv3nsbIVlFdilLRWCS44Mw1U02ODcwCog=
Received: by 10.14.127.68 with SMTP id c44mr4844155eei.47.1324580078943;
	Thu, 22 Dec 2011 10:54:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm6430252eec.9.2011.12.22.10.54.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 10:54:38 -0800 (PST)
Date: Thu, 22 Dec 2011 19:54:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111222185426.GL12791@jama.jama.net>
References: <2359656.ub2hYRIHg6@helios>
MIME-Version: 1.0
In-Reply-To: <2359656.ub2hYRIHg6@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Internal compiler error
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
X-List-Received-Date: Thu, 22 Dec 2011 19:01:45 -0000
X-Groupsio-MsgNum: 14710
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NZiXfHLGvOGtDZMn"
Content-Disposition: inline

--NZiXfHLGvOGtDZMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 06:33:05PM +0000, Paul Eggleton wrote:
> Hi Nitin/Khem/all,
>=20
> We saw a failure on the Yocto Project autobuilder recently which appears =
to be=20
> the result of an internal compiler error [1] (note this is with the ediso=
n=20
> branch of Yocto, so it's somewhat older than what we have in master). Som=
e=20
> searching brought up a Linaro gcc bug that looks remarkably similar [2].
>=20
> Do you guys know anything about this? Do we need to bring in the fix from=
 the=20
> bug report above?

I've seen few ICEs with libav, libvpx and mplayer2 in meta-oe, disabling
tree-vectorize worked as work around
http://git.openembedded.org/meta-openembedded/commit/?id=3D11fbc9fb4efaa59a=
ca85ba352f6ebc3412eaedd0
http://git.openembedded.org/meta-openembedded/commit/?id=3Dc59fda28b29afcdc=
b245651cabbe08a76856d8ca

But I'm using more gcc-4.6 patches from meta-oe.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NZiXfHLGvOGtDZMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7zfOIACgkQN1Ujt2V2gBzKBwCdG2sAeFiZeD+R9E7KP9jBIJGo
HAIAoJyIVSUMR+qAhElklAzNBNc4k/DY
=bqNO
-----END PGP SIGNATURE-----

--NZiXfHLGvOGtDZMn--
