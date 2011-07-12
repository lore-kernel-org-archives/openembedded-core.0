Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgX9K-0008F0-E6
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:12:54 +0200
Received: by wwi14 with SMTP id 14so2787137wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:08:57 -0700 (PDT)
Received: by 10.216.136.18 with SMTP id v18mr4999127wei.23.1310454537642;
	Tue, 12 Jul 2011 00:08:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm7365821weq.27.2011.07.12.00.08.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:08:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b57884dfeeaa8e5b4c1c9b35b72c01481cc1899c.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:08:55 +0200
Message-Id: <1129C3DF-DF72-4BB8-9BC3-42A3F13AF032@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<b57884dfeeaa8e5b4c1c9b35b72c01481cc1899c.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 17/26] python: Use bitbake default FILES for packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 07:12:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

missing PR bump

Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

>    This will ensure correct -dev and -staticdev packging
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/python/python_2.6.6.bb |    2 --
> 1 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python_2.6.6.bb =
b/meta/recipes-devtools/python/python_2.6.6.bb
> index 418457c..2c3c6da 100644
> --- a/meta/recipes-devtools/python/python_2.6.6.bb
> +++ b/meta/recipes-devtools/python/python_2.6.6.bb
> @@ -121,10 +121,8 @@ FILES_${PN}-dev =3D "\
>   ${includedir} \
>   ${libdir}/lib*${SOLIBSDEV} \
>   ${libdir}/*.la \
> -  ${libdir}/*.a \
>   ${libdir}/*.o \
>   ${libdir}/pkgconfig \
> -  ${base_libdir}/*.a \
>   ${base_libdir}/*.o \
>   ${datadir}/aclocal \
>   ${datadir}/pkgconfig \
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



