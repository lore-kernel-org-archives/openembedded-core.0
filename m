Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgX5O-0008Ac-Bu
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:08:50 +0200
Received: by wyg30 with SMTP id 30so3511267wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:04:53 -0700 (PDT)
Received: by 10.216.202.9 with SMTP id c9mr3873522weo.14.1310453878281;
	Mon, 11 Jul 2011 23:57:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g48sm4608474wee.37.2011.07.11.23.57.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 23:57:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 08:57:55 +0200
Message-Id: <0EEBB56F-FFD0-48AD-A04E-E1FE5080E594@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 03/26] shared_lib.bbclass: create common class
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
X-List-Received-Date: Tue, 12 Jul 2011 07:08:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> This class is for packages that do not work with debian library naming

If you put a single library in a package it *will* do shlib renaming.=20

>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/shared_lib.bbclass |    9 +++++++++

Can we name is sharedlib.bbclass or better shlibpackaging.bbclass?

> 1 files changed, 9 insertions(+), 0 deletions(-)
> create mode 100644 meta/classes/shared_lib.bbclass
>=20
> diff --git a/meta/classes/shared_lib.bbclass =
b/meta/classes/shared_lib.bbclass
> new file mode 100644
> index 0000000..4237c8c
> --- /dev/null
> +++ b/meta/classes/shared_lib.bbclass
> @@ -0,0 +1,9 @@
> +#
> +# This bbclass it a common case for lib${PN} shared libraries
> +#
> +SUMMARY_lib${PN} ?=3D "${SUMMARY} - Shared Libraries"
> +DESCRIPTION_lib${PN} ?=3D "${DESCRIPTION} This package contains the =
shared libraries"
> +
> +PACKAGES +=3D "lib${PN}"

I think you want =3D+ there

> +FILES_lib${PN} =3D "${libdir}/*${SOLIBS} ${base_libdir}/*${SOLIBS}"
> +RDEPENDS_lib${PN} =3D "${PN}"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



