Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0C0D374B0
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 15:59:02 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.1546.1729180733552067580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 08:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NT/raX+i;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7180c7a4e02so654661a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729180733; x=1729785533; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQZE47ucM4GrZS+gbCPlFNNElDo86nDY3O8/7rRTBmw=;
        b=NT/raX+i7xcrY2DF3dT4nMuazswzd832COS0aMBzwJ0E2ZNzMl6w601QkOr0b7rywN
         B4kJJ06zV3MKVjqWWqPhs0g1QbH4wss+T006EM1LkQnA+UAHS6HfBE+xnvZuKdVeULFh
         H4PdVrjwiuPB95gpVzQCBzS1tMwL6oUOUaHhz3qFPHFptKQdGycHdLhM6LPIXyHL7Pv8
         EEJVgB2vBmAvaAvCtGEUo9OE9f2k8D+FN6PX9bUwwt8f5I2A6SlDzALKa3/WUdMSZ4sJ
         p9Y9lsuaftEX4SWQ7gzD23R2V38JCCoJOuMi3w68UvJwoePpcwYvAc3MW8iynaPSc1vp
         mGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729180733; x=1729785533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQZE47ucM4GrZS+gbCPlFNNElDo86nDY3O8/7rRTBmw=;
        b=v219cHdrFsVM95FRASw7sqwwAgFyUJ1/wdiFeJg9/i9BQ+6s9P9ahxCXkuPWrJqcn4
         YQYKOYMEIKPMIB3hy6QLCW+YmS+vU9T57W+OCz4/Cz6BljZ7CI0R/AtJQzc0T0EnauDw
         DTA//vGDqB1PQiD1RmaJz4w7GApszV1FxffnN4PkJ5nPW+COuVBr747qVtuAvPO1stj/
         G7ShfM4cYhHoXxmpj93Tr0S3bjUhQYZWo9pXoWXbOXTB04edlKj6P8zPRwCADKOsWvud
         1Djm0QLRpUiSnKNF7KdCSZozVP9A445AYv+ERQpIcy02/6DKnjQgc0Fu58BfqonNiLFe
         Deiw==
X-Gm-Message-State: AOJu0YyG0ePccajvxM78TgRPgPUrQqPuomFQfQ4JJx+lcDgEuiaQKtVo
	XxxKqVOnxqyvqxCCZixDNLA+oAtIygwY25hC6f7OTij26xOtrQC5aAaaRYJvGNTaxRZUa8XrZMW
	Z7aHtMWAtYLjOw4JSkMDNeSY7928=
X-Google-Smtp-Source: AGHT+IHwJkU2kofp9Ua3JOv6WAtoRvh62Ila7vCl25CQZBt68tzQQrgtRrvHSf/dOVI9j+HAcPjioEItc0y1XBTUD50=
X-Received: by 2002:a05:6830:2d89:b0:718:3e2:f41d with SMTP id
 46e09a7af769-71803e2fcb3mr6968511a34.0.1729180732772; Thu, 17 Oct 2024
 08:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241017095410.3475084-1-purushottam27.kumar@lge.com>
In-Reply-To: <20241017095410.3475084-1-purushottam27.kumar@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2024 08:58:27 -0700
Message-ID: <CAMKF1sq5T1n2_Uwph5KAru9U_hRHzZAee=0HgYhBstRBOKfvfg@mail.gmail.com>
Subject: Re: [OE-core] [styhead][PATCH v2] kmscube: Upgrade to latest revision
To: purushottam27.kumar@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 15:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206030

it needs to go into master first IMO and then backported, kmscube is a
leaf package so perhaps less of a problem for backport but it will be
good to mention what changes are coming in due to this srcrev bump,
would make it easy for backport

On Thu, Oct 17, 2024 at 2:54=E2=80=AFAM Purushottam Choudhary via
lists.openembedded.org
<purushottam27.kumar=3Dlge.com@lists.openembedded.org> wrote:
>
> Upgrade to the latest kmscube revision.
>
> Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
> ---
>  meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-=
graphics/kmscube/kmscube_git.bb
> index 34d5a7d71d..01ea80a142 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/=
egl libdrm virtual/libgbm"
>
>  LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D=
8b309d4ee67b7315ff7381270dd631fb"
>
> -SRCREV =3D "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
> +SRCREV =3D "b2f97f53e01e07a920761e5d3e3ba22898b794a4"
>  SRC_URI =3D "git://gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;p=
rotocol=3Dhttps \
>             file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patc=
h \
>             "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206011): https://lists.openembedded.org/g/openembedde=
d-core/message/206011
> Mute This Topic: https://lists.openembedded.org/mt/109060935/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

