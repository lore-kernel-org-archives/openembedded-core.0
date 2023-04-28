Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E986FC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 10:37:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.16136.1682678224077183903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 03:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f2sn+4YS;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3003b97fa12so5966670f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682678222; x=1685270222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5lwA7YrMF3tVX1wNrL6k5iND48LCG/53LYV3g59/1BU=;
        b=f2sn+4YSa/gSVrc02pcaRQLtmRnhRscLUzkQrAzo/Bxi/FOWmaK7gqzMQExCg0XF1N
         yd0QQRf2u/iKjteRou2nbGYxN4D17qn8TJEv+B8lN2mE2FFMnYvNIsrNtDAbI8fXtdxm
         qi2l7S5omC6pMs04BHRYG97MP+WFYFZBTN6Bm7T7wU8ZK72OXgwz1FO3HVM04Wsy4HMy
         /4DRTAh36xTpXbwgelulOXOrPmU3WbdOhlpNpqdAcNTt69tu2ylA6i7ZnTps1KUIHA0d
         O/JyXefP5aDtDFrv4PY4bWy7dvMB5cGYc5PDY/RHGWifpmjfO4eFLjaoKTwqPoZSu8xP
         elMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678222; x=1685270222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lwA7YrMF3tVX1wNrL6k5iND48LCG/53LYV3g59/1BU=;
        b=DxWa6qSUJZ+9MmzmEhK4fD4pgW0xJgCMx2iZNcMjT21uhsrfoOC1T6gshdeUadrStV
         VksyYQOR6WSPUYmzSAElsGSfqCImJVKhR7SUQ3VxDAa6MN2l3KoFswAam03Yr66aXcf0
         YgsoAjTw/c/lYtWmui+er+Y9BU+ZIs2id2lX4OU3He3hDqZj6h/2RyRsmliE9ZxWA9c9
         rxo+AQee5F0Cq1tkDOUj903WNFbAX4Y0wmV5uoihP3XMH3CKknawk8z2bCea6bVXcFUW
         MMxF7MYwFLNS3c3+1r5Iuh1+ciLJMhNtk2DlMURYRBnsOZSoQUiFLvOxWPEBCxsZmEYI
         TbrA==
X-Gm-Message-State: AC+VfDxB/WzpjUsGupFR4/+OYiV640RRoUUE6ohxwX3xkH0t0kUbE87U
	t0CA5bQwR0OCUKZGRIULB1Q3xrmJakclBEpP2wo=
X-Google-Smtp-Source: ACHHUZ7+FFQd0eokk8wqXapSpeOxZFeYcP1sEf6DL9pPjmG7Jb2Q+rMKWo/8V2LWYsFFoFMPmboTngDOlnd+SYEbfr8=
X-Received: by 2002:a5d:4dc8:0:b0:300:2067:f5d8 with SMTP id
 f8-20020a5d4dc8000000b003002067f5d8mr3469610wru.65.1682678222421; Fri, 28 Apr
 2023 03:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230427073528.3956414-1-alex@linutronix.de> <20230427073528.3956414-3-alex@linutronix.de>
In-Reply-To: <20230427073528.3956414-3-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Apr 2023 12:36:51 +0200
Message-ID: <CA+chaQf+evL-UwG4RComw=y5zQfxbSN0=aXzVNQghL+ra_usAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] insane.bbclass: add a RECIPE_MAINTAINER
 check (oe-core recipes only)
To: Alexander Kanavin <alex.kanavin@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000b8038f05fa630dcd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180525

--000000000000b8038f05fa630dcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 9:35=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Absent maintainer entries are as well a frequent source of friction, as
> they are checked
> only in selftest, and so aren't revealed until autobuilder runs.
>
> The selftest is retained as it also checks for obsolete entries in
> maintainers.inc
> (not possible to do in insane class).
>

I've seen many errors triggered by this and was wondering what's going on
and it's caused by meta-security layers which provide own
conf/distro/include/maintainers.inc:

meta-security $ find . -name maintainers.inc
./meta-tpm/conf/distro/include/maintainers.inc
./conf/distro/include/maintainers.inc

So this doesn't work well with:
meta/conf/distro/defaultsetup.conf:include
conf/distro/include/maintainers.inc

as it "replaces" the file instead of adding more RECIPE_MAINTAINERs.

I think this should be fixed somehow before this gets enabled in oe-core.

--000000000000b8038f05fa630dcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Apr 27, 2023 at 9:35=E2=80=AFAM A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Absent maintainer entries are as well =
a frequent source of friction, as they are checked<br>
only in selftest, and so aren&#39;t revealed until autobuilder runs.<br>
<br>
The selftest is retained as it also checks for obsolete entries in maintain=
ers.inc<br>
(not possible to do in insane class).<br></blockquote><div><br></div><div>I=
&#39;ve seen many errors triggered by this and was wondering what&#39;s goi=
ng on and it&#39;s caused by meta-security layers which provide own conf/di=
stro/include/maintainers.inc:</div><div><br></div><div>meta-security $ find=
 . -name maintainers.inc<br>./meta-tpm/conf/distro/include/maintainers.inc<=
br>./conf/distro/include/maintainers.inc<br></div><div><br></div><div>So th=
is doesn&#39;t work well with:</div><div>meta/conf/distro/defaultsetup.conf=
:include conf/distro/include/maintainers.inc<br></div><div><br></div><div>a=
s it &quot;replaces&quot; the file instead of adding more=C2=A0RECIPE_MAINT=
AINERs.</div><div><br></div><div>I think this should be fixed somehow befor=
e this gets enabled in oe-core.</div></div></div>

--000000000000b8038f05fa630dcd--

