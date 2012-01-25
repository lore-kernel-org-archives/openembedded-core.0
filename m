Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rq4Qy-0004Uf-UR
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 16:06:49 +0100
Received: by lags15 with SMTP id s15so3051591lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 06:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=DCOPS8V/vZbCW7YVYc+C+llNhcsl7+uQe5nwlnWmmBw=;
	b=jwtsj/X7KFsEJ0CKkNL6EtBcFEh406JwXWN3Q5K3w++rW6wc3XRqGF+cLQNpPuEtqU
	3c71akyyQzfAztX75lz7fQmyQGLcQxA5/cStoE1LQ+wNowbbM6/ZvmwRzNML8Wtpp3OI
	cvvpnoYlH8q441HaLg7MDC/kSWV8pcKo1szAo=
Received: by 10.112.86.67 with SMTP id n3mr4398573lbz.29.1327503542311; Wed,
	25 Jan 2012 06:59:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 06:58:31 -0800 (PST)
In-Reply-To: <1327494745.19643.222.camel@ted>
References: <cover.1327426808.git.raj.khem@gmail.com>
	<3fb1ade006bc2d93226724eab047b9ecd49e2525.1327426808.git.raj.khem@gmail.com>
	<1327494745.19643.222.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 06:58:31 -0800
Message-ID: <CAMKF1soa1b_X-aAVCgTuCwXC-yGoXLf6Qu_yrAyMJoz8jKu3qw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] gdb-common: Drop elfutils from DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 15:06:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 4:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-01-24 at 09:42 -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/gdb/gdb-common.inc | =C2=A0 =C2=A06 +++---
>> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-dev=
tools/gdb/gdb-common.inc
>> index d728139..930a71b 100644
>> --- a/meta/recipes-devtools/gdb/gdb-common.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "gdb - GNU debugger"
>> =C2=A0HOMEPAGE =3D "http://www.gnu.org/software/gdb/"
>> =C2=A0LICENSE=3D"GPLv3+"
>> =C2=A0SECTION =3D "devel"
>> -DEPENDS =3D "ncurses readline elfutils ${LTTNGUST}"
>> +DEPENDS =3D "ncurses readline ${LTTNGUST}"
>>
>> =C2=A0LTTNGUST =3D "lttng-ust"
>> =C2=A0LTTNGUST_libc-uclibc =3D ""
>> @@ -11,7 +11,7 @@ LTTNGUST_mipsel =3D ""
>> =C2=A0LTTNGUST_mips64 =3D ""
>> =C2=A0LTTNGUST_mips64el =3D ""
>>
>> -INC_PR =3D "r4"
>> +INC_PR =3D "r5"
>>
>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4ad=
b9f9f6552 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYING.LIB;md5=
=3D9f604d8a4f8e74f4f5140845a21b6674 \
>> @@ -40,7 +40,7 @@ EXPAT =3D "--without-expat"
>>
>> =C2=A0EXTRA_OECONF =3D "--disable-gdbtk --disable-tui --disable-x \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-cur=
ses --disable-multilib --with-system-readline --disable-sim \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GDBPROPREFIX}=
 --with-libelf=3D${STAGING_DIR_TARGET} ${EXPAT} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GDBPROPREFIX}=
 ${EXPAT} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_co=
ntains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> very good, but why?

Nitin added it to overcome a build break in 7.1 there seem to be no other r=
eason
to have it in if 7.3 builds ok without it. Since libelf does not build
with uclibc this was
breaking target gdb builds with uclibc. I could make it conditional
like ust too but it seems to be not needed.

>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


