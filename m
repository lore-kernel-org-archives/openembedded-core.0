Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9E9C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 20:08:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.2616.1660248518837029079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 13:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N7MRopQT;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id c24so13156791pgg.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YT4jBFghDqufUUWtxrUIfs+sXJmDWr4Thw2s4CyZJoI=;
        b=N7MRopQT8iuBjYpW+m8gmOteFB0LmjgdzRKzosFkDBGfY+ghtPz86sNf/QNHcrHHc6
         xAMxhTJGdDCotvM7hFn/AQjym9qmPL5gXmDVbErJM/bLXuZswjpQFpf0Zb8bpFRmBZTg
         kA0h7OS0VIar2XzQB9MABRcU40E6GNmjf4TUX2xYstN+SkdYipi8qDC/UbngWWSmKBOp
         49bL5lHFVjahHM6Iwqkx7DTLF/7+W35HxYHmIomjN5g57ODEj1FxER4q7oFaYgjIVcjt
         CbaM8wslzXei/kgNuuIf1ABPJ+prB+Eeqzn1bcznLgtSbb0qqMzQusQ13nGvvy6HZLjr
         bWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YT4jBFghDqufUUWtxrUIfs+sXJmDWr4Thw2s4CyZJoI=;
        b=f3IUEizexQLBhV4Ty/zTidZEkH5B9jBXS9XfmZq5RcDiLungZzFoQ+o+2X731f9A9T
         cFVaxbZWXKeWEWypSh5IGibziO11eJ0Qt70TI1AJNu0y0ROkTpyLO6wG3sagxU7A8QYf
         GKzq+YsrfxR+d7Gv+47W1XtRIlSISPLSOdrtsgm0wigii8SS6vyHJECuhFh+PvzQVrRB
         19kUTG29ZHBNDZ7Ai2pYwmmIhuzgjRXfnBewDxwETtaZHwEbPp415mgT/k0j6KiPNUts
         U91VefCFXGYvFbLJGajRg2t1h+qc+4zYgGLu8cXT9No4g5qEzlIbM/6w015Md+7pOWfP
         NzSw==
X-Gm-Message-State: ACgBeo3kTt+jBVLPDXEXpnBhnJsJRg8yDeJw7KY5faHQ5HKpCIrhGchi
	nT+o/4aDKVVGhTtJI6v9v71RcxWwILexH3i21s4=
X-Google-Smtp-Source: 
 AA6agR7PVr9mQNG+xDlcuDqOPZtimpvK6CbY2iIdHLHwRZwssLk+ZbFzVJf5S4BKMGDGRgkVAO3HOQiihOr5fuG9+2s=
X-Received: by 2002:a63:2a06:0:b0:41d:95d7:ab4f with SMTP id
 q6-20020a632a06000000b0041d95d7ab4fmr487710pgq.187.1660248518394; Thu, 11 Aug
 2022 13:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220723203014.5332-1-pevik@seznam.cz>
 <4a201b8f37bf865f46f3f9362ce4bac59618658d.camel@linuxfoundation.org>
In-Reply-To: 
 <4a201b8f37bf865f46f3f9362ce4bac59618658d.camel@linuxfoundation.org>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 11 Aug 2022 22:08:27 +0200
Message-ID: 
 <CAB1t1CwTOS2NnqYJfz4-S6YqkrGaz6HVdaLTwyTuhBb5UJK-KQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ltp: Add post release runtime fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Petr Vorel <pevik@seznam.cz>, openembedded-core@lists.openembedded.org,
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002d888805e5fcbb2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 20:08:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169271

--0000000000002d888805e5fcbb2e
Content-Type: text/plain; charset="UTF-8"

Hi Richard, Khem,


>
> > +[ upstream status: bda92ad659a52d38ac810099f69adff626b064c6 ]
>
> Thanks for these. I did merge them, I just wanted to note that in
> future the format for upstream status is:
>
> Upstream-Status: Backport [bda92ad659a52d38ac810099f69adff626b064c6]
>
> We have code that uses these so the format is standardised. I fixed the
> ones in this series up manually.
>
Thanks a lot! I'll take care next time.

Kind regards,
Petr


>
> Cheers,
>
> Richard
>

--0000000000002d888805e5fcbb2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi Richard, Khem,</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; +[ upstream status: bda92ad659a52d38ac810099f69adff626b064c6 ]<br>
<br>
Thanks for these. I did merge them, I just wanted to note that in<br>
future the format for upstream status is:<br>
<br>
Upstream-Status: Backport [bda92ad659a52d38ac810099f69adff626b064c6]<br>
<br>
We have code that uses these so the format is standardised. I fixed the<br>
ones in this series up manually.<br></blockquote><div>Thanks a lot! I&#39;l=
l take care next time.</div><div><br></div><div>Kind regards,</div><div>Pet=
r</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000002d888805e5fcbb2e--

