Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE42C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:27:29 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.162251.1692196046603470167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 07:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LpFiBFdp;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so8777351fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692196045; x=1692800845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2Ho/dYktMuHFW6qZ264NWV3as4BIAdxS+yLDQE7YxA=;
        b=LpFiBFdpmj6UJPl6ZE+4CmRGRSR96ZCT47Zvhj/niX1CGZKDBcVnH75p6HRK8ut598
         3FQAYLWyZK/zM7vFhJ5NxsmjInAcUmVYM+wBOHMGd84fE7Wfj+OnmHHKPwcsInnP9TBY
         e+wMFPrzKK5OUYQQK1AS97mej2mQudamKRdvuVZzgQY0QOZt7HodeBrBHnWmdr0hG3ne
         fUJ7ihrfHaHd/DtzxtV4pp236wnRgQrHSJAAB9M0P6njIJvxE/VdHyzBK59dW6ILfq1N
         aKQxl4EQxY0E4XtJrVo6aQZYcsk6lO2qtZ5oJ7ANbfDYrTfRdQ1hCWwDRYGcI5qM+N99
         ycXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692196045; x=1692800845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2Ho/dYktMuHFW6qZ264NWV3as4BIAdxS+yLDQE7YxA=;
        b=bXxPDA7LinucNp/tKETShCWlCABOHSAzyai+IbBGU658Snkz/mAEvMV8WLFxAJzlqu
         2M8fcgttTifd1l4fmP4M40VYN9ujaB59yOUnBE2tQrBS+INGN8K+dW6gl8wFIbYe444K
         XiFi/LrRu9TFxuzebPSvJt6toonI95WHIpEwiaS5SYe9JeHuYfr9De8YEZM4BDpdvv1f
         SZlt2g9T2sjPdKQQfTMmR8Wzdfx3JRdBcyn/2ysOJ2GWRD9Vpc01Nbjt4z0AX0XeTHXN
         qrP8E7dtHbSo0nFLEGS1JmD3C+EVnX9hnQWWCxAENqPL/OtnEG4Tptm1HnzpMQR2Hu92
         zQVA==
X-Gm-Message-State: AOJu0YxU+8n/VQfv5eFou9tgMMtcsOmQU46guZPQCfPjFybAZEKSC1Mg
	Hn9IKQvqnGJd3cBnkEpEf6q8LO/jQtXokNZ929I=
X-Google-Smtp-Source: AGHT+IGh3JJ6Xj9BzjksF6IVlP9mbpAZyPyjyliawBKcMd11KIpN6UX7X9+3yoo4c50H3zN+U+R5xHXOY90PvSxHY2I=
X-Received: by 2002:a2e:88cb:0:b0:2bb:8eea:755a with SMTP id
 a11-20020a2e88cb000000b002bb8eea755amr1556821ljk.49.1692196044543; Wed, 16
 Aug 2023 07:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230815161126.1513219-1-JPEWhacker@gmail.com> <65fc0948436d0ac2753e213664bc44afa629ddbe.camel@linuxfoundation.org>
In-Reply-To: <65fc0948436d0ac2753e213664bc44afa629ddbe.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 16 Aug 2023 08:27:12 -0600
Message-ID: <CAJdd5GbB054PoBVQuHeJ4iJ6rmEaP57rjXnRpgdc8s=izYAbrQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/image_types: Add vfat image type
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Joshua Watt <Joshua.Watt@garmin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 14:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186133

On Wed, Aug 16, 2023 at 12:47=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-08-15 at 10:11 -0600, Joshua Watt wrote:
> > From: Joshua Watt <Joshua.Watt@garmin.com>
> >
> > Adds support for creating FAT formatted file system images (useful for
> > boot partitions on some SoCs).
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes-recipe/image_types.bbclass | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>
> This causes a selftest failure:

Oops, sorry about that. I'll take a look

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5616/st=
eps/15/logs/stdio
>
> [in other selftests as well, a consistent issue for a change!]
>
> Cheers,
>
> Richard

