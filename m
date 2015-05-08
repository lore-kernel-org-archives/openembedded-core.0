Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 72A706081A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 16:26:18 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so89540606pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=f9wwPhP6/IunzJCowrYY1Kg/aZNIv1yAZKPHp3uFXWE=;
	b=elPZCplY5tK02utfAmSkbmmJUGYv1IZ7ihnkZJpfO48GTyygbbe7Ud5b0YvvEtKv8J
	PRKhPg9UEUmI1/O0GasmCJSJbe8KuMuI2wR4n9vitVZ6UFennAD9caHlUTK1bLzWaNqt
	9Zt+XI1fGvNwGpGCBWcKoX76RcLO4st6YC58mGL+b/A4C1wMugjS1YhjORqjuzqEO/Py
	9pM/eyCYkV28VbOEJWE3H+/mgGsz1k25vP0y2Ys3vXRgBETg788hWbsuq7kBnQD4Y+JD
	EsEaeiVmlKhX03/2tx98+4bJUZcVh0Q6SkSifRuMD7x3uDMk0CWLp5qnZcSsgc7sT0ie
	Q53Q==
X-Received: by 10.70.102.132 with SMTP id fo4mr7790740pdb.31.1431102320077;
	Fri, 08 May 2015 09:25:20 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id j14sm5653336pbq.29.2015.05.08.09.25.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 May 2015 09:25:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431095308-17934-1-git-send-email-haris.okanovic@ni.com>
Date: Fri, 8 May 2015 09:25:18 -0700
Message-Id: <F7042414-7582-4E9D-AF7A-95A15FD07C74@gmail.com>
References: <1431095308-17934-1-git-send-email-haris.okanovic@ni.com>
To: Haris Okanovic <haris.okanovic@ni.com>
X-Mailer: Apple Mail (2.2098)
Cc: Ken Sharp <ken.sharp@ni.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] glibc: CVE-2015-1472: wscanf allocates too little memory
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
X-List-Received-Date: Fri, 08 May 2015 16:26:18 -0000
X-Groupsio-MsgNum: 65305
Content-Type: multipart/signed;
	boundary="Apple-Mail=_94157083-D411-4280-92A9-01C196956EA0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_94157083-D411-4280-92A9-01C196956EA0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

this is ok

