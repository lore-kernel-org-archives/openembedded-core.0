Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D68BC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 15:16:29 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.73.1648826188256426494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 08:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JzDN6aY2;
 spf=pass (domain: gmail.com, ip: 209.85.210.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso2313083otj.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Of8BBd8N7EKc44xE8vur6GQdYMnmJtgXm57gVLMus9s=;
        b=JzDN6aY2YBDqscjurIXt3sSBvvZdXXo5DdgBM2+0hU0T3iHhrg0meSsPOdWvau8VHa
         dm1m+4gpLwaQ4EplRC1BnQDcm3DgN5Q/B0fIaK2ZabErpmv9ayLN1Yx0c/QWnYYIxjSU
         uWrLGXykUH8/OM24dViw8hSvVC4IQnziEkGRV6i60iQ4y/n8t4Ku0qv+aRdkILxTjMGO
         z9fSBoxqliPl5UVjpsUk51+my5ltVpK4PVlkRZZsORUMtWOWgOsG7rZXmGgQ0vQ7MdRV
         oXbh6p69Xn21hfYUmzA55m6McDpaDmNKaHjqozppEuBqdpxcbkD/igeOLRH7pACpaX2F
         smjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Of8BBd8N7EKc44xE8vur6GQdYMnmJtgXm57gVLMus9s=;
        b=A/7svPjMZoQfOb7bSdTzTWoQhpJoXivCe4mDqcaR/fEyovhvftiJjCWI2B3wzdTAAa
         8xLKZpdqgq27qihtIACBJ2ABRZoo7rmB4FWguPhshdsyBk5MGEr+aR9JnGJaBOUzu+Ne
         4vVTIU2nokI1jL7JMuujzOrR1NbbbVEUA060UhZ1X1ZZGdC997RYrB0+ru7eKIkYCnxa
         Xtf7GywbqWvKIpGoXhou/CAyZj0GnAFoZGj+LewA20GPOt3+n2GBwUd+YjJ7mtIQxDDe
         K4MrBs5TkHSr0zEOhBb2PTgcMO0Ccm2U2S3spzy3wVJeTfObzmj6c3xnqDliCWwheuVE
         TJcA==
X-Gm-Message-State: AOAM530PoypAOcAEkz2pGomF0X0udP2CwR0Arx16/Pkav6nOYasifWeK
	IvPNAlmq4WkJXa0klrXgaG/MAx2ftnUJOiw5UJPslW2qGsA=
X-Google-Smtp-Source: 
 ABdhPJxN1eCK6Vi2aBhZxJPalNSh06XUvUDbX6jQxFcLdHiMyXSExJKrbwzJIie/RSbiggjGE+OJ1+vguKhWTPZEeFQ=
X-Received: by 2002:a9d:7c90:0:b0:5b2:2ae8:43ec with SMTP id
 q16-20020a9d7c90000000b005b22ae843ecmr7772954otn.379.1648826187453; Fri, 01
 Apr 2022 08:16:27 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0bdd8781-1174-4002-a3b6-4b3de641d2d3@denue6es010.ebgroup.elektrobit.com>
In-Reply-To: 
 <0bdd8781-1174-4002-a3b6-4b3de641d2d3@denue6es010.ebgroup.elektrobit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Apr 2022 17:16:16 +0200
Message-ID: 
 <CANNYZj_YPnBK64T_g3kp5K89C9fJH_D3N3AxytSXhHgcVp2O8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] popt: add ptest
To: Simone Weiss <simone.weiss@elektrobit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	David Niederpruem <david.niederpruem@elektrobit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 15:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163942

Also David's email seems incorrect?

Fehler bei der Nachrichtenzustellung an folgende Empf=C3=A4nger oder Gruppe=
n:

David Niederpruem (david.niederpruem@elektrobit.com)

Die eingegebene E-Mail-Adresse konnte nicht gefunden werden.
=C3=9Cberpr=C3=BCfen Sie die E-Mail-Adresse des Empf=C3=A4ngers, und versuc=
hen Sie,
die Nachricht erneut zu senden. Wenn das Problem weiterhin besteht,
wenden Sie sich an Ihren E-Mail-Administrator.


Alex

