Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F54FC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:51:51 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.12172.1678895508096809648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qfw3EtEg;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b10so19963633ljr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678895506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1G3uDnqF0nBTQIQfW9hZRdtc8AXJ6GoK5Ij8G4NCaw=;
        b=Qfw3EtEg1w5PirtwKHZvypDfpYTRK1xdjQpvmkZNUPxUx0abfnngiVBkh+MW1UqK4Y
         UGYKyER6FSDGrWzz56w373jwlD7GS82Biy5cM14P/oRCXweipgPT4NUrAsPJLNRemb9L
         dHT6uxEldgSYMatW8h1tWVQ6lKZbCtwLZA8d20xbBMqrNNXwduU9GrX+r6Y5etuW7l11
         m4SGwXDrPn5IaVAet0PLPr9xHz1XOpMkmotGlrj4ifnLT8ion7usd8Wddcs43Hu2qP6S
         Ruy9OTR0ZgS1fZRS/jFGtpzvwJQifvX/0Qu/5GXu94H8xT2D0VSjttPamtXbzGVXv3Rj
         hzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1G3uDnqF0nBTQIQfW9hZRdtc8AXJ6GoK5Ij8G4NCaw=;
        b=KKieZe6szieNCX43fB9WCNmKvhyuGDVQuXGfh34TbzXHqLzw8dzeJoa8+jCRvl7kkb
         W8EPiSVSbftue4rjpb+gkyDYEUNYGNSgqP88v5Wbt960ACH57GxwMsRKTOXQa67u7lC+
         4ywbQGhZrITAh1qImerm5YEWgHjOUs8rOvGfxGLZPX1/flVNNa0V4gRLU7Ares/mOiuP
         Ofz2NMqjb44IZcHwlIdSulJ6ZDymbRN7/Pov02DnK8C4CEOZmXvOoubDwVFxkErqBpWu
         OAOvFz1y6Kk1yfatOVGjZmQy+YPpP/6QNWp8jl3OIEf51cdBvWakBhrt+NB8119UeomI
         vJ3g==
X-Gm-Message-State: AO0yUKWtyLZHzewsRFjOIly1fus9pmvRXf74L6CLqfhGN5TU7YaBfRW/
	65g6Vljak7lqnkzVTpn8eDyqMO8TAqxluGrya28=
X-Google-Smtp-Source: AK7set9Ve9aQCRsMuKAvXfj3mDvTozhqeERgcK6hXgh6SQ/5snx1rzUkIqx12qan6E/NMbBuJ7X+FpEZkQcNFZDM4fg=
X-Received: by 2002:a2e:5045:0:b0:293:4ba5:f626 with SMTP id
 v5-20020a2e5045000000b002934ba5f626mr1356816ljd.2.1678895506123; Wed, 15 Mar
 2023 08:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230315070909.422721-1-f_l_k@t-online.de> <CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
 <LZHKRR.FOHLRDXQDV053@t-online.de>
In-Reply-To: <LZHKRR.FOHLRDXQDV053@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Mar 2023 16:51:34 +0100
Message-ID: <CANNYZj_tKEA=CgQJ8QL2660VbvkXizX7+yrZ4EgaPdPnc33Siw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178581

You probably need to find out what links /var/tmp to /tmp in ptest
images, and see if it can be reconfigured to do the same thing as the
image where the tests passed.

Alex

On Wed, 15 Mar 2023 at 16:07, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mi, 15. M=C3=A4r 2023 um 08:27:33 +0100 schrieb Alexander Kanavin <ale=
x.kanavin@gmail.com>:
>
> Guesswork is a fast track to frustration.
>
>
> True :D But thats what always happens to me if I dont know enough and can=
't find a way to reproduce.
> Thanks to your hint on  core-image-ptest-glib-2.0 I was able to reproduce=
 the issue. Running the test from /var/volatile/tmp didn't solve the issue.=
 But compared to core-image-ptest-glib-2.0 where /tmp links to /var/tmp the=
 tmpdir is handled by systemd tmp.mount in my image and thus is not a symbo=
lic link.
>
> According to systemd ducumentation /var/tmp and /tmp are not the same and=
 are handled differently
> https://systemd.io/TEMPORARY_DIRECTORIES/
>
> Still I have no idea how this should be fixed or if the failed test could=
 maybe ignored but I was able to pass the tests in  core-image-ptest-glib-2=
.0 by removing the /tmp symlink and adding this line to fstab:
> tmpfs /tmp tmpfs defaults 0 0
>
> After a reboot the tests completed successful

