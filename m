Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AEEC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 10:04:59 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.57817.1691489091522037831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 03:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aaD8Rbvv;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9dc1bff38so84971451fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691489090; x=1692093890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CUBkq7HcktyMKIByl3+0Ypk7zqA6PjsuIvi87ioY2yA=;
        b=aaD8Rbvv9GfuHddBK9hC75syjtIPcZMCA0m4kEauemEPJflDg3APSvmiYhRTxHzv/J
         PkYU5+0U2HGG6bdQDbZYz1IISAK01HPvBmKVMmXuhm+hXBk7sjFH7cNWNwsc/dosZ2VE
         /v+f2B6GlYPzr+ez4SkgcuL5yA+0VFVK6PNv61L++2M2Wb5k9IKiIravRGMBk+zInwBR
         CVuov+kpoVy3chkdfoSp8SWg3WlPywA49mm6LsQ6rX+o8wMYkcdPWcBZ9wNvkf/y1pe6
         5qX5zHBbRuWwb/lShCz/4qXR2y9PjBnL3rqY3VcAmc+oMayLmeFHv6bdYnLseU/8SNgt
         ic5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691489090; x=1692093890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUBkq7HcktyMKIByl3+0Ypk7zqA6PjsuIvi87ioY2yA=;
        b=ZFC77VByBbJKhdmJpif8j7pDfFi36O3GiCVcwIi4/Hwgxjf61NNyic8mlnYno57NR/
         +i+9nG2ey+PqPX++LEj3Yaqrr1ZDTb3HKgGgu8j+uQ/prsS1JxnddLAl+x/Nahnub6by
         VjumciAr8fQMTUSm7M5R06LHnqUuDFU+JceGHEAgM9aeY6RmRjhI1k2HO1L0ByE5NPEM
         fXvUV+YRLv53OURFiDQGqEfq6ObH4EY+wsVSkiVCs1Ac4BRLDSAMG09OdQhmLzO5vzXi
         MVLnkypUhAt2Dojy1Y3dgC3r1b15fsWeNjlFnZJ9uM0HKxyro44mH6PBYBH4YknP+nSy
         ZOyw==
X-Gm-Message-State: AOJu0YwRCUw0c0tlOcM+w93r+/gVdhE6kQ0FqT9eUu27UDOgOzSmOiWF
	2dUw8aCm570ft0ybuxHdFk9786zQp3I3ERklWng=
X-Google-Smtp-Source: AGHT+IEn/l4sbEIKdH26ZKugQZX/whZWM1bn3S35T+zOaGWvI1WezZqLOpb61piToPR32s4ylbT+ERwDKDDrseEI4/M=
X-Received: by 2002:a2e:9059:0:b0:2b6:9fdf:d8f4 with SMTP id
 n25-20020a2e9059000000b002b69fdfd8f4mr8446477ljg.29.1691489089318; Tue, 08
 Aug 2023 03:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230807162807.4037215-1-ross.burton@arm.com> <20230807162807.4037215-2-ross.burton@arm.com>
In-Reply-To: <20230807162807.4037215-2-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 8 Aug 2023 12:04:37 +0200
Message-ID: <CAApg2=T5C4AKG95NwsXnZ-7GDJTknxmTdPcqCHTOKoL61TaQwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-yocto: add script to generate kernel CVE_STATUS entries
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f766a0602667e7f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185654

--0000000000004f766a0602667e7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 6:28=E2=80=AFPM <ross.burton@arm.com> wrote:

> From: Ross Burton <ross.burton@arm.com>
>
> Instead of manually looking up new CVEs and determining what point
> releases the fixes are incorporated into, add a script to generate the
> CVE_STATUS data automatically.
>
> First, note that this is very much an interim solution until the
> cve-check class fetches data from www.linuxkernelcves.com directly.
>
>
This is coming Ross, this is coming...

But I have a question. We do prefer to have a solution that runs completely
on the
build machine, without automatic rebuilds from the YP? I'm asking because
for the
solution I'm working on we're adding a pretty big git repo to each build
(~130MB).

Regards,
Marta

--0000000000004f766a0602667e7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 7, 2023 at 6:28=E2=80=AFP=
M &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.bu=
rton@arm.com</a>&gt;<br>
<br>
Instead of manually looking up new CVEs and determining what point<br>
releases the fixes are incorporated into, add a script to generate the<br>
CVE_STATUS data automatically.<br>
<br>
First, note that this is very much an interim solution until the<br>
cve-check class fetches data from <a href=3D"http://www.linuxkernelcves.com=
" rel=3D"noreferrer" target=3D"_blank">www.linuxkernelcves.com</a> directly=
.<br>
<br></blockquote><div><br></div><div>This is coming Ross, this is coming...=
</div><div><br></div><div>But I have a question. We do prefer to have a sol=
ution that runs completely on the</div><div>build machine, without automati=
c rebuilds from the YP? I&#39;m asking because for the</div><div>solution I=
&#39;m working on we&#39;re adding a pretty big git repo to each build (~13=
0MB).</div><div><br></div><div>Regards,</div><div>Marta<br></div></div></di=
v>

--0000000000004f766a0602667e7f--

