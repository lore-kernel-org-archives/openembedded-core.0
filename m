Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB10AC43334
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 00:01:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.25393.1656201697856828462
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 17:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5lzsP19V;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id u15so11795785ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 17:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LbhajXfoLkQ4Q9pC1EIoT0QERK6vtYtaODB14H6OrhY=;
        b=5lzsP19VxT8JDZ/71jTlRRcSVVxAUB5LgpzfR0rfdckXEooG6M7jwMqQKyflvlE4mD
         4gg1FajeyThNKqB/tJZjWYzZfFiFSYCZHmtiZEUCe/NC6N6qW6f5xr9zBWbMxkeA2sHM
         sOkTunAy6mYx+NWqhmYMTjsTqEQTWzU6X5aJh25uI5bfaf9AJM0Zir7NNhNdA6JweAev
         MmOvLFYs9B3ip7IAXXgVLr4AezQOLHlqh5Yh6G4mmK06ZxDpnF8hOwDuacCcXvo1b84b
         y1L4/iZ6F/FPtY5v+A8deGLDpVmodQD1/IVmBXuTy+R0cCw+rrZs1yG8n7lYZOFvPTs1
         yBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbhajXfoLkQ4Q9pC1EIoT0QERK6vtYtaODB14H6OrhY=;
        b=ZBzm/6FSECaAw7hcIRmJWXycJCYAIDRmeMevqfgbZsAFcmJpI9PH5qCdWOPDNXoFij
         5JX4AsPmuwgJTp9agaS6Pv7YOjmxhJdmpR+ysDuHYmfkZ2jkigfwtefL+8KE2Sa911KV
         Z5aHy4d/xFRbwOWMvC+VvT7BR60Y08vQdxQMs3txut+UAUNfsulmGvALxx8O647XjWbt
         8Oyn5LljZijmBUnLNMa8v+wmaldWZFIhBzEI4nfVG+IR/1Qqkee/8qB2gkpUztlBK4ht
         JTGdNxdq453OpO7HJ69VYootuHGp5yloU4IjQro125oymc0lXh1/hzktYZp+kTZAkB/1
         G6QA==
X-Gm-Message-State: AJIora8KSMmWPpYHSSoWVM21q8YS2Qcd2snCOykg+dX29MMDU/PravNH
	qE0NFNh3Ed39PNTn3VEsu7YiRscWgE7kJtmvKnDqvw==
X-Google-Smtp-Source: 
 AGRyM1tU+rvvpOqHSQu3fCjTe40g45dCWJpUb3/JN5yQyYvatb0Jmg96NT16HtuPPX2hDyEVLjHil9LKYoJvkktWwBg=
X-Received: by 2002:a17:906:1018:b0:718:dd3f:f28c with SMTP id
 24-20020a170906101800b00718dd3ff28cmr6080846ejm.55.1656201696269; Sat, 25 Jun
 2022 17:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220625223936.135521-1-marex@denx.de>
 <YreZrhrd+GqvY/9g@zx2c4.com>
 <d895911f-c3dd-e067-e6b0-7823664bc932@denx.de>
In-Reply-To: <d895911f-c3dd-e067-e6b0-7823664bc932@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 25 Jun 2022 14:01:23 -1000
Message-ID: 
 <CAOSpxdZnCqvxUCxHUw-hi-2UzpC8NdsqBtYHcgPHhObgpapb8A@mail.gmail.com>
Subject: Re: [dunfell][PATCH] lttng-modules: Backport Linux 5.18+, 5.15.44+,
 5.10.119+ fixes
To: Marek Vasut <marex@denx.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c86d2a05e24e8171"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 00:01:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167301

--000000000000c86d2a05e24e8171
Content-Type: text/plain; charset="UTF-8"

I can add the extra info.

Steve

On Sat, Jun 25, 2022, 1:47 PM Marek Vasut <marex@denx.de> wrote:

> On 6/26/22 01:26, Jason A. Donenfeld wrote:
> > On Sun, Jun 26, 2022 at 12:39:36AM +0200, Marek Vasut wrote:
> >> The Linux kernel commit 14c174633f349 ("random: remove unused
> tracepoints")
> >> removed unused tracepoints and has been backported to stable Linux
> kernel
> >> releases. This causes build failure of lttng-modules:
> >>
> >> "
> >> lttng-modules-2.11.6/probes/lttng-probe-random.c:18:10: fatal error:
> trace/events/random.h: No such file or directory
> >> |    18 | #include <trace/events/random.h>
> >> |       |          ^~~~~~~~~~~~~~~~~~~~~~~
> >> | compilation terminated.
> >> "
> >>
> >> Backport patches from lttng-modules master branch to address the build
> >> failure on all of Linux 5.18.y, 5.15.y and 5.10.y kernel versions.
> >
> > Also 5.4, 4.19, 4.14, and 4.9.
>
> Do you want a V2 with this updated commit message ?
> (or, can Steve add this line when applying?)
>

--000000000000c86d2a05e24e8171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I can add the extra info.<div dir=3D"auto"><br></div><div=
 dir=3D"auto">Steve</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Jun 25, 2022, 1:47 PM Marek Vasut &lt;<a h=
ref=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 6/26/22 01:26, Jason A. Donenfeld wrote:<br>
&gt; On Sun, Jun 26, 2022 at 12:39:36AM +0200, Marek Vasut wrote:<br>
&gt;&gt; The Linux kernel commit 14c174633f349 (&quot;random: remove unused=
 tracepoints&quot;)<br>
&gt;&gt; removed unused tracepoints and has been backported to stable Linux=
 kernel<br>
&gt;&gt; releases. This causes build failure of lttng-modules:<br>
&gt;&gt;<br>
&gt;&gt; &quot;<br>
&gt;&gt; lttng-modules-2.11.6/probes/lttng-probe-random.c:18:10: fatal erro=
r: trace/events/random.h: No such file or directory<br>
&gt;&gt; |=C2=A0 =C2=A0 18 | #include &lt;trace/events/random.h&gt;<br>
&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~=
~~~~~~~~~~~~~~~~~~~~~<br>
&gt;&gt; | compilation terminated.<br>
&gt;&gt; &quot;<br>
&gt;&gt;<br>
&gt;&gt; Backport patches from lttng-modules master branch to address the b=
uild<br>
&gt;&gt; failure on all of Linux 5.18.y, 5.15.y and 5.10.y kernel versions.=
<br>
&gt; <br>
&gt; Also 5.4, 4.19, 4.14, and 4.9.<br>
<br>
Do you want a V2 with this updated commit message ?<br>
(or, can Steve add this line when applying?)<br>
</blockquote></div>

--000000000000c86d2a05e24e8171--

