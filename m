Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 11ED86FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 22:20:55 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bt5so68333165pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=gdNWSwJIwv86VBmZw66+BQ3wwVI431NTD2swpVxcM1Y=;
	b=bkU7+nOIQvJ5KLqHuN0AsIWanQ3hCKZmg0SIqsBVcvpquHKvib2JeTygBnjO3WVwlo
	tN/IPDZRCeSAREUTnhGQ2LVwszzYrWEpw+6+ERjTAY/r8AH6FDc0mzwRGJ7n8dk88UsA
	fhnynmPI8H9YBfaR0tWQJqYtvDHZOWcH7I+m7/ES2r4ndkT8ZVdhnlWRS3wi9HimOMay
	iDezE6y7cKP5Kqc+DWLlHEKZdDoaslTWpGEXg0fjBzKTACq+7UyKIwHiu6nxNpqyOIgy
	ZHs78SqJeRaGTmwxXC2HP2di9eDsB8AfQ4EfbQfuh/TeDWhP4cL+8XPywJT0xSatiWXu
	A77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=gdNWSwJIwv86VBmZw66+BQ3wwVI431NTD2swpVxcM1Y=;
	b=JagdfvXxvitawKDN2Mr89o2nOdwWMVkoXPRpHo1HIoAAGOVzSrxgNPqpteBoiqUe7G
	H/MdD3DwN1H9r7Yd81fTE1TRyGLp9nilcGQvfvLq0zwWG80dIyLqvJPLEOr6G39cHpgt
	mn2qYP050QNatdL9jAPRTkARRZnyiSiAupYAVMLT03U92iZuJ2NUbVd6WCL3rKlnm/DI
	C7uxULCBVX9nBcd6bQsrvnS3+DK1BLQH76nveTHuTH+Of/jBsYBESYLhrKcX54onmXg1
	Kynt3XjlrW8OGcuRCJwGCeTXY49wwy1UF68SM4cz2vzaNxsUwmQQG3zkNTNcac2dzz3Z
	zxGQ==
X-Gm-Message-State: AOPr4FWQNV3+h09BuCEVQYPFOq4L1N12z58g/T8gFmYgQsW3CYHKM2npERtr3iBCllySKQ==
X-Received: by 10.66.221.167 with SMTP id qf7mr48982976pac.94.1463437256411;
	Mon, 16 May 2016 15:20:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:15cc:8b3c:58b2:c775?
	([2601:646:8800:5a9a:15cc:8b3c:58b2:c775])
	by smtp.gmail.com with ESMTPSA id
	g77sm49417885pfg.78.2016.05.16.15.20.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 15:20:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <573A3DA4.9060900@linux.intel.com>
Date: Mon, 16 May 2016 15:20:51 -0700
Message-Id: <ED6AE2B4-1820-4EFA-A2DE-530EF0C3CB40@gmail.com>
References: <1463429996-24056-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
	<1407DCB5-D6A6-45D4-8F5B-DE43C8F74E59@gmail.com>
	<573A3DA4.9060900@linux.intel.com>
