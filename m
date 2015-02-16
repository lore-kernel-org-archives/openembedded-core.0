Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDB765C85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 18:08:04 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w62so30572269wes.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tEINgUGqvSXQx3kQ7uaz21a14GLXvynvI5lMPHdApsI=;
	b=w7kfdGl7n+9UOEb6M/5FwcXPSZkTAvJONNPTLT9XTOGKBVO3Y44DplqH5Z0YSyRyOS
	HAzDGfwkx3BTY2stZHu9XAKc8p97gnm4VgSmbkAPIX22c5Agzn4K5YWhnEXVEiKEUeqq
	ViFx7o1eiC6l2J/I+k8jRETq8NHJxdqVLnKqCP4/iXaVxCDW5vMkj9rsEliObuOXJH25
	pmtdbB0Iulem54/Hs/G+v8EAJKLdLmG2rSxbP+VYg2f02v9kIYDl+r1XVpl1VWjCSTIs
	BlNIBqbIv7LcMP4LcwGr68H0TJa/8ip65qC1En4bajTrhrQCEFJr1/xwmUhiZqPTxEgJ
	JepQ==
X-Received: by 10.180.95.162 with SMTP id dl2mr48874942wib.31.1424110083130;
	Mon, 16 Feb 2015 10:08:03 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub1sm23867179wjc.43.2015.02.16.10.08.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 10:08:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Feb 2015 19:08:11 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150216180811.GL2297@jama>
References: <1405530244-16849-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405530244-16849-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][PATCH] icu: force arm mode
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
X-List-Received-Date: Mon, 16 Feb 2015 18:08:08 -0000
X-Groupsio-MsgNum: 62450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B9BE8dkJ1pIKavwa"
Content-Disposition: inline

--B9BE8dkJ1pIKavwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 07:04:04PM +0200, Martin Jansa wrote:
> * otherwise it triggers following ICE:
> ERROR: Function failed: do_compile (log file is located at /OE/build/shr-=
core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_comp=
ile.21570)
> ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-eglibc/work/a=
rm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_compile.21570
> Log data follows:

This is still broken in oe-core, would it make sense to enable thumb on
one of autobuilder jobs (for qemuarm)?

> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-lin=
ux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make
> | Note: rebuild with "make VERBOSE=3D1 " to show all compiler parameters.
> | make[0]: Making `all' in `stubdata'
> | make[1]: Entering directory '/OE/build/shr-core/tmp-eglibc/work/arm920t=
t-oe-linux-gnueabi/icu/53.1-r0/build/stubdata'
> | make[1]: Nothing to be done for 'all'.
> | make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt=
-oe-linux-gnueabi/icu/53.1-r0/build/stubdata'
> | make[0]: Making `all' in `common'
> | make[1]: Entering directory '/OE/build/shr-core/tmp-eglibc/work/arm920t=
t-oe-linux-gnueabi/icu/53.1-r0/build/common'
> |    arm-oe-linux-gnueabi-gcc    ...  /OE/build/shr-core/tmp-eglibc/work/=
arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c
> | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r=
0/icu/source/common/ubidiwrt.c: In function 'ubidi_writeReordered_53':
> | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r=
0/icu/source/common/ubidiwrt.c:643:1: internal compiler error: in patch_jum=
p_insn, at cfgrtl.c:1275
> |  }
> |  ^
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> | *** Failed compilation command follows: -------------------------------=
---------------------------
> | arm-oe-linux-gnueabi-gcc -march=3Darmv4t -mthumb -mthumb-interwork -mtu=
ne=3Darm920t --sysroot=3D/OE/build/shr-core/tmp-eglibc/sysroots/om-gta02 -D=
_REENTRANT -DU_HAVE_ELF_H=3D1 -DU_HAVE_ATOMIC=3D1 -I/OE/build/shr-core/tmp-=
eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common -DDEFAU=
LT_ICU_PLUGINS=3D"/usr/lib/icu"  -DU_ATTRIBUTE_DEPRECATED=3D -DU_COMMON_IMP=
LEMENTATION -O2 -pipe -g -feliminate-unused-debug-types -std=3Dc99 -Wall -p=
edantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings -c -D=
PIC -fPIC -o ubidiwrt.o /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linu=
x-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c
> | --- ( rebuild with "make VERBOSE=3D1 all" to show all parameters ) ----=
----
> | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r=
0/icu/source/config/mh-linux:44: recipe for target 'ubidiwrt.o' failed
> | make[1]: *** [ubidiwrt.o] Error 1
> | make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt=
-oe-linux-gnueabi/icu/53.1-r0/build/common'
> | Makefile:141: recipe for target 'all-recursive' failed
> | make: *** [all-recursive] Error 2
> | ERROR: oe_runmake failed
> | WARNING: /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/i=
cu/53.1-r0/temp/run.do_compile.21570:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /OE/build/sh=
r-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_co=
mpile.21570)
> NOTE: recipe icu-53.1-r0: task do_compile: Failed
> ERROR: Task 6803 (/OE/build/shr-core/openembedded-core/meta/recipes-suppo=
rt/icu/icu_53.1.bb, do_compile) failed with exit code '1'
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/icu/icu_53.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/icu/icu_53.1.bb b/meta/recipes-support/=
icu/icu_53.1.bb
> index d93af68..82c8d8c 100644
> --- a/meta/recipes-support/icu/icu_53.1.bb
> +++ b/meta/recipes-support/icu/icu_53.1.bb
> @@ -8,6 +8,8 @@ def icu_download_version(d):
> =20
>  ICU_PV =3D "${@icu_download_version(d)}"
> =20
> +ARM_INSTRUCTION_SET =3D "arm"
> +
>  BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/${PV}/icu4=
c-${ICU_PV}-src.tgz"
>  SRC_URI =3D "${BASE_SRC_URI} \
>             file://icu-pkgdata-large-cmd.patch \
> --=20
> 2.0.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B9BE8dkJ1pIKavwa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTiMgsACgkQN1Ujt2V2gBy36wCeMC//lMxL+Sk5ShB78Dd4Mjfd
wnwAoLggZmhpAsX912GMUE12XtqrMY85
=HwWZ
-----END PGP SIGNATURE-----

--B9BE8dkJ1pIKavwa--
