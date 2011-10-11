Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDYFn-00082T-Cm
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 11:04:03 +0200
Received: by bke11 with SMTP id 11so9625150bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qBjDM79ugJvwmEAFFbR3Uw0NnKnURJ9pKUCvrAGbugY=;
	b=NL8F+LaqyBbKBwQhdZVz9xFmW/lXApTJJanFcF4nZVU0FWg3dIjJByVTWpECCw7q4m
	UNWeu4Ph95knP7TFRixMjxlJy6EQIR4e2YZ906SLPNzVDE8LCNKpbx3B4qpZZsjE71pc
	VI41MnOD/pDY9VnCTPjv768nW2Fp5uE1g9F3c=
Received: by 10.204.135.207 with SMTP id o15mr8651822bkt.92.1318323501195;
	Tue, 11 Oct 2011 01:58:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm1115018bku.9.2011.10.11.01.58.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 01:58:19 -0700 (PDT)
Date: Tue, 11 Oct 2011 10:58:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111011085812.GD27073@jama.jama.net>
References: <cover.1318318965.git.xiaofeng.yan@windriver.com>
	<dc43f11e95bda59f13088ee74f6c922532d9ecb2.1318318965.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <dc43f11e95bda59f13088ee74f6c922532d9ecb2.1318318965.git.xiaofeng.yan@windriver.com>
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
X-List-Received-Date: Tue, 11 Oct 2011 09:04:03 -0000
X-Groupsio-MsgNum: 10795
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline

--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 04:51:25PM +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Add the name of maintainer for the following packages:
> 	bind
>         libx11-diet
>         qmmp
>         libarchive
>         xserver-kdrive
>         xserver-xf86-lite
>         directfb
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/c=
onf/distro/include/distro_tracking_fields.inc
> index 7b6c4a9..be7e854 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -4599,6 +4599,19 @@ RECIPE_MAINTAINER_pn-libx11 =3D "Dexuan Cui <dexua=
n.cui@intel.com>"
> =20
>  RECIPE_STATUS_pn-libx11-diet =3D "green"
>  DISTRO_PN_ALIAS_pn-libx11-diet =3D "Debian=3Dlibx11-6 Fedora=3DlibX11 Ub=
untu=3Dlibx11-6 OpenSuSE=3Dxorg-x11-libX11"
> +RECIPE_STATUS_pn-xserver-xf86-lite  =3D "red"
> +RECIPE_MAINTAINER_pn-xserver-xf86-lite  =3D "Xiaofeng Yan <xiaofeng.yan@=
windriver.com>"

There is patch renaming it to xserver-xorg-lite.
Please update this patch after rename is pushed to master.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6UBSQACgkQN1Ujt2V2gBwQMACcDIgD0ZnYLq8HOilQTJW01Ybk
CcoAnic6lV0SdjgwLNw+7Gxy/m7zmzzZ
=iuCf
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
