Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5231C6A9FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:11:40 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so6972828eaj.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y+IvWDWtTJe4Rp5u73hhS1k9BgBQSHcJJd740vlBVCs=;
	b=NlAA03/FIz/C0VByv6TAbXumTgY+XU5MFvJWht3CjlbEOZNDr6Srer2hU/0t0lG468
	usm+p/xIAYcR3lgFx2+d23+hTJrzzXlDLt69lUJPHRMLER4rkOelpJOD30Tp0B1u5ccT
	UsZPYEsCs0+u+teX/IuNTQ5nPnZyeu2pKplSmbmAO34zeB259nruLFqrbywI6e7cvXPN
	yhDtO22pMPYJYk7IWD1tDR5l/qGqvQaMdAPW9WvNOiqFHe6vgPWYPwmYiQobB6E2tr3L
	QMkvwvoJm3vZOrgAxIcpCG3o5DRTdLv6aRllYZsWUv/KrYe1Azd70vUFGr4C0NMO8zRI
	tVFw==
X-Received: by 10.14.100.2 with SMTP id y2mr9062070eef.75.1371042699997;
	Wed, 12 Jun 2013 06:11:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm36783328eeh.15.2013.06.12.06.11.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 06:11:39 -0700 (PDT)
Date: Wed, 12 Jun 2013 15:12:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130612131203.GO3233@jama>
References: <1371039461-21154-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1371039461-21154-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] site: add more alignment values for at-spi2-core
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
X-List-Received-Date: Wed, 12 Jun 2013 13:11:40 -0000
X-Groupsio-MsgNum: 40524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JfVplkuTfB13Rsg5"
Content-Disposition: inline

--JfVplkuTfB13Rsg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 01:17:41PM +0100, Ross Burton wrote:
> x86 and x86_64 values were added in 8c46ec. The x86-64 values were missin=
g an
> entry, add MIPS and PowerPC values from myself in qemu, and ARM values fr=
om
> Martin Jansa.
>=20

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/site/arm-common     |   10 ++++++++++
>  meta/site/ix86-common    |    2 +-
>  meta/site/mips-common    |   10 ++++++++++
>  meta/site/powerpc-common |    9 +++++++++
>  meta/site/x86_64-linux   |    3 ++-
>  5 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/site/arm-common b/meta/site/arm-common
> index cad8027..1893dc0 100644
> --- a/meta/site/arm-common
> +++ b/meta/site/arm-common
> @@ -185,3 +185,13 @@ jm_cv_func_working_readdir=3Dyes
> =20
>  # evolution-data-server
>  ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> +
> +# at-spi2-core
> +ac_cv_alignof_char=3D1
> +ac_cv_alignof_dbind_pointer=3D4
> +ac_cv_alignof_dbind_struct=3D1
> +ac_cv_alignof_dbus_bool_t=3D4
> +ac_cv_alignof_dbus_int16_t=3D2
> +ac_cv_alignof_dbus_int32_t=3D4
> +ac_cv_alignof_dbus_int64_t=3D8
> +ac_cv_alignof_double=3D8
> diff --git a/meta/site/ix86-common b/meta/site/ix86-common
> index 5c90865..21fcf38 100644
> --- a/meta/site/ix86-common
> +++ b/meta/site/ix86-common
> @@ -221,7 +221,7 @@ nfsd_cv_broken_setfsuid=3D${nfsd_cv_broken_setfsuid=
=3D0}
>  nfsd_cv_func_statfs=3D${nfsd_cv_func_statfs=3Dstatfs2_bsize}
>  nfsd_cv_bsd_signals=3D${nfsd_cv_bsd_signals=3Dyes}
> =20
> -# dbind, in at-spi2-core
> +# at-spi2-core
>  ac_cv_alignof_char=3D1
>  ac_cv_alignof_dbind_pointer=3D4
>  ac_cv_alignof_dbind_struct=3D1
> diff --git a/meta/site/mips-common b/meta/site/mips-common
> index b4aaa7f..89d72cb 100644
> --- a/meta/site/mips-common
> +++ b/meta/site/mips-common
> @@ -44,3 +44,13 @@ ac_cv_alignof_unsigned_long=3D4
> =20
>  # slrn
>  slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
> +
> +# at-spi2-core
> +ac_cv_alignof_char=3D1
> +ac_cv_alignof_dbind_pointer=3D4
> +ac_cv_alignof_dbind_struct=3D1
> +ac_cv_alignof_dbus_bool_t=3D4
> +ac_cv_alignof_dbus_int16_t=3D2
> +ac_cv_alignof_dbus_int32_t=3D4
> +ac_cv_alignof_dbus_int64_t=3D8
> +ac_cv_alignof_double=3D8
> diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
> index a0c4951..efa299c 100644
> --- a/meta/site/powerpc-common
> +++ b/meta/site/powerpc-common
> @@ -3,3 +3,12 @@ ac_cv_alignof_guint32=3D4
>  ac_cv_alignof_guint64=3D8
>  ac_cv_alignof_unsigned_long=3D4
> =20
> +# at-spi2-core
> +ac_cv_alignof_char=3D1
> +ac_cv_alignof_dbind_pointer=3D4
> +ac_cv_alignof_dbind_struct=3D1
> +ac_cv_alignof_dbus_bool_t=3D4
> +ac_cv_alignof_dbus_int16_t=3D2
> +ac_cv_alignof_dbus_int32_t=3D4
> +ac_cv_alignof_dbus_int64_t=3D8
> +ac_cv_alignof_double=3D8
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index 78a3b85..b4434fe 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -125,7 +125,8 @@ ac_cv_func__restgpr_14_x=3Dno
>  # cvs
>  cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> =20
> -# dbind
> +# at-spi2-core
> +ac_cv_alignof_char=3D1
>  ac_cv_alignof_dbind_pointer=3D8
>  ac_cv_alignof_dbind_struct=3D1
>  ac_cv_alignof_dbus_bool_t=3D4
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JfVplkuTfB13Rsg5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG4c6MACgkQN1Ujt2V2gBzl/QCeMJY9jTSi1ljkieg8AIhWsaJ3
FTsAn0c+/iapq1lfTVnhq1oIeUPbwTKn
=FhfO
-----END PGP SIGNATURE-----

--JfVplkuTfB13Rsg5--
