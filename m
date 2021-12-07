Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE79CC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 18:47:42 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web09.1268.1638902862234694842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 10:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BK4zvejb;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id h1so23669vkh.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 10:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4LSMnaNrdUE4+zvIu0Xy+2VC28srl04xnJwC963sY4=;
        b=BK4zvejbaa4frM9kXTq1oWR00/DHxeEG8RmZrlpS0wwae5AjA/WlW3GLbpHhPlj2tt
         4wOi9mDdX+Ge7VUqM22KAzb+J48Vdr9fHlwr7HQf56RUE9FnEBKXpOaejvH86LenC0th
         CNr6tBxe+2JFi3hQIhIyeTEA2qPa82juNSSGD7BzCFypQt4SLOvICkLwQs1B91o+PaOe
         1hj6cLhYmj2aoCx8XpgVznqQ6omXQHYUYB94EHZr2pQ25i56+egSKz0TfRfu4kYtkEok
         mKHMQ1zCDbXzpEG9y/5UldFPTe/R4MuPqa4CJWEzVHirXuMfjIhpObj0IAbT7VqpSDKM
         +pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4LSMnaNrdUE4+zvIu0Xy+2VC28srl04xnJwC963sY4=;
        b=akm54NGlHe+MvE/Al5u2MCPUZnu7LkqHOoJ06SYqKjYdpfah8aOYN4mcO1xuhrj/i0
         4HVPv0KkzJTqkKyeVfwKgGcewmjPl1UoHX95YJP3spS9vsyBBZpJC/ySx2AHMDwyhsWu
         twk7mOO9C5mcgvsrM6zmUMb5gRMNxXc70xcy1n5PQarlxAZQLhft27/OvDfEKh5jxMIA
         H5rQtIeTptvGuhBSYTEBI/lc/7ALAv9Rs4Q37QHPXD96i1PlUV2RkAh+d49ynPlV/LQ7
         tbuAyoEJ3syoySFes1DFFXWP0eIxo/rq2Ax+P5f2kr3oaLyWfxbz0eTab/qEHdwnjP3/
         iwVQ==
X-Gm-Message-State: AOAM532kKs8d1+5EVmlb8wAq1QYgQruz5xRojVRk0+tqacBV/DGdJMcb
	u86qDZ+0ln6s4VtleCX5aXBN/GQtSMZ+ajvi8xc=
X-Google-Smtp-Source: 
 ABdhPJwwVIIs3LTfO86O/6+RvqHGXRkSyYwpkCYyJ+idkJRfJ+YwKVrfpAsoUR27G84jwpZq1KDL4cNmIUox4vRTpdY=
X-Received: by 2002:a1f:3f4f:: with SMTP id m76mr55512218vka.1.1638902861402;
 Tue, 07 Dec 2021 10:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20211207130703.3196805-1-alex@linutronix.de>
 <20211207130703.3196805-15-alex@linutronix.de>
 <CAMKF1so8LTZALn5Fg_o=zKUL6+oBa+Hds0rf5eXH4Fj_ebjrbQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so8LTZALn5Fg_o=zKUL6+oBa+Hds0rf5eXH4Fj_ebjrbQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Dec 2021 19:47:30 +0100
Message-ID: 
 <CANNYZj-9Atc5fVS836E6HQJ8wP89u5J2pDuB230joVCe9LjBzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] ruby: update 3.0.2 -> 3.0.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e0144805d292cec0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 18:47:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159327

--000000000000e0144805d292cec0
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Dec 2021 at 16:57, Khem Raj <raj.khem@gmail.com> wrote:

> >  do_install_ptest () {
> > +    set -x
>
> I guess this is a remnant of debugging. Perhaps not needed here
>

Thanks, I added a followup patch to my queue.

Alex

--000000000000e0144805d292cec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 7 Dec 2021 at 16:57, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt;=C2=A0 do_install_ptest () {<br>
&gt; +=C2=A0 =C2=A0 set -x<br>
<br>
I guess this is a remnant of debugging. Perhaps not needed here<br></blockq=
uote><div><br></div><div>Thanks, I added a followup patch to my queue.</div=
><div><br></div><div>Alex<br></div></div></div>

--000000000000e0144805d292cec0--

