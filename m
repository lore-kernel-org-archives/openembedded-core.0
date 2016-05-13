Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 80C13605FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 18:07:15 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 145so9863726pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 11:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=BQd9lGpkYLTDmL4x3kLMOV1iAEk48pWXIdjuBBNZnPY=;
	b=RA0f/nTgtV2eu7rQChGonks1xeSqANiKg6VTQB2MzTmxS0YykAK50qFWRN93pfNh5h
	imvTnON3NpDWodrFzeSWfjiUNlgnnMxhu/CbxWgh2KIZShypsdusnE9y9JusiIjhQrrq
	HMNBy2rhRjL0DFzQFMmmRagp9KTR+UF9Oheo8XH2uz/KuLHzZrfS9BuwhY97mmGa9EPI
	h1XTfyyrtPTxrIGZRSrQ5YpHPw1PjGZwd7DZbJuOULbrknVWzYEwSndAAOh3ykN26uYm
	lO/0EHyPF42OZwzOtqLwDjDDA1H4+UUTSODbSb/iGbADw67aNDFSrPunvx8MD/Jf7WLj
	w9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BQd9lGpkYLTDmL4x3kLMOV1iAEk48pWXIdjuBBNZnPY=;
	b=gVrrSQBYL/R26iXFcJRV/SbNpWZ9ta7sedZmm0iSq9M62ap38ToDum+C77+w4NAOKZ
	W5OonkpWbDdCyFnjD8IOrj6vlaARKHJsLodZho2s0GvkEKi7Uuv9bEX5fdPQUjlyBq92
	jgNNSRrLxpCVbWS0iYxbVsYO2lOKidJ4dHfYyO+7bHmNpiQUzrB4Zgx2zOxP8RoRDBkQ
	xEC+IjivyGPEeu/xUwJK5Kc055JW/0yQK5ZoGLjkeo7nOpap2Bz4pnEyeRQI04x3Jp1E
	iBf5XipuLzFcgM53xxIV5NkGpOcYTx5Ij+HKf1/1NGNouqjkI756dYCxdT0pEZzZHdIQ
	RreQ==
X-Gm-Message-State: AOPr4FXcFU5yaD6vV/BtOQUD08rg4H9ecWsImIajIPyOdNrD2Anb1CNp70x9kVxakJDccA==
X-Received: by 10.98.51.132 with SMTP id z126mr24913674pfz.23.1463162836732;
	Fri, 13 May 2016 11:07:16 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:90dc:14f3:602d:85ba?
	([2601:646:8800:5a9a:90dc:14f3:602d:85ba])
	by smtp.gmail.com with ESMTPSA id
	y128sm29010541pfb.13.2016.05.13.11.07.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 11:07:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5735FDE6.7040905@gmail.com>
Date: Fri, 13 May 2016 11:07:11 -0700
Message-Id: <6A115323-D3B1-4B36-AE2F-C9B38AC329D6@gmail.com>
References: <1462518717-2629-1-git-send-email-akuster808@gmail.com>
	<1462518717-2629-4-git-send-email-akuster808@gmail.com>
	<5735FDE6.7040905@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH 4/4] gcc: Security fix CVE-2016-4490
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
X-List-Received-Date: Fri, 13 May 2016 18:07:16 -0000
X-Groupsio-MsgNum: 82086
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C90A28B1-A65B-4533-ACCB-B2708954F78D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C90A28B1-A65B-4533-ACCB-B2708954F78D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks for noting. We will update gcc-6 to latest on gcc-6 branch =
sometime later and hopefully it will come in
please keep an eye on it

