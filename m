Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 08F0D65E2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 14:05:24 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so9825891wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HjpPYsXL2sbk7XN3CHMXey7BpYoQyZVX3O2r0MjuLWU=;
	b=L1cEqX81u8996AIJkrf4z6SQcbySUMI12l+lsIw7nSLuPxLe3xEH7H1DJSrDlBSJPv
	N+HxTxDrBP/T6eoJoM98H82zrOx8FXGBLtH1RlIDOTWsPBX7pKFTDA54Mz57ZHHXOBq9
	d0JvTLtUHJZz27BklPTaCCdy0VCyRXAutwfNfsQTBcERN/MR2Fqb0lsurmps0tqRff1a
	s/vr+c1UUpvRrtaOeTa5D/zW7+tBB/JQwydMXxoXC31E8R69166d5H3WO/a/EWSZCsvk
	u0Riw0WVKWgLFOgPDK9/7BVZgcEy2g1Onqg2wNm/AjkvHc+JxwoKBZn71l69YGNQqww4
	hdoA==
X-Received: by 10.194.91.228 with SMTP id ch4mr5443575wjb.59.1407852325599;
	Tue, 12 Aug 2014 07:05:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm9453185wjb.47.2014.08.12.07.05.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 07:05:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 16:06:00 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140812140600.GM14848@jama>
References: <1406667922-15716-1-git-send-email-dv@pseudoterminal.org>
	<1406667922-15716-7-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1406667922-15716-7-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 7/7] gstreamer1.0-omx: upgrade to 1.2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Aug 2014 14:05:32 -0000
X-Groupsio-MsgNum: 56356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VpRFFy90J6DTn7yH"
Content-Disposition: inline

--VpRFFy90J6DTn7yH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 11:05:22PM +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../{gstreamer1.0-omx_1.0.0.bb =3D> gstreamer1.0-omx_1.2.0.bb}          =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.0.0.bb =3D>=
 gstreamer1.0-omx_1.2.0.bb} (69%)

would you mind fixing these floating deps?

gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libegl-mesa, but it is=
n't a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libudev, but it isn't =
a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on wayland, but it isn't =
a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgstgl-1.0, but it i=
sn't a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxdamage, but it isn=
't a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgbm, but it isn't a=
 build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libwayland-egl, but it=
 isn't a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libdrm, but it isn't a=
 build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxfixes, but it isn'=
t a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgl-mesa, but it isn=
't a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libglu, but it isn't a=
 build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libglapi, but it isn't=
 a build dependency? [build-deps]
gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxxf86vm, but it isn=
't a build dependency? [build-deps]

>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
> similarity index 69%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
> index f5956c6..fe7c91c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c \
> =20
>  SRC_URI =3D "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.=
tar.xz"
> =20
> -SRC_URI[md5sum] =3D "bb34b5742223267298bcffc209104a92"
> -SRC_URI[sha256sum] =3D "7a1d8d28d70dacc6bd3c7ee7d7e40df6d5a1d38d7c256d5c=
9c5c8ef15c005014"
> +SRC_URI[md5sum] =3D "d24e8c0153c35dfefee3e26b1c2c35f8"
> +SRC_URI[sha256sum] =3D "0b4874961e6488ad9e5808114bd486ea981c540907262caa=
b1419355fd82d745"
> =20
>  S =3D "${WORKDIR}/gst-omx-${PV}"
> =20
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VpRFFy90J6DTn7yH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqH0gACgkQN1Ujt2V2gBx/GACfTXVYXZnMu4EvwEp4FxMJFJVX
VgMAnjiga7cu4P+/0WpB/E3VfMEvdc0m
=qwer
-----END PGP SIGNATURE-----

--VpRFFy90J6DTn7yH--
