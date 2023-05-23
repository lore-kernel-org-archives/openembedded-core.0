Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D14CC7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:18:39 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.1131.1684858715102161249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 09:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f1KrCe5T;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so68851e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684858713; x=1687450713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywXgJf6M6BixsU4+cgnChXU+S12KmWajtc2R01yHvmY=;
        b=f1KrCe5Td+K8wWl9+I34WAZFZ5sb07kibJpJLATJJ/dS75merFFU3pW3bnXGPVoSi9
         vYmvqyTur8Xw6R+c+YAo0vAuUkWPTOxNtO9M1tv/hZp1mKlK2QnwtH0UPc2u6xacLDLZ
         F6mZr5N8i+beqwUdj1li2e6ePccF5PSh3whFdmYqT/mn/bIbaMPey2TUTGtmE7VYcHEK
         7+KJJFlOPNekHpOo/EFTIkc+8k1AhT5/7Vnp2ELa62DmsYCr08I1RRNSxBYdHuxsqKqm
         0nxn7fzOcmFYBvb8en+lLPAdEOctidBwi+GPIBAF/c9ZSZNSL1cP4nSOQr3//o2rBWO9
         eHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684858713; x=1687450713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywXgJf6M6BixsU4+cgnChXU+S12KmWajtc2R01yHvmY=;
        b=RXtIw6KBRCTUgSQKSp2YrfB0U/vFCU6evfVJOgPUC6gCAeJMmgJ5SllpdkTC5iF6yP
         RzKvE3AJFIVfAPDcqoYTySLcq12yJZEs/RdznaaGXZFGmwRGKNDNxdwspP5RmSCAbrO1
         WmJiQA7NEBB5E3nOYyBXNBEPTHftLegrRbHEiwv786pIxhy+KHzhDMYtQ1Pb6P/ItSK8
         Mz05Rx06rzjOFj6cEmvIsFgT7jilIfZeoFKxP2sNeHH6MHkWnwjnJLg+5OB9sgbpXCOk
         29MfaTcrQokKfm6y8A9h/94SwOAwGtTOoSGPnTcrLd1x47976LjnnXblh8lTNLMcnjh4
         jPbg==
X-Gm-Message-State: AC+VfDyr4VCm4Ngd2b+13oynFOpHNf9Xev7AYhHun0L02merW8buKzxs
	XcLk+ENkVMBTqD6Iz3ye7HFKZytcCOvPe1Xk1bw=
X-Google-Smtp-Source: ACHHUZ6jz+ZW8DFFA/9XpalpJ8n5aClrpm8pufqDqmqgyx4mLltAlRYesFM2xu+eMHSSdDA/Nx1wJkN6TLy22Oy9soo=
X-Received: by 2002:a05:6512:11e2:b0:4f3:845e:f9e with SMTP id
 p2-20020a05651211e200b004f3845e0f9emr3856806lfs.13.1684858712771; Tue, 23 May
 2023 09:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230523154122.1798757-1-tgamblin@baylibre.com>
In-Reply-To: <20230523154122.1798757-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 May 2023 18:18:21 +0200
Message-ID: <CANNYZj93JQVPaE=B5kiZ76YiX2DKC94nhe-S1k8HEL3XTigVNg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] b4: add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 16:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181647

Why?

Alex

