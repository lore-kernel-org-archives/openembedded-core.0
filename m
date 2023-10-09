Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0B4CD612A
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:09:42 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.71653.1696878572970836894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 12:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wez1mOaO;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6969b391791so3276881b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696878572; x=1697483372; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+SQKzXZ9mpy1Dvngs2+8ejbpJ7sSDeX4L0WmWTgCOc=;
        b=Wez1mOaO/Wujg/TxCNlSzzVDq/lpGAGdSQziAQyYKEkcZcSq1L3rtgrfmkeA0xogI+
         BattTvJFn/jr+xEc4Ga+I8OXczYIx1QZ6P9slgFOuecVjLvwpmSUEzHAs/SXqW/O/7jx
         CdjskZTUDi0z6Wz4g3+Ie8oMCQiDpwPtMcF8ROBTvakvq1cY3HCueH05umIcUmdJGHKd
         6+OsPwbk0u9YemDGAMvj4I4j/CDLFzBfV1cjU3upQuU4M76Gc0h56WxzmWL5jzimhk8k
         npjFpXza+waBpub2qWW4OxMwtOJFFRQFc6f/P3L5DmvfwwRw6oLj7wzEp4kqWnIIsaV0
         jXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696878572; x=1697483372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+SQKzXZ9mpy1Dvngs2+8ejbpJ7sSDeX4L0WmWTgCOc=;
        b=O/mjb7AddHDnr4FtGIx/9pYy0pMkwnjrAu9QxZnTFnesJz49Sg9rBSIDyDz13i54SE
         VfG9mA5emEOHpwArN3dBchpqn9bmHSIbfagNZot2GlCWAICFuxrzfKM2ZiBXHNrn1FaY
         6M60gqPqyrx29Mb6TyK50uhmrWZIocYsxs9o5EI2UO56AuvAyxUIwdg1F0awLeDUD7JH
         cTfNWkWg0qlHBbrBcWd0t7NbfUtY6sCFQf1vnALDvCCT8avZZ5yYp+uWaV6/d8jZJ7l6
         SIBzDa/QUCbvfI90Grcnjj6Ldi9i+iRb0xfT9FVf6h2RzjbOt95I8Y98ceo8UvVo6xhn
         XUMw==
X-Gm-Message-State: AOJu0YxUmvwNiKzaTuPNqPhlpw2kSowQVWZy/Z9tZy4BUtL16mdcs/Sy
	wEFU1osESrHsgStbwTQGM6WsZgouNU12aZEUdiM=
X-Google-Smtp-Source: AGHT+IEGkCuJNu54FTJnWNssom+O8gDgTYZxAkwCF7YbRxoOhaWFfgg5GG6Ahfk8Vomwj4lk6k2niWbqlm2y9jQ1PQk=
X-Received: by 2002:a05:6a00:1825:b0:690:f6a1:ae62 with SMTP id
 y37-20020a056a00182500b00690f6a1ae62mr16160457pfa.23.1696878572336; Mon, 09
 Oct 2023 12:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231006200814.178676-1-peter.marko@siemens.com>
In-Reply-To: <20231006200814.178676-1-peter.marko@siemens.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 9 Oct 2023 21:09:21 +0200
Message-ID: <CAB2nKc8_7uCz20PSnRXY+ycoP+jekwWev9PUAFwt_DcFcxtnkQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable
 2.35 branch
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 19:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188861

Hello,

I have a small question concerning glibc source handling.

I have a machine connected to the Internet that runs
bitbake -k -f --runall=3Dfetch universe
and another offline machine that uses the previous fetch as a source mirror=
.
When I bitbake my image, it fails to use this with

ERROR: cross-localedef-native-2.35-r0 do_fetch: Bitbake Fetcher Error:
NetworkAccess('git://sourceware.org/git/glibc.git;branch=3Drelease/2.35/mas=
ter;name=3Dglibc',
'LANG=3DC git -c core.fsyncobjectfiles=3D0 -c gc.autoDetach=3Dfalse -c
core.pager=3Dcat fetch -f --progress git://sourceware.org/git/glibc.git
refs/heads/*:refs/heads/* refs/tags/*:refs/tags/*')
It seems git archives seem corrupted?

Do you know what could be causing this?
Best regards,
Vincent

Le ven. 6 oct. 2023 =C3=A0 22:10, Peter Marko via lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> a =C3=A9crit :
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Adresses CVE-2023-4911.
>
> Single commit bump:
> * c84018a05ae tunables: Terminate if end of input is reached (CVE-2023-49=
11)
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.35.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index c23a43576c..e0d47f283b 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.35/master"
>  PV =3D "2.35"
> -SRCREV_glibc ?=3D "73d4ce728a59deb2fd18969e559769b3f590fac9"
> +SRCREV_glibc ?=3D "c84018a05aec80f5ee6f682db0da1130b0196aef"
>  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
> index b4bad5b7ac..271520f76b 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -17,7 +17,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-1010022 CVE-2019-101002=
3 CVE-2019-1010024"
>  CVE_CHECK_IGNORE +=3D "CVE-2019-1010025"
>
>  # To avoid these in cve-check reports since the recipe version did not c=
hange
> -CVE_CHECK_IGNORE +=3D "CVE-2023-4813 CVE-2023-4806 CVE-2023-5156"
> +CVE_CHECK_IGNORE +=3D "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-202=
3-5156"
>
>  DEPENDS +=3D "gperf-native bison-native"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188784): https://lists.openembedded.org/g/openembedde=
d-core/message/188784
> Mute This Topic: https://lists.openembedded.org/mt/101805676/3616779
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [vi=
ncent.prince.fr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

