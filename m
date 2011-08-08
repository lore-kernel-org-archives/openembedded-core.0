Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/SMLrIFdPvacYifI2ZngILc7ysRRHQ7rw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqR43-00079j-E9
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 16:44:23 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p78EdtJA008836
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 09:39:56 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
Date: Mon, 8 Aug 2011 09:39:56 -0500
Message-Id: <6CFB9718-52F9-45F5-B157-B0410A70DA08@kernel.crashing.org>
References: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] tune-ppce5500: Add a tune file for PowerPC e5500 core
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
X-List-Received-Date: Mon, 08 Aug 2011 14:44:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 5, 2011, at 3:11 PM, Kumar Gala wrote:

> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> meta/conf/machine/include/tune-ppce5500.inc |   14 ++++++++++++++
> 1 files changed, 14 insertions(+), 0 deletions(-)
> create mode 100644 meta/conf/machine/include/tune-ppce5500.inc
>=20
> diff --git a/meta/conf/machine/include/tune-ppce5500.inc =
b/meta/conf/machine/include/tune-ppce5500.inc
> new file mode 100644
> index 0000000..8e6403d
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-ppce5500.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?=3D "ppce5500"
> +
> +require conf/machine/include/powerpc/arch-powerpc64.inc
> +
> +TUNEVALID[ppce5500] =3D "Enable ppce5500 specific processor =
optimizations"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", =
"-mcpu=3De5500", "", d)}"
> +TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", =
"ppce5500", "${PPCPKGARCH}", d)}"
> +
> +AVAILTUNES +=3D "ppce5500"
> +TUNE_FEATURES_tune-ppce5500 =3D "m64 ppce5500"
> +PACKAGE_EXTRA_ARCHS_tune-ppce5500 =3D "powerpc64 ppce5500"
> +
> +# glibc configure options to get e5500 specific library (for sqrt)
> +GLIBC_EXTRA_OECONF +=3D "--with-cpu=3De5500"
> --=20
> 1.7.3.4

If I want to have a version of this for 32-bit only (or default) and one =
for 64-bit, how would it be best to handle that?

- k=


