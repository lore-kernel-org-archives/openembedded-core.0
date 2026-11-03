Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6250.1793693308965790788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 00:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=JcuFuryR;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so39254935e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793693307; x=1794298107; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZPs/6zjZrak6/gdRqYXFVZ/EPSwQaWOMBHb06FiBro=;
        b=JcuFuryREP1ymweal6lyShzz9CSzLA0kOxU/nTQaV1/4fGt27FsiCWjLRUc/A4zn8Q
         LM1XeegrwMWkrEkXJDmWewEtGLMMldHHqiEo8IICbrqyys3vdKs3ezyk7yZxIXHcip7T
         NhjqmqpFUGf54/+B8hslZLQRK65g7x1tx8TwM9SyH8NQpJR1E+dLUfguPQye8eSlUt73
         M1QUbe5Qeslgk5DFKkE9C/VfVinnMjcwHM0dFXH9bB3rhavtYKe3SLwOmKn3DKpI+OqJ
         Bj9GhR6qb2vbiHVvdus8dk/t9T1Ugo+S4b22ZgBqqZyOgJ/l699ssJo7t2MfAuYHQPls
         INEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693307; x=1794298107;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZPs/6zjZrak6/gdRqYXFVZ/EPSwQaWOMBHb06FiBro=;
        b=aF6e2JFxPMzabf+DRgNS5dGZnV6jfrIJ+AXaha+SFzkNSlP/JFhDAPsOl7mFDmxl6e
         EURAWtfpc7Lme+7ruJUgKr740/OxuWZ5wtn7mu11fjn3NaNC7L/018SNB7PL7oODlxv7
         oFKpLdN99MEkkpNgV3E7M6fjCviT6Pmx+9VWNTBKmfgretR78M8kkRII2A3FBasoIP8h
         oohMZF2qCGRBSTZ//PjlzCuJ4x4VUWggwmxDw3TVLzk8ESpvHN08PirqEm+avO7hp5pv
         LIF53N/Bmcs3XH6BghNZwV9Yrgchq+KWECVS9ffE3Q2gzQqDl2w+A1vYfdDCzTVP1JDv
         Zkyw==
X-Forwarded-Encrypted: i=1; AKwUvBzMyLbpyOgGjocNnD0dZUc3bvVkqljmkyoS7YbJ2HNKf8n8bWdymng/nphdOQU67FUFKs48FTnLY5ZZLt7tzse5ZQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8TsZ5W2KYLoS5h7iMtMXArfxNx7Tfl1bxQYMk7VWmy2+2BQjPE
	ymDCEVtipfFgEbBCxwI1mZw9mNxgaY0tv6RZFKhmbaWIbZ1y2EU/zcgmhy81TA37MX4=
X-Gm-Gg: AYBFou2Uj8FY7Swc9JxlRplMaqx160kyHLqiX9OdNlocGU/X/dcp0lZvJXeq4lfAEDV
	qVFTZbl8h2wYQ6TZgWcN0un6lZmRIuylAfDWBf4QwzCdbkXB5iLBKb/qHwhk2dYTm2F2QCnvW+e
	JfcXzoGufqS95q0/dydeHFmU5aBLSTxRZX1keQdHICR8yuNLcmX8hVjIO0EDbDqDH3vZVOGY+WN
	6Rn57svU6sSsIzALj9hPEk1hQj8W2QFMvqdmhy37rDSHuiH+2rFrt6lfkZBdjwdZw6vLkgBfPwW
	yxnRfhCF2zOGjCKmeEiXafy4hvin8T2IPnGipgGdlsgPkuYin0KJo1yRf1GVxnGV0bhOSF6B9Ks
	Uvx19aJmwDfd1IybcoqIvTh8ciSMytgyqOIwLJFbhy+YFaanA+5dnPhHBWKLUi7Qet0Rh0yiviG
	yE4IYs9ZyLMY9/jNq2gictOmhemisIqaL4zr9x9yVH6WA24Gw7HYvsEbhikRZ93J6m/tasKnx9o
	tYLogt44iAFzNdFf3jqH2tqpHjVUaYj2rRWA+JKP8G6U0miYX0V/odzi0HabEtVVoCPTpUyl7xW
	+tqfgOOQRkCzoqZsn6TN999602RYoJECXpRwNUEZ/QON/TzuX5dMyswHDzvqyTXhnCyF0WvlOuf
	DNg9ckHFYvPglmQU=
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ac17d19777mr273950845e9.28.1793693306905;
        Tue, 03 Nov 2026 00:08:26 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-3502-a8a1-e3f9-3d71-5e00-c911.rev.sfr.net. [2a02:8440:3502:a8a1:e3f9:3d71:5e00:c911])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9faff90sm44476165e9.5.2026.11.03.00.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:08:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 09:08:25 +0100
