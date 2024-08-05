Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3294CC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:41:58 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.11204.1722872515297629961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjdU0qXx;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7b93883666dso874303a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722872515; x=1723477315; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x1WL88voNPR/GphNy7j+unYiIqod2tN+tdGppr1+r0g=;
        b=RjdU0qXxyTzudtUuHBEYHBeB/rP9ujzu1go6TsXlsKQ0QXNJhz+GhqNhpQaG17+Q97
         PieCoE6sxe1WtJhY4k0tgxiCSXu7iXXMMozbDqT0tetS3HeZoitZElrjfQMjPnDsIo+0
         G9Qw07m1YjMZrmhSWr4QEmhb9g2wQDlrRWdxdOyepMMLDiMmiIbGUIfSJFFcljUSwm0j
         L9PeIjOzElSYTKQ8+/jJ+P1HhjVuT1xxvNKonVuNVWl1KKTc6NwdarKydZDiBfPuR0zs
         LN5m4dwLo2bU0/OZbZjBQ7vGH+3e2ZsuI3RqqhEkLMJe/pUOGbxmPDeWDzgu4E0QcrNl
         xS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872515; x=1723477315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1WL88voNPR/GphNy7j+unYiIqod2tN+tdGppr1+r0g=;
        b=PzZVfUzm81EByL+ZMi2lItGnzXTpHzNxXXIq19yFeNvyUEs5BcvNGTCckWcMxrSObB
         EE9DOK51qEzUzE+JV9MVMY0MVQwxrXNpo5oY5mlkNpCQiUImHxEHKgz4vpxNw/ftolV5
         EGEa3GH9WQ+FeF4vlv09E35fFXrlRIFUkH6Ram2NBeywjyYJCI4JTYrhBj2qaNk5ojw5
         LUd0Dx1/V9AN7UhVLmRsVEKhL/L6ZdHBqspH8yafxlm8bAudQMUs/GiXFvaw4cC1BKxk
         /DIwiO9n/qRZm1Gncgz9Ubjzkh5HYs1DxXOpdFDCWRWBY8//oDQPlIEUxfBi4o7X5PvI
         vYcA==
X-Gm-Message-State: AOJu0YzhUl3yrXkTKT/v8ar9THkGLGWsn82p6dMprH6xcxgm5mY1Lzuu
	whTGFTVz8iTrnep9BPDCS61RzMmEPjCuCrw9S2A2y7Gtj0iup6t8vU98lKVWGO3wIkOa6aujRQL
	ppxzhDic7wlKug6fmq5pXhBb2l5s=
X-Google-Smtp-Source: AGHT+IFm6HmfMaugmNnUG03UMZR1e2Sk6zZXxMugqMWh2eDBoZfn3DkS8C1diV+ckRbRoWSFx3ZMRzjrQt7jsa2HHow=
X-Received: by 2002:a17:903:230b:b0:1fc:253b:5951 with SMTP id
 d9443c01a7336-1ff523eef14mr216929035ad.4.1722872514481; Mon, 05 Aug 2024
 08:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 5 Aug 2024 17:41:43 +0200
Message-ID: <CAApg2=TWFeTC5SML6mGhwo3dXBA_PyoJykxGfjqa=1b=JwFNfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] cve_check: Use a local copy of the database
 during builds
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003819d0061ef18434"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203001

--0000000000003819d0061ef18434
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 3:09=E2=80=AFPM Richard Purdie via lists.openembedde=
d.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Rtaher than trying to use a sqlite database over NFS from DL_DIR, work fr=
om
> a local copy in STAGING DIR after fetching.
>

I saw this patch this morning when I was nearly done with my version and
waiting for the fresh build to finish...

Do you plan to keep it for longer or is it for testing only? If for longer,
I would likely keep old variable names for cve-update-nvd2-native.bb

Did it help with the corruption issue?

Kind regards,
Marta

--0000000000003819d0061ef18434
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 4, 2024 at 3:09=E2=80=AFP=
M Richard Purdie via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@l=
ists.openembedded.org">linuxfoundation.org@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rtaher tha=
n trying to use a sqlite database over NFS from DL_DIR, work from<br>
a local copy in STAGING DIR after fetching.<br></blockquote><div><br></div>=
<div>I saw this patch this morning when I was nearly done with my version a=
nd waiting for the fresh build to finish...</div><div><br></div><div>Do you=
 plan to keep it for longer or is it for testing only? If for longer, I wou=
ld likely keep old variable names for <a href=3D"http://cve-update-nvd2-nat=
ive.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><=
/div><div><br></div><div>Did it help with the corruption issue?<br></div><d=
iv><br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--0000000000003819d0061ef18434--

