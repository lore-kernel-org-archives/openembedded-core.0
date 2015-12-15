Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 031166FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 00:53:01 +0000 (UTC)
Received: by pfbu66 with SMTP id u66so70125195pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 16:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4eB/ip/G5A1lZbOYZZzFrAhAFQVUKEk2/Ss/6FNi5p8=;
	b=SPsbvLwqO1pWCQDKXlS9/7jDpLS+E4LihCnjw9tK/MD7mbXWd+68u96h6UE9ui6KAj
	TEPDQ89tdtf/J4+8jGMKIKmCB5ZVkU68/5OlME66CU30jTGv5qlW/uIGrnK2zK+SwElE
	7BpKPQodk24UEDCvfK5APqAVxf51rfSLOvVVb20ksxawhLqowTsWBzvSPZ8nGI0gV/Mz
	ERM+D4L4S8IyKKHJAENt1szbr3EoMl9o81wz5Vq9dqsZxUb3CqrF8VZRbRY3muDxwTxd
	Ym229tz9uewCDFZL8+mIW8gn6X2Sqy2VeknrYCyBVKRGe0TFG7Vlp4P4jZpNh8LXkoRZ
	5S5g==
X-Received: by 10.98.89.196 with SMTP id k65mr40795527pfj.12.1450140782366;
	Mon, 14 Dec 2015 16:53:02 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5c4d:b840:1a41:b442?
	([2601:646:8802:5d5c:5c4d:b840:1a41:b442])
	by smtp.gmail.com with ESMTPSA id
	g68sm9167081pfj.57.2015.12.14.16.52.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 16:52:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
Date: Mon, 14 Dec 2015 16:52:58 -0800
Message-Id: <1BB10471-925A-427E-A757-128559BD365F@gmail.com>
References: <1450095853-48305-1-git-send-email-sona.sarmadi@enea.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][dizzy 1/6] glibc/wscanf: CVE-2015-1472
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
X-List-Received-Date: Tue, 15 Dec 2015 00:53:03 -0000
X-Groupsio-MsgNum: 74768
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1398C587-06E5-4396-9E09-A46889F8F3D4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1398C587-06E5-4396-9E09-A46889F8F3D4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 14, 2015, at 4:24 AM, Sona Sarmadi <sona.sarmadi@enea.com> =
wrote:
>=20
> Fixes a heap buffer overflow in glibc wscanf.
>=20
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2015-1472
> https://sourceware.org/ml/libc-alpha/2015-02/msg00119.html
> http://openwall.com/lists/oss-security/2015/02/04/1
>=20
> Reference to upstream fix:
> https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;a=3Dcommit;
> h=3D5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06

this is ok.

>=20
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
> ...5-1472-wscanf-allocates-too-little-memory.patch | 108 =
+++++++++++++++++++++
> meta/recipes-core/glibc/glibc_2.20.bb              |   1 +
> 2 files changed, 109 insertions(+)
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
> index 0000000..ab513aa
> --- /dev/null
> +++ =
b/meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-=
memory.patch
> @@ -0,0 +1,108 @@
> +CVE-2015-1472: wscanf allocates too little memory
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
> +
> +The patch is from (Paul Pluzhnikov <ppluzhnikov@google.com>):
> =
+[https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D5bd80bfe9ca0d955=
bfbbc002781bc7b01b6bcb06]
> +
> +diff -ruN a/ChangeLog b/ChangeLog
> +--- a/ChangeLog	2015-09-22 10:20:14.399408389 +0200
> ++++ b/ChangeLog	2015-09-22 10:33:07.374388595 +0200
> +@@ -1,3 +1,12 @@
> ++2015-02-05  Paul Pluzhnikov  <ppluzhnikov@google.com>
> ++
> ++       [BZ #16618] CVE-2015-1472
> ++       * stdio-common/tst-sscanf.c (main): Test for buffer overflow.
> ++       * stdio-common/vfscanf.c (_IO_vfscanf_internal): Compute =
needed
> ++       size in bytes. Store needed elements in wpmax. Use needed =
size
> ++       in bytes for extend_alloca.
> ++
> ++
> + 2014-12-16  Florian Weimer  <fweimer@redhat.com>
> +
> +        [BZ #17630]
> +diff -ruN a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
> +--- a/stdio-common/tst-sscanf.c	2015-09-22 10:20:09.995596201 =
+0200
> ++++ b/stdio-common/tst-sscanf.c	2015-09-22 10:21:39.211791399 =
+0200
> +@@ -233,5 +233,38 @@
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
> +diff -ruN a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
> +--- a/stdio-common/vfscanf.c	2015-09-22 10:20:14.051423230 +0200
> ++++ b/stdio-common/vfscanf.c	2015-09-22 10:21:39.215791228 +0200
> +@@ -279,9 +279,10 @@
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
> +@@ -293,14 +294,13 @@
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
> diff --git a/meta/recipes-core/glibc/glibc_2.20.bb =
b/meta/recipes-core/glibc/glibc_2.20.bb
> index a0736cd..cfbc1c2 100644
> --- a/meta/recipes-core/glibc/glibc_2.20.bb
> +++ b/meta/recipes-core/glibc/glibc_2.20.bb
> @@ -48,6 +48,7 @@ CVEPATCHES =3D "\
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
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_1398C587-06E5-4396-9E09-A46889F8F3D4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZvZGoACgkQuwUzVZGdMxQnNgCfXArSIhZfeMauZyhrMLi27Xgc
YlEAn0anugZvlZPzfK6sJlauxgqqbDw5
=HUL1
-----END PGP SIGNATURE-----

--Apple-Mail=_1398C587-06E5-4396-9E09-A46889F8F3D4--
