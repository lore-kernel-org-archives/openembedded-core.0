Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B928EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:08:59 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.584.1692806937042892569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g4/0oX5M;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1c4b4c40281so3613157fac.1;
        Wed, 23 Aug 2023 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692806936; x=1693411736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JZxnukDKpiWJaRkrPLPWYm5psKdDBHeiMtruD/e7rY=;
        b=g4/0oX5MG6tRdg0Yd14YUM80zdUunQ2SwyfIi8Kd3vzN94X99PlKCDbxZugX1t3ftm
         9vG9sWZOoqK66ifo178d0NyvmpI9oEC+8rOA+WmQBRGwR9hDEWsxwlY+ojjlCBO5Dwbh
         VCI+lPt6ZtuCcfamU2QHf+Hu567S8e8IVZVxhXasDnn4zdbiPenE6rORIkoYbTPgkc8E
         nslxCYN1/QsqfkEi5jmVegh3SLfZKv+vKOmidvnDDb6dT1zXicNeZL6LF0A1IC0tXo1X
         bvgoZzyTKIJB2+YtGomRB/koTG3Qb7kdVNsrkLMB76av6Wm/8ojW34zpHG9UllKNugTD
         yllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692806936; x=1693411736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JZxnukDKpiWJaRkrPLPWYm5psKdDBHeiMtruD/e7rY=;
        b=f4tfrIjQ2hjPJqch8zgoDO2lj3xvK7hY7utmfoWlBL4gSgidrfQ86FA1qsZpUzOg2D
         EcAMdvYK8DI//NAtbcC7f82jD12S8zvzqEv7qURjMP1FGYoSrnF2795Mb/fD6D3SaqHN
         D1NZYU+JMoK9QcTg8a/GgQvu2+hYn6ewNQMC/20W8HYZKY71YJ+xT3413egcheaa3ssF
         pxQOIlEyLiZCKEmfQTKUn4W8thTtDC+CfzpUPeSNl80LrHkISaPfq8IYF3PKJ2EFwyUO
         BM+/sNfVlS0IXErxVz5oSrKTbDKrh7LpLokEqNGwWrT7yeYKuy3vCo103ribv7GHcyKd
         eXaA==
X-Gm-Message-State: AOJu0YzSmlWF4dyP1TmPOd0lT8SAds7DLYDZl1EkMiYqyR5Onlg1/Xia
	a8gBb/vnlsoQEAM3FyKL++0D7VkSpADkdU9rzFA=
X-Google-Smtp-Source: AGHT+IEM2DBibhaAtAnohcUg3AeOrfCn+wjGEeg8muSEvRmTyTySCePLbdL18uwRemy9Opzc+hiJ6ur4qBkrmpbbRWk=
X-Received: by 2002:a05:6808:2a57:b0:3a7:6429:b9dd with SMTP id
 fa23-20020a0568082a5700b003a76429b9ddmr6509085oib.11.1692806936167; Wed, 23
 Aug 2023 09:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230821173840.1337747-1-tgamblin@baylibre.com>
 <177DF2562B5153F0.28529@lists.openembedded.org> <20230823092739.56667920@booty>
In-Reply-To: <20230823092739.56667920@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Aug 2023 09:08:29 -0700
Message-ID: <CAMKF1soe84F0n4_YDKojGRZkfCbGw=8WS=bXJ9wxO14Z4TFa0w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/2] Upgrading Cython to 3.0.0
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org" <luca.ceresoli=bootlin.com@lists.openembedded.org>, 
	Trevor Gamblin <tgamblin@baylibre.com>, openembedded-core@lists.openembedded.org, 
	tim.orling@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 16:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186618

On Wed, Aug 23, 2023 at 12:27=E2=80=AFAM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> On Wed, 23 Aug 2023 09:24:42 +0200
> "Luca Ceresoli via lists.openembedded.org"
> <luca.ceresoli=3Dbootlin.com@lists.openembedded.org> wrote:
>
> > Hello Trevor,
> >
> > On Mon, 21 Aug 2023 13:38:38 -0400
> > "Trevor Gamblin" <tgamblin@baylibre.com> wrote:
> >
> > > The Cython 3.0.0 release contains many changes. Since there are a lar=
ge
> > > number of recipes that depend on it, there will potentially be build
> > > issues with recipes in meta-python and elsewhere. I performed a world
> > > build on poky alone with the python3-cython upgrade and the only reci=
pe
> > > to fail was python3-pyyaml, so that has been tweaked to work (via two
> > > new patches for the recipe; thanks to Tim Orling for the heads-up).
> >
> > This series makes python3-cython non-reproducible:
> >
> > AssertionError: The following deb packages are different and not in exc=
lusion list:
> > /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/=
tmp/deploy/deb/./core2-64/python3-cython-src_3.0.0-r0_amd64.deb
> > The following ipk packages are different and not in exclusion list:
> > /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/=
tmp/deploy/ipk/./core2-64/python3-cython-src_3.0.0-r0_core2-64.ipk
> > The following rpm packages are different and not in exclusion list:
> > /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/=
tmp/deploy/rpm/./core2_64/python3-cython-src-3.0.0-r0.core2_64.rpm
> >
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3400=
/steps/12/logs/stdio
>
> And just noticed this is also introducing some warnings:
>
> WARNING: python3-cython-3.0.0-r0 do_package_qa: QA Issue: File /usr/src/d=
ebug/python3-cython/3.0.0-r0/Cython/Utils.c in package python3-cython-src c=
ontains reference to TMPDIR
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7657/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7657/st=
eps/11/logs/stdio

there are few meta-python recipes which need attention as well.

https://errors.yoctoproject.org/Errors/Build/170232/

>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