Message-Id: <DMLF7KYQQTWL.3RX8ESTS9KK7G@smile.fr>
Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Jeroen Hofstee"
 <oe@myspectrum.nl>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1793405493.git.yoann.congal@smile.fr>
 <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr> <29941044-0317-4fa9-9b36-e891ab5b1d83@myspectrum.nl> <DML2X05WT3OY.RAVTPE8JH68S@smile.fr> <AS8PR10MB507359D6BF2DFD0C3BB664F6FD692@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507359D6BF2DFD0C3BB664F6FD692@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249248

On Tue Nov 3, 2026 at 8:24 AM CET, Peter Marko wrote:
> Hello,
>
> I have checked again by myself and let also LLM check it, but I could not=
 identify anything missing.
> This commit is the only change in last 26 years in function mentioned in =
CVE description.
> Also looking at https://github.com/rpm-software-management/popt/pull/141 =
from repository maintainer, there is nothing more for this CVE picked.
> Having a test included and passed boosts my confidence in this patch.
> So, until there are more details showing what is missing, I consider this=
 to be a correct fix.

There is at least a metadata issue with CVE-2026-18739.patch:
* From upstream:
  * Subject: [PATCH] Fix CVE-2026-18739:
  * Fixes: CVE-2026-18739
* For us:
  * CVE: CVE-2026-18743   # Not "CVE: CVE-2026-187*39*"

I think CVE-2026-18739.patch should be fixed from master to scarthgap to
state:
| CVE: CVE-2026-18739

Apart from the above metadata fix, I agree with you, don't see any issue
with patches (CVE-2026-18739.patch and CVE-2026-18743.patch) content.

Regards,

