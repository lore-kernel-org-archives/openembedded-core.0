Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5E9C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 11:02:51 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.12288.1634036570215971716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 04:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lrLOSxsJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id e2so2095108uax.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EQw9GLmFyAWnNNTJYcixH+TkwcTByUZve5lt7yV7fGU=;
        b=lrLOSxsJoH5pLrtxv9cbCn/pX6PcnEy/13hCezrX/s6/nIGO+jju1slRrSeuKvox/I
         Rxp7fRc37828Mld0+ulla3yJNou+9BDrrZ2i/IE2wrWHi467Ia3Fz2lvr2d39yST4eLt
         VCtwiNsENmGjhHckYCN/M0yYrN/MzYl1+t6NJ0tA+WsJTDp/c7Jw2XU8r/V8KfdF+DG4
         U/9e/TME8sqKfETNgssS4wJmv2U8/dZp5fyShLQaJYy/tQ69mZI8saD+9h1z9Eg9WHQB
         BODiKv3TsRMKIo/xujLVutlbTJpvHDexK9ukSMQ3zTXBzFUa0AKSWicE4dUynDVdY34i
         N2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQw9GLmFyAWnNNTJYcixH+TkwcTByUZve5lt7yV7fGU=;
        b=5PocQBsw2JpUfMo+NeC523LgProB9MkVUIR9StMN8RtEJBAlfzcK/ZgjgNNJ5zlTan
         VhlpvV0wOT6Y58HFy+EK9fQOaxFclvQspdn0yqcnzvrgtUVfyNbnMDTcogZ0NgyrkjXh
         6sZgUa3FsEZVVWs3Uv6c2a+oeKXqugnOOWZtJZcoY/Lh9CFimLTYyGPduti8ET+pSpEz
         7wCfh9rMI1+HC3NdoZxDIDEksVzMTTIilQeqPaF1gYMjMhJl8RpEW88osHDvnZRnj1/b
         FEvYckMqxA1jpRzBd00Y76JwOuWT/EfjP71y2Ih/OPcwyu+aA67wL7f1Mz7Kiq0ANIJq
         xHuQ==
X-Gm-Message-State: AOAM532oDgr2/AI+rR6F+ZAEY5HbRzUUl2ARuMqm3w3UVrz/BzTE1ttv
	IkxNOz6wKr1CH9qBvv1ROGnISoEpE7v3YWaYTlE=
X-Google-Smtp-Source: 
 ABdhPJw1aVP+aK90CA8qSkUcleKy1eNIOwat6WoF1bkifH6d4/xUOrE8VmYbJHcOjPMrcMSfTpxXDsyeCVyqMY8Gdlo=
X-Received: by 2002:a67:df18:: with SMTP id s24mr29294788vsk.40.1634036568992;
 Tue, 12 Oct 2021 04:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-7-alex@linutronix.de>
 <8cecff22cdcf4aa89bac193213219677@axis.com>
In-Reply-To: <8cecff22cdcf4aa89bac193213219677@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Oct 2021 13:02:37 +0200
Message-ID: 
 <CANNYZj-BxwBD34yC4W9yOQ-SSTLr0jrEDRZN1q-oKSsZL8ucxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/25] openssl: update 1.1.1l -> 3.0.0
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000003eafa705ce25c9f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 11:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156872

--0000000000003eafa705ce25c9f3
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Oct 2021 at 20:07, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -     mv ${D}${libdir}/ssl-1.1/certs \
> > -        ${D}${libdir}/ssl-1.1/private \
> > -        ${D}${libdir}/ssl-1.1/openssl.cnf \
> > +     mv ${D}${libdir}/ssl-3/certs \
> > +        ${D}${libdir}/ssl-3/private \
> > +        ${D}${libdir}/ssl-3/openssl.cnf \
>
> Given that "${libdir}/ssl-3" is all over the recipe, wouldn't it make
> sense to turn it into a variable? Then it will at least only be one
> place to update the next time they change the version.
>

This changes very rarely and adjusting it was a very minor part of doing
the update, essentially a five second copy-replace. Fixing up everything
that broke due to previously long-deprecated APIs becoming hard errors, and
making the ptests pass again was the bulk of it, and I think we're not
quite done yet as I only checked and fixed oe-core and meta-oe. I'd
appreciate if you test other layers.


> There is a mix of tab and space indentation above (both in the original
> code and in the added lines).
>
> > +
>
> Unnecessary empty line.
>

Can you send a followup patch for these please?

Alex

--0000000000003eafa705ce25c9f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 11 Oct 2021 at 20:07, Peter Kjellerstedt &lt;<a href=3D"mail=
to:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">&gt; -=C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/ssl-1.1/certs \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-1.1/private \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-1.1/openssl.cnf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/ssl-3/certs \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-3/private \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-3/openssl.cnf \<br>
<br>
Given that &quot;${libdir}/ssl-3&quot; is all over the recipe, wouldn&#39;t=
 it make <br>
sense to turn it into a variable? Then it will at least only be one <br>
place to update the next time they change the version.<br></blockquote><div=
><br></div><div>This changes very rarely and adjusting it was a very minor =
part of doing the update, essentially a five second copy-replace. Fixing up=
 everything that broke due to previously long-deprecated APIs becoming hard=
 errors, and making the ptests pass again was the bulk of it, and I think w=
e&#39;re not quite done yet as I only checked and fixed oe-core and meta-oe=
. I&#39;d appreciate if you test other layers.<br></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
There is a mix of tab and space indentation above (both in the original <br=
>
code and in the added lines).<br>
<br>
&gt; +<br>
<br>
Unnecessary empty line.<br></blockquote><div><br></div><div>Can you send a =
followup patch for these please?<br></div><br><div>Alex<br></div><div><br><=
/div><br></div></div>

--0000000000003eafa705ce25c9f3--

