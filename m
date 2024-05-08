Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7C0C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 16:18:38 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.1222.1715185111439742772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 09:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SyMKoteA;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-23d39e4c0d9so2763968fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715185111; x=1715789911; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2off8csrAtJSsMyveIcWgCyS0n8cJxbz/dzZ+PKdP4=;
        b=SyMKoteA/Nf/gHaybGLCC5MSb1QOfWryRIpMyNxNzUleihSM+yNA5G5vCoXUE+hXY9
         7HrihtG8HrY6vCxEywL7rgQYkHP0TNB7ZAkaXSFh3Ri7Qdtsi50IyDLFd7qIiE32/D+W
         nIwSKN1Hz7iDkfXCf1+G3F09n4MRRi/UB9c+hcC65h5NdOBZra0EGOMGD2tnqBPQMHmV
         JTSUSc18y1E9fsBfIF395m6q7worRXPL1VzA+CCQae6h8UybbHCZYpa2D82+6kyr2u8m
         BrWGzdp5KMLhUT+4Q6Qlw8lDsaHCuqbyAREgLCLVSu9VGjCPFJg9zz/029iUU5IKrLT7
         Ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715185111; x=1715789911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2off8csrAtJSsMyveIcWgCyS0n8cJxbz/dzZ+PKdP4=;
        b=Cv4bMcqcyk4UlvV9oVUFHHpFgE4yocKe/0V4dfNSr0upevQ/HUzQHq2O5Y3nlKIsAB
         ro3he5upPyRt0/KUSkxjHYO6oEeAac+jiq2XXDJ+AR/A2Vxx60/BydUIeR3zSfAlMbJW
         cBLe68i4R0GLt05yhaGrPvmOuLfWEoWRGLxXORpH4oBdm8QtKtkDDw5f5Lq4HK8fxxnE
         jrv1OdLn3q5c46jJKyYKC6FPxoukDXZM+YHnAKaZd5hP/yyTzpjVnIJdzYyOX/2UMhE/
         Jd1zTlYyfmKgK6RrOLKEaDMyequofUP7D48/VR1avJqJMFUdV3hWg/12c4PjfrWbZnja
         XhAA==
X-Gm-Message-State: AOJu0YwgYJfBCJzkCdUm5G6xlXxs6hYkesUGZsLtic+rXLaz9aPwLmVp
	zfQkoKSiUNemZCozDLqxeC0Yi9d6kp2CR6kqqzP+UncFXGFLMLDhHLm4rIcWhs6Q6m/TxmFsz25
	zmWUdtJgp/CjKMNiVgQ51AqfapZAhAPgsfoE=
X-Google-Smtp-Source: AGHT+IERa9hkMtg8Q34gYheuccrLwJElL7IzdO3DK60DmB5tJRta7iOhJ9dyH+TZH+yeYB6c8gEkVDuCy7nGewskP18=
X-Received: by 2002:a05:6871:48f:b0:23d:510d:ea55 with SMTP id
 586e51a60fabf-24097c5536amr3197224fac.18.1715185110671; Wed, 08 May 2024
 09:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <1404aa44-8e02-44fc-8a1b-d4737ce020a1@topic.nl>
In-Reply-To: <1404aa44-8e02-44fc-8a1b-d4737ce020a1@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 May 2024 09:18:03 -0700
Message-ID: <CAMKF1sohpPpcdi5WSa2+EnTwjnnbEe6LY4P_03EHQwXnDDDVbg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] psplash no longer working
To: mike.looijmans@topic.nl
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199127

On Wed, May 8, 2024 at 3:07=E2=80=AFAM Mike Looijmans via
lists.openembedded.org
<mike.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>
> I'm puzzled.
>
> Migrating from kirkstone to scarthgap, and psplash somehow broke.
>
> Systemd doesn't start is because "/usr/bin/psplash" is missing.
>
> Interestingly, the line that appears to be responsible for that is in
> the do_install:append
>
>    rm -f ${D}${bindir}/psplash
>
> If I copy that file from ${B} to the board, psplash works again.
>
> But what really baffles me is that kirkstone already had that line in
> do_install:append but somehow /usr/bin/psplash still got created. And I
> cannot find the magic that puts it there...
>

maybe this commit [1] is bringing this to front

[1] https://git.yoctoproject.org/poky/commit/?id=3D1ba76de20bca63cec4ccaf04=
766dfd994a728c75

> --
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topic.nl
> W: www.topic.nl
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199113): https://lists.openembedded.org/g/openembedde=
d-core/message/199113
> Mute This Topic: https://lists.openembedded.org/mt/105978071/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