On Fri, 1 Apr 2022 at 16:46, Simone Weiss <simone.weiss@elektrobit.com> wro=
te:
>
> Add a ptest for popt to core-image-ptest-all. Provide a patch to popt to
> adopt the test format to "simple test" and a script for running the test.
> All tests passed on a trial run.
>
> Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  ...01-popt-test-output-format-for-ptest.patch | 68 +++++++++++++++++++
>  meta/recipes-support/popt/popt/run-ptest      |  3 +
>  meta/recipes-support/popt/popt_1.18.bb        | 21 +++++-
>  4 files changed, 91 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/popt/popt/0001-popt-test-output-=
format-for-ptest.patch
>  create mode 100644 meta/recipes-support/popt/popt/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index ac3295d1aa..b51cce4d9e 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -48,6 +48,7 @@ PTESTS_FAST =3D "\
>      opkg-ptest \
>      pango-ptest \
>      parted-ptest \
> +    popt-ptest \
>      python3-atomicwrites-ptest \
>      python3-bcrypt-ptest \
>      python3-hypothesis-ptest \
> diff --git a/meta/recipes-support/popt/popt/0001-popt-test-output-format-=
for-ptest.patch b/meta/recipes-support/popt/popt/0001-popt-test-output-form=
at-for-ptest.patch
> new file mode 100644
> index 0000000000..020949cc34
> --- /dev/null
> +++ b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-pte=
st.patch
> @@ -0,0 +1,68 @@
> +From 330b77081c3a4c7ae76cb08602db385b40fa7ff7 Mon Sep 17 00:00:00 2001
> +From: Simone Weiss <simone.weiss@elektrobit.com>
> +Date: Mon, 13 Dec 2021 09:29:53 +0000
> +Subject: [PATCH] popt test output format for ptest
> +
> +patch test output format to match simple-test as it is used in ptests.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> +Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
> +---
> + tests/testit.sh | 20 ++++++++------------
> + 1 file changed, 8 insertions(+), 12 deletions(-)
> +
> +diff --git a/tests/testit.sh b/tests/testit.sh
> +index 2a7b4aa..50b42e2 100755
> +--- a/tests/testit.sh
> ++++ b/tests/testit.sh
> +@@ -5,12 +5,11 @@ run() {
> +     name=3D$1; shift
> +     answer=3D$1; shift
> +
> +-    echo Running test $name.
> +-
> +     result=3D`HOME=3D$builddir $builddir/$prog $*`
> +     if [ "$answer" !=3D "$result" ]; then
> +-      echo "Test \"$prog $*\" failed with: \"$result\" !=3D \"$answer\"=
 "
> +-      exit 2
> ++        echo "FAIL: $name"
> ++    else
> ++        echo "PASS: $name"
> +     fi
> + }
> +
> +@@ -23,17 +22,17 @@ run_diff() {
> +     out=3D$builddir/tmp.out
> +     diff_file=3D$builddir/tmp.diff
> +
> +-    echo Running test $name.
> +-
> +     $builddir/$prog $in_file > $out
> +     ret=3D$?
> +     diff $out $answer_file > $diff_file
> +     diff_ret=3D$?
> +
> +     if [ "$diff_ret" !=3D "0" ]; then
> +-       echo "Test \"$name\" failed output is in $out, diff is:"
> +-       cat $diff_file
> +-       exit 2
> ++        echo "FAIL: $name"
> ++        echo "diff is:"
> ++        cat $diff_file
> ++    else
> ++        echo "PASS: $name"
> +     fi
> +     rm $out $diff_file
> + }
> +@@ -174,6 +173,3 @@ Help options:
> + #run_diff test3 "test3 - 51" test3-data/01.input test3-data/01.answer
> + #run_diff test3 "test3 - 52" test3-data/02.input test3-data/02.answer
> + #run_diff test3 "test3 - 53" test3-data/03.input test3-data/03.answer
> +-
> +-echo ""
> +-echo "Passed."
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/popt/popt/run-ptest b/meta/recipes-supp=
ort/popt/popt/run-ptest
> new file mode 100644
> index 0000000000..85754035d0
> --- /dev/null
> +++ b/meta/recipes-support/popt/popt/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +./testit.sh
> diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-suppor=
t/popt/popt_1.18.bb
> index 057c44f223..af8add4ad6 100644
> --- a/meta/recipes-support/popt/popt_1.18.bb
> +++ b/meta/recipes-support/popt/popt_1.18.bb
> @@ -8,9 +8,26 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb0613c30af2a=
8249b8dcc67d3edb06d"
>
>  DEPENDS =3D "virtual/libiconv"
>
> -SRC_URI =3D "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz"
> +SRC_URI =3D "\
> +    http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
> +    file://0001-popt-test-output-format-for-ptest.patch \
> +    file://run-ptest \
> +"
>  SRC_URI[sha256sum] =3D "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17=
d1e6ad5c24fdc5d1"
>
> -inherit autotools gettext
> +inherit autotools gettext ptest
> +
> +RDEPENDS_${PN}-ptest +=3D "bash"
> +
> +do_compile_ptest() {
> +    sed 's#lt-test1#test1#g' ${S}/tests/testit.sh > ${B}/tests/testit.sh
> +}
> +
> +do_install_ptest() {
> +    install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
> +    install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
> +    install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
> +    install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
> +}
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163940): https://lists.openembedded.org/g/openembedde=
d-core/message/163940
> Mute This Topic: https://lists.openembedded.org/mt/90180554/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

