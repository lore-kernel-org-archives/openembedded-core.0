Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF8EE8FDCA
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 03:59:26 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.11286.1696391964279970512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 20:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcPOQH/g;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c296e6543fso18859601fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696391962; x=1696996762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=erDDW49M5rRSMeaFmxqKkpZHXXRsdcb0BZjS7wWAF2A=;
        b=RcPOQH/g7KBVrROwjxRk7dWgcQR0JrhaUHBKxdn3iIOjO1l+MArUSwntG4/BqA5GqK
         sVV7CWFAHnVt3Y6WCoprV7o+Fwf+8ljiy070jece0Ff+Vn4rsAhqx+4TEAA/Kli5d/kj
         V99ql0T+FAupNrE8OVw5YcQXUO9bdBhg6CTecdZp6roHmUxz+dQ2VI1XacC4vnZj1K0e
         m1clBG/DfBRXYLgftTV618F1AmL+WTYnwoC/tETo6oV+ZjLbjyBrirCf2MMOC8Q4lzqf
         D+G19Kz7KZPLg/4OHQZmG7TvzT2RmtlEoG1sGqFJKDe9GL8bxQUbCnJ7bsXqts99PKWC
         8iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696391962; x=1696996762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erDDW49M5rRSMeaFmxqKkpZHXXRsdcb0BZjS7wWAF2A=;
        b=UlaL86A2dlrSVAL0KA7UzCG1VBRnL8M/Kuk3nHCy25IOlyi2i9xxzq9cv6IvPZh5Ed
         TMwXk4GoZIhXVX4tQ5mYbHMeSh48JjWLSiZGusm/slcU2UysQ43kCnKYNBUNvV+8vTJ+
         1lHWUwBF8o+j08AXC9ZnyyPMclEIl98CmexeZEEAn9h8vReZH2PB7pwM+hJVu9WGzpM/
         KfeVzNNEkGEvHbGLV7lngC41mnLuM782Vm4E7qgdafjVG7dGrEWXzZMTvgPgs4UUI3cF
         DyIXA9cV9HmyF2psa4x1FRLSvGH2XLttytBWnJz4nGjuHyETy33ZDLXM7n1LPt9r3rOk
         hnvA==
X-Gm-Message-State: AOJu0Yznx8t+E16UpYiQmzIzSu6D3pDY0ewHSEORrrpj+7BdOfuUdu8R
	n75P+cc35i/DWkQzwno38xoTYjylryWnkSFRHOg=
X-Google-Smtp-Source: AGHT+IF5wO42upx2Ue4Od9iORMOzzy+wqic+Eflgyto+r515OLVuWdAGMuwyura7q3/LB7iiZBI9RQZAxMUsTgTqtm8=
X-Received: by 2002:a2e:b0d6:0:b0:2bd:180d:67b7 with SMTP id
 g22-20020a2eb0d6000000b002bd180d67b7mr954632ljl.40.1696391962210; Tue, 03 Oct
 2023 20:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
In-Reply-To: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 4 Oct 2023 05:59:09 +0200
Message-ID: <CAApg2=SeLa_Y2K807s=CM_uXe9bVM3TXwe1zyQpgUYpoPPP3Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: Classify patched CVEs into 3 statuses
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004eb68a0606dc08a9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 03:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188666

--0000000000004eb68a0606dc08a9
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Sept 2023, 11:03 Matsunaga-Shinji, <shin.matsunaga@fujitsu.com>
wrote:

> CVEs that are currently considered "Patched" are classified into the
> following 3 statuses:
> 1. "Patched"      - means that a patch file that fixed the vulnerability
> has been applied
> 2. "Out of range" - means that the package version (PV) is not subject to
> the vulnerability
> 3. "Undecidable"  - means that versions cannot be compared to determine if
> they are affected by the vulnerability


Hello,
Thank you for your patch. I'm wondering what you use case is. What do you
do with that data? Currently in YP we aim to do as much as automatic
classification as we can. We only adjust the classification manually when
it is clearly wrong.

Now, in this piece of code I don't see setting up 'out-of-range', while it
is possible to separate the not affected case and the case when we apply a
patch. I do not understand the 'undecideable' classification. Could you
give an exemple of a situation when it makes sense to use it?

On the naming side, I'd prefer 'Not Affected' for out-of-range, because
that term is often used in error conditions. In this case there is no error
at all.

Kind regards,
Marta



>

--0000000000004eb68a0606dc08a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 21 Sept 2023, 11:03 Matsunaga-Shinji, &lt;<a h=
ref=3D"mailto:shin.matsunaga@fujitsu.com">shin.matsunaga@fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">CVEs that are currently co=
nsidered &quot;Patched&quot; are classified into the following 3 statuses:<=
br>
1. &quot;Patched&quot;=C2=A0 =C2=A0 =C2=A0 - means that a patch file that f=
ixed the vulnerability has been applied<br>
2. &quot;Out of range&quot; - means that the package version (PV) is not su=
bject to the vulnerability<br>
3. &quot;Undecidable&quot;=C2=A0 - means that versions cannot be compared t=
o determine if they are affected by the vulnerability</blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Hello,</div><div dir=3D"au=
to">Thank you for your patch. I&#39;m wondering what you use case is. What =
do you do with that data? Currently in YP we aim to do as much as automatic=
 classification as we can. We only adjust the classification manually when =
it is clearly wrong.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Now=
, in this piece of code I don&#39;t see setting up &#39;out-of-range&#39;, =
while it is possible to separate the not affected case and the case when we=
 apply a patch. I do not understand the &#39;undecideable&#39; classificati=
on. Could you give an exemple of a situation when it makes sense to use it?=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">On the naming side, I&#=
39;d prefer &#39;Not Affected&#39; for out-of-range, because that term is o=
ften used in error conditions. In this case there is no error at all.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Kind regards,</div><div dir=
=3D"auto">Marta</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--0000000000004eb68a0606dc08a9--

