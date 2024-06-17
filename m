Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE55AC27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 11:55:44 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.54801.1718625340626938821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 04:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qYp7s9sn;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-63127fc434aso34761437b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625340; x=1719230140; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdZolZ88EploPG4GBicxn1lXIGGRk/XANduveGBCBvU=;
        b=qYp7s9snCz73XgvEQz38X1YBaRqCZZ8wJdT8+/S7P5fYFeOJTJwLsHTshy2y3ry7UJ
         xkfN/TeDhpgFYN1cAQtuJWhBiaG7I6PFmZTYBvDajc/0y03wcatSyR3W7jBZz/Ze0F3X
         FGvlRB1k7uVYGpJ5OUdDWcWU2BV9AWQmzPb1nc2k/W1pMNZgKFAswuMu2MZR6w2Jts9Z
         1TkDXz/6rxQei6zxhvsb3pr1P3os2Y55Yu9T67wd7NxQeOPEsxFHC4hrBQNA1nPFnVMd
         4PJSOuFw/58VnsaTGzxbuRmPWWVEbXZcXIslq85NnXo5HhbDp1GyhxY0BLjOIaiVIlhV
         8u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625340; x=1719230140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdZolZ88EploPG4GBicxn1lXIGGRk/XANduveGBCBvU=;
        b=igf1Xkl8UCDqFcMyKOXZ5+SjyCVCrj6hI3wFfaManC/7EJCDJhJ3hhG0zLGR7EfOkt
         xlWuzDgjiSLEQhd1mhUBkLNjIzVTJf14t2vXQRmnRRrDiFRgrF2Hp8h/xSRWARyT3Zjs
         yTyAJr8LoDqKnF78GA3r/dNn41hQoVtoHuVyVwrlIvkw2tDK8A/BMoDy8KaasQ4bo9TG
         7v2a6a5K2OrCBcx+sDUm+hBNJT+xOVVRVJsAt1L9Yo+7cSo54qNj23xGhs6h+ykaBw24
         FV/juE0wsg1gF5lU+YhP+Vlmr4bI/4LVD0dM3CLVJ3UpxhSFeNTZxeKgtVn0TsDZvrHQ
         gvfg==
X-Gm-Message-State: AOJu0Yz9xvfo4kR/JWCUf993aBC9M+gNdBKKdjLZN4P1+WKEREW0VkAg
	9rbOULzE3F+PkzlyUTmpzwsdmnoXdvH0FjdqWBX+6wr+apSjIR0s2InswcBM/OaIjP7T1jzuRxd
	VsXzgeuzMZd5VpcTdmzqth+WorEulte2h3ldkrA==
X-Google-Smtp-Source: AGHT+IFJGIDums4wsFtlU7G9nVA5MYYBxax1Jcbc4VE3efb1YTZSVIvyOEcaE3LXeNsaS4HAdQ0UFpWov2Lor5ijx74=
X-Received: by 2002:a81:cf01:0:b0:631:3f2d:289c with SMTP id
 00721157ae682-63222d6124cmr86560497b3.26.1718625339615; Mon, 17 Jun 2024
 04:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240617063431.2221035-1-changqing.li@windriver.com>
In-Reply-To: <20240617063431.2221035-1-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Jun 2024 04:55:27 -0700
Message-ID: <CAOSpxda2zT7E_hJ4gm=M8EnJ1F3Ygo+j7+OA+nbUBA8Dj64e=Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 0/8] backports from master
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 11:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200810

All of these patches (as well as other f40/gcc-14 related patches) are
included in the patchset I will be sending out for review later this
morning.

Steve

On Sun, Jun 16, 2024 at 11:34=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> * backport 7 patches from master, so we can build scarthgap on
>   host with gcc-14, like fedora 40
> * Add one patch for fixing build failure for expect-native
>
> Changqing Li (1):
>   expect-native: fix build with gcc-14
>
> Khem Raj (1):
>   zip: Fix build with gcc-14
>
> Martin Jansa (3):
>   db: ignore implicit-int and implicit-function-declaration issues fatal
>     with gcc-14
>   cdrtools-native: fix build with gcc-14
>   expect: ignore various issues now fatal with gcc-14
>
> Michael Halstead (1):
>   yocto-uninative: Update to 4.5 for gcc 14
>
> Zoltan Boszormenyi (2):
>   cracklib: Modify patch to compile with GCC 14
>   cdrtools-native: Fix build with GCC 14
>
>  meta/conf/distro/include/yocto-uninative.inc  |  8 ++--
>  .../cdrtools/cdrtools-native_3.01.bb          | 12 ++++-
>  .../cdrtools/cdrtools/gcc14-fix.patch         | 13 ++++++
>  meta/recipes-devtools/expect/expect_5.45.4.bb |  7 +++
>  ...port-dictionary-byte-order-dependent.patch |  2 +-
>  ...e-dirent.h-for-closedir-opendir-APIs.patch | 45 +++++++++++++++++++
>  ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 ---------------
>  meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
>  meta/recipes-support/db/db_5.3.28.bb          |  4 ++
>  9 files changed, 85 insertions(+), 43 deletions(-)
>  create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.pat=
ch
>  create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Incl=
ude-dirent.h-for-closedir-opendir-APIs.patch
>  delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-=
redefine-DIR-as-FILE.patch
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200786): https://lists.openembedded.org/g/openembedde=
d-core/message/200786
> Mute This Topic: https://lists.openembedded.org/mt/106716173/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

