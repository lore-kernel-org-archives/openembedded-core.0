Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65487CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 06:33:18 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.10910.1757485988410070188
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 23:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VedAN9gz;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e9d923fd113so4092620276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 23:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757485987; x=1758090787; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tEfSvK1PG6lOy3x0zIDxB/Ubc7+yJ/ziZy50nE97lE=;
        b=VedAN9gzQXeNWtMdFNY0nN0L9ynU4bJtP4wr5yNJ0MJAPoCfYFfgpyMcEa1Fq44nJe
         u1fxZVwPSKwAt+SjXk3sV+Ai82nBmYiMxjN0BypfhB65gshuvzirwpUJJGx76SdgUkEP
         mFbT1SzXDAfA6ZAT2BCgqPr2kcOakGQ4wlHztpmqatrcs86fQ/LwNnl6vLAj91YnLa+v
         wzjajA220hP+i0NhUMRvumEe2tsjXC4KlYZlAVVBA6G6WhJDONidQzyFOUrDBPYC9ClJ
         n5+RYvbJjLaCzaqGUD2FFMkM7qMIqUnrvM5VhW/TzlRaBIOhWWfpwPpdpvpWzsuIjhVI
         Chfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757485987; x=1758090787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tEfSvK1PG6lOy3x0zIDxB/Ubc7+yJ/ziZy50nE97lE=;
        b=rvTzWSxfVBXfDgkz/4CwazptESnNBIFSL95vxMXBL/KjMdGlMBGmXvAGPBd2/OMGZX
         WjJX3vbPeDyioZwv7njzj80nSBVnVksMI1HvgEVqJvB9HsKMyhO+7yzvwTAi/qk90ljj
         lifyupyTe+ILYQncD0qOfATP6xf3pkf0TB+qBLwsKMXMdwmAYX7kaZ/xym9QgelRx18K
         EK013PkwjMTCeqvvu3OLzn3wuWHbLqz7X33VgWZ6QahWtzAD41t/yjCZXVfwTQcM1nPW
         6Pclgzqupq1OijfSf2GcBEczcUm2qlMZ77sM42/swOtnpWXm5JqA9pdFSQDxajtVo7Si
         KBvA==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZDmD+W8d00gnULz7Em6C7/kddFl5K//NRV1qO17TyKfymByLmCzI9sBDJbKN1TfQMKQWsqlb1xVM1hG+U9sS0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRSB5B5bLD/W2mM/AdgfVYgZ4GlsY0+2XVV3h3BKyA4M7q22Sm
	tbu9gX+awtRe2wrUJxwJ4NW9daEtjzrC5/t3L1h2B4nQy3MRAJJeT75cS0uel5aG1S5pxsc+PL/
	cq5fIkyeibAEakoY1Jsk8VRA/qmLxtKc=
X-Gm-Gg: ASbGncsKi8Fs8Po8cn4Y2GA+epz749aBZ7M8wIqNM9iRqI5Byrlzhvigk3CCnkbl8v0
	Lfp5b/S6DXgHZxzhw8/qdOe1Z3KCBC5PycsKC0CPRo9J3l11S3sopb59oNaZ3Dt+FMa8/dYu6jG
	vQPKprp1L13XLujhJSrgnEneHluSrKEVBh1ZwLqxgAoN9c756d1BsWNyhBv01XWHoqz5MC8hUnd
	I9rr82GbAVyxDg4Ys1yfRXYoYUV0mu0nwKdYGg7H+nyG1ipLVioiuDschTVSQWOE1lsWZmPBggW
	qvrf642KKDe5cP+FOvW5pG0n2GrmgHvLFxoEG5Ukcolqv0GkF0RqGYw1
X-Google-Smtp-Source: AGHT+IHdoG8VvwL00cP8czf/B3FYXkO2M7xoqA9NRp29CTYOGKXUp2nVuYeOTnPo9ymZXrXXVRqqRjrANPrzpJjj8FE=
X-Received: by 2002:a05:690c:650a:b0:723:b16a:ce6 with SMTP id
 00721157ae682-727f5e3ac31mr106371527b3.50.1757485987292; Tue, 09 Sep 2025
 23:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250903222658.3929743-1-peter.marko@siemens.com>
 <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com> <9D9FCA93-9D8F-4F86-A080-C1CCD08B70B5@arm.com>
In-Reply-To: <9D9FCA93-9D8F-4F86-A080-C1CCD08B70B5@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Sep 2025 23:32:40 -0700
X-Gm-Features: Ac12FXxzHee5CUcxIhz8OnBgiD5RNU1iGOkXMaGncLRYADRq57V1J15hrPHYiJk
Message-ID: <CAMKF1sorn6=C9n7NZ1o6rmXDdCLW267HoncP=fViP5zZ2_n10A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
To: ross.burton@arm.com
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223148

I am observing another issue with this upgrade. proj-native fails to
build, it depends on cmake-native and sqlite3-native
see - https://errors.yoctoproject.org/Errors/Details/882201/

proj also fails ( for target ) - see -
https://errors.yoctoproject.org/Errors/Details/882203/

On Tue, Sep 9, 2025 at 6:05=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 9 Sep 2025, at 12:22, Ross Burton <Ross.Burton@arm.com> wrote:
> >> * add hack to rewrite native binaries as native installation will stri=
p
> >> them unconditionally
> >
> > That=E2=80=99s definitely a bug in either upstream autosetup or sqlite.=
  Have you looked at autosetup to know if its a bug there, or in the use of=
 it by sqlite?
>
> Actually=E2=80=A6 are you sure about this?
>
> I just deleted your hack, the do_install log for sqlite3-native shows it =
using =E2=80=98install=E2=80=99 without -s, and the binaries are not stripp=
ed in the image/ directory:
>
> $ file libsqlite3.so.3.50.4
> libsqlite3.so.3.50.4: ELF 64-bit LSB shared object, ARM aarch64, version =
1 (SYSV), dynamically linked, BuildID[sha1]=3D6e8d2ef793a5acf927116f8ffa4b2=
9bcbe3934a2, not stripped
>
> (my builder is arm64, this isn=E2=80=99t a cross-compile)
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223110): https://lists.openembedded.org/g/openembedde=
d-core/message/223110
> Mute This Topic: https://lists.openembedded.org/mt/115054818/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

