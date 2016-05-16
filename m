Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 04A9560851
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 23:08:51 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id qo8so26962810pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 16:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=AEXfQwOg6i+HaOGH5uPIjGe/x+5mrbPJ6/OYEXdwz5I=;
	b=LV5uJY8inrI9ByNxobcSxyTV6oFrvhm5IgjPYxlS20v0rpKdBmRth963DMZWx0Ofh4
	ekNGVhdcQWDKCe9e4e+cxs9oNJwzElWtFKREXAmSvujAH8yxK0gwJFwbKzx4nIDOrWjy
	9mRdWGzeqKO7w1dA5DsaLnR+E1BZHsTl5/yYHjEd2FC3QS36ZqWGQ+JxNKO9ahzKeVd6
	/nslXUP0gKMiMwfktVANFqEf+rcBpWoL3+4ECPBDDMuM2QgNLjEEn8+L6EVSm3OvlyZT
	1y46snau2qHnL34y6gDOTP2CJ7nXSYN+66Mkf74FP+/iqAp+6GVRmUPBJnWMHlrCh9ye
	we2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AEXfQwOg6i+HaOGH5uPIjGe/x+5mrbPJ6/OYEXdwz5I=;
	b=bqlqPdGsZvUYdK1K9swsgg0Cu9CQyzRDdAuDWUygVG3S0rsEWBRY6Akb5ZZmAdpup2
	qsQnJWq9kbA2huxR0ikxQo7G+hjla+rU5qjkKiJJhxIkojeZNnLvF32kUcgFlIHBOGeq
	p5JhtNaNm2ZMNhfzsoJY70fvvQqrI5Kyv25u5+ZWQ4qR7Ts+eQBLIdvlBTAe8ubfuMbZ
	jwsDDL4I4Aj9KGBLUtdi1fsTVRFDvF8cCi6+Jf1d0hsoFoE4hs7pNk57e36KOozrX+yy
	8yPGh8cHgtfhVZzido26GFtRzxYbuncaSCkrhmmlhlgWlj+fPNx3JXqVxiIzAwpHOwsq
	YAag==
X-Gm-Message-State: AOPr4FXQ9miykoO3z7Ew5e7d2SD/PGrxxPJGm+5MPkYRE3RCRbLqg4qDGv9Ovj9gH+OV+g==
X-Received: by 10.66.118.166 with SMTP id kn6mr49249895pab.33.1463440132173;
	Mon, 16 May 2016 16:08:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5587:b1ab:c014:b8fd?
	([2601:646:8800:5a9a:5587:b1ab:c014:b8fd])
	by smtp.gmail.com with ESMTPSA id
	d186sm49612448pfa.45.2016.05.16.16.08.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 16:08:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463436382-9946-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Date: Mon, 16 May 2016 16:08:46 -0700
Message-Id: <BF908D4D-D366-4553-8A85-DE92ED6EDF76@gmail.com>
References: <1463436382-9946-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta:recipes-extended: zip fix security gaps
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
X-List-Received-Date: Mon, 16 May 2016 23:08:52 -0000
X-Groupsio-MsgNum: 82191
Content-Type: multipart/signed;
	boundary="Apple-Mail=_147A03CD-929B-4705-B232-E6BF378BA87F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_147A03CD-929B-4705-B232-E6BF378BA87F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 16, 2016, at 3:06 PM, Edwin Plauchu =
<edwin.plauchu.camacho@linux.intel.com> wrote:
>=20
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>=20
> This patch avoids zip recipe fails to compile with compiler flags =
which elevate common string formatting issues into an error (-Wformat =
-Wformat-security -Werror=3Dformat-security).
>=20
> [YOCTO #9552]
>=20
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> ---
> meta/conf/distro/include/security_flags.inc        |  1 -
> .../zip/zip-3.0/fix-security-format.patch          | 42 =
++++++++++++++++++++++
> meta/recipes-extended/zip/zip.inc                  |  3 +-
> 3 files changed, 44 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> index 7a91cec..bb1a398 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -107,7 +107,6 @@ SECURITY_STRINGFORMAT_pn-makedevs =3D ""
> SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
> SECURITY_STRINGFORMAT_pn-stat =3D ""
> SECURITY_STRINGFORMAT_pn-unzip =3D ""
> -SECURITY_STRINGFORMAT_pn-zip =3D ""
>=20
> TARGET_CFLAGS_append_class-target =3D " ${SECURITY_CFLAGS}"
> TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
> diff --git =
a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch =
b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
> new file mode 100644
> index 0000000..b745c6b
> --- /dev/null
> +++ b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
> @@ -0,0 +1,42 @@
> +meta: recipes-extended: Fixing security formatting issues on zip
> +
> +Fix security formatting issues related to printing without NULL =
argument
> +
> +zip.c: In function 'help_extended':
> +zip.c:1031:5: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
> +     printf(text[i]);
> +     ^
> +zip.c: In function 'version_info':
> +zip.c:1228:5: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
> +     printf(cryptnote[i]);
> +     ^
> +
> +[YOCTO #9552]
> +[https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9552]
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> +
> +diff --git a/zip.c b/zip.c
> +index 439821f..2ef57e3 100644
> +--- a/zip.c
> ++++ b/zip.c
> +@@ -1028,7 +1028,7 @@ local void help_extended()
> +
> +   for (i =3D 0; i < sizeof(text)/sizeof(char *); i++)
> +   {
> +-    printf(text[i]);
> ++    printf( text[i] , NULL );

same issue as discussed in another similar patch. if text[i] is not =
supposed
to be a printf format string, then qualify it with one e.g. =E2=80=9C%s=E2=
=80=9D is mostly what
you want since they are usually strings otherwise.

> +     putchar('\n');
> +   }
> + #ifdef DOS
> +@@ -1225,7 +1225,7 @@ local void version_info()
> +             CR_MAJORVER, CR_MINORVER, CR_BETA_VER, CR_VERSION_DATE);
> +   for (i =3D 0; i < sizeof(cryptnote)/sizeof(char *); i++)
> +   {
> +-    printf(cryptnote[i]);
> ++    printf( cryptnote[i] , NULL );
> +     putchar('\n');
> +   }
> +   ++i;  /* crypt support means there IS at least one compilation =
option */
> diff --git a/meta/recipes-extended/zip/zip.inc =
b/meta/recipes-extended/zip/zip.inc
> index 6221c5e..fac3a9f 100644
> --- a/meta/recipes-extended/zip/zip.inc
> +++ b/meta/recipes-extended/zip/zip.inc
> @@ -5,7 +5,8 @@ SECTION =3D "console/utils"
> LICENSE =3D "BSD-3-Clause"
> LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D04d43c5d70b496c032308106e26ae17d"
>=20
> -SRC_URI =3D =
"ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.'=
, '')}.tgz"
> +SRC_URI =3D =
"ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.'=
, '')}.tgz \
> +           file://fix-security-format.patch"
>=20
> EXTRA_OEMAKE =3D "'CC=3D${CC}' 'BIND=3D${CC}' 'AS=3D${CC} -c' =
'CPP=3D${CPP}' \
> 		'CFLAGS=3D-I. -DUNIX ${CFLAGS}' 'INSTALL=3Dinstall' \
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_147A03CD-929B-4705-B232-E6BF378BA87F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6UwIACgkQuwUzVZGdMxQoWACgker9NeZZ7f8x4+6MU/3LEoxW
3TQAn1/xgRYvpRJFZMJfB1yV++q2YbmW
=8tir
-----END PGP SIGNATURE-----

--Apple-Mail=_147A03CD-929B-4705-B232-E6BF378BA87F--
