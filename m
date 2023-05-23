Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9BBC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:30:49 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.1588.1684859443337688556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 09:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iygY5U3t;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6af713338ccso1194320a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684859442; x=1687451442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vocaOrZGySRhEoVfUAjnllQbjbMECoXvF7yBjqAE3vg=;
        b=iygY5U3twlB+et8qgXWFR/fWsXwDiCOISDg2aIr2Mu+QccCuPzRSNp2cAHA3UFcuS5
         I29W33oHct+natlyPRWi8ZCEPSgkXSAl4zaONsDSFTSVXDEZHosvgQ3Xbfm1oK3Kawyy
         /l5FsvxTikeYauwz9fgylJF3o6+O2gBa/fvxY+25h4+j6jkC39louzhshCykhFL4KrtX
         dK5oL5foaZa1AirgFkLvEJcv4K99xCIXO69L6CqOyLaEAao6OmotpQI/68B4vcM1C2yQ
         q0SLIRO/13vwuhaC9SGqcsCs3yGsXd7oDmH2oGnz/dEBac7Y6amZaHE1z8T0N9RLWJGD
         tqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684859442; x=1687451442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vocaOrZGySRhEoVfUAjnllQbjbMECoXvF7yBjqAE3vg=;
        b=BU8KkjF9QZU+AfIOTiCBuEAYebKkp9D1C4roj3xcNYcZo/kaWd1Roe4pZIq4aJByWS
         F9EhMIIl2PsVlfz60IBXTG+Jpuz0WtwvEx6bdel2mczluNQd52zaDWhJSO6mcBnF8FDv
         3K59Hd0ekfR2GH0fi5Txmi67ylwT0l7P023EvhBIuoCI938dq4ob7O+yn3d1TKflxTTS
         WPItQRTdqetRhyGulasLIXILLAjtetb6M6g/LhFIObGahHJ2hgG6ubyPyHvwqqRJw0E8
         N7JFx+WBiLAG4eSaQdvmHPxhhjH10AAacYiBU0yvNbRp2o3WNmm/Sg28px2Y1JTt0G4g
         5IDg==
X-Gm-Message-State: AC+VfDzuihmBzJYzCbdx83eBLi5uhM/pgVlwFHQnHV0HhlPlZ4ASbn86
	5VRbdC7wSZoubIcZXrdBX0guh94mmWoggKTcT3U=
X-Google-Smtp-Source: ACHHUZ6FxHZuTYWH/v14c0JAU//sYoBKapYp0+8XLMwltm5kcWuhP2+qblbzdnCIRP8BZRuOJ11L8YUOcZnxw5WHP5M=
X-Received: by 2002:aca:1e0d:0:b0:397:c038:54ef with SMTP id
 m13-20020aca1e0d000000b00397c03854efmr7362993oic.0.1684859442283; Tue, 23 May
 2023 09:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230523154122.1798757-1-tgamblin@baylibre.com> <CANNYZj93JQVPaE=B5kiZ76YiX2DKC94nhe-S1k8HEL3XTigVNg@mail.gmail.com>
In-Reply-To: <CANNYZj93JQVPaE=B5kiZ76YiX2DKC94nhe-S1k8HEL3XTigVNg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2023 09:30:16 -0700
Message-ID: <CAMKF1soch+2Fs+wibXUQtryViNoGnkf9YxEnBsmVnWDc7-SdeA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] b4: add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 16:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181648

On Tue, May 23, 2023 at 9:18=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Why?

I guess implement a new patch test using it.

