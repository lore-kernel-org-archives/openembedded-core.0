Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAsC-00045j-3y
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:54:40 +0200
Received: by bkat8 with SMTP id t8so4847509bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5mVxxQ4hufeStYCpAw/4fzgvZzlb2NV+gCm+tJO0SEY=;
	b=u23+uOMnSJ1QUt5uj4Ol8ogq+LaAkGUXKCjfrlb3JkjmrVAcJA/ijGXZVlAF56ben9
	5dnMzopqEYOudpfwf1EDWmo7Luc6gsnNLQvfqLlC8cZryDMSucUzoJv7hsL8uVbE3Zet
	6vUp4+shN3aY91Omoyyn3dAGFFj+d10u7jLg0=
Received: by 10.204.156.150 with SMTP id x22mr10230733bkw.86.1319186926560;
	Fri, 21 Oct 2011 01:48:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm12615897bkn.6.2011.10.21.01.48.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:48:45 -0700 (PDT)
Date: Fri, 21 Oct 2011 10:48:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111021084840.GP3522@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
	<20111021084346.GA20103@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20111021084346.GA20103@mi.fu-berlin.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/8] libatomics-ops: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 08:54:40 -0000
X-Groupsio-MsgNum: 11421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pleSNuEbvnUYtMxG"
Content-Disposition: inline

--pleSNuEbvnUYtMxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 10:43:46AM +0200, Henning Heinold wrote:
> Hi,
>=20
> hm we should think of reworking this recipe now. Because since gcc 4.5
> pulseaudio for arm can use the gcc internal atomicstuff and in oe-core=20
> and meta-oe we have 4.5 or 4.6 only. The lib is
> only needed for mips and it is still the old release, on cvs
> is a much better version, which supports thumb too, if
> remember correctly.

Agreed, I've added this only because pulseaudio is now needed for
gst-plugins and I wasn't able to build any armv[45]t images.

But because I don't know much about pulseaudio or libatomics-ops I was
hoping that someone who maintains them will fix it properly and this
work around will be needed only temporary.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pleSNuEbvnUYtMxG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6hMegACgkQN1Ujt2V2gByVeQCglhAELopkNlRbKK4rPhDUk1vE
Vz4AnjminCtz7mqUrhte8DyaXye/mRH7
=fA1S
-----END PGP SIGNATURE-----

--pleSNuEbvnUYtMxG--
