Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D300BC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 01:21:01 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.12965.1661131252161036061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 18:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mw3qty7h;
 spf=pass (domain: gmail.com, ip: 209.85.128.169,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3246910dac3so253714267b3.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 18:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=igL7bmeMXCwifcvq4L9LSVc2ZoTpFV6NTejdq0QVCF0=;
        b=Mw3qty7h3feTN5shoT7i9kjX4HGcj3KA7eklv2M7l4jQ0xAYMxrss39b7NQ63LGRJd
         hYYCXbLcXn6bcM7iGuWrVSJ9//JNWSgFxoKdykZgH1a4/qkRiXylk167ctO9CJwmaurs
         IjALgHwqtMwF9X/MsIjjqncSeAHsY9z7dBCBllHRG6Btl6q4gNroPF96Zw8kQAm26xPG
         gci0ps3FR6ajkz5JBW2eO29VooUwJy59l37FIgejHNPrIYiIdhND8LDTo8S+r0T2kqq9
         AYt7eRNeSfF+B7JYK8h+aUj+Vj6fupjA9OGiPB+kIlDH/byGi3TsbINqm2zXMMSK0ul1
         v4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=igL7bmeMXCwifcvq4L9LSVc2ZoTpFV6NTejdq0QVCF0=;
        b=2aQQKCAHrogLeQicgEEsH2gEXi94sy7HEBHdBNCuBsgfShvxCApphyB45N2fX/5WR8
         Trxb5E2QU89ZMXvB33M0SDb9RDBfmRbFcJRtV76sM3Kl0HgwxJB0NQ/kYDFwQ4LzN8sN
         Q63NyiepM8PEJFAhIupzL4gAF+QnvnonlXVtgFBW6dPI5SJDkQ8p0vYm6ISBab5Cnw4E
         COaxQeFzIcKLbmZ51d3avxxszSYUtduu8LVJDTRxfcH7BPhEaSWXR8UWkXcmI5Wl6IkV
         t1Vq8pkQBQ+F/kcYzE4nyGSjSM4U2Rzd5a4TEf1b8NDLIcxFrrXiXrGoZG1f6a/HkQUL
         oz/A==
X-Gm-Message-State: ACgBeo3CWGCCjBz6BSAgswzLWEW79+VUAbyhuiRXSc3+gGsOYtXeewOi
	N3nbS/eqtGl5J7cQZXjnwWrf8TRlnzWyMctzrT0=
X-Google-Smtp-Source: 
 AA6agR7cmGuJUqZeSjcmOeWSwYf7Cah/OITYx5lygDJCST9IXJeU7vNqiTCpweHk71fsIon15Zh/OeGGEYeMNfASlDA=
X-Received: by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr2492062ywe.188.1661131251229; Sun, 21
 Aug 2022 18:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-4-alex@linutronix.de>
In-Reply-To: <20220817131023.4093773-4-alex@linutronix.de>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Sun, 21 Aug 2022 18:20:39 -0700
Message-ID: 
 <CAB=6tBQEuiwNq6W-qT6P6fcnGOpQtxH2cRDBd2NrfKqWrNsXiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] scripts/oe-setup-layers: add a script that
 restores the layer configuration from a json file
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000027a95c05e6ca42b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 01:21:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169657

--00000000000027a95c05e6ca42b5
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 6:10 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This script can be used directly from poky, or can be copied directly into
> a
> layer or any other repository - it is self-suffucient and requires only
> python3
> and git on the host where it will run. It is also copied by the
> bitbake-layers
> layers-setup plugin together with the json, unless requested otherwise.
>

I need to review the code a bit closer, but on the face of it, this appears
to solve the repository
pinning problem quite elegantly. This matters a great deal in tightly
configuration controlled
environments, such as where regulatory oversight is involved.

One feedback item I might suggest is to check if the layer is already
pulled and to avoid pulling
again. Same goes for the commit hash - no reason to checkout the hash if
HEAD is already pointing
at it.

Adding those checks would enable your script to be added as a pre-build
step in a developer
workflow wrapper script. Our environment takes a different approach to
repository pinning, but if
setup-layers had those checks, we could probably switch to this approach.

..Ch:W..

-- 
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--00000000000027a95c05e6ca42b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 17, 2022 at 6:10 AM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">This script can be used directly from poky, or=
 can be copied directly into a<br>
layer or any other repository - it is self-suffucient and requires only pyt=
hon3<br>
and git on the host where it will run. It is also copied by the bitbake-lay=
ers<br>
layers-setup plugin together with the json, unless requested otherwise.<br>=
</blockquote><div><br></div><div>I need to review the code a bit closer, bu=
t on the face of it, this appears to solve the repository</div><div>pinning=
 problem quite elegantly. This matters a great deal in tightly configuratio=
n controlled</div><div>environments, such as where regulatory oversight is =
involved.<br></div><div><br></div><div>One feedback item I might suggest is=
 to check if the layer is already pulled and to avoid pulling</div><div>aga=
in. Same goes for the commit hash - no reason to checkout the hash if HEAD =
is already pointing</div><div>at it.</div><div><br></div><div>Adding those =
checks would enable your script to be added as a pre-build step in a develo=
per</div><div>workflow wrapper script. Our environment takes a different ap=
proach to repository pinning, but if</div><div>setup-layers had those check=
s, we could probably switch to this approach.<br></div><div><br></div><div>=
..Ch:W..<br></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div><b><span style=3D"font-family:monospace=
">&quot;Perfection must be reached by degrees; she requires the slow hand o=
f time.&quot; - Voltaire</span></b></div></div></div></div>

--00000000000027a95c05e6ca42b5--

