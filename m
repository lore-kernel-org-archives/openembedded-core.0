Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJHN-0003jd-ID
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:16:49 +0200
Received: by bkat8 with SMTP id t8so415488bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0xnLch+0qasUTk7gITE53cy8SkYEg5rgKUDdflpOcTo=;
	b=u9833mFXKaVDWBzvPxcmYcMJ/ZagCOvOj3Gk0BVQch0Z/58vwN3keotBQSwH0r63NZ
	NJUDGheujBcfx/QCCZelIBmBlKM4Uzj1ko1WXq9iXJI52wDAAaOTJ2J6jSnx9WzqtiSF
	hD8DHI+i62Vr96MKF9Y4PeDgx888fJfy2ftBk=
Received: by 10.204.143.5 with SMTP id s5mr2362627bku.65.1318504265784;
	Thu, 13 Oct 2011 04:11:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm3198655bkd.6.2011.10.13.04.11.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:11:04 -0700 (PDT)
Date: Thu, 13 Oct 2011 13:10:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111013111057.GA28525@jama.jama.net>
References: <cover.1318503768.git.xiaofeng.yan@windriver.com>
	<5b2a12b800170740a2f91a17f7f2e4fced3f1b5e.1318503768.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5b2a12b800170740a2f91a17f7f2e4fced3f1b5e.1318503768.git.xiaofeng.yan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] distro_tracking_fields.inc: Add maintainer for some packages without maintainer
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
X-List-Received-Date: Thu, 13 Oct 2011 11:16:49 -0000
X-Groupsio-MsgNum: 10910
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 07:07:15PM +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Add the name of maintainer for the following packages:
> bind
> libx11-diet
> qmmp
> libarchive
> xserver-kdrive
> xserver-xorg-lite
> directfb
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |   38 ++++++++++++++=
++++--
>  1 files changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/c=
onf/distro/include/distro_tracking_fields.inc
> index b07209e..1023091 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -4599,6 +4599,23 @@ RECIPE_MAINTAINER_pn-libx11 =3D "Dexuan Cui <dexua=
n.cui@intel.com>"
> =20
>  RECIPE_STATUS_pn-libx11-diet =3D "green"
>  DISTRO_PN_ALIAS_pn-libx11-diet =3D "Debian=3Dlibx11-6 Fedora=3DlibX11 Ub=
untu=3Dlibx11-6 OpenSuSE=3Dxorg-x11-libX11"
> +RECIPE_LATEST_VERSION_pn-libx11-diet =3D "1.4.4"
> +RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet =3D "Dec,2010"
> +RECIPE_LAST_UPDATE_pn-libx11-diet =3D "Oct 13, 2011"
> +RECIPE_MAINTAINER_pn-libx11-diet =3D "Xiaofeng Yan <xiaofeng.yan@windriv=
er.com>"
> +
> +RECIPE_STATUS_pn-directfb =3D "red"
> +RECIPE_MAINTAINER_pn-directfb =3D "Xiaofeng Yan <xiaofeng.yan@windriver.=
com>"
> +
> +RECIPE_STATUS_pn-libarchive =3D "red"
> +RECIPE_MAINTAINER_pn-libarchive =3D "Xiaofeng Yan <xiaofeng.yan@windrive=
r.com>"
> +
> +RECIPE_STATUS_pn-xserver-kdrive =3D "red"
> +RECIPE_MAINTAINER_pn-xserver-kdrive =3D "Xiaofeng Yan <xiaofeng.yan@wind=
river.com>"
> +
> +RECIPE_STATUS_pn-xserver-xorg-lite =3D "red"
> +RECIPE_MAINTAINER_pn-xserver-xorg-lite =3D "Xiaofeng Yan <xiaofeng.yan@w=
indriver.com>"
> +
> =20
>  RECIPE_STATUS_pn-libx11-trim =3D "green"
>  DISTRO_PN_ALIAS_pn-libx11-trim =3D "Debian=3Dlibx11-6 Fedora=3DlibX11 Ub=
untu=3Dlibx11-6 OpenSuSE=3Dxorg-x11-libX11"
> @@ -5703,10 +5720,27 @@ RECIPE_LAST_UPDATE_pn-libgdata =3D "Dec 29, 2010"
>  RECIPE_MAINTAINER_pn-libgdata =3D "Zhai Edwin <edwin.zhai@intel.com>"
> =20
>  RECIPE_LATEST_VERSION_pn-man-pages =3D "3.32"
> -RECIPE_LATEST_VERSION_pn-qmmp =3D "0.4.3"
>  RECIPE_LATEST_VERSION_pn-sysprof =3D "6b5b8432711ef5c747f8375073cd9af889=
22d3c6"
>  RECIPE_LATEST_VERSION_pn-table =3D "d42a44938699ee30a998fc42bc149aebf693=
89db"
> =20
> +RECIPE_STATUS_pn-qmmp =3D "green"
> +RECIPE_LATEST_VERSION_pn-qmmp =3D "0.5.2"
> +RECIPE_LATEST_RELEASE_DATE_pn-qmmp =3D "Sep 02, 2011"
> +RECIPE_LAST_UPDATE_pn-qmmp =3D "Oct 13, 2011"
> +RECIPE_MAINTAINER_pn-qmmp =3D "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
> +
> +RECIPE_STATUS_pn-bind =3D "green"
> +RECIPE_LATEST_VERSION_pn-bind =3D "9.8.1"
> +RECIPE_LATEST_RELEASE_DATE_pn-bind =3D "Aug 31, 2011"
> +RECIPE_LAST_UPDATE_pn-bind =3D "Oct 13, 2011"
> +RECIPE_MAINTAINER_pn-bind =3D "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
> +
> +RECIPE_STATUS_pn-xserver-xorg-lite =3D "green"
> +RECIPE_LATEST_VERSION_pn-xserver-xorg-lite =3D "1.4.4"

