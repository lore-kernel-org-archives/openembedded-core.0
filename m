Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id A5CC16B0D0
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 22:36:21 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so1737899ead.31
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bY8Qb1UYsKXVLgsILm6AkLFMxz8U4TdmCMrMVQyd3pE=;
	b=e4LKxzB7XShMIxSRPcCqFw6eUX/Mnpw8FDbyapJ7LHm2zNc3acMoNAdZkUi6gG80xT
	HGpzLk+gdBDUTdjSyP06L087aqtygY2fcfnSXZlPBX8T1595mDhv/zTocfi+ln2BL44O
	GZIwYPsbU24LA8+9wOvi8l2H7AbhC75ljcCY4JpJDehFUaMNN8ZBLzXDlIcHab6RdcFo
	esU41AV++XpAT/9MctHzdgdvM8/aN58uoeF5pWlnL6LZh3UJNxoL0gB2BYZS0mUGWndR
	PPCvvUaBctShS9WBmv2KdDX3t9PiBpFhBd6u0BRwwIzIMSxLFfKB7BqxJkS2QyV+HqQh
	IN9Q==
X-Received: by 10.14.102.72 with SMTP id c48mr10429452eeg.52.1376001381851;
	Thu, 08 Aug 2013 15:36:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm23222207eeb.9.2013.08.08.15.36.20 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 15:36:21 -0700 (PDT)
Date: Fri, 9 Aug 2013 00:37:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: nitin.a.kamble@intel.com
Message-ID: <20130808223707.GA17945@jama>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
	<ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] gst-meta-base: bring in the v4l2 related gst plugin
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
X-List-Received-Date: Thu, 08 Aug 2013 22:36:22 -0000
X-Groupsio-MsgNum: 43131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2013 at 09:34:29PM +0000, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> If the v4l2 machine feature is enabled, then the v4l2 gstreamer plugin
> is also pulled in the gst-meta-base packages.
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/me=
ta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> index 210da37..c1139f4 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> @@ -35,7 +35,9 @@ RDEPENDS_gst-meta-base =3D "\
>      gst-plugins-base-videoscale \
>      gst-plugins-base-ffmpegcolorspace \
>      gst-plugins-good-autodetect \
> -    gst-plugins-good-souphttpsrc"
> +    gst-plugins-good-souphttpsrc \
> +    gst-plugins-base-videotestsrc \
> +    ${@base_contains('MACHINE_FEATURES', 'v4l2', 'gst-plugins-good-video=
4linux2', '', d)}"

I was expecting to see PACKAGECONFIG somewhere, is v4l2 autodetected?

Why not keep v4l2-utils in meta-multimedia?

> =20
>  RRECOMMENDS_gst-meta-x11-base =3D "\
>      gst-plugins-base-ximagesink \
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIEHZMACgkQN1Ujt2V2gByI2ACgl1zXAYJaDCox0aBceuR3Bt6I
7coAn2pnuYyvUIQj9YURFj4ikmUXErMa
=ih9g
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
