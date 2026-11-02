Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4095.1793658625809684321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 14:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=pt6yYNNS;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so23504725e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 14:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793658624; x=1794263424; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iPThOxDSgTvabXdmPSLoQkUr1aWol7Muyn/bTdSnwm4=;
        b=pt6yYNNS8nxFX250E03+ZPeXfeTn3D+eoXs5twp0JNWtcg/1H+8jM7/LegVLtXRUpC
         DWQ9yVaP1ToUr6RGrQMKKI+vcAEi32D1gLqMojMkhb7YrxPC4klAtJboaWq0b8iGNy1r
         l0mrFzZWki359oniq5+ib0jy8BtAabe/BM4R/p/a9O+SkIliqNFlGTlYsWEwJt/M8MYh
         sFLic8+BXI6mENhsHcce/M70qWCvoEpP3UTDh8deg568HRg0GfNWPpVbIK/hpblA8wRq
         7AqRUHm+6rpoHkHYUDYYdJC/W8irNjggLsqIurVoOMOiEikipMK9wPYiIoGffEJX36Xk
         LheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658624; x=1794263424;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPThOxDSgTvabXdmPSLoQkUr1aWol7Muyn/bTdSnwm4=;
        b=zFcESXuVMeHXJ+Rc3nZaq0mrvJfCc5L6pp1BxLfeFROZ/FJsa3huoOcapKp2pE1hoj
         Ql/F1Gwyl6D6ZKdd6BjtxuLoWNXHU6KFLICdm8hZf40cHfCABMeZdm1tp8wszN95EW9h
         z2escLNkITRnfuUGbJDp9KXXkS3zkuOk1Ogup6fDRiQCVbvx+4xyGadv1S7amRmLGQl6
         LDpWxZabNF/1bt4UXEzqMNNN0jsX8axBfkRSRlZ/uh4nGgyo7JQWQ3mQhn2p+w+eahHd
         1cy0URfzJ0YNn2LwWgBJzr4uNaK0AbYjbfxxwrxdOoNL7zydNrSq72BRI5/pBllZ/qkz
         6+dg==
X-Forwarded-Encrypted: i=1; AKwUvBzgu1jvoppjmmhnUFh0yken2YFWfKffOvE1f/WTV20R4zuQX6WUXcFR8qwFlgWz/iLy8NflEcD2kAI6SZmpFIjOcQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI3apGp+5dDWowRwNRgi43+0A3LQ8PqNwrk+MMH/iNRKexJaXbw
	oo8Yz1I7ZZbNbpkpUAnEekO3JMcU9ejKewjUzbJTpZla2rCH+TTP5SE57wwxkLF53do=
X-Gm-Gg: AYBFou0J5msZ4taU5lFMosp8wSzYpJbaZnzUeCWPvaDG2ywiqYWZ8rujGNPb9boXVG9
	F+XUlptGVVaT4NlXaNiN2ebiEfzV5XSe091Eas0X07PbJL/JbY2LB5CT+v7qS6uX/F+ie7/7mtI
	p358Nl8vJBHeGRK7v5yATzSImpk7kEzE2QTyVmXLTwXuUXVG1oaZqqWowQb0PGhbPOgCTpRdFCo
	4VmjTKj+YnRjWbxRttnMCyI8OcCEwlBeHL5rXbD3l6XTZCrlSf+BSwAQLWML/QD2oyFPz9VKIgM
	Fa+9fC9i5ostG40Ta1cKkRpZD+R0GV8DdBsxSQAYfqz3tU2Xtm55ozNov13R7OWGReL9ciVA9Uh
	WC3jy2wi+GzPyvW9Aag38a2/e1Xx2nvjJofyBQdIgVCUkEL1Ao9xrg5XDtIzizzC+GWX08ZpJJQ
	WmudeXfxwHsv5giGoJaJOtxnEew5sji+zzkecPN2e3vQjd+Y4Yu6BZ5nh1/kzIt5n1aL2WIoNxG
	tXyyPQo7ZwyUwax6btlqEk+k5rLA3JfC9syam92WsdElfNClmDRzYU5lNY4tVPKNU5jQGYOEvAd
	ygIL+wTQ2+MUiDmc789jsYeOTIgC8D0kg12zPjuMO6b/b4eiraNmyt7jBRqKacDI435CoAbDmRP
	IkQ7HM1K3Mt1ZmQi1
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr264185115e9.27.1793658624033;
        Mon, 02 Nov 2026 14:30:24 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm220190555e9.2.2026.11.02.14.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:30:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 23:30:23 +0100
