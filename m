Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76ADC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 14:23:15 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.26037.1680099785740638028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 07:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uuxfJBdR;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: sakoman@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id n17so11461353uaj.10
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 07:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680099785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8fDGKcucyGkyo6QehT2fFSC9oWQHzfCXdu8nufAFj0=;
        b=uuxfJBdR0sBjVbzzF2216s0lD09u4lQKu8IIwVfzwHW3qmnOkH150OcT3yAmABKVwC
         QrZh/qqLag+0SCuLqYNzjOR1dBcy6QNm2SnRdrWqam+FxHUQRsPublGgmZ+33rOy/nVq
         d9YlYx8d2vrfXr4XQ8lOFJpFyxnQZSe4cn9uAQBz7eN9QBR3n5udByz6ffil0QHdIjh8
         OZ+iATQk0+0/XY4s43xcDWGKN5lAi6Ku7ibZmg+GEpZqBhc67BejJ43DFqG6KrXTKdFo
         uSmibf+JBXPbPvpYZ4gbkRL8jqPOpljUSaqSY1HU+IFNZy7TYOv8LVh09pjZ2sLL17dG
         OiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680099785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8fDGKcucyGkyo6QehT2fFSC9oWQHzfCXdu8nufAFj0=;
        b=ec2F6kjYwSnfxtVQkE4Htbh66rR+ezCJsDic/jjq2r36o4nLKignNc5FzEmpEL48Hq
         zyT+um9JI7inmp1FynTClvQ8kf5NyFTMAyrX9Es4XlAI6ItQ13B6USCddrLiMjZW9zAB
         dCs+bZz6lu+eJubsj28ohs8P6TvrFJpHAbTNAgvy/OAnTYDRr77bfUjP5t0mQX0TpdkU
         enWJIMq+Qj8Mdq1Pzh4UIllH+x45sxoKNudFKrp+iVoZhfGdb3LSn1a06HPqTsmtFPFS
         hjD4LQEeHPS0+rKwZKeZvj1LrB1l+6Jh0iVHKNorbovMMBadZYcDjzUwKfaRiN0jTgqT
         Z71g==
X-Gm-Message-State: AAQBX9egMuleCp53pIV8eftjfTyiD19k5DVrCJLC5XLgzt+sdoWbcR1/
	nYxIW/Gm6XRu6zC+fjZ6/KwbXDpCy1AzgIRvx1c=
X-Google-Smtp-Source: AKy350aKQhWFZGHtNgaV3N1b4Sg9/qoYM7MBnxC2ovnQbZnMDEbwCQRGqlW/PF1RsvH+pm/toaAG5xRTuaN0ol5M26Y=
X-Received: by 2002:a1f:ad46:0:b0:401:7625:e9e3 with SMTP id
 w67-20020a1fad46000000b004017625e9e3mr1447761vke.1.1680099784780; Wed, 29 Mar
 2023 07:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230329132952.2415412-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230329132952.2415412-1-Martin.Jansa@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 Mar 2023 04:22:53 -1000
Message-ID: <CAGDS+nmcLtD_SpQn+DbeoxHNZxho9-HAK6e7Jn1QWYDGjx=BKQ@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH] bmap-tools: switch to main branch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 14:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179281

Thanks!  I've cherry-picked this into langdale and it will appear in
kirkstone shortly too.

Steve

On Wed, Mar 29, 2023 at 3:30=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> * master branch was removed upstream:
>   downloads/git2/github.com.intel.bmap-tools $ git remote prune origin
>   Pruning origin
>   URL: https://github.com/intel/bmap-tools
>    * [pruned] refs/heads/master
>    * [pruned] refs/pull/73/merge
>
> * downloads/git2/github.com.intel.bmap-tools $ git branch -a --contains c=
0673962a8ec1624b5189dc1d24f33fe4f06785a
>   main
>   release-3.0
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  meta/recipes-support/bmap-tools/bmap-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/rec=
ipes-support/bmap-tools/bmap-tools_git.bb
> index 78c51e7731..89b7bf2b93 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> @@ -9,7 +9,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -SRC_URI =3D "git://github.com/intel/${BPN};branch=3Dmaster;protocol=3Dht=
tps"
> +SRC_URI =3D "git://github.com/intel/${BPN};branch=3Dmain;protocol=3Dhttp=
s"
>
>  SRCREV =3D "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
>  S =3D "${WORKDIR}/git"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179277): https://lists.openembedded.org/g/openembedde=
d-core/message/179277
> Mute This Topic: https://lists.openembedded.org/mt/97928170/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

