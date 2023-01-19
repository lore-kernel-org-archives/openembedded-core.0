Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9FDC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 15:17:31 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.47709.1674141443242826901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 07:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NwZkuphs;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id s22so2430149ljp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 07:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jrZVTVGC3r2a8ZQF5vHsQ9PUrJjgAXoxhmAelV5TEOg=;
        b=NwZkuphsOW7yYxfhyES4W20YG7JrF0BSTiDrn8O+AadJ2Cu8kM99Z9W2pgqY5FG6KE
         X/LJwd6tbZouerH9M7dRbNi+zvSd5D6petZK6/FPyBr6dXpuq7WZMLlwWoootvJGGmBS
         H6xJYsFfZmmgauh14xBOLb4K0TnIA3Fv1rFwM8s37EXK9zk0q2ZrO5p2RP903k0fpk4z
         O0cHTWxS5eiUzUzLCdPWYPNjLccr9kLQ5SiAWcv8lTuEzkq5xPvCOjev9MtYkoXNUECp
         ibbnH9wgSIOXCdhJGg6bi/qkThSjEp+7SjKwtK7gkZ4sdJ5urixwfZqBmWiNOmvAJyEU
         E1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrZVTVGC3r2a8ZQF5vHsQ9PUrJjgAXoxhmAelV5TEOg=;
        b=gBBYYJXiLOFihanZr1qsQmGJr5rNm4z3qobnL8hZNx18R/czlXC1Jpga43oNCwj1HM
         KqsZMXm3MUnb5Nfc6Bq7dHKC+v7tnb2xoUNKSuqc786TYT9rKn0jJsDc5BDtBZfwpOOS
         Cc6ajo7py/zW3PgPYxvB4PvNhm3ycHi5Ai+Dp0FlXmknSUZ/l/zF8rjkCdpf1/2s1I2W
         pG/dhtvKfsaRsb+wG6+JUkV9xXFG6MhX4X7sFYjCiWnb3wQDzEGMukN2NJXRPbWdyUXA
         HUwLzukERmgOYudcZBIrqwt5jnGm0sS9/qt2D5CVxuo9P9PN3Sx2/Q3yh1HEQAz51FvN
         4j8w==
X-Gm-Message-State: AFqh2kqmW0vy/s6KU1b+RCni+UZEEWSTs8gHYoeD3yv3EHO9cSbYLlAn
	8kmImNs/TG0pS4w6WK00ZAshSDpqVKPr5yNbXlZT2x1E
X-Google-Smtp-Source: AMrXdXsFxCSPo+9r1HmjbqVER6TH/KziHTX1hQlPSpLSzazgFCVKQbGxxlPnMKblwEzTcaLN5OpX6q3cxG6wKjiGHOk=
X-Received: by 2002:a2e:7311:0:b0:28b:6407:3cf3 with SMTP id
 o17-20020a2e7311000000b0028b64073cf3mr626528ljc.222.1674141441337; Thu, 19
 Jan 2023 07:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20230119131853.27372-1-f_l_k@t-online.de> <CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
 <4RNQOR.43XS0RK8SBL11@t-online.de>
In-Reply-To: <4RNQOR.43XS0RK8SBL11@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jan 2023 16:17:10 +0100
Message-ID: <CANNYZj8VGAXt3Djj3hwC54WZ2U52fOo7r33uSX07aB3X3bYmZw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea2e4e05f29f6dde"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176147

--000000000000ea2e4e05f29f6dde
Content-Type: text/plain; charset="UTF-8"

No. If it can be submitted upstream, then you should do so.

Alex

On Thu 19. Jan 2023 at 16.16, Markus Volk <f_l_k@t-online.de> wrote:

> Am Do, 19. Jan 2023 um 16:14:58 +0100 schrieb Alexander Kanavin <
> alex.kanavin@gmail.com>:
>
> ck other patches to see the upstream situation and correct the status.
>
>
> Then i guess the correct status would be pending ?
>

--000000000000ea2e4e05f29f6dde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No. If it can be submitted upstream, then you should do s=
o.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 19. J=
an 2023 at 16.16, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_=
k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)"><div id=3D"m_6049268=
842635782078geary-body" dir=3D"auto">Am Do, 19. Jan 2023 um 16:14:58 +0100 =
schrieb Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt;:<br><blockquote type=3D"cite"=
>ck other patches to see the upstream situation and correct the status.</bl=
ockquote><div><br></div><div>Then i guess the correct status would be pendi=
ng ?</div></div></blockquote></div></div>

--000000000000ea2e4e05f29f6dde--

