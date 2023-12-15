Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC79DC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:44:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.68549.1702662284829572823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y7NrfPdf;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a1db99cd1b2so124732866b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702662283; x=1703267083; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNUCAl5aUVoUU015SfzJURXj96EoX+JTLabrWmp7ewQ=;
        b=Y7NrfPdf5cwE+JyQ1eSlql7IwkpQN1mR89PvUNeiL8O5PCO5fhztz6f4KlJ1M/rMqE
         QjEtzFy7BesKYDrBIijncUh7GBLiZdlPrT6fYPOLiqGahEg+v18LHvKh0UM3wdQtPGCY
         gD4wkg//b9cuv0Y//GipMsC0BA2ImEXaXOoBqu/SEEwN69eW+sbDHFrW0jVhLVw4KCMn
         nE6ZaZrqQ+xxn2RBX2adk9N50lat5S5EWnZipqnyswD2y7Xi9ViCuBIA6WnGVnqbxt42
         yHmLh4iwDxght8yUcknfgXiK94v18zmH3wGMceu5yuVfp48Vuxy5rQ983Z9QNbkLXs6m
         1igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662283; x=1703267083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNUCAl5aUVoUU015SfzJURXj96EoX+JTLabrWmp7ewQ=;
        b=AoapS0RHCc598QcCa+AeA1Ype1AeKWfYgvxOVeVyPNKT94qMhWS1eTBgOcS2FaZNYb
         /O8g7GXl8SjH1+pqOwabxkAonqxarMm8iqvknEyXd3J9iodDKODTsI0IALi7jhOfsyja
         vP+cewjyKJGlDVw3sKa1nEM1KQdp3rGfEUtJOLebzqd+u2EaqtHnzvpG94+GbuEqotB1
         qlM1gdaasPbsYLzZj+Ob+eOw1wgwxtU3OdYv3y5aleGO2OJM0jZ5Ai6Fwd0IPQk8KbH0
         GNApW0s2CZ+xxrIstqYSlvOljVGMflKBtipF5q2wF5XK3VAHueAsWP2D9UYjT3VzZ6/y
         oRLQ==
X-Gm-Message-State: AOJu0Yx06g9lO0bohCfnVdJomTfVTCeTUKN0RX+oUJOsSRj+XPBPAyPY
	gEvpMxbQMU1X2rK/ZbK5yavPKbkNKUrnWddhvcw=
X-Google-Smtp-Source: AGHT+IEYPkJRU1B6I6oIslB5r6F911At/lxLKeDrzg+Pfa5qYu+5uPvg4s4rHI4j2mDGmu37XGOP1wh58SLZcqutKYU=
X-Received: by 2002:a17:906:1c89:b0:a19:a19b:4216 with SMTP id
 g9-20020a1709061c8900b00a19a19b4216mr3841611ejh.129.1702662282912; Fri, 15
 Dec 2023 09:44:42 -0800 (PST)
MIME-Version: 1.0
References: <CALT56yM414xkWEHMf1+uXo5dwJKN2MSnnuL5Ltwu+0pYRxspfw@mail.gmail.com>
 <CADkTA4PXw7rwVZs-Ye2nGdy0PYtZebyfMeXSPdGRyF3LaPmhFw@mail.gmail.com>
In-Reply-To: <CADkTA4PXw7rwVZs-Ye2nGdy0PYtZebyfMeXSPdGRyF3LaPmhFw@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 15 Dec 2023 19:44:31 +0200
Message-ID: <CALT56yOJ5zO0ME3ATms_wovkH0XohQKJFe8-RtT4v7N1i72Ubg@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto 6.6
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192543

On Thu, 14 Dec 2023 at 22:31, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> To avoid burning everyone out even more (plus Scarthgap m1 is going to
> build shortly), I'm not sending the new reference kernel updates until
> January.
>
> Even just the send of them and any AB runs will steal time and be a
> distraction over the week between Christmas and New Year.
>
> If you want to use them locally, you can find the queue that has been
> under test for a bit on my poky-contrib branch "zedd/kernel"

This sounds perfect, thanks a lot! (with the hope that we will see 6.6
in Scarthgap).

>
> Bruce
>
> On Tue, Dec 12, 2023 at 5:28=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmai=
l.com> wrote:
> >
> > Hello,
> >
> > Granted that 6.5 is declared EOL, is there any timeline for the
> > linux-yocto 6.6 recipe?
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192190): https://lists.openembedded.org/g/openembed=
ded-core/message/192190
> > Mute This Topic: https://lists.openembedded.org/mt/103127485/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
With best wishes
Dmitry

