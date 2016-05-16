Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE92770FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 21:28:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g132so16718280pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 14:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=+NTRYv3yRykAHvIAuYbh7g5akragwMd52DEh8Bd3bCI=;
	b=JWyTK4M9VI3+1eMi0Y80qp83H063sdA7QwZBmJcXQ7IlsuUs7Lf+nAxpsb15E99gFq
	5F016NKrUBLdsvBNglReFJFZmVSRgsG4Fnf5M20UKFEmhqcW14BwZW0h8YaHRk/3/Kjm
	u5GFMYY5SsG1Xp+BLF8/UknGAU80TFeIZSQwcPXrqcbqlDzmqmVk8c3BCAuWq9btbx4x
	YFlKIvYPGuqjwPEuT+1OhN9IQCmWj5Q8qwisYNZAgiSmBbGvbWtpNYT1YS1vDwA/Ci/c
	zfiC/0JimVuThZt37nwz3NLMV/EkQrBMJsQ3NDznS0tU5kiKtT12NP19Gi4Mpe6z6jep
	45tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+NTRYv3yRykAHvIAuYbh7g5akragwMd52DEh8Bd3bCI=;
	b=io+kcptgJ+RcFr5Yk3RWZn/x61o6PYCQYH9is89I5GlkZLsSW43s6UozGS6AA4lX/4
	bsZtFT89rVy7DaJ5omsAeG+VDX4XL9z+5mziwsKi5cX3eLKa0wsONBHMmpbYYBAgqUW+
	X8v9BdtCoUvOVbab02/+pTcZvLmcbf8mNkItSVQa1Ef6y7sv9TiA/jRrQpXJr/7V1E06
	7Le5np6wIDOo0c8ilc4Wy/1c0fo5lSlgFK7/xsrRRnJSzm7X3knIhnEvk57dNrXXDAK3
	apeb/co7oHuhySMSDKtZ9B6yq8nlOJzLESygiKVQ0LOZz/cs2lKd1Au82yGW3t7MNBYf
	bNjA==
X-Gm-Message-State: AOPr4FXWSiOd/UpFF/KQHfP0s5AYzRW6ooePCR62sTFzH7Gjc7L+HFDFZ3FULuTyc77zGQ==
X-Received: by 10.98.75.81 with SMTP id y78mr48710563pfa.161.1463434088715;
	Mon, 16 May 2016 14:28:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:dd3:cb39:a42f:8eaf?
	([2601:646:8800:5a9a:dd3:cb39:a42f:8eaf])
	by smtp.gmail.com with ESMTPSA id
	ym8sm49387925pab.22.2016.05.16.14.28.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 14:28:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463429996-24056-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Date: Mon, 16 May 2016 14:28:02 -0700
Message-Id: <1407DCB5-D6A6-45D4-8F5B-DE43C8F74E59@gmail.com>
References: <1463429996-24056-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
To: edwin.plauchu.camacho@linux.intel.com
X-Mailer: Apple Mail (2.3124)
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta:recipes-extended: stat fix security gaps
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
X-List-Received-Date: Mon, 16 May 2016 21:28:10 -0000
X-Groupsio-MsgNum: 82183
Content-Type: multipart/signed;
	boundary="Apple-Mail=_078BE299-1C38-4756-AAA5-915CB2FF31A0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_078BE299-1C38-4756-AAA5-915CB2FF31A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 16, 2016, at 1:19 PM, edwin.plauchu.camacho@linux.intel.com =
