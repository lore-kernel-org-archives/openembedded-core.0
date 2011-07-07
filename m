Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QepZK-0007DF-CU
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:28:42 +0200
Received: by wyg30 with SMTP id 30so784998wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:24:50 -0700 (PDT)
Received: by 10.227.127.135 with SMTP id g7mr781968wbs.96.1310048690568;
	Thu, 07 Jul 2011 07:24:50 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.196])
	by mx.google.com with ESMTPS id gb1sm6929169wbb.3.2011.07.07.07.24.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 07:24:49 -0700 (PDT)
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<b53c3209e62b53c744afeed13e1563932770cf1f.1310044227.git.paul.eggleton@linux.intel.com>
In-Reply-To: <b53c3209e62b53c744afeed13e1563932770cf1f.1310044227.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <09ECC867-24F5-4CC7-8312-F00F34897B68@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 7 Jul 2011 15:24:46 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Thu, 07 Jul 2011 14:28:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

angstrom has been setting it to 2.6.16 for some years now, I forget which bu=
g that fixed over 2.6.0

Op 7 jul. 2011 om 14:11 heeft Paul Eggleton <paul.eggleton@linux.intel.com> h=
et volgende geschreven:

> Since we no longer support 2.4, update this setting to 2.6.0. (This affect=
s
> eglibc's kernel support).
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/conf/bitbake.conf |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdaa35d..56a867b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -349,7 +349,7 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
> # Kernel info.
> ##################################################################
>=20
> -OLDEST_KERNEL =3D "2.4.0"
> +OLDEST_KERNEL =3D "2.6.0"
> STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/kernel"
>=20
> ##################################################################
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


