Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F8EC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 15:30:14 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.16235.1753198210835747853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 08:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dy7o69Jb;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fabe9446a0so48616766d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753198210; x=1753803010; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AYUhbaXkFUtSifk2kaHUHL5Nx8MjtAaTF7aSObYYSe0=;
        b=dy7o69JbUjN00k40uWikEmyRR0zmAxb5xgBBfKTZZPunCHyqdFdvRjplq87COinjRT
         KpFJT4oGqRgxm+NlTQKyiZPjRmMcq4Unf2Y7U87RZBwDZLr7gM6X+0guxuyusympHrsL
         +0Z3qwRHEjOw3I6qOnNxtbM04OHwTinHRqtFQPtX7UcEwVaMftdf7VZAQlVGzNw2YDY9
         f0s02ntX0lrRdG6kZYuHVHMyMmwZNpRuGlP9B7M8eGflogorfX9oBhlyUgfVlkYZHrXG
         ZmI6eKmSwaSFPWwPX/XkZLGWcZr38h+1op/q45lvrx8p2d4V/cpPoNmTM2cykXQYvnDh
         zoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198210; x=1753803010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYUhbaXkFUtSifk2kaHUHL5Nx8MjtAaTF7aSObYYSe0=;
        b=jxiPfShE5Xd/iK1jYpzpkdkDVwjL+/hJqyDcdSDz6WQgZUWPbTZ5J7nUVqKfl0yjRV
         LH4R+Z8PcfaOnGOP8KmbZR5S/+4ApKqzE2D7NnMJnAF2diCVvpNdOFkVnpYAWAr3vTTB
         SIfyN2AjA42/mnHl+d1Vjq9ajK3q0TAobOvpR5I5hR1WdKUiuwu3DRthrkyRkpXuFPx2
         Y+xktJXVwW5HfEmn80Z6VenCEY3YdY8VSvdGbX24M3r4/fmrzUB+sQg+8hodAjoDI+zq
         QrqQlBjBoaXjdgMAJUDUHa6REloX5Q/Zh0yabroxVzZr2DOhc/DRkiIIotL1mPO4HSsa
         cxHA==
X-Gm-Message-State: AOJu0YxFjtPHMtZGztiaF9kUVzZMabHYpSXofz+jFl/R8Sq4LXQUmWxt
	iJgCPJTbQpaKBkEjdnB4IeOf7RWXJTdxIbnk3NpQ6BrkVOdQf9IlhAEzPdrfSb45sI1o7LhGac1
	rVJV/EIOWPiWCYnjZm7gNGiFIzpwgHmM=
X-Gm-Gg: ASbGncsda/wlRZayWNHjYwDjPEdmmn+914teeB0k9wPyaHDjLL4fa1q+YEI87+mCHZs
	txXwi6WxQgR14TG08/jKZgPepk37HbH20qet/Q7ZrbMkjQtIyNn2PbmYJW28y3Vw6nl+n/6q8oW
	hTNJNGPRiIISrQcGn/2JCvqnBMMa85CSigNymGUqT3IIqoOu1knle41FxWxXzsmfZV24NVx8npN
	FJUvmA84FpB7K08m34YYTngmNv4nrPlJg4G4gyf
X-Google-Smtp-Source: AGHT+IESdtfYJ83Xk+gcI6FrODYlvz7S99NkhXCoPO7o6MohusNSwNStp9Egy9so+QpYS0DNgw/4dFMJgYEzHY4wfzQ=
X-Received: by 2002:a05:6214:5f0e:b0:6fa:be7e:c0be with SMTP id
 6a1803df08f44-704f4ab5c57mr442648626d6.34.1753198209235; Tue, 22 Jul 2025
 08:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250722113250.255487-1-pascal.weisser.ext@karlstorz.com> <20250722113250.255487-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250722113250.255487-2-pascal.weisser.ext@karlstorz.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Jul 2025 17:29:58 +0200
X-Gm-Features: Ac12FXwBijmgD7o7HzObX8EmT6CGhZaXnF7lrwVeEYlz3RivAW5Uk6DMjpJlzuo
Message-ID: <CANNYZj9NgDTwrs5qLUViW5ZctXoStcHJLxWXEXChtkm4_f0z9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] dbus: add traditional-activation PACKAGECONFIG
To: Pascal.Weisser.ext@karlstorz.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 15:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220754

Thanks for additional explanations, this looks fine.

Alex

On Tue, 22 Jul 2025 at 13:33, Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=karlstorz.com@lists.openembedded.org> wrote:
>
> Add traditional-activation PACKAGECONFIG to DBus recipe in order to allow
> users to enable or disable traditional DBus service activation.
>
> DBus service activation refers to automatically starting an application
> when a DBus message is sent to a service provided by that application.
> Traditionally, this is done by the DBus-daemon, thus, the term traditional
> here. On systems using systemd, systemd can do this, instead.
>
> On some systems it might be of interest to disable the traditional service
> activation in order to ensure that services are always started via systemd.
>
> Per default, traditional service activation is enabled for DBus. Thus, the
> traditional-activation PACKAGECONFIG is added to the default PACKAGECONFIG.
> Otherwise, we might introduce a breaking change here.
>
> The binary dbus-daemon-launch-helper isn't created in case DBus is built
> with traditional service activation disabled, so we change its attributes
> only when traditional service activation is turned on.
>
> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>  meta/recipes-core/dbus/dbus_1.16.2.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
> index 65f7028b4f..aabc4c3efb 100644
> --- a/meta/recipes-core/dbus/dbus_1.16.2.bb
> +++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
> @@ -28,7 +28,7 @@ EXTRA_OEMESON = "-Dxml_docs=disabled \
>                  "
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
> -                   user-session \
> +                   traditional-activation user-session \
>                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
>                    "
>  PACKAGECONFIG:class-native = ""
> @@ -36,6 +36,7 @@ PACKAGECONFIG:class-nativesdk = ""
>
>  PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemd_system_unitdir=${systemd_system_unitdir},-Dsystemd=disabled,systemd"
>  PACKAGECONFIG[x11] = "-Dx11_autolaunch=enabled,-Dx11_autolaunch=disabled, virtual/libx11 libsm"
> +PACKAGECONFIG[traditional-activation] = "-Dtraditional_activation=true,-Dtraditional_activation=false"
>  PACKAGECONFIG[user-session] = "-Duser_session=true -Dsystemd_user_unitdir=${systemd_user_unitdir},-Duser_session=false"
>  PACKAGECONFIG[verbose-mode] = "-Dverbose_mode=true,-Dverbose_mode=false,,"
>  PACKAGECONFIG[audit] = "-Dlibaudit=enabled,-Dlibaudit=disabled,audit"
> @@ -152,8 +153,11 @@ do_install:append:class-target() {
>
>         chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
>
> -       chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> -       chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'traditional-activation', '1', '0', d)}" = "1" ]
> +       then
> +               chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> +               chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
> +       fi
>
>         # Remove Red Hat initscript
>         rm -rf ${D}${sysconfdir}/rc.d
> --
> 2.50.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220735): https://lists.openembedded.org/g/openembedded-core/message/220735
> Mute This Topic: https://lists.openembedded.org/mt/114284562/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