Message-Id: <DML2X05WT3OY.RAVTPE8JH68S@smile.fr>
Subject: Re: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <peter.marko@siemens.com>
To: "Jeroen Hofstee" <oe@myspectrum.nl>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1793405493.git.yoann.congal@smile.fr>
 <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr> <29941044-0317-4fa9-9b36-e891ab5b1d83@myspectrum.nl>
In-Reply-To: <29941044-0317-4fa9-9b36-e891ab5b1d83@myspectrum.nl>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 22:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249227

On Sat Oct 31, 2026 at 2:24 PM CET, Jeroen Hofstee wrote:
> Hi Yoann,

Hello,

> This is a low prio CVE, but that CVE: CVE-2026-18743 is incorrect in Fix=
=20
> CVE-2026-18739 and the fix is incomplete.
>
> But that is already the case in master. I will send a patch for it as soo=
n
> as things finish building here. It can't hurt if you include it anyway.

Thanks for your attention. I missed that (commented below for
awareness).

When you say "fix is incomplete.", do you mean the "CVE:" tag is wrong
or something is also missing in the patch?

Regards,

> With kind regards,
>
> Jeroen
>
> On 10/31/26 01:14, Yoann Congal via openembedded-core wrote:
>> From: Peter Marko<peter.marko@siemens.com>
>>
>> Pick patch referencing this CVE.
>> Convert change in cmake file to autotools/makefile.
>> Install the new test in recipe.
>>
>> Signed-off-by: Peter Marko<peter.marko@siemens.com>
>> Signed-off-by: Mathieu Dubois-Briand<mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>> (cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4)
>> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>> [YC: backport translated cmake to automake
>>       (the project migrated in between) ]
>> ---
>>   .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
>>   meta/recipes-support/popt/popt_1.19.bb        |  2 +
>>   2 files changed, 94 insertions(+)
>>   create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
>>
>> diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/=
recipes-support/popt/popt/CVE-2026-18739.patch
>> new file mode 100644
>> index 00000000000..0a1e8f35907
>> --- /dev/null
>> +++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
>> @@ -0,0 +1,92 @@
>> +From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17 00:00:00 2001
>> +From: Yao Zhang<294772273@qq.com>
>> +Date: Wed, 5 Aug 2026 14:52:10 +0800
>> +Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffArgs(=
)
>> +
>> +The poptStuffArgs function only checks whether (con->os - con->optionSt=
ack)
>> +is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, and doe=
s
>> +not increment the value by 1 to perform boundary pre-checking, as
>> +handleAlias does.
>> +
>> +Add a new test program as a reproducer for this case.
>> +
>> +Co-authored-by: Panu Matilainen<pmatilai@redhat.com>
>> +
>> +Fixes: CVE-2026-18739
>> +
>> +CVE: CVE-2026-18743
         ^ this CVE tag does not match patch filename nor the upstream
		 "Fixes" tag.

