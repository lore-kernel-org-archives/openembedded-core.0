Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R6i6I-0003YF-GW
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 14:09:58 +0200
Received: by bke11 with SMTP id 11so2791004bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=QtgA8K+TR6Q9ujuhAJj7BEfMewhA+aU2dSV4SLmm8tY=;
	b=aKYRkPowntMRr9Sz9mTyzXI3jzD6gE61YlljSCtdHtR0dxCAaxBsPxo/LEE7j5Hwao
	WFI5CsxV0/sCQO2gDPxWlIDdncRwYuS6IkoKDs8ypDyzyjCeTtS3wVpgojo2uE/y343S
	WYRlQpChiandCZsHnPZ0nXmrZQDx2jN/bApA0=
Received: by 10.204.139.21 with SMTP id c21mr1529140bku.47.1316693079054;
	Thu, 22 Sep 2011 05:04:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm8104239bkt.5.2011.09.22.05.04.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 05:04:37 -0700 (PDT)
Date: Thu, 22 Sep 2011 14:04:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110922120430.GE3477@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 11/17] eglibc: fix packaging of some of nativesdk	packages
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
X-List-Received-Date: Thu, 22 Sep 2011 12:09:58 -0000
X-Groupsio-MsgNum: 9834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Content-Disposition: inline

--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

after this patch PKGSUFFIX is probably evaluated too late and this:

# PREFERRED_PROVIDER_glibc-thread-db=3Deglibc-thread-db
PREFERRED_PROVIDER_glibc-thread-db=3D"eglibc-thread-db"
# RPROVIDES_eglibc-thread-db${PKGSUFFIX}=3Dglibc-thread-db${PKGSUFFIX}
RPROVIDES_eglibc-thread-db=3D"glibc-thread-db"

doesn't seem to work as expected and gdb pulls whole
external-csl-toolchain as glibc-thread-db provider for

RRECOMMENDS_gdb_append_linux-gnueabi =3D " glibc-thread-db "

and btw:
ERROR: external-poky-toolchain: Recipe file does not have license file info=
rmation (LIC_FILES_CHKSUM)
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix

and sign of this behavior is also qemu-native pulled to build and
warnings like this also for virtual/libc virtual/linux-libc-headers

ERROR: Multiple .bb files are due to be built which each provide virtual/li=
biconv
(/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.13.bb
 /OE/shr-core/openembedded-core/meta/recipes-core/meta/external-csl-toolcha=
in_2008q3-72.bb).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk57JE4ACgkQN1Ujt2V2gBwajQCfXCDCm2WjNLBSD3s/mM/LwAdX
xzAAn2KWcrnejxdkA3aKhYIDrBPIHekA
=cmFm
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
