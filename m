Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 353D162252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:43:29 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so8381860wes.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yyqWwoElZXAxFwY23scxaSsFXs8ZRIpCJI8blBJRU+w=;
	b=mPU9qMjBNDijmhT4vefLqYbT3HTXde6LEFtashs/ICjJYYuK+ZnFftuVR15bOY8NAa
	6vSn5b/g85Z/Zej0MbTMdbMTtc9n057bkhfEC4GvJrRq69LO78KQUXskvtMFQ3mUIJ7w
	k2xAR9WVKipx7y08+bf9FtCVS8FctT4fOOl1FdcAMqChCFV4M5lM5sbA7AbH1yWpKQ/J
	av0UaQKv/yH2Ry12CobWPCuRDfyDpIO85ZhoQeWlq1gzNApbEcV4yJsu+CRO2UhkjZJ5
	qnzSLxzrBzfSr0KW+jv3/bKM+LU0fq8E0yf5PxnWgLT4C/0t3r13jhYiLv9zF0qs2Y3k
	FB6g==
X-Received: by 10.180.89.161 with SMTP id bp1mr18390264wib.49.1407181410812;
	Mon, 04 Aug 2014 12:43:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kr5sm45671247wjc.27.2014.08.04.12.43.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 12:43:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Aug 2014 21:43:57 +0200
To: Ben Shelton <ben.shelton@ni.com>
Message-ID: <20140804194357.GF2465@jama>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<bee86f48e59ad65ffe1256fa967ac83eb0ac111e.1407177403.git.ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <bee86f48e59ad65ffe1256fa967ac83eb0ac111e.1407177403.git.ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/20] udev: Make build MACHINE-specific
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
X-List-Received-Date: Mon, 04 Aug 2014 19:43:36 -0000
X-Groupsio-MsgNum: 55957
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline

--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2014 at 01:41:10PM -0500, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>=20
> For space reasons, udev needs to be configured differently depending on
> MACHINE_FEATURES. So set PACKAGE_ARCH accordingly.
>=20
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58621
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-core/udev/udev.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/ude=
v.inc
> index 11204aa..8394064 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -15,6 +15,12 @@ LDFLAGS +=3D "-lrt"
>  DEPENDS =3D "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-=
native util-linux"
>  RPROVIDES_${PN} =3D "hotplug"
> =20
> +#
> +# packages which content depend on MACHINE_FEATURES/COMBINED_FEATURES ne=
ed to be MACHINE_ARCH
> +#
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

A lot of recipes are depending on udev and aren't MACHINE_ARCH (this
would make them effectively MACHINE_ARCH).

e.g. bluez4, ofono, clutter, mesa, pulseaudio, ... and everything
depending on them as well.

>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.t=
ar.gz \
>             file://0001-Fixing-keyboard_force_release.sh-shell-script-pat=
h.patch \
>             file://avoid-mouse-autosuspend.patch \
> --=20
> 2.0.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPf4n0ACgkQN1Ujt2V2gBzPGQCggSDN8H0afxUEy23ki3NjeSoM
/ukAoLefQjGIDn5/yk8SOGBRfro9sAE2
=WNp0
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
