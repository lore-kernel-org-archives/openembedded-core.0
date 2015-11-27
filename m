Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 382B860132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 08:37:48 +0000 (UTC)
Received: by wmww144 with SMTP id w144so46402725wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 00:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BPew5LWZm17W45R6MfwcHjkYD7+XTN2Gtce50xO4sfI=;
	b=ZBG5NIQ9j9IT77rh8WIageHkY9fV2vBDz7n78tS+VxXsSpanxHZF2twQVuyp+hunSs
	LYvNNDlqKCEOq00jSEKrwO5StGYLgcdoUgp4iE3Zis5nCVPxRnTA9hNMAGGjAjJQrV+j
	TS9DYFU6l6fcjnQiWmn6G/qqRrcy/SyVgcNz/297MDMNl4Cy4msn3WBcXi4ukrhWb1kh
	deCPdgK5ruE8XV+S7q0CVr6Q4ctafD8C4nur/77eR7W62fbAVYEi30rPbV64JCq541wU
	WZwx64Od6dujay1Npdv5GUKGwrUEJ5ejkdHSDO1vI+zT+YIotHxYcTWJ3QU+WKYlFBL4
	1hbA==
X-Received: by 10.194.175.230 with SMTP id cd6mr53617360wjc.100.1448613469154; 
	Fri, 27 Nov 2015 00:37:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z17sm31879854wjq.1.2015.11.27.00.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 00:37:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Nov 2015 09:38:25 +0100
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Message-ID: <20151127083825.GZ17303@jama>
References: <1448592348-16830-1-git-send-email-Yuanjie.Huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1448592348-16830-1-git-send-email-Yuanjie.Huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-cross-initial: make dependency on gnu-config-native and autoconf-native explicit
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
X-List-Received-Date: Fri, 27 Nov 2015 08:37:51 -0000
X-Groupsio-MsgNum: 74069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NxDiCysn+RCvdoZt"
Content-Disposition: inline

--NxDiCysn+RCvdoZt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2015 at 10:45:48AM +0800, Yuanjie Huang wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>=20
> When a project is configure to use sstate cache and has the host tool sys=
root
> cleaned, gcc-cross-initial may fail to be configured due to lack of
> gnu-configize tool.
>=20
> gcc-cross-initial recipe has autotools dependency inhibited, and the same=
 flag
> variable also excludes the gnu-config-native.  Though there is an indirect
> dependency through libmpc-native, it's not safe with sstate cache being u=
sed.
>=20
> Moreover, gnu-config-native requires a perl package from autoconf-native =
to
> run, otherwise it will fail with "Can't locate Autom4te/ChannelDefs.pm in=
 @INC"
> message.
>=20
> This patch makes both dependencies explicit for gcc-cross-initial's
> configuration.
>=20
> Upstream-status: Inappropriate[configuration]

Upstream-status is for .patch files added to metadata, not for metadata
changes.

> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-initial.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recip=
es-devtools/gcc/gcc-cross-initial.inc
> index 7197447..1cb341b 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -5,6 +5,9 @@ PACKAGES =3D ""
>  INHIBIT_AUTOTOOLS_DEPS =3D "1"
>  INHIBIT_DEFAULT_DEPS =3D "1"
> =20
> +# We still need gnu-config-native
> +DEPENDS_prepend =3D "gnu-config-native autoconf-native"

You need trailing space for _prepend.

> +
>  PN =3D "gcc-cross-initial-${TARGET_ARCH}"
> =20
>  CROSS_TARGET_SYS_DIR_append =3D ".${PN}"
> --=20
> 2.6.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NxDiCysn+RCvdoZt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZYFoAACgkQN1Ujt2V2gBxlkgCgibIUiiX1gbEY0JAPdKlt0lKo
5VsAniJCX/GGZuKHQQtQXxHtwqJNHiTg
=7CQe
-----END PGP SIGNATURE-----

--NxDiCysn+RCvdoZt--
