Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 13E8B731B0;
	Sun, 11 Sep 2016 19:37:11 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d7so3052860wmi.3;
	Sun, 11 Sep 2016 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hnr2vTBQ2z5qQUw+P4Jo1Nfznkroco74kCN2rh33Dds=;
	b=mmuEnUf9UI95fOjMgzXqqXuWHOZK7GbkFj3zCxTLgLD4dbxIvzMfYdfxKiSC/ZvDTw
	94sWzLOvWluriJghs24CI5bJGsCUkAJdhGkM+dd+Id4vNlQ/Pv8Yda3zfEh8czONUCD6
	fR9PwZmu+KZcqNuQFZrmdzIfNuKMRvPSMdUVPSiCy4Dg0u5dNBvh00ow+6WgsZzJON+1
	4MKOpqEFPk/xG7IZ8MucYeyyPfrwLJC8zWLGQCv8y1QFC8uBYtm7e+J1Mrzxunq/QFMn
	VbYEa1/Boh8X0WYUVeu5NYnjdhVVJs1jf6TsSTWwoaYrkDWJvvVbO902T7qSxOgkvx8k
	IEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hnr2vTBQ2z5qQUw+P4Jo1Nfznkroco74kCN2rh33Dds=;
	b=ZvZoaVGgfh+yLXpT3lHIcGfm/pZnZxxAqXBYb90QHz6KF5nBZsAwJrzxyEXZY07X6p
	ebLcdsNQMXdXtIh49n1orNhG5Kc1Av/l4G1/Yf2YFmxqPt9DaM7wRfWpojt14Nsqln26
	MTo8KSWVv6bTEey/bz6sOhKPcPpUizZqg8Qp6ijOF5qv+yC0AO9rku9QwDR4q/MwsiAr
	7nkZzWCpLXSB6X6Q7uFlbvJg9wi1QrtgPqBuotYRfwXpdKqoHU9ayhAXojSAHORLgdhx
	l3B0jlpNgpiLVQBEp38Fftyo3lyYfQRpX5+2iacrMPsP/tRHHjgyFWzD/oBqOc4kJoi4
	1n8Q==
X-Gm-Message-State: AE9vXwNwv/Ei13g0Qh2ucBK0vELHKrONIjOG5+2+niCKQ0catIfom6aZJ2xtowd9RzYoGw==
X-Received: by 10.194.20.65 with SMTP id l1mr13783004wje.71.1473622631845;
	Sun, 11 Sep 2016 12:37:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	u123sm5787160wmu.0.2016.09.11.12.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Sep 2016 12:37:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 11 Sep 2016 21:37:12 +0200
To: openembedded-core@lists.openembedded.org,
	Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160911193712.GA6859@jama>
References: <20160907233743.18699.54755@opal.openembedded.org>
	<20160907233744.4852350198@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160907233744.4852350198@opal.openembedded.org>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/24: gnutls: update to 3.5.3
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
X-List-Received-Date: Sun, 11 Sep 2016 19:37:12 -0000
X-Groupsio-MsgNum: 86990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 11:37:44PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 972ab9246e4b5a0f46a4f2b5b1e54773beac11bb
> Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
> AuthorDate: Wed Aug 31 11:50:03 2016 +0300
>=20
>     gnutls: update to 3.5.3
>    =20
>     Add patch to fix compile without libtasn headers.
>    =20
>     (From OE-Core rev: b43e4499fb3bae4740660a729a900d951eab00e8)
>    =20
>     Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This upgrade causes new QA issue:

ERROR: gnutls-3.5.3-r0 do_package_qa: QA Issue: ELF binary 'gnutls/3.5.3-r0=
/packages-split/gnutls/usr/lib/libgnutls.so.30.9.0' has relocations in .tex=
t [textrel]
ERROR: gnutls-3.5.3-r0 do_package_qa: QA Issue: ELF binary 'gnutls/3.5.3-r0=
/packages-split/gnutls/usr/lib/libgnutls.so.30.9.0' has relocations in .tex=
t [textrel]
ERROR: gnutls-3.5.3-r0 do_package_qa: QA run found fatal errors. Please con=
sider fixing them.
ERROR: gnutls-3.5.3-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in: gnutls/3.5.3-r0/temp/log.do_package_qa=
=2E33916
NOTE: recipe gnutls-3.5.3-r0: task do_package_qa: Failed
ERROR: Task (meta/recipes-support/gnutls/gnutls_3.5.3.bb:do_package_qa) fai=
led with exit code '1'


> ---
>  ...001-Use-correct-include-dir-with-minitasn.patch | 31 ++++++++++++++++=
++++++
>  .../gnutls/{gnutls_3.5.1.bb =3D> gnutls_3.5.3.bb}    |  5 ++--
>  2 files changed, 34 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-=
dir-with-minitasn.patch b/meta/recipes-support/gnutls/gnutls/0001-Use-corre=
ct-include-dir-with-minitasn.patch
> new file mode 100644
> index 0000000..d7dd7cf
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/0001-Use-correct-include-dir-wit=
h-minitasn.patch
> @@ -0,0 +1,31 @@
> +From 2651b08477f42dd7a05ea7d6df410fb2c46de4fb Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Wed, 31 Aug 2016 11:04:06 +0300
> +Subject: [PATCH] Use correct include dir with minitasn
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This allows compiling=A0certtool-cfg without libtasn headers.
> +
> +Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/merge_reque=
sts/54]
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + src/Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 182f3a5..cf65388 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -146,6 +146,7 @@ libcmd_cli_debug_la_SOURCES =3D cli-debug-args.def c=
li-debug-args.c cli-debug-args
> + COMMON_LIBS =3D $(LIBOPTS) $(LTLIBINTL)
> + if ENABLE_MINITASN1
> + COMMON_LIBS +=3D ../lib/minitasn1/libminitasn1.la ../gl/libgnu.la=20
> ++AM_CPPFLAGS +=3D -I$(top_srcdir)/lib/minitasn1
> + else
> + COMMON_LIBS +=3D $(LIBTASN1_LIBS)
> + endif
> +--=20
> +2.9.3
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.5.1.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.5.3.bb
> similarity index 50%
> rename from meta/recipes-support/gnutls/gnutls_3.5.1.bb
> rename to meta/recipes-support/gnutls/gnutls_3.5.3.bb
> index 85d9904..1bdca6a 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.5.1.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
> @@ -3,6 +3,7 @@ require gnutls.inc
>  SRC_URI +=3D "file://correct_rpl_gettimeofday_signature.patch \
>              file://0001-configure.ac-fix-sed-command.patch \
>              file://use-pkg-config-to-locate-zlib.patch \
> +            file://0001-Use-correct-include-dir-with-minitasn.patch \
>             "
> -SRC_URI[md5sum] =3D "cb48bb0cf36d329f7321c6cdc0d7ae36"
> -SRC_URI[sha256sum] =3D "bc4a0f80a627c3aca6e7ea59d30e50cda118c61e0e3fab36=
7ff1451d6ec8bdbd"
> +SRC_URI[md5sum] =3D "6c2c7f40ddf52933ee3ca474cb8cb63c"
> +SRC_URI[sha256sum] =3D "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b=
5eae74881bdb1fef"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfVsmgACgkQN1Ujt2V2gBwLBwCePMi88Jf7MFgl00wM3nLs9F9d
rjQAnA+VC/bPDGaVqnboUQgjWOidXbqC
=TDvc
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
