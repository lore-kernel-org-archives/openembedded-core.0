Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 13F296FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 01:02:31 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g132so143123pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 18:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=/29MJPiMg2oSrl8hwCn5aOvSncmM8i1Y5qhUStrvAtc=;
	b=qVPv2ym2pIaYAxrHarCm3yAl4E/+xPLpRzcKu5zvbtAWJVeRJc0LBYWWgYoIGfyqGf
	V8NcaBG+DOTGUcHbw5MSNw7FHkQYOezzpfZfsT+J2KjjXElnU78rtS8grWnphDHjBNbG
	L5FyA4B6ixK4yc9Zm3UWy0rEs7lqz5q10k5uy3wAHGWhWzX6rjxf6+t09Kjvth5xzVgs
	WoaSzdpuO/GC5NB99glBBhVgJklQ13H5tXVDaBN788EQIhXoCzj5/OMApodpjnUSunH8
	R39q/ICBK3bBEixN26lUOtVwTZN873xjHjbV8BkjFHzYuNNtQ0FzCrA3az2xhZWj/arz
	qFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=/29MJPiMg2oSrl8hwCn5aOvSncmM8i1Y5qhUStrvAtc=;
	b=cUKP4/8ZuIEiOivqd/9VYporFkSb8LDghrxxgCz4KzMI/jrBLdKZ5SETn/5HWeafTV
	+8wXCOpUSQ1EggVuCPZ4LO0xY2le8OliqC8grpBe2v360PiJpr/d5rI+Ojq8sHZMj1VV
	0WNXspV7t2TIMzS9hrruIYwhemaL6TlQmCIM7I/yZRki5KFHQSuw1rtYTmeQEo9yVw1N
	dGvDX+byNx3QtNDMxdocUQHbjoPp1iuwq6EhFeAzLUHWeEscCpUVCReBwZ7NdTlAahbT
	7VKvuPUZysVrnXKDRC7cTmv9honssVkaWC1fNbAd2qkYYDQx0fIueBApHHHNt/maXxIo
	LArA==
X-Gm-Message-State: AOPr4FXVADobuj6ClX89S8SqHtxOtJxyZTIYkHXCDw5IKHKLEpgdSXD5hvkVQCB4U65V3A==
X-Received: by 10.98.99.66 with SMTP id x63mr49769851pfb.132.1463446952029;
	Mon, 16 May 2016 18:02:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5587:b1ab:c014:b8fd?
	([2601:646:8800:5a9a:5587:b1ab:c014:b8fd])
	by smtp.gmail.com with ESMTPSA id ym8sm127892pab.22.2016.05.16.18.02.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 18:02:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <573A641D.90808@linux.intel.com>
Date: Mon, 16 May 2016 18:02:27 -0700
Message-Id: <57F72925-B08E-45A1-A259-EDE409DC21C2@gmail.com>
References: <1463429996-24056-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
	<1407DCB5-D6A6-45D4-8F5B-DE43C8F74E59@gmail.com>
	<573A3DA4.9060900@linux.intel.com>
	<1463437315.2768.29.camel@intel.com>
	<573A641D.90808@linux.intel.com>
To: Plauchu Edwin <edwin.plauchu.camacho@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 17 May 2016 01:02:34 -0000
X-Groupsio-MsgNum: 82194
Content-Type: multipart/signed;
	boundary="Apple-Mail=_62818684-19E1-4DC2-AB95-1F4EC74DD331";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_62818684-19E1-4DC2-AB95-1F4EC74DD331
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 16, 2016, at 5:21 PM, Plauchu Edwin =
<edwin.plauchu.camacho@linux.intel.com> wrote:
>=20
> Ok Bill
>=20
> I rewrote the patch without using macros =
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121581.=
html
>=20

you did not address the other comment about using printf properly.

