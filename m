Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QezTV-0004mP-RX
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 03:03:22 +0200
Received: by vws2 with SMTP id 2so1287211vws.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=FwaCciuCSD7RxM9S7t05mzdZQ4e3votCOQgxQNaRFbY=;
	b=gv7+hLdQp34S7tq/HVnQBoRqwPBhMFkbuvnrBEBfQ3joi4ynU9b4zxmdpEpVPT0eF+
	gvJFX71H+0K6mtXV1LGu1CBkOw1QCh9P0xuIh8qSIjzTngj59mBCmY8Vs9eFxv7mkAFe
	T3ZKz2E03w6Zu2u6YEPCIgaK5WQ8eRpltENxU=
Received: by 10.52.177.130 with SMTP id cq2mr1974583vdc.171.1310086768819;
	Thu, 07 Jul 2011 17:59:28 -0700 (PDT)
Received: from [192.168.30.25] (ns-visitor-nsrp.juniper.net [208.223.208.242])
	by mx.google.com with ESMTPS id d3sm3492922vdg.24.2011.07.07.17.59.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 17:59:28 -0700 (PDT)
References: <cover.1310081443.git.sgw@linux.intel.com>
	<d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
In-Reply-To: <d188228df9d99be77ec2b3becc354a1fc905ab65.1310081443.git.sgw@linux.intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <886C3867-FF12-4B5E-90C3-9E5906BAA94F@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 17:59:56 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] eglibc: Add RDEPENDS on bash
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
X-List-Received-Date: Fri, 08 Jul 2011 01:03:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 7, 2011, at 4:31 PM, Saul Wold <sgw@linux.intel.com> wrote:

> [YOCTO #1214]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
> meta/recipes-core/eglibc/eglibc.inc         |    2 +-
> meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
> meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
> 4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-co=
re/eglibc/eglibc-package.inc
> index 1c6626c..f0fac76 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -69,7 +69,7 @@ FILES_eglibc-utils =3D "${bindir}/* ${sbindir}/*"
> FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug ${libdir}/audit/.debug"
> FILES_catchsegv${PKGSUFFIX} =3D "${bindir}/catchsegv"
> RDEPENDS_catchsegv${PKGSUFFIX} =3D "libsegfault"
> -EDEPENDS_eglibc-utils =3D "libsotruss"
> +RDEPENDS_eglibc-utils +=3D "libsotruss bash"

While typo fix is ok why do we need dependency on bash ?
If it is for ldd then there is already a fix to free it from bashism
We should use that

> FILES_eglibc-pcprofile =3D "${base_libdir}/libpcprofile.so"
> FILES_eglibc-thread-db${PKGSUFFIX} =3D "${base_libdir}/libthread_db*"
> RPROVIDES_eglibc-dev +=3D "libc-dev"
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglib=
c/eglibc.inc
> index 74afb9d..058d58e 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend =3D " \
> # nptl needs unwind support in gcc, which can't be built without glibc.
> DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
> #this leads to circular deps, so lets not add it yet
> -#RDEPENDS_ldd +=3D " bash"
> +RDEPENDS_ldd +=3D " bash"
> # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this=

> #RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/e=
glibc/eglibc_2.12.bb
> index 85d58fa..fd7b485 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -1,7 +1,7 @@
> require eglibc.inc
>=20
> DEPENDS +=3D "gperf-native"
> -PR =3D "r18"
> +PR =3D "r19"
>=20
> SRCREV =3D "14158"
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/e=
glibc/eglibc_2.13.bb
> index 7986131..be65787 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -4,7 +4,7 @@ SRCREV =3D "14157"
>=20
> DEPENDS +=3D "gperf-native"
> FILESPATHPKG =3D. "eglibc-svn:"
> -PR =3D "r5"
> +PR =3D "r6"
> PR_append =3D "+svnr${SRCPV}"
>=20
> EGLIBC_BRANCH=3D"eglibc-2_13"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