On Tue, 23 May 2023 at 17:41, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-devtools/b4/b4_0.12.2.bb         | 35 +++++++++++++++++++
>  ...skip-tests-requiring-git-filter-repo.patch | 30 ++++++++++++++++
>  meta/recipes-devtools/b4/files/run-ptest      |  3 ++
>  5 files changed, 70 insertions(+)
>  create mode 100644 meta/recipes-devtools/b4/b4_0.12.2.bb
>  create mode 100644 meta/recipes-devtools/b4/files/0001-test_ez-skip-test=
s-requiring-git-filter-repo.patch
>  create mode 100644 meta/recipes-devtools/b4/files/run-ptest
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index e99fbe4aef..72145a0a38 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -52,6 +52,7 @@ RECIPE_MAINTAINER:pn-autoconf =3D "Robert Yang <liezhi.=
yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-autoconf-archive =3D "Robert Yang <liezhi.yang@wind=
river.com>"
>  RECIPE_MAINTAINER:pn-automake =3D "Robert Yang <liezhi.yang@windriver.co=
m>"
>  RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@windriver.com>"
> +RECIPE_MAINTAINER:pn-b4 =3D "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-babeltrace =3D "Alexander Kanavin <alex.kanavin@gma=
il.com>"
>  RECIPE_MAINTAINER:pn-babeltrace2 =3D "Alexander Kanavin <alex.kanavin@gm=
ail.com>"
>  RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <alej=
andro@enedino.org>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index da9153b998..2c9fb3433d 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -7,6 +7,7 @@ PTESTS_FAST =3D "\
>      acl \
>      apr-util \
>      attr \
> +    b4 \
>      babeltrace \
>      babeltrace2 \
>      bc \
> diff --git a/meta/recipes-devtools/b4/b4_0.12.2.bb b/meta/recipes-devtool=
s/b4/b4_0.12.2.bb
> new file mode 100644
> index 0000000000..f222a8b2e5
> --- /dev/null
> +++ b/meta/recipes-devtools/b4/b4_0.12.2.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "B4 workflow tools"
> +DESCRIPTION =3D "A tool to work with public-inbox and patch archives"
> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/utils/b4/b4.git/"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +SRC_URI[sha256sum] =3D "b6f4afd78bf78a28055b389f0909792b1c7805fb3557f5d7=
1efbda3682aabe6e"
> +
> +inherit python_setuptools_build_meta ptest
> +
> +SRC_URI +=3D "git://git.kernel.org/pub/scm/utils/b4/b4.git;branch=3Dstab=
le-0.12.y;protocol=3Dhttps \
> +            file://run-ptest \
> +            file://0001-test_ez-skip-tests-requiring-git-filter-repo.pat=
ch \
> +"
> +
> +SRCREV =3D "0529d7ae380c46f8006892d8fffb563326e2d131"
> +
> +RDEPENDS:${PN} +=3D " \
> +        ${PYTHON_PN}-mailbox \
> +        ${PYTHON_PN}-requests \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +        git \
> +        ${PYTHON_PN}-pytest \
> +        ${PYTHON_PN}-unittest-automake-output \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install_ptest() {
> +      install -d ${D}${PTEST_PATH}/tests
> +      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requi=
ring-git-filter-repo.patch b/meta/recipes-devtools/b4/files/0001-test_ez-sk=
ip-tests-requiring-git-filter-repo.patch
> new file mode 100644
> index 0000000000..579c31d090
> --- /dev/null
> +++ b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-gi=
t-filter-repo.patch
> @@ -0,0 +1,30 @@
> +From 5b77018e0d5648f519345a682752df91d99a6a09 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Tue, 23 May 2023 11:09:07 -0400
> +Subject: [PATCH] test_ez: skip tests requiring git-filter-repo
> +
> +git-filter-repo isn't available and is difficult to properly add as a
> +recipe, so skip b4 ptests that require it to be installed.
> +
> +Upstream-Status: Inappropriate (oe-specific)
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + tests/test_ez.py | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/test_ez.py b/tests/test_ez.py
> +index 1b02e7b..059c84c 100644
> +--- a/tests/test_ez.py
> ++++ b/tests/test_ez.py
> +@@ -32,6 +32,7 @@ def prepdir(gitdir):
> +      ['log', '--format=3D%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread=
-with-followups-and-tripledash',
> +      None),
> + ])
> ++@pytest.mark.skip(reason=3D"no git-filter-repo")
> + def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, comp=
areargs, compareout, b4cfg):
> +     if b4cfg:
> +         b4.MAIN_CONFIG.update(b4cfg)
> +--
> +2.40.1
> +
> diff --git a/meta/recipes-devtools/b4/files/run-ptest b/meta/recipes-devt=
ools/b4/files/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta/recipes-devtools/b4/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKI=
P/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $N=
F=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}=
'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181644): https://lists.openembedded.org/g/openembedde=
d-core/message/181644
> Mute This Topic: https://lists.openembedded.org/mt/99090018/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

