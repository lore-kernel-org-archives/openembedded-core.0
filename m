Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02777C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 15:19:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.12840.1656515993540295102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cPK5UkH+;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id w20so28632295lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PHSZuWlVUpJ9Ue4J8hMmae1DDNiS4FEl0P7qB81Gdfs=;
        b=cPK5UkH+2Lct3KEKi73q/EHDVI4dmYhha46v4VQ7IfuuImzysYVm81UcAivElxVDFI
         kAa9qPfOgwVX0SsMGL+hD7/Yfsx8BM0iqboq/l95gipzu0T6atmY4ki0oYcFSto7svRU
         1ejd8oVdfOlRjaSpiI72JTG58J69g/1WkAB1EFN3omAioGh4ZmxS397ECjzw++GCbMEQ
         05QM19aTzoy0NtndHhs2y4xtveU0dmZ6uy8y3aqwumecdUpqR0CG0DyiC6UyzGqoLVi/
         kmVwC3Cflpnu7TM/A9yyGDOIClCCiHMqij+i4KqGlr+eOMxPQclvUTY+xkw50siRU3yD
         sxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PHSZuWlVUpJ9Ue4J8hMmae1DDNiS4FEl0P7qB81Gdfs=;
        b=X8wJZuBQ2zLAWvjp/N+lVy4PWHPX1pamTS8b/wbVb0FntmVC1T07CFf/OOK+Aozuat
         /JNbgEyt46Pm+wp4JTm1xERfYLoD4uHHRoIO2XdSJHBsYNjfIf9iJzSxJgrUxLHyo05G
         gzC33MrN1wVj4pdACPgEgTs6sBiMduclEZzkuQtqbgMsI8OJmHGHDlEG7GGqgFrhnqgQ
         /yj47noY0TDP3+AAEuktr/Bnv2LHXgqajKnikprN9Mvk8Fs1hJtvMcrtkIPJMa/iBb8u
         Ok1ZCmXbJ8XGxd9uhA5UFcepQp/P3HKzfHh7/NNi1fANpLuSxUtPIgukTZgNPUrAXIJH
         nhPA==
X-Gm-Message-State: AJIora8lpt4OaZNiT8BcEP+mQi9NllJy2YvOnOL5JyyN+P4/0jYSQH0L
	Se0p/YU+2VndQk6qnA4KgW3mkbiGPJFuH2fNX/o=
X-Google-Smtp-Source: 
 AGRyM1v6VQfO8SoREnM8DL78PtKZJ8r3ny3h8tMjzwcyF/iOPwbGa3EwTClWkERKlC8E1yYmMgUd3irxySbSP7vkUfA=
X-Received: by 2002:a05:6512:3ca4:b0:47f:6e53:fb4 with SMTP id
 h36-20020a0565123ca400b0047f6e530fb4mr2514633lfv.57.1656515990913; Wed, 29
 Jun 2022 08:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220629151519.1179173-1-ross.burton@arm.com>
 <20220629151519.1179173-2-ross.burton@arm.com>
In-Reply-To: <20220629151519.1179173-2-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 29 Jun 2022 17:19:39 +0200
Message-ID: 
 <CAApg2=R5-tfzpbMzKevZaPkzVd=BOnJpu-QOmdSFAKXxxThdzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: hook cleanup to the
 BuildCompleted event, not CookerExit
To: Ross Burton <ross.burton@arm.com>, Sean Nyekjaer <sean@geanix.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000034059705e297af57"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 15:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167384

--00000000000034059705e297af57
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 29, 2022 at 5:15 PM Ross Burton <ross.burton@arm.com> wrote:

> The cve-check class writes temporary files to preserve state across the
> build, and cleans them up in a CookerExit handler.
>
> However, in memory-resident builds the cooker won't exit in between
> builds, so the state isn't cleared and the CVE report generation fails:
>
> NOTE: Generating JSON CVE summary
> ERROR: Error adding the same package twice
>
> Easily solved by hooking to BuildCompleted, instead of CookerExit.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
>

Sean, could you check if it is your case too? I'll be adding a more verbose
error message
so that we know which package it comes from.

Regards,
Marta

--00000000000034059705e297af57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 29, 2022 at 5:15 PM Ross =
Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The cv=
e-check class writes temporary files to preserve state across the<br>
build, and cleans them up in a CookerExit handler.<br>
<br>
However, in memory-resident builds the cooker won&#39;t exit in between<br>
builds, so the state isn&#39;t cleared and the CVE report generation fails:=
<br>
<br>
NOTE: Generating JSON CVE summary<br>
ERROR: Error adding the same package twice<br>
<br>
Easily solved by hooking to BuildCompleted, instead of CookerExit.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br></blockquote><div><br></div><di=
v>Sean, could you check if it is your case too? I&#39;ll be adding a more v=
erbose error message</div><div>so that we know which package it comes from.=
</div><div><br></div><div>Regards,</div><div>Marta<br></div></div></div>

--00000000000034059705e297af57--

