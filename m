Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpSpN-0004j6-1N
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 23:57:29 +0100
Received: by eekd41 with SMTP id d41so1166140eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 14:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iFbesN1/VIYA0xz/V8aWzWOAjyO++BTa8EaedEaCFfU=;
	b=LrKp4DTx1n7b2uAOD9KgkkzHrjmkNdPw4S/BqpnwQm3rCzh9csT8tZMe2SpLTeZPrT
	Mhb3mkyDiaLzeARJjGxvMnGPuKijUUQhlKTFRO/N4UiXa0l8/TZL8pIJ8XjEUhpwrH/R
	cetAfnfH5N2Yq3Ud8owyPsoYQ6FYFT39PTnZI=
Received: by 10.14.135.140 with SMTP id u12mr3553943eei.73.1327358984056;
	Mon, 23 Jan 2012 14:49:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm59596371eef.8.2012.01.23.14.49.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 14:49:42 -0800 (PST)
Date: Mon, 23 Jan 2012 23:49:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120123224937.GA3634@jama.jama.net>
References: <4F1DDB53.2030502@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4F1DDB53.2030502@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bitbake.lock?
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
X-List-Received-Date: Mon, 23 Jan 2012 22:57:29 -0000
X-Groupsio-MsgNum: 16481
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2012 at 03:12:35PM -0700, Gary Thomas wrote:
> I've noticed that recent versions of bitbake leave this file
> in the build directory.
>=20
> What is it for & why is it left around?

see
http://git.openembedded.org/bitbake/commit/?id=3D6004cbf36c980c2574c1c9153d=
f81a7c55317e17

and
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1464

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8d5AEACgkQN1Ujt2V2gByabACgrqo+lZ4f9C9BgPbpWmir6XP0
j94AoJVZ3smzjewTM795+c2r8KeQnZVH
=Ve4A
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