>> +Upstream-Status: Backport [https://github.com/rpm-software-management/p=
opt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
>> +Signed-off-by: Peter Marko<peter.marko@siemens.com>
>> +---
>> + src/popt.c        |  2 +-
>> + tests/Makefile.am |  5 ++++-
>> + tests/testit.sh   |  2 ++
>> + tests/tstuff.c    | 17 +++++++++++++++++
>> + 4 files changed, 24 insertions(+), 2 deletions(-)
>> + create mode 100644 tests/tstuff.c
>> +
>> +diff --git a/src/popt.c b/src/popt.c
>> +index 9ea3dfe..458aadc 100644
>> +--- a/src/popt.c
>> ++++ b/src/popt.c
>> +@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char ** =
argv)
>> +     int argc;
>> +     int rc;
>> +
>> +-    if ((con->os - con->optionStack) =3D=3D POPT_OPTION_DEPTH)
>> ++    if ((con->os - con->optionStack + 1) =3D=3D POPT_OPTION_DEPTH)
>> + 	return POPT_ERROR_OPTSTOODEEP;
>> +
>> +     for (argc =3D 0; argv[argc]; argc++)
>> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>> +index c410389..99fbf64 100644
>> +--- a/tests/Makefile.am
>> ++++ b/tests/Makefile.am
>> +@@ -11,7 +11,10 @@ EXTRA_DIST =3D testit.sh \
>> +
>> + AM_CPPFLAGS =3D -I. -I$(top_srcdir)/src
>> +
>> +-noinst_PROGRAMS =3D test1 test2 tdict test3
>> ++noinst_PROGRAMS =3D test1 test2 tdict test3 tstuff
>> ++tstuff_SOURCES =3D tstuff.c
>> ++tstuff_LDFLAGS =3D
>> ++tstuff_LDADD =3D $(top_builddir)/src/libpopt.la
>> + test1_SOURCES =3D test1.c
>> + test1_LDFLAGS =3D
>> + test1_LDADD =3D $(top_builddir)/src/libpopt.la
>> +diff --git a/tests/testit.sh b/tests/testit.sh
>> +index 4078f51..d26be3a 100755
>> +--- a/tests/testit.sh
>> ++++ b/tests/testit.sh
>> +@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=3Df1
>> +
>> + run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=3D-1
>> +
>> ++run tstuff "tstuff - 1" "-13"
>> ++
>> + if ! [ -e test3-data ]; then
>> +   # create symlink for running during 'make distcheck'
>> +   ln -s "${srcdir}/test3-data" test3-data
>> +diff --git a/tests/tstuff.c b/tests/tstuff.c
>> +new file mode 100644
>> +index 0000000..b820c7b
>> +--- /dev/null
>> ++++ b/tests/tstuff.c
>> +@@ -0,0 +1,17 @@
>> ++#include <stdio.h>
>> ++#include <popt.h>
>> ++
>> ++int main(int argc, char *argv[])
>> ++{
>> ++    poptContext ctx =3D poptGetContext(argv[0], argc, (const char **)a=
rgv, NULL, 0);
>> ++    int rc =3D 0;
>> ++    for (int i =3D 0; i < 100; ++i) {
>> ++	const char *ea[] =3D { "a", NULL };
>> ++	if ((rc =3D poptStuffArgs(ctx, ea)))
>> ++	    break;
>> ++    }
>> ++    printf("%d\n", rc);
>> ++
>> ++    poptFreeContext(ctx);
>> ++    return rc;
>> ++}
>> diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-suppo=
rt/popt/popt_1.19.bb
>> index c8b4875c1b7..18cc4f2867d 100644
>> --- a/meta/recipes-support/popt/popt_1.19.bb
>> +++ b/meta/recipes-support/popt/popt_1.19.bb
>> @@ -11,6 +11,7 @@ DEPENDS =3D "virtual/libiconv"
>>   SRC_URI =3D"http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \=
=20
>> file://run-ptest \ file://CVE-2026-18743.patch \ +=20
>> file://CVE-2026-18739.patch \ "
>>   SRC_URI[sha256sum] =3D "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987f=
dad3ca2758c63240f9"
>>  =20
>> @@ -25,6 +26,7 @@ do_compile_ptest() {
>>   do_install_ptest() {
>>       install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
>>       install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
>> +    install ${B}/tests/.libs/tstuff ${D}/${PTEST_PATH}
>>       install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
>>       install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
>>   }


--=20
Yoann Congal
Smile ECS