> On May 13, 2016, at 9:16 AM, akuster808 <akuster808@gmail.com> wrote:
>=20
> this fix is not in gcc 6.0
>=20
> On 05/06/2016 12:11 AM, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>=20
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>> meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
>> .../gcc/gcc-5.3/CVE-2016-4490.patch                | 270 =
+++++++++++++++++++++
>> 2 files changed, 271 insertions(+)
>> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc =
b/meta/recipes-devtools/gcc/gcc-5.3.inc
>> index 5fede2a..445d003 100644
>> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
>> @@ -91,6 +91,7 @@ SRC_URI =3D "\
>>            file://CVE-2016-4488.patch \
>>            file://CVE-2016-4489.patch \
>>            file://CVE-2016-2226.patch \
>> +           file://CVE-2016-4490.patch \
>> "
>>=20
>> BACKPORTS =3D ""
>> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch =
b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
>> new file mode 100644
>> index 0000000..4a9ed69
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
>> @@ -0,0 +1,270 @@
>> +=46rom 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 =
2001
>> +From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
>> +Date: Mon, 2 May 2016 17:06:40 +0000
>> +Subject: [PATCH] =
=3D?UTF-8?q?Demangler=3D20integer=3D20overflow=3D20fixes=3D20from?=3D
>> + =3D?UTF-8?q?=3D20Marcel=3D20B=3DC3=3DB6hme.?=3D
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +	PR c++/70498
>> +	* cp-demangle.c: Parse numbers as integer instead of long to =
avoid
>> +	overflow after sanity checks. Include <limits.h> if available.
>> +	(INT_MAX): Define if necessary.
>> +	(d_make_template_param): Takes integer argument instead of long.
>> +	(d_make_function_param): Likewise.
>> +	(d_append_num): Likewise.
>> +	(d_identifier): Likewise.
>> +	(d_number): Parse as and return integer.
>> +	(d_compact_number): Handle overflow.
>> +	(d_source_name): Change variable type to integer for parsed =
number.
>> +	(d_java_resource): Likewise.
>> +	(d_special_name): Likewise.
>> +	(d_discriminator): Likewise.
>> +	(d_unnamed_type): Likewise.
>> +	* testsuite/demangle-expected: Add regression test cases.
>> +
>> +
>> +
>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 =
138bc75d-0d04-0410-961f-82ee72b054a4
>> +
>> +Upstream-Status: Backport
>> +
>> +CVE: CVE-2016-4490
>> +hand applied ChangeLog
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + libiberty/ChangeLog                   | 19 +++++++++++++
>> + libiberty/cp-demangle.c               | 52 =
++++++++++++++++++++---------------
>> + libiberty/testsuite/demangle-expected | 14 ++++++++--
>> + 3 files changed, 61 insertions(+), 24 deletions(-)
>> +
>> +Index: gcc-5.3.0/libiberty/cp-demangle.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-5.3.0.orig/libiberty/cp-demangle.c
>> ++++ gcc-5.3.0/libiberty/cp-demangle.c
>> +@@ -124,6 +124,13 @@ extern char *alloca ();
>> + # endif /* alloca */
>> + #endif /* HAVE_ALLOCA_H */
>> +
>> ++#ifdef HAVE_LIMITS_H
>> ++#include <limits.h>
>> ++#endif
>> ++#ifndef INT_MAX
>> ++# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* =
0x7FFFFFFF */
>> ++#endif
>> ++
>> + #include "ansidecl.h"
>> + #include "libiberty.h"
>> + #include "demangle.h"
>> +@@ -394,7 +401,7 @@ d_make_dtor (struct d_info *, enum gnu_v
>> +              struct demangle_component *);
>> +
>> + static struct demangle_component *
>> +-d_make_template_param (struct d_info *, long);
>> ++d_make_template_param (struct d_info *, int);
>> +
>> + static struct demangle_component *
>> + d_make_sub (struct d_info *, const char *, int);
>> +@@ -417,7 +424,7 @@ static struct demangle_component *d_unqu
>> +
>> + static struct demangle_component *d_source_name (struct d_info *);
>> +
>> +-static long d_number (struct d_info *);
>> ++static int d_number (struct d_info *);
>> +
>> + static struct demangle_component *d_identifier (struct d_info *, =
int);
>> +
>> +@@ -1105,7 +1112,7 @@ d_make_dtor (struct d_info *di, enum gnu
>> + /* Add a new template parameter.  */
>> +
>> + static struct demangle_component *
>> +-d_make_template_param (struct d_info *di, long i)
>> ++d_make_template_param (struct d_info *di, int i)
>> + {
>> +   struct demangle_component *p;
>> +
>> +@@ -1121,7 +1128,7 @@ d_make_template_param (struct d_info *di
>> + /* Add a new function parameter.  */
>> +
>> + static struct demangle_component *
>> +-d_make_function_param (struct d_info *di, long i)
>> ++d_make_function_param (struct d_info *di, int i)
>> + {
>> +   struct demangle_component *p;
>> +
>> +@@ -1595,7 +1602,7 @@ d_unqualified_name (struct d_info *di)
>> + static struct demangle_component *
>> + d_source_name (struct d_info *di)
>> + {
>> +-  long len;
>> ++  int len;
>> +   struct demangle_component *ret;
>> +
>> +   len =3D d_number (di);
>> +@@ -1608,12 +1615,12 @@ d_source_name (struct d_info *di)
>> +
>> + /* number ::=3D [n] <(non-negative decimal integer)>  */
>> +
>> +-static long
>> ++static int
>> + d_number (struct d_info *di)
>> + {
>> +   int negative;
>> +   char peek;
>> +-  long ret;
>> ++  int ret;
>> +
>> +   negative =3D 0;
>> +   peek =3D d_peek_char (di);
>> +@@ -1840,7 +1847,7 @@ d_java_resource (struct d_info *di)
>> + {
>> +   struct demangle_component *p =3D NULL;
>> +   struct demangle_component *next =3D NULL;
>> +-  long len, i;
>> ++  int len, i;
>> +   char c;
>> +   const char *str;
>> +
>> +@@ -1982,7 +1989,7 @@ d_special_name (struct d_info *di)
>> + 	case 'C':
>> + 	  {
>> + 	    struct demangle_component *derived_type;
>> +-	    long offset;
>> ++	    int offset;
>> + 	    struct demangle_component *base_type;
>> +
>> + 	    derived_type =3D cplus_demangle_type (di);
>> +@@ -2905,10 +2912,10 @@ d_pointer_to_member_type (struct d_info
>> +
>> + /* <non-negative number> _ */
>> +
>> +-static long
>> ++static int
>> + d_compact_number (struct d_info *di)
>> + {
>> +-  long num;
>> ++  int num;
>> +   if (d_peek_char (di) =3D=3D '_')
>> +     num =3D 0;
>> +   else if (d_peek_char (di) =3D=3D 'n')
>> +@@ -2916,7 +2923,7 @@ d_compact_number (struct d_info *di)
>> +   else
>> +     num =3D d_number (di) + 1;
>> +
>> +-  if (! d_check_char (di, '_'))
>> ++  if (num < 0 || ! d_check_char (di, '_'))
>> +     return -1;
>> +   return num;
>> + }
>> +@@ -2928,7 +2935,7 @@ d_compact_number (struct d_info *di)
>> + static struct demangle_component *
>> + d_template_param (struct d_info *di)
>> + {
>> +-  long param;
>> ++  int param;
>> +
>> +   if (! d_check_char (di, 'T'))
>> +     return NULL;
>> +@@ -3130,9 +3137,10 @@ d_expression_1 (struct d_info *di)
>> + 	}
>> +       else
>> + 	{
>> +-	  index =3D d_compact_number (di) + 1;
>> +-	  if (index =3D=3D 0)
>> ++	  index =3D d_compact_number (di);
>> ++	  if (index =3D=3D INT_MAX || index =3D=3D -1)
>> + 	    return NULL;
>> ++	  index ++;
>> + 	}
>> +       return d_make_function_param (di, index);
>> +     }
>> +@@ -3455,7 +3463,7 @@ d_local_name (struct d_info *di)
>> + static int
>> + d_discriminator (struct d_info *di)
>> + {
>> +-  long discrim;
>> ++  int discrim;
>> +
>> +   if (d_peek_char (di) !=3D '_')
>> +     return 1;
>> +@@ -3511,7 +3519,7 @@ static struct demangle_component *
>> + d_unnamed_type (struct d_info *di)
>> + {
>> +   struct demangle_component *ret;
>> +-  long num;
>> ++  int num;
>> +
>> +   if (! d_check_char (di, 'U'))
>> +     return NULL;
>> +@@ -4037,10 +4045,10 @@ d_append_string (struct d_print_info *dp
>> + }
>> +
>> + static inline void
>> +-d_append_num (struct d_print_info *dpi, long l)
>> ++d_append_num (struct d_print_info *dpi, int l)
>> + {
>> +   char buf[25];
>> +-  sprintf (buf,"%ld", l);
>> ++  sprintf (buf,"%d", l);
>> +   d_append_string (dpi, buf);
>> + }
>> +
>> +Index: gcc-5.3.0/libiberty/testsuite/demangle-expected
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-5.3.0.orig/libiberty/testsuite/demangle-expected
>> ++++ gcc-5.3.0/libiberty/testsuite/demangle-expected
>> +@@ -4357,12 +4357,22 @@ _QueueNotification_QueueController__$4PP
>> + _Z1fSsB3fooS_
>> + f(std::string[abi:foo], std::string[abi:foo])
>> + #
>> +-# Tests a use-after-free problem
>> ++# Tests a use-after-free problem PR70481
>> +
>> + _Q.__0
>> + ::Q.(void)
>> + #
>> +-# Tests a use-after-free problem
>> ++# Tests a use-after-free problem PR70481
>> +
>> + _Q10-__9cafebabe.
>> + cafebabe.::-(void)
>> ++#
>> ++# Tests integer overflow problem PR70492
>> ++
>> ++__vt_90000000000cafebabe
>> ++__vt_90000000000cafebabe
>> ++#
>> ++# Tests write access violation PR70498
>> ++
>> ++_Z80800000000000000000000
>> ++_Z80800000000000000000000
>> +Index: gcc-5.3.0/libiberty/ChangeLog
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-5.3.0.orig/libiberty/ChangeLog
>> ++++ gcc-5.3.0/libiberty/ChangeLog
>> +@@ -1,3 +1,22 @@
>> ++2016-05-02  Marcel B=C3=B6hme  <boehme.marcel@gmail.com>
>> ++
>> ++   PR c++/70498
>> ++   * cp-demangle.c: Parse numbers as integer instead of long to =
avoid
>> ++   overflow after sanity checks. Include <limits.h> if available.
>> ++   (INT_MAX): Define if necessary.
>> ++   (d_make_template_param): Takes integer argument instead of long.
>> ++   (d_make_function_param): Likewise.
>> ++   (d_append_num): Likewise.
>> ++   (d_identifier): Likewise.
>> ++   (d_number): Parse as and return integer.
>> ++   (d_compact_number): Handle overflow.
>> ++   (d_source_name): Change variable type to integer for parsed =
number.
>> ++   (d_java_resource): Likewise.
>> ++   (d_special_name): Likewise.
>> ++   (d_discriminator): Likewise.
>> ++   (d_unnamed_type): Likewise.
>> ++   * testsuite/demangle-expected: Add regression test cases.
>> ++
>> + 2016-04-08  Marcel B=C3=B6hme  <boehme.marcel@gmail.com>
>> +
>> + 	PR c++/69687
>>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C90A28B1-A65B-4533-ACCB-B2708954F78D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc2F9MACgkQuwUzVZGdMxR5qACeLBPiovTJmh2U75ztRLtj3uUW
23MAnRI5sHfXxBTVn4j7LkL1OtdKbdRy
=BYHQ
-----END PGP SIGNATURE-----

--Apple-Mail=_C90A28B1-A65B-4533-ACCB-B2708954F78D--
