Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFrkf-0002dQ-6N
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 20:49:45 +0200
Received: by wibhj13 with SMTP id hj13so1654956wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mNKFTvQZfxhSXQ0gPPkWBXoCjTZ8L6TdZVMSIWMWltA=;
	b=QuMxABA01Cxh3K6q5bjrs8O9NCVrIouuASDVJfJjfXS9Kl3il70tXR4yWX/46Nmkhh
	Hb4VmDV+Rot73OcmY/u1YF8t4BdkLSjROy1QFmP1wPhI3v8mcIhYHGAs7ShjVuVRR3Md
	JNiI4Zm/C6J7BOdzIe396oCP/3GxkK1xwK/DNKeP8xw6/+0eTqNXxsxkH0MmqN7eGJ2D
	lwSoZlfOv1plyGb+pPckM8EolEkHIxm0OiAel5M0mh37xjAACm7WfSSu/k1WfhujsseY
	7y8i498zy3q2AOVyr/VKWvAm3qdjICl8gN9R5dMwC6rFxS5ON7tEJpFLo4aOO4LXkSkh
	l3Sw==
Received: by 10.216.135.199 with SMTP id u49mr2415625wei.7.1333651233389;
	Thu, 05 Apr 2012 11:40:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm20300465wiw.5.2012.04.05.11.40.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 11:40:32 -0700 (PDT)
Date: Thu, 5 Apr 2012 20:40:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120405184033.GR4181@jama.jama.net>
References: <cover.1333642153.git.dexuan.cui@intel.com>
	<db6ed82ab474a1b521b8f9bcb14abee243ac63a9.1333642153.git.dexuan.cui@intel.com>
	<1567550.pQkNRWCquK@helios>
MIME-Version: 1.0
In-Reply-To: <1567550.pQkNRWCquK@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/3] xterm: port the recipe from OE and upgrade to v278
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
X-List-Received-Date: Thu, 05 Apr 2012 18:49:45 -0000
X-Groupsio-MsgNum: 20328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="im83/wVv0jiGQj4J"
Content-Disposition: inline

--im83/wVv0jiGQj4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 05, 2012 at 05:19:22PM +0100, Paul Eggleton wrote:
> On Friday 06 April 2012 00:10:12 Dexuan Cui wrote:
> > The recipe is ported from OE:
> > http://git.openembedded.org/openembedded/tree/recipes/xorg-app/xterm_26=
6.bb
> >=20
> > I upgraded it from v266 to v278.
> > I added LICENSE, LIC_FILES_CHKSUM and updated SRC_URI checksums.
>=20
> I think it's unfortunate we have to pull in xterm just for the sake of sh=
owing=20
> the qemu output - can we not use matchbox-terminal for this?
>=20
> If we have to have it, Dexuan can you please compare this to the meta-oe =
xterm=20
> recipe as that is likely to be more up-to-date than the one in OE-Classic?

yes it is..
meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_277.bb

and already with LICENSE from xorg-app-common.inc and LIC_FILES_CHKSUM
using xterm.h instead of package/debian/copyright

Cheers,

>=20
> Thanks,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--im83/wVv0jiGQj4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk995yEACgkQN1Ujt2V2gBw5owCfVZjGN+Kz8iPseH8hvWQRtbOy
kSEAnA2vQBjMBu4xfPMYc1cEk7er5TAH
=Nl+G
-----END PGP SIGNATURE-----

--im83/wVv0jiGQj4J--
