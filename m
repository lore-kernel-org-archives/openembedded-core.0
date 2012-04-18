Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKTc4-0000SO-D0
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 14:03:56 +0200
Received: by wera1 with SMTP id a1so4702880wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2pC4WaDOmR7TL7Tmth9T5RkQaSe0OwK98ThDzMdrCMQ=;
	b=cnOWBmho5WDZrI35Ng/iG8x6ZxGKxphAl2eXz4AFFIodUaPRVhoZEpLapkKyZ39A1k
	ESKS9Ac7vy+hkASr0yN9QFRyHdPzCECUXCRlwM3c1o8YwYjMfZXZY0ZeUpJlGEZ4+EXq
	L32yNznRgae5ejiW8Hnf4RdJiiqLPTDXUxAxOfRcHhsvo3z7GTd02KrZSvhIS1Zh+UDi
	bY/y2ojkC3wLfgLb1rXFxQ3Mqi8/ylMV1Ss4Z0NqeNSxuqjE/plj2B/EFG/bfI6s8edX
	eAd4puClYKYpgzLg3jCHeh4ocYFazNXY2wzUlqRpTjthCKAFCEoEdjQt8ZrG09OUZhd5
	fXAw==
Received: by 10.180.103.35 with SMTP id ft3mr5632652wib.0.1334750069138;
	Wed, 18 Apr 2012 04:54:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm34072328wix.8.2012.04.18.04.54.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 04:54:28 -0700 (PDT)
Date: Wed, 18 Apr 2012 13:54:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120418115428.GJ3635@jama.jama.net>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org>
	<4F8C24CB.3080607@opendreambox.org> <1334587325.616.4.camel@ted>
	<4F8C379A.3070903@opendreambox.org> <4F8C3B19.40400@windriver.com>
	<4F8EA5CC.6010101@opendreambox.org> <1334749226.24091.67.camel@ted>
	<4F8EA972.1090304@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F8EA972.1090304@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 12:03:56 -0000
X-Groupsio-MsgNum: 20947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Content-Disposition: inline

--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 01:45:54PM +0200, Andreas Oberritter wrote:
> On 18.04.2012 13:40, Richard Purdie wrote:
> > On Wed, 2012-04-18 at 13:30 +0200, Andreas Oberritter wrote:
> >> now, after having repacked all binary tarballs that had mipsel or
> >> mipsel-nf in their name and contents, and after having changed all
> >> occurrences of mipsel and mipsel-nf in my local recipes (where
> >> appropriate), and after having rebuilt everything from scratch again, =
it
> >> came to my attention that "mipsel" in PACKAGE_EXTRA_ARCHS breaks opkg,
> >> because no mipsel packages are being generated. That's what I told
> >> before, right?
> >=20
> > How is this breaking opkg? We often have architectures listed in there
> > for which there are no packages generated (all, noarch and any spring to
> > mind)?
>=20
> Downloading http://10.0.0.1/mipsel/Packages.gz.
> wget: server returned error: HTTP/1.1 404 Not Found
> Collected errors:
>  * opkg_download: Failed to download http://10.0.0.1/mipsel/Packages.gz, =
wget returned 1.

I had a lot of those (e.g. because armv7a-vfp-neon was including 20
arm*feed.conf variants in /etc/opkg most of them empty - without
Packages.gz).

So I've added "filter" to distro-feed-configs
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D236a=
a553bb0f82f741c6edb793e96f421f24f4fa
to add only feeds I'm generating (and I also don't want armv5* packages
installed on armv7a-vfp-neon target unless user explicitly adds armv5*
feed).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+Oq3QACgkQN1Ujt2V2gBx8iQCaAqzo2Z1M/twgMCbE8r48qJXW
DGsAnRsSuMl/yD0/04rE7Izl88ruH4Af
=7mfP
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