>
> Alex
>
> On Tue, 23 May 2023 at 17:41, Trevor Gamblin <tgamblin@baylibre.com> wrot=
e:
> >
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  meta/recipes-devtools/b4/b4_0.12.2.bb         | 35 +++++++++++++++++++
> >  ...skip-tests-requiring-git-filter-repo.patch | 30 ++++++++++++++++
> >  meta/recipes-devtools/b4/files/run-ptest      |  3 ++
> >  5 files changed, 70 insertions(+)
> >  create mode 100644 meta/recipes-devtools/b4/b4_0.12.2.bb
> >  create mode 100644 meta/recipes-devtools/b4/files/0001-test_ez-skip-te=
sts-requiring-git-filter-repo.patch
> >  create mode 100644 meta/recipes-devtools/b4/files/run-ptest
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> > index e99fbe4aef..72145a0a38 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -52,6 +52,7 @@ RECIPE_MAINTAINER:pn-autoconf =3D "Robert Yang <liezh=
i.yang@windriver.com>"
> >  RECIPE_MAINTAINER:pn-autoconf-archive =3D "Robert Yang <liezhi.yang@wi=
ndriver.com>"
> >  RECIPE_MAINTAINER:pn-automake =3D "Robert Yang <liezhi.yang@windriver.=
com>"
> >  RECIPE_MAINTAINER:pn-avahi =3D "Yi Zhao <yi.zhao@windriver.com>"
> > +RECIPE_MAINTAINER:pn-b4 =3D "Trevor Gamblin <tgamblin@baylibre.com>"
> >  RECIPE_MAINTAINER:pn-babeltrace =3D "Alexander Kanavin <alex.kanavin@g=
mail.com>"
> >  RECIPE_MAINTAINER:pn-babeltrace2 =3D "Alexander Kanavin <alex.kanavin@=
gmail.com>"
> >  RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <al=
ejandro@enedino.org>"
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
> > index da9153b998..2c9fb3433d 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -7,6 +7,7 @@ PTESTS_FAST =3D "\
> >      acl \
> >      apr-util \
> >      attr \
> > +    b4 \
> >      babeltrace \
> >      babeltrace2 \
> >      bc \
> > diff --git a/meta/recipes-devtools/b4/b4_0.12.2.bb b/meta/recipes-devto=
ols/b4/b4_0.12.2.bb
> > new file mode 100644
> > index 0000000000..f222a8b2e5
> > --- /dev/null
> > +++ b/meta/recipes-devtools/b4/b4_0.12.2.bb
> > @@ -0,0 +1,35 @@
> > +SUMMARY =3D "B4 workflow tools"
> > +DESCRIPTION =3D "A tool to work with public-inbox and patch archives"
> > +HOMEPAGE =3D "https://git.kernel.org/pub/scm/utils/b4/b4.git/"
> > +LICENSE =3D "GPL-2.0-or-later"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> > +SRC_URI[sha256sum] =3D "b6f4afd78bf78a28055b389f0909792b1c7805fb3557f5=
d71efbda3682aabe6e"
> > +
> > +inherit python_setuptools_build_meta ptest
> > +
> > +SRC_URI +=3D "git://git.kernel.org/pub/scm/utils/b4/b4.git;branch=3Dst=
able-0.12.y;protocol=3Dhttps \
> > +            file://run-ptest \
> > +            file://0001-test_ez-skip-tests-requiring-git-filter-repo.p=
atch \
> > +"
> > +
> > +SRCREV =3D "0529d7ae380c46f8006892d8fffb563326e2d131"
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +        ${PYTHON_PN}-mailbox \
> > +        ${PYTHON_PN}-requests \
> > +"
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +        git \
> > +        ${PYTHON_PN}-pytest \
> > +        ${PYTHON_PN}-unittest-automake-output \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install_ptest() {
> > +      install -d ${D}${PTEST_PATH}/tests
> > +      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-req=
uiring-git-filter-repo.patch b/meta/recipes-devtools/b4/files/0001-test_ez-=
skip-tests-requiring-git-filter-repo.patch
> > new file mode 100644
> > index 0000000000..579c31d090
> > --- /dev/null
> > +++ b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-=
git-filter-repo.patch
> > @@ -0,0 +1,30 @@
> > +From 5b77018e0d5648f519345a682752df91d99a6a09 Mon Sep 17 00:00:00 2001
> > +From: Trevor Gamblin <tgamblin@baylibre.com>
> > +Date: Tue, 23 May 2023 11:09:07 -0400
> > +Subject: [PATCH] test_ez: skip tests requiring git-filter-repo
> > +
> > +git-filter-repo isn't available and is difficult to properly add as a
> > +recipe, so skip b4 ptests that require it to be installed.
> > +
> > +Upstream-Status: Inappropriate (oe-specific)
> > +
> > +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > +---
> > + tests/test_ez.py | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/tests/test_ez.py b/tests/test_ez.py
> > +index 1b02e7b..059c84c 100644
> > +--- a/tests/test_ez.py
> > ++++ b/tests/test_ez.py
> > +@@ -32,6 +32,7 @@ def prepdir(gitdir):
> > +      ['log', '--format=3D%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thre=
ad-with-followups-and-tripledash',
> > +      None),
> > + ])
> > ++@pytest.mark.skip(reason=3D"no git-filter-repo")
> > + def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, co=
mpareargs, compareout, b4cfg):
> > +     if b4cfg:
> > +         b4.MAIN_CONFIG.update(b4cfg)
> > +--
> > +2.40.1
> > +
> > diff --git a/meta/recipes-devtools/b4/files/run-ptest b/meta/recipes-de=
vtools/b4/files/run-ptest
> > new file mode 100644
> > index 0000000000..b63c4de0d9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/b4/files/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || =
$NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print=
}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > --
> > 2.40.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181647): https://lists.openembedded.org/g/openembedde=
d-core/message/181647
> Mute This Topic: https://lists.openembedded.org/mt/99090018/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

