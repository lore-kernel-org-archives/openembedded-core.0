Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA08C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:21:47 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.32017.1641824506051300039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Da6wG4bg;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id x33so22341528uad.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tq8Hvv9NyBYRPAeP+Knq396rtC+dnfskFylyYN43CW4=;
        b=Da6wG4bggrD07DwpJ7O76gccLnD3Bp5fqaHaYHyrhlp8/yJrLaPhvFjLnzB6+6PStL
         bcsE3x222/nYX9QdRWPUqSIZZKWACcvEP4QISgBIPHn73F62RXwWnHir6m86viVsLB92
         edhxlLL5UNfWvErtfif/YNGR1vauO4IVyrOPvBDZUU7+VbNp0WdCImFIGHMvoadmW0va
         HaVIc10/eMuWZIEWWcro/XUbHFBsN+4/2J/hD3pgXyLpdVB2kz6I10bf1xCMgAYxTq1S
         pWxpL5xAMHkfhRvNNuEbDUxf7aZSDj7qWQWwvAJwxsCfW/y3nxZx72qA9FAPpHpjg8Rs
         xeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tq8Hvv9NyBYRPAeP+Knq396rtC+dnfskFylyYN43CW4=;
        b=nkmfE3oOxLzXTblPM04kyQurVyoBKt1T5/oXB7Ch77jSVWzr2nPhP1zwsbUSTmuWdR
         pj1NzgLA4RcmIcCM5a2JGFLuADgwRT6EQIoKYPsi/564HXG2woEsEI9WQhjOIhL+BKA9
         HFCeUqaZP4PVUux44ts6igO+hpgFhw+8ayZtMqLUDSeuPqaym+bldetGaUOjnu+ntQM7
         j0vwKHKcMWGewnF1TGurQU7hiVZjmseVnbWIb06XVd3LFy7ZTenD83xiLKRxJotkIOK6
         2kS1xAxOnTjVbQkG4e6SwyErndJAubk8OIj/wgwcdkPszm7JKsalXeXj/9XFSZom5sQu
         hm+A==
X-Gm-Message-State: AOAM532q5lgsx99Z7rs7L3k+PzAcZudR22Hbu8lQDxD0O8/6lnvAy97H
	0cY/b2RqwLQLejpJEx+3yB0q9+wsRymFYM9BPlM=
X-Google-Smtp-Source: 
 ABdhPJyorlernrjkJ8/5GZ3Eci0I5rEhl2LY/LD6e7WaCjhf1AMGuzMU0wkQuvpPBaQomDZ3g35NIkXvlYgPl6b+f8c=
X-Received: by 2002:a67:c81c:: with SMTP id u28mr24840162vsk.38.1641824505246;
 Mon, 10 Jan 2022 06:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <4d829edff8abad25269693d4f199b582b5bdf879.camel@linuxfoundation.org>
In-Reply-To: 
 <4d829edff8abad25269693d4f199b582b5bdf879.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 15:21:34 +0100
Message-ID: 
 <CANNYZj8sah0ehNNcvQqfO9hJaCLq6jx72gpTbqz2cUyLQSdstg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/14] python3: drop unneeded multiprocessing
 module patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Hongxu Jia <hongxu.jia@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000006b38cf05d53b0e77"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:21:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160364

--0000000000006b38cf05d53b0e77
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jan 2022 at 14:59, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> Isn't this now working since pthread was merged into the main libc library
> and
> therefore separate linking for pthread is no longer needed?
>

Yes, there was a previous discussion with the same point, so this needs a
commit message adjustment?

Alex

--0000000000006b38cf05d53b0e77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 10 Jan 2022 at 14:59, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Isn&#39;t this now working since pthread was merged into the main libc libr=
ary and<br>
therefore separate linking for pthread is no longer needed?<br></blockquote=
><div><br></div></div><div class=3D"gmail_quote">Yes, there was a previous =
discussion with the same point, so this needs a commit message adjustment?<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<b=
r></div></div>

--0000000000006b38cf05d53b0e77--

