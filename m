Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 211916F465
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 02:32:31 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so413031pad.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 19:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=xx/Bhh6o70MDDxOech27i8NoSV8/c7zYC2YiFDgu1gw=;
	b=X2Wxi0YJ3a7gf52WcwTZwDVq8jHkHidJTv9ydYecjwqKzDTIcVABJOrzonbbvhxgmr
	LNyOwJWeqW/zJqSVikDC3EaM+f13/WOjGi1LrPyIKeflaKD58TIHdCVHUUbrnN/OeMVl
	AXVAmGngomuKGJ1osE1gtG7cFvHsnk6YhT486I9+UiHhBQCV9wyPGtgSHOJ1yo1VLk5Y
	Un8hv1xIhAH+W7Nlj9mzKmEq8VgG/3Ys+yryAP8RjNNNmdeYDSalEVfsWVz/jYcH+7Fj
	hWx+a1XRz2laiZemy20lIP/jSrPFr18xrbhxGEBoqugDAhf+A2fMGcOKbm9xAfTFq01O
	tQMg==
X-Received: by 10.68.215.68 with SMTP id og4mr1151132pbc.112.1394677952554;
	Wed, 12 Mar 2014 19:32:32 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id my6sm1652486pbc.36.2014.03.12.19.32.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Mar 2014 19:32:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1394676641.git.hongxu.jia@windriver.com>
Date: Wed, 12 Mar 2014 19:32:28 -0700
Message-Id: <04B26531-AA3F-4E9E-8B0E-2B2EB7287AA4@gmail.com>
References: <cover.1394676641.git.hongxu.jia@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: msm@freescale.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 02:32:32 -0000
X-Groupsio-MsgNum: 51176
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DC3B494E-BD48-4050-B7A0-F11DC0A29E8C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DC3B494E-BD48-4050-B7A0-F11DC0A29E8C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Mar 12, 2014, at 7:14 PM, Hongxu Jia <hongxu.jia@windriver.com> =
wrote:

> The following changes since commit =
5f81d9d1fa537445d5da49e12de1e16300e94552:
>=20
>  bitbake: runqueue: Use SIGCHLD instead of polling waitpid (2014-03-10 =
11:10:02 -0700)
>=20
> are available in the git repository at:
>=20
>  git://git.pokylinux.org/poky-contrib hongxu/fix-eglibc
>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-eglibc

Does this patch do anything in addition to

commit 6235cc3ccf98dce15ffe3313cf4e6cdf9c922bce
Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Mar 10 15:51:37 2014 +0000

    eglibc: Fix build for FSL ppc/fpu
   =20
    The patch needs to adapt to upstream changes
    should fix errors on e500mc+ based SOCs
   =20
    This should fix [YOCTO #5871]
   =20
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>





>=20
> Hongxu Jia (1):
>  eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19
>=20
> .../eglibc/eglibc-2.19/glibc.fix_sqrt2.patch       | 24 =
+++++++++++-----------
> 1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> --=20
> 1.8.1.2
>=20


--Apple-Mail=_DC3B494E-BD48-4050-B7A0-F11DC0A29E8C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMhGLwACgkQuwUzVZGdMxTYVQCfXeGr2c9tDU1f+vWZR1CVhWp8
Vi8An3rqhOTtsEqTRk52z2JViSTZCt+9
=1zXq
-----END PGP SIGNATURE-----

--Apple-Mail=_DC3B494E-BD48-4050-B7A0-F11DC0A29E8C--
