Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SmPKb-0001mn-0X; Wed, 04 Jul 2012 15:09:21 +0200
Received: by wibhm11 with SMTP id hm11so4743209wib.6
	for <multiple recipients>; Wed, 04 Jul 2012 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o9qz0Pfu3RKe64Ig+KbfSIPPBzgESq2sazz5hELG308=;
	b=pleQ2WGX4Iz0Rj62gUnk8ELHUKfpMd7SXjhSIqRYPcupwB9fwU/5f8qck7H3MOsNi2
	vfJcwKSw2Ono5DjDF7qPYNwBO7Du9awZqFjHqAhV2Mftbn8XprAbELdEgbugCFdGRX27
	CoAgI9AqiWN+RRNQvzuqRKpdYBXdM/N273yTx4KTUgju2PcOo6f8jQ34amou1hHMPTXf
	EnsVxrF3QdbgYYMvIdE1LbfJ99cHYE/XAeDKK0kiWHKs25D4DBxC72nLCBUGKOxKzJBN
	cr6v9mlFc9Lt1tL88pwS79BFRuF/Cb2pkScRxm0UJg22sYBuzy/6kHDhPMZFoX2k9qUR
	VXSQ==
Received: by 10.180.14.34 with SMTP id m2mr33558975wic.22.1341406697904;
	Wed, 04 Jul 2012 05:58:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d10sm66343440wiy.3.2012.07.04.05.58.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 05:58:16 -0700 (PDT)
Date: Wed, 4 Jul 2012 14:58:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120704125810.GA15100@jama.jama.net>
References: <CAMKF1spU53TcfLHif3CUzrHKqJTT1uBqBqsZAn-zfaBOBecMtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spU53TcfLHif3CUzrHKqJTT1uBqBqsZAn-zfaBOBecMtw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: eglibc 2.16
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
X-List-Received-Date: Wed, 04 Jul 2012 13:09:21 -0000
X-Groupsio-MsgNum: 24654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2012 at 12:14:29AM -0700, Khem Raj wrote:
> Hi All,
>=20
> I have pushed a contrib branch with eglibc 2.16 here
>=20
> http://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
>=20
> and I would like some hands in testing it out. I have so far tested
> core-image-minimal and core-image-sato on all architectures
> they build and boot fine. There are changes in eglibc which may need
> tweaking some apps especially if its using gnulib. So give it shot and
> let me know if you find issues
>=20
> All you need is pull this branch into your sandbox and then set
>=20
> EGLIBCVERSION =3D "2.16" in your local.conf if using angstrom then add
> ANGSTROM_EGLIBC_VERSION =3D "2.16" to local.conf

Buildtest still runnig (NOTE: Running task 1525 of 17969) sofar only
bison failed (missing gets).

And I belive that grub would need something like this too:
https://bugs.gentoo.org/show_bug.cgi?id=3D424703

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/0PeIACgkQN1Ujt2V2gBwAUQCcC/rcyxyw8MVm09jlwUy1eCgK
AYMAoKVujCTYjMalo7e+0/1lTIO67CKY
=evRu
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
