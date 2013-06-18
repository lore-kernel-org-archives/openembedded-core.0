Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C9C54601DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:19:06 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so4101116pab.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to; bh=tTKrVTUDLA5h4H7VwSWcqON8Y821ZofJ9wLrV1KojTo=;
	b=miORpRDaZkMdXJ3AB/Kh1EjXc5MSDRZLupWA6KeH57o7+RG/kRkvtLRe8yP6lAknmb
	xC5o2yzCly+5wR9RzbuDWiqTSmO9Tta5BgB42BNmCL/iqMpLFg/904hRzyc0sBK+NOIg
	bMZyonjirDvWnQQRkkWdrOjixZDwQvYYyJOgWiUkGOKF/YpDRJ9sRWiR9vkSx49xa9t8
	urVZWNhvtlKf8yHCk/g0OB90A84ZGCHdN8PQD9MPltUCi2dFmZt73U2Rb0MRqi0uwTBc
	0k3T4SLZ+FjME/IOlbTSgQV/2JgH7/lBwuIFTpC/1VrRkBLe9KWvwS79RDfF8KFL3dUi
	DXIQ==
X-Received: by 10.66.100.201 with SMTP id fa9mr2573296pab.120.1371568747562;
	Tue, 18 Jun 2013 08:19:07 -0700 (PDT)
Received: from [192.168.0.6] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209]) by mx.google.com with ESMTPSA id
	re16sm20074392pac.16.2013.06.18.08.19.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 08:19:06 -0700 (PDT)
References: <cover.1371535277.git.rongqing.li@windriver.com>
	<0a46b955bf906f9ce2c6a9045c740ac44a1b0959.1371535277.git.rongqing.li@windriver.com>
	<51C06C13.3030104@windriver.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <51C06C13.3030104@windriver.com>
Message-Id: <69CD9BED-59F0-4011-BB22-F234D0C03051@gmail.com>
X-Mailer: iPad Mail (10B329)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2013 08:19:07 -0700
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cairo: fix build error since toolchain has not get_feature command
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
X-List-Received-Date: Tue, 18 Jun 2013 15:19:07 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



On Jun 18, 2013, at 7:17 AM, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 6/18/13 1:02 AM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>=20
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>  ...-check-stderr-when-test-compiling-in-conf.patch |   39 ++++++++++++++=
++++++
>>  meta/recipes-graphics/cairo/cairo_1.12.14.bb       |    3 +-
>>  2 files changed, 41 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-graphics/cairo/cairo/cairo-don-t-check-s=
tderr-when-test-compiling-in-conf.patch
>>=20
>> diff --git a/meta/recipes-graphics/cairo/cairo/cairo-don-t-check-stderr-w=
hen-test-compiling-in-conf.patch b/meta/recipes-graphics/cairo/cairo/cairo-d=
on-t-check-stderr-when-test-compiling-in-conf.patch
>> new file mode 100644
>> index 0000000..e04c3b2
>> --- /dev/null
>> +++ b/meta/recipes-graphics/cairo/cairo/cairo-don-t-check-stderr-when-tes=
t-compiling-in-conf.patch
>> @@ -0,0 +1,39 @@
>> +=46rom 1581e5373c5917ed8ff6f7129c51160594c927d1 Mon Sep 17 00:00:00 2001=

>> +From: "Song.Li" <Song.Li@windriver.com>
>> +Date: Mon, 30 Jul 2012 16:38:02 +0800
>> +Subject: [PATCH] cairo:don't check stderr when test compiling in configu=
re
>> +
>> +Upstream-Status: Pending
>> +
>> +cairo configure use a special macro to test compiling feature.
>> +It'll require no any warnings or errors in stderr.That is too strict.
>> +for example, when there is no get_feature in gcc,
>> +gcc will print "no get_feature" in stderr, but that is not a real error.=

>=20
> FYI -- 'get_feature' is something specific to Wind River.  The patch is st=
ill reasonable, but the commit description might need some cleanup for peopl=
e not familiar with some of our internal tools.
>=20

I am still confused what does it fix in existing build

> I'd suggest just removing the example part.
>=20
> --Mark
>=20
>> +so let cairo don't check stderr,just check the return value of compiling=

>> +is enough.
>> +
>> +Signed-off-by: Song.Li <Song.Li@windriver.com>
>> +---
>> + build/aclocal.cairo.m4 |    6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/build/aclocal.cairo.m4 b/build/aclocal.cairo.m4
>> +index 592e168..4de3b26 100644
>> +--- a/build/aclocal.cairo.m4
>> ++++ b/build/aclocal.cairo.m4
>> +@@ -106,9 +106,9 @@ AC_DEFUN([CAIRO_CC_TRY_LINK_WITH_ENV_SILENT],[dnl
>> +        [cairo_cc_stderr=3D`test -f conftest.err && cat conftest.err`
>> +         cairo_cc_flag=3Dno])
>> +
>> +-    if test "x$cairo_cc_stderr" !=3D "x"; then
>> +-        cairo_cc_flag=3Dno
>> +-    fi
>> ++dnl    if test "x$cairo_cc_stderr" !=3D "x"; then
>> ++dnl        cairo_cc_flag=3Dno
>> ++dnl    fi
>> +
>> +    if test "x$cairo_cc_flag" =3D "xyes"; then
>> +        ifelse([$3], , :, [$3])
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb b/meta/recipes-=
graphics/cairo/cairo_1.12.14.bb
>> index 40aa169..5c8c9cd 100644
>> --- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
>> +++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
>> @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72b5=
ac9012424fa157ad77"
>>  PR =3D "r0"
>>=20
>>  SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
>> -           file://png.patch"
>> +           file://png.patch \
>> +           file://cairo-don-t-check-stderr-when-test-compiling-in-conf.p=
atch"
>>=20
>>  SRC_URI[md5sum] =3D "27b634113d0f52152d60ae8e2ec7daa7"
>>  SRC_URI[sha256sum] =3D "96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4=
f3a83847dff4ac13"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

