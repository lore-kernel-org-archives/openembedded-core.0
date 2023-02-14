Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6F2C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 17:58:47 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.960.1676397518153905258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 09:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jTLr9rzP;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bd6so13635953oib.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jha3O8pgfpehyWzCET4MBjK1DxIiaVwUT9iboZq3D7I=;
        b=jTLr9rzPvvsX31lJcn3IGZLJqRMHLFIfgsCx0z01iKnhVW98a3oUW0P00L5D/J/pV9
         PMwMAE7kV5PNGFoNWuFVAphhGF4QWfzmgqlS2xZYnxNv4NC183aqX1U9rF5wm84Srmeo
         yIG9vdnW2tv440cvGBMb/1YOM0qgj/uc6vCS07XTMdGHR/qigVVinbTegAtOSm4bNx6t
         UTfIZM7mvdaTO4ro/Au9XsendRTZrS+bQQVrnnNR/YdJmZtxY+3ZMjjoyWgQHVkWpPHv
         3iNKDVsMC3O4uoqPlSdzWR49dAW3HAuoIfCvLWLEERwiWLZE03gq15z6JXLHbSAb/Gag
         grLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jha3O8pgfpehyWzCET4MBjK1DxIiaVwUT9iboZq3D7I=;
        b=ikyqrortlWXMso3fRltqfKC4RgTkvUq5TKrQTVZ64MZIhQgeE9u7cf1xMtroL9snWJ
         YJql+TpCckjeQjxKayu0Hle+KTMFWLw2txwIc38A1FjCFMkBMcLy3MhHEjWoZWI7XdvU
         KbtzKd5V1AAguv0N+CTrGjh2Iws0PvEVE8dkFp2+Ml0wotLTpS1HP7wXBgbu/SYurQtq
         gSCLzV+eNO8Fa88ywMm8RfDry/k4UGJ26hrYbMqQj7+2986RguYajNdONJ/PTJaAr7Ws
         LRZid0w8qsZETAFw3KKkH/AbD5OBglL+ufRGMZ0v1giTZDK72ffXhX1RlEmNwnmgGjUs
         j1Qw==
X-Gm-Message-State: AO0yUKV8whnb7S9CAxEzZFU1zBwMzEk5Je87Sr2mfG716tM7pwtgfHfO
	75EVi2kF3D6Si/XFrJBqlEeJN2H8/BiYHLmNw8c=
X-Google-Smtp-Source: AK7set+UVLZwQ9TVEkbCoW3Rd1fS3+tBaBZKvp5HQ+xwP1Rx9pTp7fXhzbBnW6K0T0Uk1UBOuWki2h9gt3QSvbBsqUw=
X-Received: by 2002:a05:6808:19a8:b0:37b:592b:ec39 with SMTP id
 bj40-20020a05680819a800b0037b592bec39mr24949oib.262.1676397517236; Tue, 14
 Feb 2023 09:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20230214164204.2792379-1-ross.burton@arm.com>
In-Reply-To: <20230214164204.2792379-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Feb 2023 09:58:11 -0800
Message-ID: <CAMKF1sqEKPCXT2J+8+nwy2yWF5jPL-68J6CdUZGWAyymZ7-K-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libcgroup: clean up musl DEPENDS
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 17:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177169

On Tue, Feb 14, 2023 at 8:42 AM Ross Burton <ross.burton@arm.com> wrote:
>
> libcgroup uses fts_* functions, but these are not implemented in musl so
> we depend on the fts recipe and force a link to libfts.
>
> However since 3.0.0 libcgroup will automatically look for fts_open in
> both libc and libfts[1], so this can be simplified to just a conditional
> DEPENDS.
>
> [1] https://github.com/libcgroup/libcgroup/commit/27ba904355575153308bdc0fa48344ef1be55ca1
>

cool. LGTM

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/libcgroup/libcgroup_3.0.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
> index 9937a17fb51..457b965481d 100644
> --- a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
> +++ b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4d794c5d710e5b3547a6cc6a6609a641"
>  inherit autotools pkgconfig github-releases
>
>  DEPENDS = "bison-native flex-native"
> +DEPENDS:append:libc-musl = " fts"
>
>  SRC_URI = "${GITHUB_BASE_URI}/download/v3.0/${BP}.tar.gz \
>             file://0001-api-Use-GNU-strerror_r-when-available.patch \
> @@ -18,9 +19,6 @@ UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
>
>  SRC_URI[sha256sum] = "8d284d896fca1c981b55850e92acd3ad9648a69227c028dda7ae3402af878edd"
>
> -DEPENDS:append:libc-musl = " fts "
> -EXTRA_OEMAKE:append:libc-musl = " LIBS=-lfts"
> -
>  PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG[pam] = "--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes,--enable-pam=no,libpam"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177157): https://lists.openembedded.org/g/openembedded-core/message/177157
> Mute This Topic: https://lists.openembedded.org/mt/96963828/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

