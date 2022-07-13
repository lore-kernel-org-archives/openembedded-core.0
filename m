Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4B9C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:00:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.23939.1657728025614341838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nj8oWEYc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 r127-20020a1c4485000000b003a2fb7c1274so1014428wma.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmFpw30REkQBEUBJ5qii+C2d6ejE521gcYJncWIXHyQ=;
        b=nj8oWEYc94jg7utcga7rlLjuGoJ/XtnikPvbheKMQVIH7voG+M59Ids9UR8dKTnRBM
         VhfJSpKC6ugQPy8NEUHlFcuPHvjXKd69lB5m+kaMVdiF/cMfobHeBV47GAy9Z/2Ue24u
         M8B8QmLlcx/U8GQk9uV7oNCIOzuK0jxSZmkqlhamTSMxIVgzkA2aeIHja+q4R+3GOON9
         N0iaRCHostqn7nkXPnfzFa/GIu9QiwATMcuk0biE7B+HbdaW/kSOC6J0IVZ03mxm4PbW
         ASe9ZPczRehPx+M7PEBS9DOaFOnh5+ljfNNPdykYwufXsUHLVc7x76xmqHj9lX+iB+LD
         BnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmFpw30REkQBEUBJ5qii+C2d6ejE521gcYJncWIXHyQ=;
        b=qeLr34eeQDcG6WiY9FWcO7Xl4HY1CLAlz/3H8B4bYczn4yJhx9q3qLxLgK+eIvibj1
         tXQ7XB7VR2GiqumiJdmTt19FlgCkIbJTX+J0OEjOLvcH4w4EfJaI9NJq9g8g9AE+mDRt
         0F7sL7L2216WCdUxGx+5V4FCd9Tn5KRC6+GPQuOGrjzERWrUCd5W2W+tPg0h8fdtmA1a
         YwFX8a3zYtB4zX04vt5wUrfa+/W7Cfp6Dg6wNCAjyf8lpILOKmq68wzrMhZU+0mkqtig
         gNqTN5lSwcABKzTiLLWVxez5r1HFugytioeIWWiOx2/8rS3p8+r5YrDilBmK5jumquQQ
         LUcA==
X-Gm-Message-State: AJIora+94IxHLZJ7RJiXnTlVLm/qeI42cj23RIpLcbtOd5Mc37ugyPmx
	EdNonGCS/E4pWZ/l3iRWqVR49qdgjyvZOH2Sk9k=
X-Google-Smtp-Source: 
 AGRyM1uwLHltPsjCSi/rEGLdK6GC13ZlXzmHnhgbB7U+ELYtvvjjN5ZVEMFZz5fxGKgWUPUvainKkCZqKhng4n8x0/I=
X-Received: by 2002:a7b:c2b1:0:b0:3a2:e07b:827f with SMTP id
 c17-20020a7bc2b1000000b003a2e07b827fmr10897049wmk.44.1657728023902; Wed, 13
 Jul 2022 09:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713154139.101744-1-luca.boccassi@gmail.com>
 <20220713154139.101744-2-luca.boccassi@gmail.com>
 <17016EB5AC5A56BC.15323@lists.openembedded.org>
In-Reply-To: <17016EB5AC5A56BC.15323@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Jul 2022 18:00:06 +0200
Message-ID: 
 <CA+chaQcLHYz9TWB+F6+eChdgkWpSt=sUmW+fBi-uxELhuxSOzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
To: Martin.Jansa@gmail.com
Cc: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ffbcd605e3b1e1b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167963

--000000000000ffbcd605e3b1e1b1
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 5:57 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> Don't use :append together with +=, just add the leading space in the
> value.
>
> Wasn't there a warning when these 2 are used together?
>

There should be a warning since:

https://git.openembedded.org/bitbake/commit/?id=8c31e75557dc6a8d8f407b5d24d6327889a3e3b1

--000000000000ffbcd605e3b1e1b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jul 13, 2022 at 5:57 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">D=
on&#39;t use :append together with=C2=A0+=3D, just add the leading space in=
 the value.<div><br></div><div>Wasn&#39;t there a warning when these 2 are =
used together?</div></div></blockquote><div><br></div><div>There should be =
a warning since:</div><div>=C2=A0<a href=3D"https://git.openembedded.org/bi=
tbake/commit/?id=3D8c31e75557dc6a8d8f407b5d24d6327889a3e3b1">https://git.op=
enembedded.org/bitbake/commit/?id=3D8c31e75557dc6a8d8f407b5d24d6327889a3e3b=
1</a></div></div></div>

--000000000000ffbcd605e3b1e1b1--