> On 16/05/16 17:21, Randle, William C wrote:
>> On Mon, 2016-05-16 at 16:37 -0500, Plauchu Edwin wrote:
>>> On 16/05/16 16:28, Khem Raj wrote:
>>>>> On May 16, 2016, at 1:19 PM, edwin.plauchu.camacho@linux.intel.com =
wrote:
>>>>>=20
>>>>> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>>>=20
>>>>> This patch avoids stat fails to compile with compiler flags which =
elevate
>>>>> common string formatting issues into an error (-Wformat =
-Wformat-security
>>>>> -Werror=3Dformat-security).
>>>>>=20
>>>>> [YOCTO #9550]
>>>>>=20
>>>>> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>>> ---
>>>>> meta/conf/distro/include/security_flags.inc        |  1 -
>>>>> .../stat/stat-3.3/fix-security-format.patch        | 77
>>>>> ++++++++++++++++++++++
>>>>> meta/recipes-extended/stat/stat_3.3.bb             |  1 +
>>>>> 3 files changed, 78 insertions(+), 1 deletion(-)
>>>>> create mode 100644 =
meta/recipes-extended/stat/stat-3.3/fix-security-
>>>>> format.patch
>>>>>=20
>>>>> diff --git a/meta/conf/distro/include/security_flags.inc
>>>>> b/meta/conf/distro/include/security_flags.inc
>>>>> index 7a91cec..5ae6dd8 100644
>>>>> --- a/meta/conf/distro/include/security_flags.inc
>>>>> +++ b/meta/conf/distro/include/security_flags.inc
>>>>> @@ -105,7 +105,6 @@ SECURITY_STRINGFORMAT_pn-gettext =3D ""
>>>>> SECURITY_STRINGFORMAT_pn-kexec-tools =3D ""
>>>>> SECURITY_STRINGFORMAT_pn-makedevs =3D ""
>>>>> SECURITY_STRINGFORMAT_pn-oh-puzzles =3D ""
>>>>> -SECURITY_STRINGFORMAT_pn-stat =3D ""
>>>>> SECURITY_STRINGFORMAT_pn-unzip =3D ""
>>>>> SECURITY_STRINGFORMAT_pn-zip =3D ""
>>>>>=20
>>>>> diff --git =
a/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>>> b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>>> new file mode 100644
>>>>> index 0000000..7d9f8df
>>>>> --- /dev/null
>>>>> +++ =
b/meta/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>>>> @@ -0,0 +1,77 @@
>>>>> +meta: recipes-extended: Fixing security formatting issues on stat
>>>>> +
>>>>> +Fix security formatting issues related to printf without NULL =
argument
>>>>> +
>>>>> +stat.c: In function 'print_human_access':
>>>>> +stat.c:292:13: error: format not a string literal and no format =
arguments
>>>>> [-Werror=3Dformat-security]
>>>>> +     printf (access);
>>>>> +             ^
>>>>> +stat.c: In function 'print_human_time':
>>>>> +stat.c:299:57: error: format not a string literal and no format =
arguments
>>>>> [-Werror=3Dformat-security]
>>>>> +   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>>>> +                                                         ^
>>>>> +stat.c: In function 'print_it':
>>>>> +stat.c:613:6: error: format not a string literal and no format =
arguments
>>>>> [-Werror=3Dformat-security]
>>>>> +      printf(b);
>>>>> +      ^
>>>>> +stat.c:642:6: error: format not a string literal and no format =
arguments
>>>>> [-Werror=3Dformat-security]
>>>>> +      printf(b);
>>>>> +      ^
>>>>> +
>>>>> +[YOCTO #9550]
>>>>> +[https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9550]
>>>>> +
>>>>> +Upstream-Status: Pending
>>>>> +
>>>>> +Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>>>> +
>>>>> +diff --git a/stat.c b/stat.c
>>>>> +index 1ed07a9..351ab54 100644
>>>>> +--- a/stat.c
>>>>> ++++ b/stat.c
>>>>> +@@ -21,6 +21,8 @@
>>>>> +
>>>>> + #include "fs.h"
>>>>> +
>>>>> ++#define __PRINT(STR) printf (STR,NULL)
>>>>> ++
>>>> Can we use proper formatting string here something like
>>>> printf(=E2=80=9C%s=E2=80=9D, access );
>>>>=20
>>>> or use fputs() Call instead
>>> With fputs we need to specify stdout stream and
>>> the printf "%s" option needs a little bit more processing in =
formatting.
>>>=20
>>> The actual change covers the security considerations with minimal =
add of
>>> NULL if you
>>> know why the another ways will be better please tell me.
>>>=20
>>> Thanks in advance
>>> Edwin Plauchu
>>>>=20
>>>>> + void print_human_type(unsigned short mode)
>>>>> + {
>>>>> +   switch (mode & S_IFMT)
>>>>> +@@ -289,15 +291,15 @@ void print_human_access(struct stat =
*statbuf)
>>>>> +     default:
>>>>> +       access[0] =3D '?';
>>>>> +     }
>>>>> +-    printf (access);
>>>>> ++    __PRINT(access);
>>>>> + }
>>>>> +
>>>>> + void print_human_time(time_t *t)
>>>>> + {
>>>>> +   char str[40];
>>>>> +
>>>>> +-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>>>> +-  else printf("Cannot calculate human readable time, sorry");
>>>>> ++  if (strftime(str, 40, "%c", localtime(t)) > 0) __PRINT(str);
>>>>> ++  else __PRINT("Cannot calculate human readable time, sorry");
>>>>> + }
>>>>> +
>>>>> + /* print statfs info */
>>>>> +@@ -610,7 +612,7 @@ void print_it(char *masterformat, char =
*filename,
>>>>> + 	{
>>>>> + 	    strcpy (pformat, "%");
>>>>> + 	    *m++ =3D '\0';
>>>>> +-	    printf(b);
>>>>> ++	    __PRINT(b);
>>>>> +
>>>>> + 	    /* copy all format specifiers to our format string =
*/
>>>>> + 	    while (isdigit(*m) || strchr("#0-+. I", *m))
>>>>> +@@ -639,7 +641,7 @@ void print_it(char *masterformat, char =
*filename,
>>>>> + 	}
>>>>> + 	else
>>>>> + 	{
>>>>> +-	    printf(b);
>>>>> ++	    __PRINT(b);
>>>>> + 	    b =3D NULL;
>>>>> + 	}
>>>>> +     }
>>=20
>> Is there a particular reason you used a macro for this package when =
all the
>> others you submitted so far use printf(arg, NULL) directly? I think =
it would be
>> good to be consistent.
>>=20
>>     -Bill
>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_62818684-19E1-4DC2-AB95-1F4EC74DD331
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6baYACgkQuwUzVZGdMxR2RQCfQmq2CbgPo9ULDq1mqvAFcZ7p
rBoAmQEFLCX+l3aEG/+Se9c6sq/Q6cmI
=YrnO
-----END PGP SIGNATURE-----

--Apple-Mail=_62818684-19E1-4DC2-AB95-1F4EC74DD331--
