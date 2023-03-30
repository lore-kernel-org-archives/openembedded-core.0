Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C416C77B72
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:42 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.25744.1680184054669443320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FHAcWo+O;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id j11so24562613lfg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680184053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExyvztSvaYqi3aFpgkC0WNL2wQ6P5GIAsMmc/z/1UyU=;
        b=FHAcWo+OdYp1vDs4rwnWbUrGdeQ3/TGVp8wAsy6JBHFAEZZNqieGa/ry4GqhRJH/Ob
         N3j5z/b3V0BszTVxZFL9+pdYBybz8ctIyE6OnzHVkcIc6K3W1CertcG6mvEK1vGAGDlH
         rwOd+/kgvCf14d4+TijXEX5Y4uLy6x3TOkTRwEUnG9u3XKpjuYJaWyJ5pcdlneDV5+vk
         5sdsO1264EsdlAKonHfeujbAev59o6ay7z6BGSYvYNscIJrbnE3ryJ/G8bzzEtwcpikm
         byhoWS4X5IhUt0v4tJ5wCxX1cdWQhfLhKc2y7qUE0kpMKH+2rrFnjdtNLmCGtq/9an/0
         5i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExyvztSvaYqi3aFpgkC0WNL2wQ6P5GIAsMmc/z/1UyU=;
        b=1OXOZXup0EXxgKUhpX3zMTT+RFucclWY973DyRRUJmOY3FX7KdzwGyYyK8oB1TvPsq
         VqL5gcdBdBycWB+xIn7oKqdt3rPH5cYDPJG6m0qVu3ynaCNnWF7YLlnSJDia4jD4jyXq
         EnlHQgB1gE7r924BHeiWB3KiriszWqAIE3nDcODNyu9zgWDe72Xp3ZH6kBXyffEWui+E
         TvwikoreVEHUTm460Pny0tdS3BDh4NrC7tFyilt45TPN7DBO6JAEl7WRje8tUZtn483R
         QWLQFQa5lRFJ2mQfjdgfpFXhRQHJuNR6azGqRVN9VkZTynBGI+CHwfApMeLUF7wi7BQN
         Ivcg==
X-Gm-Message-State: AAQBX9eYCuhkLYc8ep64azu4gGwGEcUXl/AIDrK9v+iCB9Oashr60xBz
	8XZedHq4EorGg0d49ffFxkO29VNXnuqpqxhit6l50b0R
X-Google-Smtp-Source: AKy350bkgm6db4xBCIET+X/q/PAWq3TklwMa4pSQRbD5RbbPI2rzaLlIvTZ5m5rH8NC4tuzTdYqCh8r4zjhmckMWx/Q=
X-Received: by 2002:ac2:44d8:0:b0:4d5:ca32:6ed5 with SMTP id
 d24-20020ac244d8000000b004d5ca326ed5mr1880284lfm.3.1680184052563; Thu, 30 Mar
 2023 06:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134214.2772913-1-zboszor@gmail.com> <20230330134214.2772913-2-zboszor@gmail.com>
In-Reply-To: <20230330134214.2772913-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 15:47:21 +0200
Message-ID: <CANNYZj--VdBinzni-5vKpb9Q4qq09x-oo9WAfmZYoBb5bfZ3BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libgudev: Allow native build
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 13:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179324

Can you look into specific details of why libgudev is needed, and
whether it can be made optional? Also, what is it from
libfprint-native that libfprint needs?

I would really like to know these details before we conclude that
adding native variants for tricky, brittle items like all of systemd
is indeed the only option. Maybe we can break those dependency chains.

Alex


On Thu, 30 Mar 2023 at 15:42, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> libgudev-native is a dependency of libfprint-native, which
> is needed to build libfprint.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-gnome/libgudev/libgudev_237.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-g=
nome/libgudev/libgudev_237.bb
> index 9ce43ce34b..ad3a16ab99 100644
> --- a/meta/recipes-gnome/libgudev/libgudev_237.bb
> +++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
> @@ -9,6 +9,8 @@ SRC_URI[archive.sha256sum] =3D "0d06b21170d20c93e4f0534db=
b9b0a8b4f1119ffb00b4031aa
>
>  DEPENDS =3D "glib-2.0 udev"
>
> +BBCLASSEXTEND =3D "native"
> +
>  RCONFLICTS:${PN} =3D "systemd (<=3D 220)"
>
>  LICENSE =3D "LGPL-2.1-only"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179322): https://lists.openembedded.org/g/openembedde=
d-core/message/179322
> Mute This Topic: https://lists.openembedded.org/mt/97950751/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

