Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW9sb-0005ou-KD
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:53:03 +0100
Received: by eaad13 with SMTP id d13so2428701eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 08:46:15 -0800 (PST)
Received: by 10.213.3.73 with SMTP id 9mr635181ebm.133.1322757975019;
	Thu, 01 Dec 2011 08:46:15 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 58sm14483257eet.11.2011.12.01.08.46.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 08:46:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 17:46:12 +0100
In-Reply-To: <4ED7AD99.3060302@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED7AD99.3060302@gmail.com>
Message-Id: <116BB784-D819-4E20-AA54-999AFD65D943@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] lzop-1.03: add recipe
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
X-List-Received-Date: Thu, 01 Dec 2011 16:53:03 -0000
X-Groupsio-MsgNum: 13463
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D254B97E-A2C2-4CB4-BE40-50C2ABB25A03";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D254B97E-A2C2-4CB4-BE40-50C2ABB25A03
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 17:38 heeft Christopher Larson het volgende =
geschreven:

> This is needed by some kernels when CONFIG_KERNEL_LZO=3Dy =
(specifically, given
> the current defconfig, this affects linux-omap4 2.6 in the meta-ti =
layer).
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> meta/recipes-support/lzop/lzop/acinclude.m4 |  390 =
+++++++++++++++++++++++++++
> meta/recipes-support/lzop/lzop_1.03.bb      |   25 ++
> 2 files changed, 415 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
> create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
>=20
> diff --git a/meta/recipes-support/lzop/lzop_1.03.bb =
b/meta/recipes-support/lzop/lzop_1.03.bb
> new file mode 100644
> index 0000000..02a5590
> --- /dev/null
> +++ b/meta/recipes-support/lzop/lzop_1.03.bb
> @@ -0,0 +1,25 @@
> +inherit autotools

That should go below SUMMARY/DESCRIPTION/DEPENDS

> +SUMMARY =3D "Real-time file compressor"
> +DESCRIPTION =3D "lzop is a compression utility which is designed to =
be a companion to gzip. \n\
> +It is based on the LZO data compression library and its main =
advantages over \n\
> +gzip are much higher compression and decompression speed at the cost =
of some \n\
> +compression ratio. The lzop compression utility was designed with the =
goals \n\
> +of reliability, speed, portability and with reasonable drop-in =
compatibility \n\
> +to gzip."
> +DEPENDS +=3D "lzo"

I see the DEPENDS +=3D pattern a lot, what are we prepending to? =
Especially with the inherit going below this assignemnt.


> +PR =3D "r0"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ddfeaf3dc4beef4f5a7bdbc35b197f39e \
> + =
file://src/lzop.c;beginline=3D5;endline=3D21;md5=3D6797bd3ed0a1a49327b7ebf=
9366ebd86"
> +
> +SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
> +           file://acinclude.m4"
> +
> +do_configure () {
> +    ln -sf ../acinclude.m4
> +    autotools_do_configure
> +}
> +
> +BBCLASSEXTEND +=3D "native"

nativesdk as well I guess.

regards,

Koen=

--Apple-Mail=_D254B97E-A2C2-4CB4-BE40-50C2ABB25A03
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Xr1QACgkQMkyGM64RGpE0rQCePCS/aQ7ksRT10g5opF8u58po
YnQAniDgzQAGCPp+bclNzO75C83S+q4Z
=l2sE
-----END PGP SIGNATURE-----

--Apple-Mail=_D254B97E-A2C2-4CB4-BE40-50C2ABB25A03--
