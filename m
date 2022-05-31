Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857F8C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:51:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.51064.1654012281272739698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 08:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1YgdqDB;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id x7so13583659qta.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GGM8Pb2qbINtAOnQfN1oH4rym+MoVfXlsZjodYph/Ys=;
        b=V1YgdqDBJpF2XXlPB8gh6EE9e6STxV22gazxUfhUXQbRTlStCCUcBk1hYVAPpLzbgO
         hZ2qsulj4ef55RN+9KmxwcsgPzUra5NuObKsRKRRrN8vt5x+0u/L8VSKi02qyGw+afW/
         QvbHtQJ2PB36jRFdPeo7RGTfXPe6VcWzgEI8Qh0C884YuByoTI47fB7mgfBgwRYRdZ/X
         EhsbF9VtndM37Lfnj19Yg2QvOPIcKvKx3YdPcwCht6T6mfRt+xCcgjfP4EspEznlPZ8R
         6HZoae/goKnmYbjqBauAj1CfH3JUsDtIvUD45KMFnBlII728nleYG9z2OXxFtJdP/e/9
         48aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GGM8Pb2qbINtAOnQfN1oH4rym+MoVfXlsZjodYph/Ys=;
        b=CHoeIi63VT3tc6tH4kDO33MB7BtXoD4rVMqzrzi9nc9cXpJ8pJlH/fCJdLju64bWzt
         OFeWaXreBFgDGQanRaJNw2TzlEFnKyScMdx+ZIGZ6I0XxBEFDoiwLoRzrW81ZhBO1n8f
         66D3FgdFIAVzN+MQGnj2ZS3kl15AjycV2nvaNRlirSHZhq4skNhMSck4W6CbuP4h4wDx
         IHYxJfGbP5bB39kFLjhl0f9zponIl1zY85IZ7zlaE6LVtPNtO8ZsuivCjTYrj7BLD1fT
         VYElhSFCfmc4RHuo+9+X2v15Vc9ufqhaWrMoeGcmX7O6I/kuFiR9iie5p9h271nNewPE
         hjiw==
X-Gm-Message-State: AOAM5309JB1ZE2qG74vNLaojLbsdr/mkF7JqJKNKJcDgyaR8bUZctDex
	E7IoPTrBkBnaduYLlvBYy70WGXfZZWDqaEHE7rDsIOGv96w=
X-Google-Smtp-Source: 
 ABdhPJwrst/YjzlPYsbVXG1c4DoYKy/YZOt/qrQbAC8rU2mMAP7o0qyKT3e6+0Ubo9pJcYI8g90eDIYnxd3zmBPVfSQ=
X-Received: by 2002:ac8:5a86:0:b0:303:fba5:ed5e with SMTP id
 c6-20020ac85a86000000b00303fba5ed5emr8903298qtc.330.1654012280256; Tue, 31
 May 2022 08:51:20 -0700 (PDT)
MIME-Version: 1.0
References: 
 <36681a90-b7d3-4332-8860-b24dd9b7a35d@denue6es011.ebgroup.elektrobit.com>
In-Reply-To: 
 <36681a90-b7d3-4332-8860-b24dd9b7a35d@denue6es011.ebgroup.elektrobit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 08:50:54 -0700
Message-ID: 
 <CAMKF1sq7oxpm62Ox=faegxAt1eNPnu0pouZr5pWYWRhaMfawBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] json-c: Add ptest for json-c
To: Simone Weiss <simone.weiss@elektrobit.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Kai Tomerius <kai.tomerius@elektrobit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 15:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166320

On Mon, May 30, 2022 at 2:36 AM Simone Weiss
<simone.weiss@elektrobit.com> wrote:
>
> Also add a script for executing the ptests. All tests were sucessful on a=
 trial
> run.
>
> Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
> Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc |  1 +
>  meta/recipes-devtools/json-c/json-c_0.16.bb     | 15 +++++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index a1ead90649..0bfcb60c76 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -22,6 +22,7 @@ PTESTS_FAST =3D "\
>      gettext-ptest \
>      glib-networking-ptest \
>      gzip-ptest \
> +    json-c-ptest \
>      json-glib-ptest \
>      libconvert-asn1-perl-ptest \
>      liberror-perl-ptest \
> diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-d=
evtools/json-c/json-c_0.16.bb
> index fdec5ec9af..3fa5ce2c49 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.16.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
> @@ -4,7 +4,10 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee21=
6f2"
>
> -SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar=
.gz"
> +SRC_URI =3D " \
> +    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> +    file://run-ptest \
> +"
>
>  SRC_URI[sha256sum] =3D "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d0=
30c5ba8a0288d96b"
>
> @@ -13,6 +16,14 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)=
-\d+"
>
>  RPROVIDES:${PN} =3D "libjson"
>
> -inherit cmake
> +inherit cmake ptest
> +
> +do_install_ptest() {
> +    cp -r ${B}/tests ${D}/${PTEST_PATH}
> +    cp -r ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
> +    cp -r ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
> +    cp -r ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
> +    cp -r ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
> +}

cp -r may have permission issues its better to install using install utilit=
y

>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166275): https://lists.openembedded.org/g/openembedde=
d-core/message/166275
> Mute This Topic: https://lists.openembedded.org/mt/91427504/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

