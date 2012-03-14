Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7rBO-0008Sl-7i
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:36:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 09:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120983047"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2012 09:27:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Wed, 14 Mar 2012 16:27:26 +0000
Message-ID: <22576197.WV0krj9sgO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1331740771-32303-1-git-send-email-bjst@enea.com>
References: <2142033.FIQWIVi2oI@helios>
	<1331740771-32303-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Wed, 14 Mar 2012 16:36:14 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 14 March 2012 16:59:31 Bj=F6rn Stenberg wrote:
> pigz, which stands for parallel implementation of gzip, is a fully
> functional replacement for gzip that exploits multiple processors and=

> multiple cores to the hilt when compressing data. pigz was written by=
 Mark
> Adler, and uses the zlib and pthread libraries.
>=20
> This recipe adds pigz as an alternative gzip-native implementation on=
ly.
>...
> diff --git a/meta/recipes-extended/pigz/pigz.inc
> b/meta/recipes-extended/pigz/pigz.inc new file mode 100644
> index 0000000..b501d7a
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/pigz.inc
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "A parallel implementation of gzip"
> +DESCRIPTION =3D "pigz, which stands for parallel implementation of g=
zip, is a
> \ +fully functional replacement for gzip that exploits multiple proce=
ssors
> and \ +multiple cores to the hilt when compressing data. pigz was wri=
tten
> by Mark \ +Adler, and uses the zlib and pthread libraries."
> +HOMEPAGE =3D "http://zlib.net/pigz/"
> +SECTION =3D "console/utils"
> +LICENSE =3D "Zlib"
> +
> +SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz \
> +           file://ldflags.patch"
> +
> +PROVIDES +=3D "gzip-native"

Sorry for not picking up on this earlier, but I think this needs to be=20=

PROVIDES_virtclass-native, otherwise the target recipe will also provid=
e gzip-
native.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


