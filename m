Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A4DC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 18:29:05 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.10360.1658860138161281103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 11:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lkFTpCjF;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: armccurdy@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id f15so10264512edc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+e1Z9lxS2feF4mxmkERwnB4oCBcLKBeqEXvTAgdpWlA=;
        b=lkFTpCjFvG8/6Gbr7ksiCqxIL1FEE2jVnIqgykzOtxiciVUxkzdCw9TStSZRoKNUYe
         PRizbozvvgAX8t4ROoboukiLYQZkjz3RDVntIR52HpoUyYDhJOEMmRJorGsarX+9uUDL
         I+AUKbyD42hAhcIwy+INNIeY38bZGe5RG0UOd2neSwaDo/h+9N6E6gRmCFd13z8dpyfD
         m9EiRxaNHwg8HRh74gQ4AoFPHQirouctDdk8D5KvahOoNsKjz6E1iR3WGNTYaQu3abg+
         723hMcRWUAohSpfuTzfVvMBDeJcaBCu7ZlZuCYZYb45cCk8qaew6gya3Bzftx7juy4xJ
         xFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+e1Z9lxS2feF4mxmkERwnB4oCBcLKBeqEXvTAgdpWlA=;
        b=ZuDR5ngYRU0wHfovGkgC+HPbPge8DSzcIHGGzcBOPw6yfjzKbF83cyJJI+ptOaKlvf
         aRiYTp0DsS+d6hfaGfPtW8edHt5E6W4bVek/164pOU0M5IO+7vngAW3210SGRyDcZYVk
         OW7g80L08bnstqGI3hVslFb2qeGa7Iwm6HhFsPSzJrW0/XFziwW07jm+K8opPvaIKUYQ
         BbNemq6Yxr0dJ4KVJkyWHqXlf7Ria2i5Wq5j3+eNnYH9mYUnTU//aX4hu4LwQOeqiG9m
         N+EsUHec6CyFwfCFQaHVy4MKwNR5/obq0C109U/ZxzkGbCZObaphKbo5e5vrDqUxJ1NF
         AJCA==
X-Gm-Message-State: AJIora8yH0T8fLR5dSh/sZKt6n50qQQa6Tc/FhJdDRBSBFNVKkcUHIIk
	pEE03ylmDUyn/z3m21dPHXuOUAteMjm7+WgNV68=
X-Google-Smtp-Source: 
 AGRyM1uRcw0Qu1qBnr4EJoQXUB8H2MwY5UEJfu9roR1QOkDuAlsJvsTvhvNZZQ5x/EsSeM4l4id00+9REiKU7K9KgEk=
X-Received: by 2002:aa7:de91:0:b0:43a:d5b0:e0bb with SMTP id
 j17-20020aa7de91000000b0043ad5b0e0bbmr19268766edv.165.1658860136429; Tue, 26
 Jul 2022 11:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220726093906.619035-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20220726093906.619035-1-johannes.schneider@leica-geosystems.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Jul 2022 11:28:39 -0700
Message-ID: 
 <CAJ86T=WrNHr-HB+1tRk_RGhjN_1AfQbPgNHiyk47drAsR_Ljsw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] classes: rootfs-postcommands:
 autologin root on serial-getty
To: johannes.schneider@leica-geosystems.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 18:29:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168510

On Tue, Jul 26, 2022 at 2:39 AM Johannes Schneider via
lists.openembedded.org
<johannes.schneider=leica-geosystems.com@lists.openembedded.org>
wrote:
>
> when empty-root-password AND serial-autologin-root are part of the
> IMAGE_FEATURES, save some of the developers time by not having to type
> the (then still sole) 'root' username on the serial consoleafter each
> and every reboot
>
> this is done by inserting '--autologin root' into the command line of
> the responsible 'getty' service
>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> ---
>  meta/classes/image.bbclass               |  2 +-
>  meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2139a7e576..fe32cdefd5 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -34,7 +34,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  # IMAGE_FEATURES may contain any available package group
>  IMAGE_FEATURES ?= ""
>  IMAGE_FEATURES[type] = "list"
> -IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging overlayfs-etc"
> +IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login serial-autologin-root post-install-logging overlayfs-etc"
>
>  # Generate companion debugfs?
>  IMAGE_GEN_DEBUGFS ?= "0"
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index a8a952f31d..e8e9661f58 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>  # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-root-login is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
>
> +# Autologin the root user on the serial console, if empty-root-password and serial-autologin-root are active
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", [ 'empty-root-password', 'serial-autologin-root' ], "serial_autologin_root; ", "",d)}'
> +
>  # Enable postinst logging if debug-tweaks or post-install-logging is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>
> @@ -196,6 +199,18 @@ ssh_allow_root_login () {
>         fi
>  }
>
> +#
> +# Autologin the 'root' user on the serial terminal,
> +# if empty-root-password is enabled

Comment should be updated too "... if empty-root-password and
serial-autologin-root are both enabled".

> +#
> +serial_autologin_root () {
> +       if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service ]; then
> +               sed -i '/^\s*ExecStart\b/ s/getty /&--autologin root /' \
> +                       "${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service"
> +       fi
> +}
> +
> +
>  python sort_passwd () {
>      import rootfspostcommands
>      rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168502): https://lists.openembedded.org/g/openembedded-core/message/168502
> Mute This Topic: https://lists.openembedded.org/mt/92623778/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

