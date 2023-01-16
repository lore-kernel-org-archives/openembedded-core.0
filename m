Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C485AC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:31:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.171537.1673886698461778090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gtxb0cSY;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id a11so3332541lfg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8ViEdwyZkq6CoOA+8+PcjhosYt81zcjycCobfDd150=;
        b=Gtxb0cSYDJMblC9HVxsCRxsB5HbKhJseJ/24+oBBjJGtSbUIZIpN+vgHTRepRvq5D9
         1pJ5NJ3Uc0c3UXFzpm8sSG4h7UWdep8Yen9SOMZ9dgdUt6Pe2K61Nj9wLGraNSTx4KMV
         UwUlfANU49Wvkn9IGRVRNS9ZznaqGGo65v50LAsQqjDGcHPF2eF/cFH4lq5oR75oCKHc
         M5o8zYV/2MPnePpTEBGXeH5ws8l6yE3iujkmcsaRNezi8MdJ/IJklWbpSLDFN9bDAzlA
         GKQE6hYNxEZuFmBEC6RX/IR/8QpCeI0R2cP9V63V9KPJ5N2IiIRFVhSxrPTbRujBvc90
         evOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8ViEdwyZkq6CoOA+8+PcjhosYt81zcjycCobfDd150=;
        b=bONfEIOL6sj8QhuT0yZ62sqA2sEUK3s7p/gOKKlHdsNCvZa/7cFQkxCRJXl8tWuchq
         HWCmDkNpmR6Zcz37nqFBC56HLHOlV83kH8AkBC4iaqRT04eHN9KFf/V6xVfUyNRQztEJ
         Ao9mXR7bBCM9if57QvKp5QECSTjgeqsmjY4Kg7+6uY24FMbLjYuv52AC2u3J6c29cCD1
         U2V8msYsSVyZQzdApa8sEG3SK0Xn/HyDyRphfWji2k6RFjGOhmoLgnWL2PsU5ZI0B8T3
         8B3DIsvc56OOipmiKIluIK6+8CvDELBW1HP6PDWjeQ1pKZDccZ9EZEdmbYUGvq9ACYAi
         rgwA==
X-Gm-Message-State: AFqh2kq3ZQYyZhIm8scRP9/BeY28kjISUhrfG2npUjgfkZA/TkO8aIJ1
	tywEHkdlhShQsnAXm+H9A5JnmloQoVB8rQRYRDQ=
X-Google-Smtp-Source: AMrXdXsrJsqHkhO9qZLi2u0DzpdD3Xd1Cl54aDewS78g+iSt9jvBLKEp8jQcDsonqqGZ4dYN2m2Od/85uS/FlZgZdEk=
X-Received: by 2002:a05:6512:1107:b0:4cb:2508:f535 with SMTP id
 l7-20020a056512110700b004cb2508f535mr4973669lfg.131.1673886696660; Mon, 16
 Jan 2023 08:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20230113145700.2773771-1-alex@linutronix.de> <20230113145700.2773771-6-alex@linutronix.de>
 <BB6FF62C-5B13-435A-B707-B26ABE094FF9@arm.com>
In-Reply-To: <BB6FF62C-5B13-435A-B707-B26ABE094FF9@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Jan 2023 17:31:25 +0100
Message-ID: <CANNYZj_bibmoOX4ya0scYUkCjEjf6Rzr1uQN3KnbhgFiHDJcDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] gdk-pixbuf: remove ptest support
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex@linutronix.de>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f2e06605f2641d3f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176002

--000000000000f2e06605f2641d3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon 16. Jan 2023 at 17.10, Ross Burton <Ross.Burton@arm.com> wrote:

> On 13 Jan 2023, at 14:56, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Moving to x86-64-v3 instructions revealed that the recipe was doing an
> entirely
> > incorrect thing: running native gdk-pixbuf-query-loaders executable
> against the target set
> > of loader .so binaries. This worked, but only by coincidence, and no
> longer
> > works on build hosts that do not support v3 instructions.
> >
> > Re-enabling installed tests in a cross compile scenario requires a
> complete
> > re-think (against the need to run gdk-pixbuf executables to produce the
> tests),
> > and is best done upstream, so sadly the cross-testing has to be dropped
> > for now.
>
> So what happened in a proper cross environment where the native tools
> can=E2=80=99t open the target .so?


The tool prints failure to load messages, concludes that no loaders are
available and writes out an empty cache file.

Alex

--000000000000f2e06605f2641d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon 16. Jan 2023 at 17.10, Ross Burton &lt;<a href=3D"mailto:Ross.B=
urton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)" dir=3D"auto">On 13 Jan 2023, at 14:56, Al=
exander Kanavin via <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@=
lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Moving to x86-64-v3 instructions revealed that the recipe was doing an=
 entirely<br>
&gt; incorrect thing: running native gdk-pixbuf-query-loaders executable ag=
ainst the target set<br>
&gt; of loader .so binaries. This worked, but only by coincidence, and no l=
onger<br>
&gt; works on build hosts that do not support v3 instructions.<br>
&gt; <br>
&gt; Re-enabling installed tests in a cross compile scenario requires a com=
plete<br>
&gt; re-think (against the need to run gdk-pixbuf executables to produce th=
e tests),<br>
&gt; and is best done upstream, so sadly the cross-testing has to be droppe=
d<br>
&gt; for now.<br>
<br>
So what happened in a proper cross environment where the native tools can=
=E2=80=99t open the target .so?</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">The tool prints failure to load messages, concludes that no =
loaders are available and writes out an empty cache file.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote></div><=
/div>

--000000000000f2e06605f2641d3f--