^ this looks like libx11-diet version

> +RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg-lite =3D "Aug 31, 2011"
> +RECIPE_LAST_UPDATE_pn-xserver-xorg-lite =3D "Oct 13, 2011"
> +RECIPE_MAINTAINER_pn-xserver-xorg-lite =3D "Xiaofeng Yan <xiaofeng.yan@w=
indriver.com>"
> +
>  RECIPE_LATEST_VERSION_pn-texinfo =3D "4.13a"
>  RECIPE_LATEST_RELEASE_DATE_pn-texinfo =3D "Sep 22, 2008"
>  RECIPE_LAST_UPDATE_pn-texinfo =3D "Sep 16, 2011"
> @@ -5715,8 +5749,6 @@ RECIPE_NO_UPDATE_REASON_pn-texinfo =3D "Checking sc=
ript parses directory wrong"
> =20
>  RECIPE_LATEST_VERSION_pn-blktrace =3D "a788dfde86dfaff8f1c277a233f92c182=
2e06b76"
>  RECIPE_LATEST_VERSION_pn-dtc =3D "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569=
c6"
> -RECIPE_LATEST_VERSION_pn-bind =3D "9.7.2-P3"
> -RECIPE_NO_UPDATE_REASON_pn-bind =3D "Latest Stable version, newer versio=
ns are Alpha/Beta"
>  RECIPE_LATEST_VERSION_pn-man =3D "1.6f"
>  RECIPE_LATEST_VERSION_pn-mc =3D "4.7.5-pre1"
>  RECIPE_MAINTAINER_pn-mc =3D "Saul Wold <sgw@linux.intel.com>"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Wx0EACgkQN1Ujt2V2gBzdbgCglITICwvJxCk4aVAV+uadXqAC
8nYAn1EEaNfy/MP7uUO/thIcVPx+mDo7
=2KMR
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
