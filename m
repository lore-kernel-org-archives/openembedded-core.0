Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 367E76072C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 02:54:15 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 65so185447009pff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 18:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=DJxWsCGCKaPmED36DVGdqq8GZXgU4NiwMrfz9CmOiyE=;
	b=AvbCCbHGvfsjBXt7LPTRXm/ouBCDTWnEnMs7cZTOkeDTEs271iMLhs053ulkFVRE+v
	UUdRCgOa/68tA+b6U/p0TrmjpZnlaAdCNUBRSObNAAU1G89BFN9yI+n4OoLmDlzTJo8S
	VitHn7xEv8NK7see72w3pFri9dY2L2OQxUAZT3gl2tMkCQzaYLnjfNduhLYeC78YWKQ4
	RQVN5j0UmyRXM05gKW+Z/BrzzFcxs5cbGu3zuQUNlAbf++HGmun/xWBis+/qqJ7woLDD
	qFDsnWLI8YN7oLyUiwV99Y5qmuX5IRaYzwnBpCfcLlIlVCwaFOaZk9HE6Xg6Tiqzyctt
	Ru2g==
X-Received: by 10.98.73.7 with SMTP id w7mr137049124pfa.158.1452048856221;
	Tue, 05 Jan 2016 18:54:16 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d17f:ed53:e760:c0ba?
	([2601:646:8802:5d5c:d17f:ed53:e760:c0ba])
	by smtp.gmail.com with ESMTPSA id
	79sm62721664pfs.42.2016.01.05.18.54.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 18:54:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452046409-7350-1-git-send-email-marex@denx.de>
Date: Tue, 5 Jan 2016 18:54:11 -0800
Message-Id: <C6305912-A665-4147-82C8-DB3213161A88@gmail.com>
References: <1452046409-7350-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc5: Fix build on NIOS2
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
X-List-Received-Date: Wed, 06 Jan 2016 02:54:16 -0000
X-Groupsio-MsgNum: 75488
Content-Type: multipart/signed;
	boundary="Apple-Mail=_98EBBB51-E351-4CC0-9334-3F995C625D23";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_98EBBB51-E351-4CC0-9334-3F995C625D23
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 5, 2016, at 6:13 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> The gcc 5.3 does not build on NIOS2 due to a missing =
MUSL_DYNAMIC_LINKER
> definition in it's config file. Add the definition to fix the build =
issue.
> The output produced during the failing build is as follows:
>=20
> g++    -isystem/b/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe =
-DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti =
-fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings =
-Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic =
-Wno-long-long -Wno-variadic-macros -Wno-overlength-strings   =
-DHAVE_CONFIG_H -static-libstdc++ -static-libgcc =
-L/b/tmp/sysroots/x86_64-linux/usr/lib =
-L/b/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/b/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath,/b/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/b/tmp/sysroots/x86_64-linux/lib -Wl,-O1 gcc-ar.o -o gcc-ar \
>        file-find.o libcommon.a ../libcpp/libcpp.a   =
../libbacktrace/.libs/libbacktrace.a ../libiberty/libiberty.a =
../libdecnumber/libdecnumber.a
> In file included from ./tm.h:27:0,
>                 from =
/b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:34:
> ./config/linux.h:92:28: error: expected ',' or ';' before =
'MUSL_DYNAMIC_LINKER'
>     BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
>                            ^
> ./config/linux.h:59:60: note: in definition of macro =
'CHOOSE_DYNAMIC_LINKER1'
>   "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" =
LD1 "}}}"
>                                                            ^
> ./config/linux.h:91:3: note: in expansion of macro =
'CHOOSE_DYNAMIC_LINKER'
>   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, =
\
>   ^
> ./config/nios2/linux.h:40:25: note: in expansion of macro =
'GNU_USER_DYNAMIC_LINKER'
>       -dynamic-linker " GNU_USER_DYNAMIC_LINKER "} \
>                         ^
> /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:884:32: note: in =
expansion of macro 'LINK_SPEC'
> static const char *link_spec =3D LINK_SPEC;
>                                ^
> <command-line>:0:27: warning: deprecated conversion from string =
constant to 'char*' [-Wwrite-strings]
> /b/tmp/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:1295:48: note: in =
expansion of macro 'STANDARD_STARTFILE_PREFIX'
> static char *const standard_startfile_prefix =3D =
STANDARD_STARTFILE_PREFIX;


This is ok to install.

>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/recipes-devtools/gcc/gcc-5.3.inc                         |  1 +
> .../gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch               | 11 =
+++++++++++
> 2 files changed, 12 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc =
b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 3ce0893..80999c1 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "\
>            =
file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch \
>            file://0045-Support-for-arm-linux-musl.patch \
>            =
file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
> +	   file://0047-Fix-nios2-musl-build.patch \
>           "
>=20
> BACKPORTS =3D ""
> diff --git =
a/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch =
b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
> new file mode 100644
> index 0000000..44cea84
> --- /dev/null
> +++ =
b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
> @@ -0,0 +1,11 @@
> +diff -Naru gcc-5.3.0.orig/gcc/config/nios2/linux.h =
gcc-5.3.0/gcc/config/nios2/linux.h
> +--- gcc-5.3.0.orig/gcc/config/nios2/linux.h	2015-05-28 =
16:08:37.000000000 +0200
> ++++ gcc-5.3.0/gcc/config/nios2/linux.h	2016-01-04 =
02:42:46.878844806 +0100
> +@@ -30,6 +30,7 @@
> + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> +
> + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> +
> + #undef LINK_SPEC
> + #define LINK_SPEC LINK_SPEC_ENDIAN \
> --
> 2.1.4
>=20


--Apple-Mail=_98EBBB51-E351-4CC0-9334-3F995C625D23
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaMgdYACgkQuwUzVZGdMxQ3DgCfU8Hh/EFuJszd8Pjctoe70+gN
PVoAnArPuPWLhAuOK1wBHVGEDxPT0zVp
=TOFZ
-----END PGP SIGNATURE-----

--Apple-Mail=_98EBBB51-E351-4CC0-9334-3F995C625D23--
