Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791F6C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 17:02:45 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.1568.1682528559831987982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 10:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=caNxZ36g;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-507bdc5ca2aso13050255a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 10:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682528558; x=1685120558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2b/3x4S8BLgnMMajYbGmaZlEMX3XZa9PYr1uButf3A=;
        b=caNxZ36g/jgdjRcCk4oJNCs79s1L52pGTjH/oD5nC2jnMQuSH9kQ9NdWJBrOLqMYfu
         jLa7aaXC+EwDzFfqD/nR2/OTrzXbCF0nlkjRZvUrnqTnpjcn1Syp7jvCfVj0PHgbcFki
         ThE1QYIYO1oKdpvIfDq/OAMyThY3U7KiUDqvLyCOYCNQIBl+QNADKSqKi/GEP0hgvK9z
         Gr7P+e6ARTgrosnzkJEgLtnded6cDXp7dcm+1xugyiW8Ou5fVclZXL0QQf21ITl204ad
         I8gbu8VLxo0EtJoY4UO7F8kp1RtFQ9QQPY8gQjpmzG33YZLRfSCx4hWmlFPgEqcZBzGF
         VO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682528558; x=1685120558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2b/3x4S8BLgnMMajYbGmaZlEMX3XZa9PYr1uButf3A=;
        b=i5T285JSKbN9j4A3CEHlmwVYafJLcTo2Ln3NG2sR4Z5gx6nHbg1eKbvqh+ApK7+QrM
         O0x9TRyybTMbe8VsS9rdAw+jViclfvWr7q1qnBLJP0MLHWmStJCh+xAmiFn/NbSB+A6U
         JNF8/nUc75UVqlZScnFqVNn+uRJdNl7uenrwI++3e67d7jssRd+0mtzml4oD5aF6QVtx
         OzunbupKeD8+v0WhqQZML5XOB4VX90LLdVeu02vFXyyH24B9H0xVUGX0wN7fq34V04sa
         ovbA8z+A3xQuOU9CMuZ/bft5NUV5TQskaYHqtur2r1mMAeKeGMgVIHkK+XCnpd3UkOXi
         n35Q==
X-Gm-Message-State: AAQBX9c+bXLf11XD0jKUSC6hSM45/jSoY1TCpw6vFF36HgybEwtIgNQE
	4EnHHHtWcB9J2HQFih4a3du3kuVYR2xerc4D3p0eWA==
X-Google-Smtp-Source: AKy350YpFBPypSafrW7ghoFbTgZKbAgAVUO90rSojPEhN7fGMcvsFz0f06KbhvSDfw5I1OKzX6oaFyYJns9EgpAThVA=
X-Received: by 2002:aa7:c984:0:b0:506:9ed3:b470 with SMTP id
 c4-20020aa7c984000000b005069ed3b470mr19311212edt.21.1682528558071; Wed, 26
 Apr 2023 10:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230426111915.2740079-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230426111915.2740079-1-deepadeepthi98@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Apr 2023 07:02:27 -1000
Message-ID: <CAOSpxdZWcCVPg0P2y_vtL1homkyGa_xRy7tQjXXjT8iWfoT=TA@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] glibc: stable 2.37 branch updates.
To: Deepthi Hemraj <deepadeepthi98@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	linux@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 17:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180449

Since master is still on 2.37 I think this needs to be submitted for
master first before I can take it for mickledore.

Thanks!

Steve

On Wed, Apr 26, 2023 at 1:20=E2=80=AFAM Deepthi Hemraj <deepadeepthi98@gmai=
l.com> wrote:
>
> Below commits on glibc-2.37 stable branch are updated.
> 1d63573f81 stdio-common: tests: don't double-define _FORTIFY_SOURCE
> 590d0e089b elf: Restore ldconfig libc6 implicit soname logic [BZ #30125]
> 790e504a17 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 2 +-
>  meta/recipes-core/glibc/glibc-version.inc   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dist=
ro/include/security_flags.inc
> index 2972f05b4e..e950e06ca7 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -15,7 +15,7 @@ OPTLEVEL =3D "${@bb.utils.filter('SELECTED_OPTIMIZATION=
', '-O0 -O1 -O2 -O3 -Ofast
>  lcl_maybe_fortify ?=3D "${@oe.utils.conditional('OPTLEVEL','-O0','','${O=
PTLEVEL} -D_FORTIFY_SOURCE=3D2',d)}"
>
>  # Error on use of format strings that represent possible security proble=
ms
> -SECURITY_STRINGFORMAT ?=3D "-Wformat -Wformat-security -Werror=3Dformat-=
security"
> +SECURITY_STRINGFORMAT ?=3D "-Wformat -Wformat-security"
>
>  # Inject pie flags into compiler flags if not configured with gcc itself
>  # especially useful with external toolchains
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 1b8665a9d8..4e0b82f1de 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.37/master"
>  PV =3D "2.37"
> -SRCREV_glibc ?=3D "d8e1a7590d375159fb5aac07ad8111ab4699e994"
> +SRCREV_glibc ?=3D "1d63573f81945a489ea169636fa11850bc74716b"
>  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180430): https://lists.openembedded.org/g/openembedde=
d-core/message/180430
> Mute This Topic: https://lists.openembedded.org/mt/98512433/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