wrote:
>=20
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>=20
> This patch avoids stat fails to compile with compiler flags which =
elevate common string formatting issues into an error (-Wformat =
-Wformat-security -Werror=3Dformat-security).
>=20
> [YOCTO #9550]
>=20
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> ---
> meta/conf/distro/include/security_flags.inc        |  1 -
> .../stat/stat-3.3/fix-security-format.patch        | 77 =
++++++++++++++++++++++
> meta/recipes-extended/stat/stat_3.3.bb             |  1 +
> 3 files changed, 78 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> index 7a91cec..5ae6dd8 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -105,7 +105,6 @@ SECURITY_STRINGFORMAT_pn-gettext =3D ""
> SECURITY_STRINGFORMAT_pn-kexec-tools =3D ""
> SECURITY_STRINGFORMAT_pn-makedevs =3D ""
> SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
> -SECURITY_STRINGFORMAT_pn-stat =3D ""
> SECURITY_STRINGFORMAT_pn-unzip =3D ""
> SECURITY_STRINGFORMAT_pn-zip =3D ""
>=20
> diff --git =
a/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch =
b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
> new file mode 100644
> index 0000000..7d9f8df
> --- /dev/null
> +++ b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
> @@ -0,0 +1,77 @@
> +meta: recipes-extended: Fixing security formatting issues on stat
> +
> +Fix security formatting issues related to printf without NULL =
argument
> +
> +stat.c: In function 'print_human_access':
> +stat.c:292:13: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
> +     printf (access);
> +             ^
> +stat.c: In function 'print_human_time':
> +stat.c:299:57: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
> +   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
> +                                                         ^
> +stat.c: In function 'print_it':
> +stat.c:613:6: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
> +      printf(b);
> +      ^
> +stat.c:642:6: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
> +      printf(b);
> +      ^
> +
> +[YOCTO #9550]
> +[https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9550]
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> +
> +diff --git a/stat.c b/stat.c
> +index 1ed07a9..351ab54 100644
> +--- a/stat.c
> ++++ b/stat.c
> +@@ -21,6 +21,8 @@
> +
> + #include "fs.h"
> +
> ++#define __PRINT(STR) printf (STR,NULL)
> ++

Can we use proper formatting string here something like
printf(=E2=80=9C%s=E2=80=9D, access );

or use fputs() Call instead

> + void print_human_type(unsigned short mode)
> + {
> +   switch (mode & S_IFMT)
> +@@ -289,15 +291,15 @@ void print_human_access(struct stat *statbuf)
> +     default:
> +       access[0] =3D '?';
> +     }
> +-    printf (access);
> ++    __PRINT(access);
> + }
> +
> + void print_human_time(time_t *t)
> + {
> +   char str[40];
> +
> +-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
> +-  else printf("Cannot calculate human readable time, sorry");
> ++  if (strftime(str, 40, "%c", localtime(t)) > 0) __PRINT(str);
> ++  else __PRINT("Cannot calculate human readable time, sorry");
> + }
> +
> + /* print statfs info */
> +@@ -610,7 +612,7 @@ void print_it(char *masterformat, char *filename,
> + 	{
> + 	    strcpy (pformat, "%");
> + 	    *m++ =3D '\0';
> +-	    printf(b);
> ++	    __PRINT(b);
> +
> + 	    /* copy all format specifiers to our format string */
> + 	    while (isdigit(*m) || strchr("#0-+. I", *m))
> +@@ -639,7 +641,7 @@ void print_it(char *masterformat, char *filename,
> + 	}
> + 	else
> + 	{
> +-	    printf(b);
> ++	    __PRINT(b);
> + 	    b =3D NULL;
> + 	}
> +     }
> diff --git a/meta/recipes-extended/stat/stat_3.3.bb =
b/meta/recipes-extended/stat/stat_3.3.bb
> index a5ece07..0697c73 100644
> --- a/meta/recipes-extended/stat/stat_3.3.bb
> +++ b/meta/recipes-extended/stat/stat_3.3.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYRIGHT;md5=3D39886b077fd072e876e5c4c16310b631 \
>                     file://GPL;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>=20
> SRC_URI =3D "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz =
\
> +           file://fix-security-format.patch \
>            file://fix-error-return.patch"
>=20
> SRC_URI[md5sum] =3D "37e247e8e400ad9205f1b0500b728fd3"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_078BE299-1C38-4756-AAA5-915CB2FF31A0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6O2YACgkQuwUzVZGdMxQ/GQCdFQ3FlJxw56J3FJdGi7ufRaJi
W+wAnRiHSMKGeB2xp8M4/udUwVWQQWQX
=L1xs
-----END PGP SIGNATURE-----

--Apple-Mail=_078BE299-1C38-4756-AAA5-915CB2FF31A0--
