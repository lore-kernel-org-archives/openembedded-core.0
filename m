Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62F9C19F2D
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 00:42:07 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.9484.1659832918138058797
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MqNHeWfI;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id z5so8932992yba.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=OnIAx8OLYD7gnMS3vaNVHx3+MVvlS8gQkV76/r1J6DA=;
        b=MqNHeWfIDVX5AjChttzhMf/T5dOFXmsrXM07tu1/TfWfEB25UhG/7zCrlYDx+AryRb
         YqG86P6BcMTB6mA3/EveXIs1KEf1wcZ/ocHOVdhWOSVb862QytT/WeWf00lES3Ab9dH0
         sCzcTizJxYnDnP1NCxn6qTdbFk+6cmsgRtRIYWu8HxvyxrFh74sx3oL5C/jipkTsG9fG
         IvhINeX6fh55RBb34C52GF4FCaoyVJjEvF58oE0ZT3f20yC9RxJOX0n1h7DXrgmxQNKb
         XjC2x94JoXOghuxzjg44N0MEqfL4xtG8r8M2cS55RLVXjeuOcAmnGmk+a9Di/Jm4SRwz
         0/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OnIAx8OLYD7gnMS3vaNVHx3+MVvlS8gQkV76/r1J6DA=;
        b=t9OhUjNv+Vp29NB7mNWTQsX192yoC0ml1JpUT5KxC1oyA+fB3J6pIIv81pWo93KKCP
         AZM6klN+9+W1xenUrdSmmS12sxOcPhouqA1YeYSe9m3/x9Sln1GVAKX7PUI2TjgEVI+8
         dd2Nk/VNH/B4L+r4DqvpVOOo8ve3oKcA2AHco7bTcNgP7VMy+PLI/YNJeHIkKdYuq7jz
         vMC/7e+K5OijqmBTBLzpSg2p4IO2WSTvD5GzTjkqWOwTbWyg5urlvCQbKq5ebtrHrpPU
         TAiWpOGyUui5VA3kQ98v/5wUhba0Ce2lXfb7JOpl/XM2xhtVF+vR/SaYpZGxmzSiRMu/
         2cug==
X-Gm-Message-State: ACgBeo3kgsR9wFvSr/QKsk4IwR82JSmysNktS4N8KWLkpiCgngjK4GDu
	DiGopXYRovjmMdan9XTvHPOnyFFmjfZfgSYEzeo14gGv
X-Google-Smtp-Source: 
 AA6agR6cq6Pvm/c3k6kDwcwkt6a0g2OR+xveLXBdshRc2plIVB/8uT3CdEGw1r9xffd0SY3H0ww6OGpgw9ZCcnNSIkY=
X-Received: by 2002:a25:e713:0:b0:67b:d3f3:3072 with SMTP id
 e19-20020a25e713000000b0067bd3f33072mr919092ybh.428.1659832917242; Sat, 06
 Aug 2022 17:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
 <20220805131252.3706794-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220805131252.3706794-4-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Aug 2022 17:41:29 -0700
Message-ID: 
 <CAMKF1sqbw1=EXmTbG96ZJ0daZkhr9k+8EY-B1GNkQ3KkaKkygg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/29] conf/distro/no-static-libs: Allow static
 musl for rust
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 00:42:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168979

On Fri, Aug 5, 2022 at 6:13 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> When building rust for musl targets we need the static library from musl,
> so enable it.

it should be ok in general to link with static libs from musl so this
change is fine.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/no-static-libs.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> index ee673834601..75359928a14 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -18,6 +18,8 @@ DISABLE_STATIC:pn-nativesdk-openssl = ""
>  DISABLE_STATIC:pn-gcc-runtime = ""
>  # libusb1-native is used to build static dfu-util-native
>  DISABLE_STATIC:pn-libusb1-native = ""
> +# needed by rust
> +DISABLE_STATIC:pn-musl = ""
>
>  EXTRA_OECONF:append = "${DISABLE_STATIC}"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168938): https://lists.openembedded.org/g/openembedded-core/message/168938
> Mute This Topic: https://lists.openembedded.org/mt/92834379/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

