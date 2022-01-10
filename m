Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCACC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:15:19 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web08.31232.1641820517826079529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBqdLDdz;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id b77so8059973vka.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzR7BRIjdvjIrdJB6FkY9nAcBVhyvOD72OGvB9qxpUI=;
        b=ZBqdLDdznI6zLChvpdZvQz5tea/EuonF/rC57L6LUrbKDFQw7kVSAbVO4571NR5K7U
         X1vReS95pgXaI+GRm5pMreSW190KeC22kyUgIPob4ylKNDRr8ZO/Pv15cCPG6avEc6ZU
         bTbvkOrXbrL8oF6KrYjrw70WLVMyUx+sHJ03s+LHWnqvDbDjSJl7yyyhHtNY/LoGgJlk
         vzhAIa6aRvH/HEQTlZinX4IIosZ++biUaZvq6XViazD+fwXoJ0UbmIAdpFPtVZgzIgQU
         mTQMrz4hAz0AEWCa6vRa+9vNennE3AOKKHoWakUUNaiLXgs1+XopPA3X+a6Ir+5KjnPB
         tKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzR7BRIjdvjIrdJB6FkY9nAcBVhyvOD72OGvB9qxpUI=;
        b=SdUl7lX/lqPlvqCk+kHINTeJKCYyafBMu6wjkhjcZ8BoaTBRvCdRm0soMDdmCjH3lV
         PHXC9CqSM4ElDGmMyRcj2KaU0AOqegORfi1SIs3ugQHb07QTT24gQ/C2mOAxLqW1Qv1x
         RZURxCbGSlOjijCPD08twGRKFeKmMhQYnbYkppLncLNfwjBlPDUqPF+36M24jRJUc/9t
         EMX9fqIwlN49aiimidmKr1dCexQAd0uyNmu6KiuvvjFWG2sh17yp+DDGnoRj+rNq1H3d
         X+rlnh1i65m3Jyklwl4IFycL1WHTS/c2JnnmKYotT9EG3zoVw+uvZYenSgtZV2ljxa9A
         CG0w==
X-Gm-Message-State: AOAM530ethlTFiNs/2E672T5AoP9Fbme8OegFyFIdmMaCn+IiHd3CfD3
	qQ5BL6k3IPtitnq5Afa3PIAXNW48zA0PkvB/wfY=
X-Google-Smtp-Source: 
 ABdhPJwyofUdJC5fnLzTSdOtdEVssktxmcq7V/J6Cn5a/J98z33hi/tnTmq2K/PO6g+x4tdTLwipVydzAjw2IemZOc4=
X-Received: by 2002:a1f:ce41:: with SMTP id e62mr1114237vkg.30.1641820517017;
 Mon, 10 Jan 2022 05:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20220106201234.159792-1-saul.wold@windriver.com>
 <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
 <647ddff7-c27c-4023-aa70-a423876f4e20@www.fastmail.com>
 <CANNYZj_DDFsXrftLA3ySaAefWbqO=CRwHROiisY8_x80DDT4nA@mail.gmail.com>
 <ac4676b0-7d40-4f2e-bf3d-892fef657037@www.fastmail.com>
In-Reply-To: <ac4676b0-7d40-4f2e-bf3d-892fef657037@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 14:15:05 +0100
Message-ID: 
 <CANNYZj8VVqOpQYdg3MJFYjXKaZu8+cLinjggSvcwxEiEtzngeA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] perl: Enable threading
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>, bero@lindev.ch
Content-Type: multipart/alternative; boundary="000000000000b3abd805d53a2064"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 13:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160350

--000000000000b3abd805d53a2064
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Jan 2022 at 14:08, Andrei Gherzan <andrei@gherzan.com> wrote:

>
> You need to clean before every build. Perl doesn't correctly reconfigure
> itself when settings like this change.
>
> I'm not sure I get you here. Are you saying that this is normal behavior
> or that it is a known issue? If the latter, do we have an bug raised on it?
>

Yes, it's something to be fixed, I'm just saying that the specific change
itself is not the source of trouble.

Alex

--000000000000b3abd805d53a2064
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 10 Jan 2022 at 14:08, Andrei Gherzan &lt;<a href=3D"mailto:a=
ndrei@gherzan.com">andrei@gherzan.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div><br><div dir=3D"ltr"><div>You nee=
d to clean before every build. Perl doesn&#39;t correctly reconfigure itsel=
f when settings like this change.<br></div></div><div><br></div><div>I&#39;=
m not sure I get you here. Are you saying that this is normal behavior or t=
hat it is a known issue? If the latter, do we have an bug raised on it?<br>=
</div></div></blockquote></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">Yes, it&#39;s something to be fixed, I&#39;m just sayin=
g that the specific change itself is not the source of trouble.</div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></d=
iv>

--000000000000b3abd805d53a2064--

