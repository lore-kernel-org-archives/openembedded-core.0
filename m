Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RkY57-0001Yn-JZ for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 10:33:26 +0100
Received: from f053046173.adsl.alicedsl.de ([78.53.46.173]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RkXxv-0007eA-Sr; Tue, 10 Jan 2012 09:26:00 +0000
Message-ID: <1326187552.15840.65.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:25:52 +0100
In-Reply-To: <d3d9ba1a5582d4d62e728a866ccafd2ae7c2da23.1326181827.git.dongxiao.xu@intel.com>
References: <cover.1326181827.git.dongxiao.xu@intel.com>
	<d3d9ba1a5582d4d62e728a866ccafd2ae7c2da23.1326181827.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] distro_tracking: update manual check info
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
X-List-Received-Date: Tue, 10 Jan 2012 09:33:26 -0000
X-Groupsio-MsgNum: 15712
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-QcM9n2peTyjWCQcwfyfE"

--=-QcM9n2peTyjWCQcwfyfE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dongxiao,


Am Dienstag, den 10.01.2012, 15:52 +0800 schrieb Dongxiao Xu:
> updated kexec-tools manual check information

this is mostly the same as the commit summary. So just merge it.

distro_tracking_fields: kexec-tools: Add manual check info

> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/c=
onf/distro/include/distro_tracking_fields.inc
> index cc87d5c..6a8463f 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -2384,6 +2384,7 @@ RECIPE_NO_OF_PATCHES_pn-kexec-tools=3D"1"
>  RECIPE_LATEST_RELEASE_DATE_pn-kexec-tools=3D"Jul 29, 2010"
>  RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-kexec-tools=3D"1 year"
>  RECIPE_LAST_UPDATE_pn-kexec-tools =3D "Nov 16, 2010"
> +RECIPE_MANUAL_CHECK_DATE_pn-kexec-tools =3D "Jan 10, 2012"
>  RECIPE_MAINTAINER_pn-kexec-tools =3D "Dongxiao Xu <dongxiao.xu@intel.com=
>"
> =20
>  RECIPE_STATUS_pn-hostap-conf =3D "red"

Otherwise very trivial. So

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-QcM9n2peTyjWCQcwfyfE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8MBCIACgkQPX1aK2wOHVgwHwCgjOaucYDmM2+jxE91k9WffZ3s
FlwAnj68WtsjOJmGkwhRBJ83NFOQhHFH
=zqk9
-----END PGP SIGNATURE-----

--=-QcM9n2peTyjWCQcwfyfE--
