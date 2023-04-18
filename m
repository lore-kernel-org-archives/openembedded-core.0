Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F239C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 00:00:16 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.25982.1681862407738808316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 17:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i03LEzjm;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-541f4ee6f89so428250eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 17:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681862407; x=1684454407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm7jOhVZp8iwbW4N2qU6W4W7Uiq3Me9H8mdO6ufgG+w=;
        b=i03LEzjm0JDckdlBB7mQ3FGfZhEbkpO248B2Sa4VUApeXSlM6T1rYJkir+T2s7ZKV7
         nrEX75wkvjm2J/1jhVsmdTQryQftFVo96h1uDuO7FNqkRf76jaiziwQRNpdXQZTJe5Ru
         dFS1OSw8F6GyqVLG7QUhk72CRY1Ff1SpzTr640cEUSu6p9ZuXKWrOOX84Poy6HeurzNv
         WuwLRQu9v5kmANUNAx9xLd8wbKKOKYncxIzh1GV0D3tObh6c5DbxYcoWO65DT1wxpOS7
         +oGG6eNGpfUgkuI+Ha8kk9O6jWgHfiTvO8PDj2QjjAiduwOFDdxeW0fGF2fSGkj5ziFx
         b+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681862407; x=1684454407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm7jOhVZp8iwbW4N2qU6W4W7Uiq3Me9H8mdO6ufgG+w=;
        b=YaPQs/KNAsK3QuV5ATXCf3DE7fgnjE12Xh3bR6Nyg0ablI6rYj/Sra45wUIywZfaXL
         oD80ZcUw1ShmsCP7ekYlo3M1ppo3o3JhiKxth0iEXUVwtsmrAwoxuqJZn7ZnGIvkyQL5
         j7lzXTtSuFAZOVQifFh/Ek/r3COVkhiwnoW9dG5W1vK0m1xNkgjf0Y686UUZ9AvyYT4e
         OYZ2fxI73f6yQWqIbGU14AoSofq10EgAMvXfGehb93Nb0jqVjEEMonBnWsdA0RjhELk0
         2wi2dV8+IJYK2i+8FbqrnyzDUIFH/FFyrCBL/Kybjvglf2jb19bx/aCM1Pd9PcV4YrPB
         HTAA==
X-Gm-Message-State: AAQBX9cPjK2CP+qeKVVadgsJ8YDY9Pd0CWhuUPfAtI9X7WgGO67J+hPf
	EPw4W3v2N0pM7tWC2UbyrQdRlwrgsSaqYtmQHI0=
X-Google-Smtp-Source: AKy350ZTNofEVdfh3iece6Pr6xx2JIY+s1v0FjRooX4bmAzkdHdGDcbEf8c5CIp7soMGvucZh0W+TSJlpW4E3PuTTSY=
X-Received: by 2002:aca:dfc4:0:b0:38e:2993:be84 with SMTP id
 w187-20020acadfc4000000b0038e2993be84mr922760oig.4.1681862406776; Tue, 18 Apr
 2023 17:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Apr 2023 16:59:40 -0700
Message-ID: <CAMKF1srawEwScb2i3Bm1qp_nXs9XSK8A1esrMFSFvELyMZCG8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] parted: upgrade 3.5 -> 3.6
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 00:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180205

fails during do_patch see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2669/step=
s/14/logs/stdio

On Mon, Apr 17, 2023 at 1:08=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-extended/parted/{parted_3.5.bb =3D> parted_3.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/parted/{parted_3.5.bb =3D> parted_3.6.bb} (=
96%)
>
> diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes-ex=
tended/parted/parted_3.6.bb
> similarity index 96%
> rename from meta/recipes-extended/parted/parted_3.5.bb
> rename to meta/recipes-extended/parted/parted_3.6.bb
> index ea2b68bbd8..05d57507fb 100644
> --- a/meta/recipes-extended/parted/parted_3.5.bb
> +++ b/meta/recipes-extended/parted/parted_3.6.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>             file://run-ptest \
>             "
>
> -SRC_URI[sha256sum] =3D "4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c24=
8578b1d2470c05a2"
> +SRC_URI[sha256sum] =3D "3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b3=
0ccde5e73359e612"
>
>  inherit autotools pkgconfig gettext texinfo ptest
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180152): https://lists.openembedded.org/g/openembedde=
d-core/message/180152
> Mute This Topic: https://lists.openembedded.org/mt/98314724/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