>
> Peter
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Monday, November 2, 2026 11:30 PM
>> To: Jeroen Hofstee <oe@myspectrum.nl>; openembedded-
>> core@lists.openembedded.org
>> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
>>=20
>> On Sat Oct 31, 2026 at 2:24 PM CET, Jeroen Hofstee wrote:
>> > Hi Yoann,
>>=20
>> Hello,
>>=20
>> > This is a low prio CVE, but that CVE: CVE-2026-18743 is incorrect in F=
ix
>> > CVE-2026-18739 and the fix is incomplete.
>> >
>> > But that is already the case in master. I will send a patch for it as =
soon
>> > as things finish building here. It can't hurt if you include it anyway=
.
>>=20
>> Thanks for your attention. I missed that (commented below for
>> awareness).
>>=20
>> When you say "fix is incomplete.", do you mean the "CVE:" tag is wrong
>> or something is also missing in the patch?
>>=20
>> Regards,
>>=20
>> > With kind regards,
>> >
>> > Jeroen
>> >
>> > On 10/31/26 01:14, Yoann Congal via openembedded-core wrote:
>> >> From: Peter Marko<peter.marko@siemens.com>
>> >>
>> >> Pick patch referencing this CVE.
>> >> Convert change in cmake file to autotools/makefile.
>> >> Install the new test in recipe.
>> >>
>> >> Signed-off-by: Peter Marko<peter.marko@siemens.com>
>> >> Signed-off-by: Mathieu Dubois-Briand<mathieu.dubois-briand@bootlin.co=
m>
>> >> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>> >> (cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4)
>> >> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>> >> [YC: backport translated cmake to automake
>> >>       (the project migrated in between) ]
>> >> ---
>> >>   .../popt/popt/CVE-2026-18739.patch            | 92 ++++++++++++++++=
+++
>> >>   meta/recipes-support/popt/popt_1.19.bb        |  2 +
>> >>   2 files changed, 94 insertions(+)
>> >>   create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.pa=
tch
>> >>
>> >> diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>> b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>> >> new file mode 100644
>> >> index 00000000000..0a1e8f35907
>> >> --- /dev/null
>> >> +++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>> >> @@ -0,0 +1,92 @@
>> >> +From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17
>> 00:00:00 2001
>> >> +From: Yao Zhang<294772273@qq.com>
>> >> +Date: Wed, 5 Aug 2026 14:52:10 +0800
>> >> +Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffAr=
gs()
>> >> +
>> >> +The poptStuffArgs function only checks whether (con->os - con->optio=
nStack)
>> >> +is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, and
>> does
>> >> +not increment the value by 1 to perform boundary pre-checking, as
>> >> +handleAlias does.
>> >> +
>> >> +Add a new test program as a reproducer for this case.
>> >> +
>> >> +Co-authored-by: Panu Matilainen<pmatilai@redhat.com>
>> >> +
>> >> +Fixes: CVE-2026-18739
>> >> +
>> >> +CVE: CVE-2026-18743
>>          ^ this CVE tag does not match patch filename nor the upstream
>> 		 "Fixes" tag.
>>=20
>> >> +Upstream-Status: Backport [https://github.com/rpm-software-
>> management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
>> >> +Signed-off-by: Peter Marko<peter.marko@siemens.com>
>> >> +---
>> >> + src/popt.c        |  2 +-
>> >> + tests/Makefile.am |  5 ++++-
>> >> + tests/testit.sh   |  2 ++
>> >> + tests/tstuff.c    | 17 +++++++++++++++++
>> >> + 4 files changed, 24 insertions(+), 2 deletions(-)
>> >> + create mode 100644 tests/tstuff.c
>> >> +
>> >> +diff --git a/src/popt.c b/src/popt.c
>> >> +index 9ea3dfe..458aadc 100644
>> >> +--- a/src/popt.c
>> >> ++++ b/src/popt.c
>> >> +@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char =
**
>> argv)
>> >> +     int argc;
>> >> +     int rc;
>> >> +
>> >> +-    if ((con->os - con->optionStack) =3D=3D POPT_OPTION_DEPTH)
>> >> ++    if ((con->os - con->optionStack + 1) =3D=3D POPT_OPTION_DEPTH)
>> >> + 	return POPT_ERROR_OPTSTOODEEP;
>> >> +
>> >> +     for (argc =3D 0; argv[argc]; argc++)
>> >> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>> >> +index c410389..99fbf64 100644
>> >> +--- a/tests/Makefile.am
>> >> ++++ b/tests/Makefile.am
>> >> +@@ -11,7 +11,10 @@ EXTRA_DIST =3D testit.sh \
>> >> +
>> >> + AM_CPPFLAGS =3D -I. -I$(top_srcdir)/src
>> >> +
>> >> +-noinst_PROGRAMS =3D test1 test2 tdict test3
>> >> ++noinst_PROGRAMS =3D test1 test2 tdict test3 tstuff
>> >> ++tstuff_SOURCES =3D tstuff.c
>> >> ++tstuff_LDFLAGS =3D
>> >> ++tstuff_LDADD =3D $(top_builddir)/src/libpopt.la
>> >> + test1_SOURCES =3D test1.c
>> >> + test1_LDFLAGS =3D
>> >> + test1_LDADD =3D $(top_builddir)/src/libpopt.la
>> >> +diff --git a/tests/testit.sh b/tests/testit.sh
>> >> +index 4078f51..d26be3a 100755
>> >> +--- a/tests/testit.sh
>> >> ++++ b/tests/testit.sh
>> >> +@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=3Df1
>> >> +
>> >> + run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=3D-=
1
>> >> +
>> >> ++run tstuff "tstuff - 1" "-13"
>> >> ++
>> >> + if ! [ -e test3-data ]; then
>> >> +   # create symlink for running during 'make distcheck'
>> >> +   ln -s "${srcdir}/test3-data" test3-data
>> >> +diff --git a/tests/tstuff.c b/tests/tstuff.c
>> >> +new file mode 100644
>> >> +index 0000000..b820c7b
>> >> +--- /dev/null
>> >> ++++ b/tests/tstuff.c
>> >> +@@ -0,0 +1,17 @@
>> >> ++#include <stdio.h>
>> >> ++#include <popt.h>
>> >> ++
>> >> ++int main(int argc, char *argv[])
>> >> ++{
>> >> ++    poptContext ctx =3D poptGetContext(argv[0], argc, (const char *=
*)argv,
>> NULL, 0);
>> >> ++    int rc =3D 0;
>> >> ++    for (int i =3D 0; i < 100; ++i) {
>> >> ++	const char *ea[] =3D { "a", NULL };
>> >> ++	if ((rc =3D poptStuffArgs(ctx, ea)))
>> >> ++	    break;
>> >> ++    }
>> >> ++    printf("%d\n", rc);
>> >> ++
>> >> ++    poptFreeContext(ctx);
>> >> ++    return rc;
>> >> ++}
>> >> diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-
>> support/popt/popt_1.19.bb
>> >> index c8b4875c1b7..18cc4f2867d 100644
>> >> --- a/meta/recipes-support/popt/popt_1.19.bb
>> >> +++ b/meta/recipes-support/popt/popt_1.19.bb
>> >> @@ -11,6 +11,7 @@ DEPENDS =3D "virtual/libiconv"
>> >>   SRC_URI =3D"http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz =
\
>> >> file://run-ptest \ file://CVE-2026-18743.patch \ +
>> >> file://CVE-2026-18739.patch \ "
>> >>   SRC_URI[sha256sum] =3D
>> "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
>> >>
>> >> @@ -25,6 +26,7 @@ do_compile_ptest() {
>> >>   do_install_ptest() {
>> >>       install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
>> >>       install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
>> >> +    install ${B}/tests/.libs/tstuff ${D}/${PTEST_PATH}
>> >>       install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
>> >>       install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
>> >>   }
>>=20
>>=20
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS

