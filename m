Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B46DC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:03:39 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web08.49961.1638788618410683413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2uKoPqz;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id ay21so18603176uab.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/AGm738RpTbdopaZIDl4klfDItV/kXP1FFZrOwjW+hU=;
        b=i2uKoPqzKbulGHB8GDhv5MyLl0UKBsGZ2ltsZL1TEGv6UU9oCMmtDNR6lW8L7FByaR
         NRLaGVtYmYt7Sd1RiZUFxoUi1UufJEHD5S3Uvu3xDTWSeOA8jdiUk5iFQ8hC1XKnZvW3
         sSmXfXAx3IWznMeN8dQW8TuqPkz4suaYt2uw2dD5jmcp0Fe1MTqrzUs7Q2ZKVJYG3Fk+
         A9wdqUi6wP0JzWIU4v5zRFuQXFe+uaOQE5VZwWOFs9ko9UVsfatfbVEDHC4iXdtpUUir
         BhRDVtrM9FTNUJuonoEZn1fCmmllgJxZfwN9mrRvwS0YeoFb4C4nS778BgiaYF+I1yIt
         KTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/AGm738RpTbdopaZIDl4klfDItV/kXP1FFZrOwjW+hU=;
        b=OxCouG3w+BVAdxEiS/sOum5RD8PJ7ka7zT1Bz7RtNEJYNDBQH5dUTpxMn0gb/PQMnp
         oTwFUvYl+Qn+Ssl+bMzLN+wv7a7fPuh+dQMZo+SksB+cxVA6Dz6ootAHv1SawZ3Gq3j0
         kIGs1bKfDppmPyvfpx46eYLrmjNzr35HxfMjhfmeT6p8eS2I0jJOUCO7ly8wuIe3pQqe
         HEd5iED21Bp2w+uxk2K+v63JM9tiazml0eB3AiF4Vgw5Vf2JdDoatmcmk138NAW6qsh/
         RGvIaEUVz57a8cEWWs+RvV9ZbKs/mIpRdgjemtlS64iUVSE5zJpPkkoxai90eURQJcNY
         pbwg==
X-Gm-Message-State: AOAM531F3DLptGJCpGPEiRQuRQjqcoS2IDCnb9tGL1nIY80a6qpODStZ
	nUG2m9sGrTWZ8V3eWLNjZ/1YJd13+eKNg8vJdmI=
X-Google-Smtp-Source: 
 ABdhPJxB6bCvfMRFvht4yh6VfEave26Z+X8S9sHRCFftgNqMk5RFyFXa3bIJP2LowgGPGdCVywJiO6Z15cKdZ4KU5rM=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr40263146uah.22.1638788617523;
 Mon, 06 Dec 2021 03:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 12:03:26 +0100
Message-ID: 
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000068d53805d27835be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159218

--00000000000068d53805d27835be
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 11:25, Ross Burton <ross@burtonini.com> wrote:

> On Sat, 4 Dec 2021 at 07:13, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> > -Upstream-Status: Pending
> > +Upstream-Status: Inappropriate [last release in 2015, last commit in
> 2019]
>
> If someone picked up Serf maintainership tomorrow, would these patches
> be suitable upstream?  If so, then they're not Inappropriate.
>

Presumably, that someone would start updating the repo and making releases,
at which point we can reevaluate the situation with the patches. As of
today, they are inappropriate.

Alex

--00000000000068d53805d27835be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 11:25, Ross Burton &lt;<a href=3D"mailto:ross@=
burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, 4 Dec 2021 at 07:13, Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; -Upstream-Status: Pending<br>
&gt; +Upstream-Status: Inappropriate [last release in 2015, last commit in =
2019]<br>
<br>
If someone picked up Serf maintainership tomorrow, would these patches<br>
be suitable upstream?=C2=A0 If so, then they&#39;re not Inappropriate.<br><=
/blockquote><div><br></div>Presumably, that someone would start updating th=
e repo and making releases, at which point we can reevaluate the situation =
with the patches. As of today, they are inappropriate.<br></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000068d53805d27835be--

