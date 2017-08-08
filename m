Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 624DD7780D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:56:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d40so4770657wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=j5pwH3srN1V/JRIguCWgfYI89xQzGVA3ptwsq6aRYy4=;
	b=TlAtP87DtJDRvLiYg/K6JWWj9z8olk/7XLHJPphWzAFYnZXhBenuASYWIwV4q/uMuU
	QaGqWu7/F8aBR8UCvspUxBFoRnWKJmlosEs9/8PjjwF3pB3wwSjG9JOUswRm9qcwh+3S
	PbFmzrtetwD6o+26fOdn0L9mZxti5VjKWUWon44xdp5Mfl+/lRKevOgZx71Csh+I3Yz5
	qUAJhDJSXp7BkpdIOZp6SG9IjtGCZBbX+tA7b04qKoO4etx+cSgqnIVxOhJUARKT+gib
	EUxpjhwcFyWn5R1nAkXtaFHIReRpRVnmmPtbiq3/8Bn2usS1owqsHDN+y8lXyg9GFPJp
	bJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=j5pwH3srN1V/JRIguCWgfYI89xQzGVA3ptwsq6aRYy4=;
	b=c4IdbU+Gn+27GCFZxXvvkZtHg+J5HeXJwlaO04dYHkdf4TRERUfER/rGhiORWoRMR3
	PixjNCqzeZIpV+g1RkSYfnS0BgQiyE97/SylUoNqS7mT9CM2m0bZ08JyWH77qYFYn0ec
	hcqrJHYdiq1R4SgC6QSthWQXYr4t9lzaGUtI+Sz7++GobAu2YsYtp7/9wVtBrJYwDc4X
	brCj7fwWbN5z5DUgFefSKi72Q1B4hZiFmc0yg0RsDoVrIHlKQ1C/6SRnwGDyFQrlJu+f
	7vOfANubHHCcigqj3r0unq+1usVu7nu5y79Elq9RHMhhWiy6H7loZ3pc5HZACrbGpl2G
	359A==
X-Gm-Message-State: AHYfb5jRZwemz/lttoGXy0vUGu21+gm89XK8ppvmli9IC73foGg4CI5x
	u6oA6J1hYEnyRkKos6Vn7MgY80CXeQ==
X-Received: by 10.80.140.253 with SMTP id r58mr6036715edr.123.1502229393877;
	Tue, 08 Aug 2017 14:56:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 8 Aug 2017 14:56:03 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF3D353E@ALA-MBD.corp.ad.wrs.com>
References: <20170808201605.139537-1-jslater@windriver.com>
	<1502224623.1934.32.camel@linux.intel.com>
	<CA+chaQdH7vowdB3fTz41zgyF+SkHZGHn6qS6hvAH_AduL_wrDw@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF3D353E@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2017 14:56:03 -0700
Message-ID: <CAMKF1sq=8ONMQR7mwRB_TuA1EoYM4bBMfL5ntSrd6u2jGbToSA@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] php: move to version 7.1.8
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
X-List-Received-Date: Tue, 08 Aug 2017 21:56:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 8, 2017 at 1:40 PM, Slater, Joseph <joe.slater@windriver.com> w=
rote:
> I=E2=80=99ll look at the CVEs.  LICENSE updated from 2016 to 2017.  Text =
is the
> same.    Joe

I have posted an upgrade to 7.1.7 which addresses some of concerns
raised here plus build
fixes when compiling with clang.

https://patchwork.openembedded.org/series/8131/#

>
>
>
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, August 08, 2017 1:31 PM
> To: Leonardo Sandoval
> Cc: Slater, Joseph; Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [oe-core][PATCH 1/1] php: move to version 7.1.8
>
>
>
> And wrong ML
>
>
>
> On Tue, Aug 8, 2017 at 9:37 PM, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
> On Tue, 2017-08-08 at 13:16 -0700, Joe Slater wrote:
>> Fixes many CVEs.
>
> would be a plus if you list those.
>
> why LIC_FILES_CHKSUM changed?
>
> Leo
>
>
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> ---
>>  .../{php-7.1.0 =3D> php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch |=
 0
>>  meta-oe/recipes-devtools/php/{php_7.1.0.bb =3D> php_7.1.8.bb}         |=
 6
>> +++---
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-oe/recipes-devtools/php/{php-7.1.0 =3D>
>> php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
>>  rename meta-oe/recipes-devtools/php/{php_7.1.0.bb =3D> php_7.1.8.bb} (6=
4%)
>>
>> diff --git
>> a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LIN=
K.patch
>> b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LIN=
K.patch
>> similarity index 100%
>> rename from
>> meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.=
patch
>> rename to
>> meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.=
patch
>> diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb
>> b/meta-oe/recipes-devtools/php/php_7.1.8.bb
>> similarity index 64%
>> rename from meta-oe/recipes-devtools/php/php_7.1.0.bb
>> rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
>> index 210d91f..c0b2541 100644
>> --- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
>> +++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
>> @@ -1,10 +1,10 @@
>>  require php.inc
>>
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db602636d46a61c0ac0432bbf5c07=
8fe4"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc0af599f66d0461c5837c695fcbc=
5c1e"
>>
>>  SRC_URI +=3D "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
>> -SRC_URI[md5sum] =3D "54e364b60a88db77adb96aacb10f10a4"
>> -SRC_URI[sha256sum] =3D
>> "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25bbc9ec70995228e61"
>> +SRC_URI[md5sum] =3D "d22451dc20bbdf4b8bb656dc787c2a36"
>> +SRC_URI[sha256sum] =3D
>> "7064a00a9450565190890c7a4be04e646e0be73b2e0f8c46ae34419f343ca2f8"
>>
>>  PACKAGECONFIG[mysql] =3D
>> "--with-mysqli=3D${STAGING_BINDIR_CROSS}/mysql_config \
>>
>> --with-pdo-mysql=3D${STAGING_BINDIR_CROSS}/mysql_config \
>> --
>> 2.7.4
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

