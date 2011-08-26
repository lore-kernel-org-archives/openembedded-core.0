Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrP1-0001nJ-GQ
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:04:35 +0200
Received: by wwe32 with SMTP id 32so2547062wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 00:59:47 -0700 (PDT)
Received: by 10.216.10.211 with SMTP id 61mr669044wev.4.1314345587226;
	Fri, 26 Aug 2011 00:59:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id i51sm849802wed.19.2011.08.26.00.59.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 00:59:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314318504-9524-4-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 09:59:44 +0200
Message-Id: <065829D9-9AF8-4685-8ADF-D374D87C79FF@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-4-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 3/9] libmad: Imported from OE-classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:04:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:
>=20
> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb =
b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> new file mode 100644
> index 0000000..537d685
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "MPEG Audio Decoder Library"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"

That field isn't used anymore

> +DEPENDS =3D "libid3tag"
> +LICENSE =3D "GPL"

Which version?

> +PR =3D "r5"

reset that

> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
> +           file://add-pkgconfig.patch \
> +	   file://mad.diff \
> +	   file://mad-mips-h-constraint.patch"
> +
> +S =3D "${WORKDIR}/libmad-${PV}"
> +
> +SRC_URI_append_avr32 =3D " =
file://libmad-0.15.1b-avr32-optimization.patch"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "-enable-speed --enable-shared"
> +# The ASO's don't take any account of thumb...
> +EXTRA_OECONF_append_thumb =3D " --disable-aso --enable-fpm=3Ddefault"
> +EXTRA_OECONF_append_arm =3D " --enable-fpm=3Darm"
> +
> +do_configure_prepend () {
> +#	damn picky automake...
> +	touch NEWS AUTHORS ChangeLog
> +}
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +SRC_URI[md5sum] =3D "1be543bc30c56fb6bea1d7bf6a64e66c"
> +SRC_URI[sha256sum] =3D =
"bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



