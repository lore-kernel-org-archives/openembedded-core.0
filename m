Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF431C74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 15:44:40 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.76158.1679586279557995158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 08:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=auaRLIsR;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17997ccf711so23181937fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679586279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFCXW+46kylQDp89HDT2IvJ6w9uLQvzuHudgz77CB2k=;
        b=auaRLIsRyqGuFjItTq6+tQn/gkiJUJ8p/8bXEBh6wGXq2tHvZt/75FuLU4hTsnKSS2
         SXIOInBbTZJQLcxe3oIGG20n+TJPfd6dkG3uH8JqXKVytfXHaaMocKrZkTZZQNyY8GOm
         g9krM1/hRYlMJPNnWH4R6fX0RT+k3vlGPY5zD66ayolno7rRoK7G1JLbtw4hZawXhdUG
         trVV1XOwmE+9v2GB9KBxnHvbWs5Pwf9ancEqSYJ6XOTaphv8qShr4SV61w0Gx98x5Dyy
         4F8Hp+8Cgk02M6QRXnkr9bU0B+7VIYEWcdnhbaV/nHjWxnKOinGma5mk4z8q+JnPZ3rR
         qOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679586279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFCXW+46kylQDp89HDT2IvJ6w9uLQvzuHudgz77CB2k=;
        b=kBbT1aw/slK+JewxToemuNqD77q1+5THriCXXGMdMJim0yDmsnLKnh1f83oyG6nVJn
         0YZNUd2kvKhqJ8jpaRDxUuHYuA10NeMZQ0/XIlcqGW4zDUNmSVEQwrWxBbCsJErtb0qe
         RKDxCIPaHuFvhQ/D8uPecfiaLjXViLp/aDkk7Xgy0vXPDO12zLLoQFj5e7byrC2+ruAh
         S9tAuBHCIMLo/f7aGanXVL1jvc4qItGqo9YdfHvraE2izPIxG+pSfbweGJeCki5r7HXw
         zJVmPXN9h6Ad3aBjXtkJg0Gl4bak8ecMhLrpkkl8iAZnZk6zbrSKk1d/2yYvHComgb9j
         DpoQ==
X-Gm-Message-State: AO0yUKX2yzjTjXf7A6E0inql+0ir3GkW/Rr5mZfnNJ9+0434ehg4avGH
	YcwySRfSePOXCOag9BP2LpnP8vCLdBPUnutHmtXRdD8Wdpo=
X-Google-Smtp-Source: AKy350Y8+hIklHB3IiQt7orWDKFNCjZQTwB2VHZD1O8JxCYVYWJ6iZ473xDdclyonquILSaYTvO7UYX24VXY3RvY1zY=
X-Received: by 2002:a05:6871:d96:b0:17a:b713:63e9 with SMTP id
 vi22-20020a0568710d9600b0017ab71363e9mr1276489oab.4.1679586278702; Thu, 23
 Mar 2023 08:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230322121229.2007987-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20230322121229.2007987-1-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Mar 2023 08:44:12 -0700
Message-ID: <CAMKF1srJFtNyq=LEXABsrc1=Dd9dx+XPn7BKEV1oeq0xjBwU7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: Update from 7.88.1 to 8.0.1
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 15:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178989

This breaks ettercap in meta-oe

https://errors.yoctoproject.org/Errors/Details/698639/

On Wed, Mar 22, 2023 at 5:13=E2=80=AFAM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> This update contains bug, security, and feature updates. For detailed
> release notes, see https://curl.se/changes.html#8_0_1
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta/recipes-support/curl/{curl_7.88.1.bb =3D> curl_8.0.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/curl/{curl_7.88.1.bb =3D> curl_8.0.1.bb} (98=
%)
>
> diff --git a/meta/recipes-support/curl/curl_7.88.1.bb b/meta/recipes-supp=
ort/curl/curl_8.0.1.bb
> similarity index 98%
> rename from meta/recipes-support/curl/curl_7.88.1.bb
> rename to meta/recipes-support/curl/curl_8.0.1.bb
> index 0930d229d2..5cf044615f 100644
> --- a/meta/recipes-support/curl/curl_7.88.1.bb
> +++ b/meta/recipes-support/curl/curl_8.0.1.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>      file://disable-tests \
>  "
> -SRC_URI[sha256sum] =3D "1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca9=
09d6938249ae415f"
> +SRC_URI[sha256sum] =3D "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025=
f2bf118e79e0b5f0"
>
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178921): https://lists.openembedded.org/g/openembedde=
d-core/message/178921
> Mute This Topic: https://lists.openembedded.org/mt/97776368/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

