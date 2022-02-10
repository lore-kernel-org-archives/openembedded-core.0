Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546E1C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:28:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.12327.1644510490981344218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YWJ6UOVW;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso4344369wme.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/uR2wUc00NMNtMj37u2Rq1VRU0sRAT4wRluJP4RBCQ=;
        b=YWJ6UOVWsPZBCvULDbPWgdl6c3lpTweGDcpdGdXygpX/nMKN1zKpXBnp7wA/UZKB/u
         MggoIc9qIHUIE+V8Kg9aOk4jYGwXdEpsqhO00pdRjEVQhgsWTqqgQtISFUZOFnPtYyxA
         y/IbvBT/lgDNfd7F+buk9tE5CtgGgkwCXg1MYJQVKe06nQ0Cw6a0iAPBtrHeqQIcSjp4
         1BxUG2iCXnSTGaU5ZwiNouj+ImWtPElt9WqDwHZLCOWQLRZkqrW5bQ+s6eacehfiIfEZ
         Ana7iVKv0yk52eE383m9ZSYBwYypOlwGQCEdoogoUSRjfKp1QGwg0cV0UkNZOCKodCVZ
         NCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/uR2wUc00NMNtMj37u2Rq1VRU0sRAT4wRluJP4RBCQ=;
        b=GRP6DEgld+OEFrbtYKVxASxmzuQ6ZOjgXZ3fiqfQgIbOz71hdupuX24rgsz9exsIw9
         ID2TsxFqJZbfs56zi6arCbe3NSl5xTu8f7qUDqEiHJws5eQrA1jE6greCO9J/MrVkEV7
         nY58gEjJSN65woiODvQQ+dNBcudX8sn9i6d0QRx+fCWac0dzgL6hBS7TUI0+FVOwVeIm
         E2fqnsGED8ltud0OLu/2UrakY3cN+DRuSHKhm825f7XyNoyiamlHX5XoAhbQbgKr1U3x
         X27X5tLoqIr5kvuBHR0nrIH5WNkrlzche2qbaqeuHMF2m7eCaJcbyu1crp0oSCUpobEz
         TGwg==
X-Gm-Message-State: AOAM533OR1ia0V/xOzM6pyscDsIZCVaBg9W1QEZrbuKD4RiDR/q3EOfq
	Nmnehvojp8s3d/70m2YKcrrfV4L9NgpezrqHh7Y=
X-Google-Smtp-Source: 
 ABdhPJyY9EFmlHVeiPzDrhWauthirHMz7+H98d2OWKAKnSnPFSXA+Fv0TdaALSfeODrgrlm+KlgVzuDSdfRIo9pWasM=
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr2842848wmr.64.1644510489415;
 Thu, 10 Feb 2022 08:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20220125095922.70163-1-rybczynska@gmail.com>
 <CAAnfSTvkWktcmBBGWVXxuBRgeu6iBMoi7bt2iniNyuNRG3cPKA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvkWktcmBBGWVXxuBRgeu6iBMoi7bt2iniNyuNRG3cPKA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 10 Feb 2022 17:27:56 +0100
Message-ID: 
 <CAApg2=Q30WinT=S6buUNmtZOj5dyPRLNmEfhU7fYvqPhDQf5vA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: add json format
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, ross.burton@arm.com,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000008d122e05d7ac6f9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:28:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161621

--0000000000008d122e05d7ac6f9e
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 10, 2022 at 3:36 PM Ross Burton <ross@burtonini.com> wrote:

>
> > +        from jsonmerge import Merger
>
> This isn't part of the standard Python library, you'll have to
> replicate the logic.
>
>
Do you mean copying part of the class or reimplementing it?


> One suggestion would be to move more of the logic into
> lib/oe/cve_check.py so the class doesn't get too big.
>
> This is possible.

Kind regards,
Marta

--0000000000008d122e05d7ac6f9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 10, 2022 at 3:36 PM Ross =
Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 from jsonmerge import Merger<br>
<br>
This isn&#39;t part of the standard Python library, you&#39;ll have to<br>
replicate the logic.<br>
<br></blockquote><div><br></div><div>Do you mean copying part of the class =
or reimplementing it?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
One suggestion would be to move more of the logic into<br>
lib/oe/cve_check.py so the class doesn&#39;t get too big.<br>
<br></blockquote><div>This is possible.</div><div><br></div><div>Kind regar=
ds,</div><div>Marta<br></div></div></div>

--0000000000008d122e05d7ac6f9e--

