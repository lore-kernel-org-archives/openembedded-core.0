Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Sx3rI-0000BA-RB; Fri, 03 Aug 2012 00:27:08 +0200
Received: by weyr6 with SMTP id r6so23305wey.6
	for <multiple recipients>; Thu, 02 Aug 2012 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wHl4ocCXgOXt8tr0p8P7L++IW6u2gj4nstoBjFUlcao=;
	b=kcdUk+x6ROCtoL/C4DMwpazWEvMHaIyL0mRsm7OxwJkB2Euwitrj6KEdMsrJlOJz1j
	+sLQ17Nt5BiofoaHoZNvUP3RxbuJUfG2cQYucolYTjJKbBDCmmnGVvxm2u3z+RrDVEgM
	6QTYAsTkULKnEwHiCX4lH2CHNzAp7m5t5EDz3TT5+RNgLFIlzXqsVlLmbRknmBL7fFOy
	kD9Lg62LmJ9uJQZ/ZzbAkeBNEvdMWTeYsSWNstlHejewe1GBHLVMjkSL9nZBDw3ffpTg
	oHH4TE9A0hxL2+mTGj8Y+4wYjOh2JBF/E5pn6zkfsafEw2eXVG1pl8wSMpuKnhqDfPmL
	5KoQ==
Received: by 10.217.2.133 with SMTP id p5mr11561663wes.143.1343945728699;
	Thu, 02 Aug 2012 15:15:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm36011230wib.5.2012.08.02.15.15.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 15:15:27 -0700 (PDT)
Date: Fri, 3 Aug 2012 00:15:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120802221526.GC16306@jama.jama.net>
References: <20120731070518.61E5C10217@opal>
MIME-Version: 1.0
In-Reply-To: <20120731070518.61E5C10217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Eggleton : qt4: allow recipes building commercial edition
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
X-List-Received-Date: Thu, 02 Aug 2012 22:27:08 -0000
X-Groupsio-MsgNum: 26847
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEpdcbHbO3kvNF3k"
Content-Disposition: inline

--PEpdcbHbO3kvNF3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 07:05:17AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 2be0058fc4acddab611637656183accd052b40eb
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2be0058fc4acddab611637656183accd052b40eb
>=20
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Tue Jul 31 00:31:00 2012 +0100
>=20
> qt4: allow recipes building commercial edition
>=20
> To enable building the commercial edition of Qt (through additional
> recipes that are *not* provided by OE-Core) we need to tweak a few
> things:
>=20
> * Don't make recipes that inherit qt4x11.bbclass depend on qt4-x11-free
>   - instead add qt4-x11 to DEPENDS and then have qt4-x11-free include
>   this in its PROVIDES. A commercial equivalent recipe should do the
>   same.
> * Add a QT_LICENSE_FILE variable that can be used to specify the license
>   file required by the commercial edition.
> * Add a QT_LICENSE_FLAGS variable which the recipe can set to select the
>   license option being used. The default of "-opensource" retains the
>   current behaviour; a commercial recipe should set it to "-commercial".
>=20
> Fixes [YOCTO #2505].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

After this patch I see, libdummy.prl created again
OE @ ~/projects/shr-chroot $ ll include/WebCore/libdummy.prl
-rw-r--r-- 1 bitbake bitbake 651 Aug  2 19:23 include/WebCore/libdummy.prl

originally fixed by:
http://git.openembedded.org/openembedded-core/commit/?id=3D7d3fd68480d54a8e=
f0d91a772df3506cd45ef2c2

Do you have any idea why it's broken again? If you still have log.do_config=
ure logs, can you check for
WARNING: DESTDIR: Cannot access directory '/include/WebCore'
?

Cheers,

--PEpdcbHbO3kvNF3k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAa+/4ACgkQN1Ujt2V2gByLvgCeOn+QVLKe4FGJvpqRaIhjWcW/
eDwAnjAOmq3JUEirp+zxLZc0Zcg+VXpi
=5Fuj
-----END PGP SIGNATURE-----

--PEpdcbHbO3kvNF3k--