To: Plauchu Edwin <edwin.plauchu.camacho@linux.intel.com>
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
X-List-Received-Date: Mon, 16 May 2016 22:20:56 -0000
X-Groupsio-MsgNum: 82188
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FC3ACAF9-74A4-49EC-8A6E-C306BA2262BD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FC3ACAF9-74A4-49EC-8A6E-C306BA2262BD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 16, 2016, at 2:37 PM, Plauchu Edwin =
<edwin.plauchu.camacho@linux.intel.com> wrote:
>=20
>=20
>=20
> On 16/05/16 16:28, Khem Raj wrote:
>>> On May 16, 2016, at 1:19 PM, edwin.plauchu.camacho@linux.intel.com =
wrote:
>>>=20
>>> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>=20
>>> This patch avoids stat fails to compile with compiler flags which =
elevate common string formatting issues into an error (-Wformat =
-Wformat-security -Werror=3Dformat-security).
>>>=20
>>> [YOCTO #9550]
>>>=20
>>> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>> ---
>>> meta/conf/distro/include/security_flags.inc        |  1 -
>>> .../stat/stat-3.3/fix-security-format.patch        | 77 =
++++++++++++++++++++++
>>> meta/recipes-extended/stat/stat_3.3.bb             |  1 +
>>> 3 files changed, 78 insertions(+), 1 deletion(-)
>>> create mode 100644 =
meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>=20
>>> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
>>> index 7a91cec..5ae6dd8 100644
>>> --- a/meta/conf/distro/include/security_flags.inc
>>> +++ b/meta/conf/distro/include/security_flags.inc
>>> @@ -105,7 +105,6 @@ SECURITY_STRINGFORMAT_pn-gettext =3D ""
>>> SECURITY_STRINGFORMAT_pn-kexec-tools =3D ""
>>> SECURITY_STRINGFORMAT_pn-makedevs =3D ""
>>> SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
>>> -SECURITY_STRINGFORMAT_pn-stat =3D ""
>>> SECURITY_STRINGFORMAT_pn-unzip =3D ""
>>> SECURITY_STRINGFORMAT_pn-zip =3D ""
>>>=20
>>> diff --git =
a/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch =
b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>> new file mode 100644
>>> index 0000000..7d9f8df
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>> @@ -0,0 +1,77 @@
>>> +meta: recipes-extended: Fixing security formatting issues on stat
>>> +
>>> +Fix security formatting issues related to printf without NULL =
argument
>>> +
>>> +stat.c: In function 'print_human_access':
>>> +stat.c:292:13: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
>>> +     printf (access);
>>> +             ^
>>> +stat.c: In function 'print_human_time':
>>> +stat.c:299:57: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
>>> +   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>> +                                                         ^
>>> +stat.c: In function 'print_it':
>>> +stat.c:613:6: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
>>> +      printf(b);
>>> +      ^
>>> +stat.c:642:6: error: format not a string literal and no format =
arguments [-Werror=3Dformat-security]
>>> +      printf(b);
>>> +      ^
>>> +
>>> +[YOCTO #9550]
>>> +[https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9550]
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>> +
>>> +diff --git a/stat.c b/stat.c
>>> +index 1ed07a9..351ab54 100644
>>> +--- a/stat.c
>>> ++++ b/stat.c
>>> +@@ -21,6 +21,8 @@
>>> +
>>> + #include "fs.h"
>>> +
>>> ++#define __PRINT(STR) printf (STR,NULL)
>>> ++
>> Can we use proper formatting string here something like
>> printf(=E2=80=9C%s=E2=80=9D, access );
>>=20
>> or use fputs() Call instead
> With fputs we need to specify stdout stream and
> the printf "%s" option needs a little bit more processing in =
formatting.
>=20
> The actual change covers the security considerations with minimal add =
of NULL if you
> know why the another ways will be better please tell me.

First of all macros here make code quite unreadable.
secondly, I am just recommending how printf
is supposed to be used here,

int printf(const char *format, ...);

someone just missed specifying a formatting string.

>=20
> Thanks in advance
> Edwin Plauchu
>>=20
>>> + void print_human_type(unsigned short mode)
>>> + {
>>> +   switch (mode & S_IFMT)
>>> +@@ -289,15 +291,15 @@ void print_human_access(struct stat *statbuf)
>>> +     default:
>>> +       access[0] =3D '?';
>>> +     }
>>> +-    printf (access);
>>> ++    __PRINT(access);
>>> + }
>>> +
>>> + void print_human_time(time_t *t)
>>> + {
>>> +   char str[40];
>>> +
>>> +-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>> +-  else printf("Cannot calculate human readable time, sorry");
>>> ++  if (strftime(str, 40, "%c", localtime(t)) > 0) __PRINT(str);
>>> ++  else __PRINT("Cannot calculate human readable time, sorry");
>>> + }
>>> +
>>> + /* print statfs info */
>>> +@@ -610,7 +612,7 @@ void print_it(char *masterformat, char =
*filename,
>>> + 	{
>>> + 	    strcpy (pformat, "%");
>>> + 	    *m++ =3D '\0';
>>> +-	    printf(b);
>>> ++	    __PRINT(b);
>>> +
>>> + 	    /* copy all format specifiers to our format string */
>>> + 	    while (isdigit(*m) || strchr("#0-+. I", *m))
>>> +@@ -639,7 +641,7 @@ void print_it(char *masterformat, char =
*filename,
>>> + 	}
>>> + 	else
>>> + 	{
>>> +-	    printf(b);
>>> ++	    __PRINT(b);
>>> + 	    b =3D NULL;
>>> + 	}
>>> +     }
>>> diff --git a/meta/recipes-extended/stat/stat_3.3.bb =
b/meta/recipes-extended/stat/stat_3.3.bb
>>> index a5ece07..0697c73 100644
>>> --- a/meta/recipes-extended/stat/stat_3.3.bb
>>> +++ b/meta/recipes-extended/stat/stat_3.3.bb
>>> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYRIGHT;md5=3D39886b077fd072e876e5c4c16310b631 \
>>>                     file://GPL;md5=3D94d55d512a9ba36caa9b7df079bae19f"=

>>>=20
>>> SRC_URI =3D =
"http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
>>> +           file://fix-security-format.patch \
>>>            file://fix-error-return.patch"
>>>=20
>>> SRC_URI[md5sum] =3D "37e247e8e400ad9205f1b0500b728fd3"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_FC3ACAF9-74A4-49EC-8A6E-C306BA2262BD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6R8YACgkQuwUzVZGdMxRWUQCgh7wpE+0xqvvutvwrKY0l6Y36
tS4AnRritZs3srEDTtjLkbvqacoNRUzA
=cUJb
-----END PGP SIGNATURE-----

--Apple-Mail=_FC3ACAF9-74A4-49EC-8A6E-C306BA2262BD--
