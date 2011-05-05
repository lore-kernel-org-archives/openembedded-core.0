Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QHtfE-0003en-2s
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:12:00 +0200
Received: by wwb17 with SMTP id 17so1714468wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 01:09:15 -0700 (PDT)
Received: by 10.227.157.134 with SMTP id b6mr1708457wbx.59.1304582953387;
	Thu, 05 May 2011 01:09:13 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	z13sm1183142wbd.29.2011.05.05.01.09.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 May 2011 01:09:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <70f1d28d6c05982c3b06abe5ce069705dfd1fee9.1304581769.git.sgw@linux.intel.com>
Date: Thu, 5 May 2011 10:09:07 +0200
Message-Id: <35853380-9ABD-432A-BAE2-239E0536B654@dominion.thruhere.net>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<70f1d28d6c05982c3b06abe5ce069705dfd1fee9.1304581769.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 05/26] setuptools: Make options for setup.py more flexible
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
X-List-Received-Date: Thu, 05 May 2011 08:12:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I NAK'ed this before, and will NAK it again.

See =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/001265.h=
tml

Op 5 mei 2011, om 09:55 heeft Saul Wold het volgende geschreven:

> From: Gary Thomas <gary@mlbassoc.com>
>=20
> The setuptools class uses hard-wired options for 'setup.py' during
> the install step.  In particular, not all versions of setup.py
> support the "--single-version-externally-managed" option.  This
> patch allows for a recipe to easily override these options, while
> leaving the majority (important) setup options intact.
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
>> =46rom 0afbe6b9477c207e37009c8ef5aa47b3438640a9 Mon Sep 17 00:00:00 =
2001
> From: Gary Thomas <gary@mlbassoc.com>
> Date: Wed, 13 Apr 2011 15:12:57 -0600
> Subject: [PATCH] setuptools: Make options for setup.py more flexible
>=20
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/setuptools.bbclass |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/setuptools.bbclass =
b/meta/classes/setuptools.bbclass
> index ced9509..cf1c224 100644
> --- a/meta/classes/setuptools.bbclass
> +++ b/meta/classes/setuptools.bbclass
> @@ -2,7 +2,8 @@ inherit distutils
>=20
> DEPENDS +=3D "python-setuptools-native"
>=20
> +DISTUTILS_INSTALL_OPTS ?=3D "--single-version-externally-managed "
> DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
> -    --single-version-externally-managed \
> +    ${DISTUTILS_INSTALL_OPTS} \
>     --prefix=3D${prefix} \
>     --install-data=3D${datadir}"
> --=20
> 1.7.1.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