> On May 8, 2015, at 7:28 AM, Haris Okanovic <haris.okanovic@ni.com> =
wrote:
>=20
> Backport Paul Pluzhnikov's glibc patch for CVE-2015-1472:
>=20
> Under certain conditions wscanf can allocate too little memory for the
> to-be-scanned arguments and overflow the allocated buffer.  The
> implementation now correctly computes the required buffer size when
> using malloc.
>=20
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D16618
>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Signed-off-by: Ken Sharp <ken.sharp@ni.com>
> Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
> ---
> Natinst-CAR-ID: 518552
> Natinst-ReviewBoard-ID: 96712
> ---
> ...5-1472-wscanf-allocates-too-little-memory.patch | 127 =
+++++++++++++++++++++
> meta/recipes-core/glibc/glibc_2.20.bb              |   1 +
> 2 files changed, 128 insertions(+)
> create mode 100644 =
meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-me=
mory.patch
>=20
> diff --git =
a/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-=
memory.patch =
b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-=
memory.patch
> new file mode 100644
> index 0000000..4ffd609
> --- /dev/null
> +++ =
b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-=
memory.patch
> @@ -0,0 +1,127 @@
> +=46rom 5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06 Mon Sep 17 00:00:00 =
2001
> +From: Paul Pluzhnikov <ppluzhnikov@google.com>
> +Date: Fri, 6 Feb 2015 00:30:42 -0500
> +Subject: [PATCH] CVE-2015-1472: wscanf allocates too little memory
> +
> +BZ #16618
> +
> +Under certain conditions wscanf can allocate too little memory for =
the
> +to-be-scanned arguments and overflow the allocated buffer.  The
> +implementation now correctly computes the required buffer size when
> +using malloc.
> +
> +A regression test was added to tst-sscanf.
> +
> +Upstream-Status: Backport
> +https://sourceware.org/bugzilla/show_bug.cgi?id=3D16618
> +---
> + stdio-common/tst-sscanf.c | 33 +++++++++++++++++++++++++++++++++
> + stdio-common/vfscanf.c    | 12 ++++++------
> + 2 files changed, 39 insertions(+), 6 deletions(-)
> +
> +diff --git a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
> +index =
aece3f2f290088b2c08441cf85f2b915a61b9789..8a2eb9e39c4752a30941753d7f0325c2=
aa352fd1 100644
> +--- a/stdio-common/tst-sscanf.c
> ++++ b/stdio-common/tst-sscanf.c
> +@@ -226,12 +226,45 @@ main (void)
> + 	  result =3D 1;
> + 	}
> +       else if (ret =3D=3D 2 && c !=3D double_tests2[i].residual)
> + 	{
> + 	  printf ("double_tests2[%d] stopped at '%c' !=3D '%c'\n",
> + 		  i, c, double_tests2[i].residual);
> + 	  result =3D 1;
> + 	}
> +     }
> +
> ++  /* BZ #16618
> ++     The test will segfault during SSCANF if the buffer overflow
> ++     is not fixed.  The size of `s` is such that it forces the use
> ++     of malloc internally and this triggers the incorrect =
computation.
> ++     Thus the value for SIZE is arbitrariy high enough that malloc
> ++     is used.  */
> ++  {
> ++#define SIZE 131072
> ++    CHAR *s =3D malloc ((SIZE + 1) * sizeof (*s));
> ++    if (s =3D=3D NULL)
> ++      abort ();
> ++    for (size_t i =3D 0; i < SIZE; i++)
> ++      s[i] =3D L('0');
> ++    s[SIZE] =3D L('\0');
> ++    int i =3D 42;
> ++    /* Scan multi-digit zero into `i`.  */
> ++    if (SSCANF (s, L("%d"), &i) !=3D 1)
> ++      {
> ++	printf ("FAIL: bug16618: SSCANF did not read one input =
item.\n");
> ++	result =3D 1;
> ++      }
> ++    if (i !=3D 0)
> ++      {
> ++	printf ("FAIL: bug16618: Value of `i` was not zero as =
expected.\n");
> ++	result =3D 1;
> ++      }
> ++    free (s);
> ++    if (result !=3D 1)
> ++      printf ("PASS: bug16618: Did not crash.\n");
> ++#undef SIZE
> ++  }
> ++
> ++
> +   return result;
> + }
> +diff --git a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
> +index =
cd129a81dee57e5e06ccb0e676e0de3fd52469ca..0e204e7b326d848716222f40b5b82b82=
56ed1b77 100644
> +--- a/stdio-common/vfscanf.c
> ++++ b/stdio-common/vfscanf.c
> +@@ -265,42 +265,42 @@ _IO_vfscanf_internal (_IO_FILE *s, const char =
*format, _IO_va_list argptr,
> +   CHAR_T *wp =3D NULL;		/* Workspace.  */
> +   size_t wpmax =3D 0;		/* Maximal size of workspace.  =
*/
> +   size_t wpsize;		/* Currently used bytes in workspace.  =
*/
> +   bool use_malloc =3D false;
> + #define ADDW(Ch)							 =
   \
> +   do									=
    \
> +     {									=
    \
> +       if (__glibc_unlikely (wpsize =3D=3D wpmax))				=
      \
> + 	{								 =
   \
> + 	  CHAR_T *old =3D wp;						 =
   \
> +-	  size_t newsize =3D (UCHAR_MAX + 1 > 2 * wpmax			 =
   \
> +-			    ? UCHAR_MAX + 1 : 2 * wpmax);		 =
   \
> +-	  if (use_malloc || !__libc_use_alloca (newsize))		 =
   \
> ++	  bool fits =3D __glibc_likely (wpmax <=3D SIZE_MAX / sizeof =
(CHAR_T) / 2); \
> ++	  size_t wpneed =3D MAX (UCHAR_MAX + 1, 2 * wpmax);		 =
   \
> ++	  size_t newsize =3D fits ? wpneed * sizeof (CHAR_T) : SIZE_MAX;	=
    \
> ++	  if (!__libc_use_alloca (newsize))				 =
   \
> + 	    {								 =
   \
> + 	      wp =3D realloc (use_malloc ? wp : NULL, newsize);		 =
   \
> + 	      if (wp =3D=3D NULL)						=
    \
> + 		{							 =
   \
> + 		  if (use_malloc)					 =
   \
> + 		    free (old);						 =
   \
> + 		  done =3D EOF;						 =
   \
> + 		  goto errout;						 =
   \
> + 		}							 =
   \
> + 	      if (! use_malloc)						 =
   \
> + 		MEMCPY (wp, old, wpsize);				 =
   \
> +-	      wpmax =3D newsize;						=
    \
> ++	      wpmax =3D wpneed;						 =
   \
> + 	      use_malloc =3D true;					 =
   \
> + 	    }								 =
   \
> + 	  else								 =
   \
> + 	    {								 =
   \
> + 	      size_t s =3D wpmax * sizeof (CHAR_T);			 =
   \
> +-	      wp =3D (CHAR_T *) extend_alloca (wp, s,			 =
   \
> +-					     newsize * sizeof (CHAR_T)); =
   \
> ++	      wp =3D (CHAR_T *) extend_alloca (wp, s, newsize);		 =
   \
> + 	      wpmax =3D s / sizeof (CHAR_T);				 =
   \
> + 	      if (old !=3D NULL)						=
    \
> + 		MEMCPY (wp, old, wpsize);				 =
   \
> + 	    }								 =
   \
> + 	}								 =
   \
> +       wp[wpsize++] =3D (Ch);						=
    \
> +     }									=
    \
> +   while (0)
> +
> + #ifdef __va_copy
> +--
> +2.2.2
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.20.bb =
b/meta/recipes-core/glibc/glibc_2.20.bb
> index 3277f7a..e3427dd 100644
> --- a/meta/recipes-core/glibc/glibc_2.20.bb
> +++ b/meta/recipes-core/glibc/glibc_2.20.bb
> @@ -46,6 +46,7 @@ CVEPATCHES =3D "\
>         file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch =
\
>         file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch =
\
>         file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
> +        file://CVE-2015-1472-wscanf-allocates-too-little-memory.patch =
\
>     "
> LIC_FILES_CHKSUM =3D =
"file://LICENSES;md5=3De9a558e243b36d3209f380deb394b213 \
>       file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> --
> 2.2.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_94157083-D411-4280-92A9-01C196956EA0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVM424ACgkQuwUzVZGdMxRIAACeLUAE6BeFKrS0q3x0CcgicNui
wUkAn3mXhiZGbNrXLe9o4X7aa/pMxgkm
=7ODT
-----END PGP SIGNATURE-----

--Apple-Mail=_94157083-D411-4280-92A9-01C196956EA0--
