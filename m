Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715EBECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 15:01:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.6664.1663426873201798368
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 08:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EscyX/Hp;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id i26so40043137lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tsB6e5aDBKWc0TQbh9VNQVk02NvK/ZpFSzLT8wEATng=;
        b=EscyX/HpaL/tojWXl0HcbH/P3Ugg82I5BRhqHQeI5h95nfXPHd9uI2OF84fO1JPDDr
         QxKXKY7DApgvKEzuKWXZSvwatKOTddntwE0vrOgV8vT6LtKzRAOiZvqhX2XNV0rqwlcr
         vAp/76PIbnP/kVNOVtFatxDtf6TA+ccqsV5TEEmFGctjvtZupgdpzGbrylvQP3gpDYi3
         gk7voOySfBMWzFWityNVntahrZYpTTADnvrO8pTtcC2H3BPAZiyVIG2oL5arhMAtCRbB
         fXO7HTqHHFoM9c8fEVmm2E4yDYs5dMav1Qxs76MtXojcZdRE02CuqXjc505yLb5sL7t2
         I71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tsB6e5aDBKWc0TQbh9VNQVk02NvK/ZpFSzLT8wEATng=;
        b=gXCYHRnxvPsQdZ/3sRQAXLfGJqH+Arl9SBhgOleNJQlgqJM6SkCVNRN9V2TOsOak0k
         +u0ndT5v/ysU6gsSG2HBJk2aY3U9scqWCAIBmTM+XJ4FE7U0LVQQEdtNwN2njcku+V2q
         DafDE4g9ZVdzduYHeB59QHfLElqDaLQYuIwHKaP/SR7cdqgYP9hFWiI1oYoq+MO+1BHo
         BPXSxm1xKhyIUy/kWKxXqalFlJFDBcaTkXvmRKAVPFKiAeds47bgHUmQv2fHk1V3vIUg
         zqyzi6UD+Z5oI9P3AZv21pF7WsFiyAZW/REjl7tjNCys66+RF7HiYaiXPd4lB09+jcys
         rK1w==
X-Gm-Message-State: ACrzQf2r7cyiaqzEk1It9CqrV4MPf/nkp+v06l1BM9sALmZobJ2/I3WJ
	Q2vjaWhC/V6oUG299Fx4IDQZuntEeE2exlr9QuI=
X-Google-Smtp-Source: 
 AMsMyM4CJtcU6O/dNCVMWORTe5O6xJlvyIRUhpHn0lg0UN3rRrPQ0XjvXP06J16+MyR+3cyCsRCTRm6CN4nt/uC3lXo=
X-Received: by 2002:a05:6512:10c4:b0:499:4c:64d7 with SMTP id
 k4-20020a05651210c400b00499004c64d7mr3254687lfg.521.1663426871132; Sat, 17
 Sep 2022 08:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220914120421.551923-1-alex@linutronix.de>
 <7af0d3563301632f007852d58c406d507f70fe2e.camel@linuxfoundation.org>
In-Reply-To: 
 <7af0d3563301632f007852d58c406d507f70fe2e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 17 Sep 2022 16:01:00 +0100
Message-ID: 
 <CANNYZj8qPew0+qNt-2HcnnFmQBTjOkFyYJFnDcoQuRWrYbayDw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] python3: update 3.10.6 -> 3.11.0rc2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3858e05e8e0bfb2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 15:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170837

--000000000000c3858e05e8e0bfb2
Content-Type: text/plain; charset="UTF-8"

This is marked RFC for exactly that reason :) the purpose is to allow
pre-testing with other layers, and avoid duplication of effort.

Alex

On Sat 17. Sep 2022 at 15.04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-09-14 at 14:04 +0200, Alexander Kanavin wrote:
> > The semaphore fix has landed and is available from 3.11 onwards:
> >
> https://github.com/python/cpython/commit/1ee0f94d16f150356a4b9b0a39d44ba1d2d5b9fc
> >
> > 3.11 release schedule: https://peps.python.org/pep-0664/
> >
> > Drop 0001-Mitigate-the-race-condition-in-testSockName.patch
> > as it is merged upstream.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes-recipe/python3-dir.bbclass       |  2 +-
> >  ...ib-termcap-to-linker-flags-to-avoid-.patch |  8 ++--
> >  ...-search-system-for-headers-libraries.patch |  6 +--
> >  ...-use-prefix-value-from-build-configu.patch | 14 +++---
> >  ...e-the-race-condition-in-testSockName.patch | 47 -------------------
> >  ...sts-due-to-load-variability-on-YP-AB.patch | 18 +++----
> >  ...FLAG_REF-always-for-interned-strings.patch | 33 -------------
> >  ...-detection-of-mips-architecture-for-.patch | 33 ++++++++++---
> >  ...fig-append-STAGING_LIBDIR-python-sys.patch |  6 +--
> >  ...asename-to-replace-CC-for-checking-c.patch | 44 ++++++++---------
> >  ...tutils-prefix-is-inside-staging-area.patch | 10 ++--
> >  .../python3/avoid_warning_about_tkinter.patch | 21 ++++-----
> >  .../python/python3/crosspythonpath.patch      | 22 ++++-----
> >  .../python/python3/makerace.patch             | 10 ++--
> >  ...python3_3.10.6.bb => python3_3.11.0rc2.bb} | 13 ++---
> >  15 files changed, 112 insertions(+), 175 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
> >  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> >  rename meta/recipes-devtools/python/{python3_3.10.6.bb =>
> python3_3.11.0rc2.bb} (97%)
>
> It is good to have this ready but given the timing of the final release
> compared to ours, and the knock on implications of a python version
> change on other layers, I'm likely to hold this until the next release
> unless there is a pressing reason we need it.
>
> Cheers,
>
> Richard
>

--000000000000c3858e05e8e0bfb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is marked RFC for exactly that reason :) the purpose=
 is to allow pre-testing with other layers, and avoid duplication of effort=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 17. Se=
p 2022 at 15.04, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)">On Wed, 2022-09-14 at 14:04 +0200, Alexander Kanavin wrote:=
<br>
&gt; The semaphore fix has landed and is available from 3.11 onwards:<br>
&gt; <a href=3D"https://github.com/python/cpython/commit/1ee0f94d16f150356a=
4b9b0a39d44ba1d2d5b9fc" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/python/cpython/commit/1ee0f94d16f150356a4b9b0a39d44ba1d2d5b9fc</a><br>
&gt; <br>
&gt; 3.11 release schedule: <a href=3D"https://peps.python.org/pep-0664/" r=
el=3D"noreferrer" target=3D"_blank">https://peps.python.org/pep-0664/</a><b=
r>
&gt; <br>
&gt; Drop 0001-Mitigate-the-race-condition-in-testSockName.patch<br>
&gt; as it is merged upstream.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/python3-dir.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 ...ib-termcap-to-linker-flags-to-avoid-.patch |=C2=A0 8 ++--<br>
&gt;=C2=A0 ...-search-system-for-headers-libraries.patch |=C2=A0 6 +--<br>
&gt;=C2=A0 ...-use-prefix-value-from-build-configu.patch | 14 +++---<br>
&gt;=C2=A0 ...e-the-race-condition-in-testSockName.patch | 47 -------------=
------<br>
&gt;=C2=A0 ...sts-due-to-load-variability-on-YP-AB.patch | 18 +++----<br>
&gt;=C2=A0 ...FLAG_REF-always-for-interned-strings.patch | 33 -------------=
<br>
&gt;=C2=A0 ...-detection-of-mips-architecture-for-.patch | 33 ++++++++++---=
<br>
&gt;=C2=A0 ...fig-append-STAGING_LIBDIR-python-sys.patch |=C2=A0 6 +--<br>
&gt;=C2=A0 ...asename-to-replace-CC-for-checking-c.patch | 44 ++++++++-----=
----<br>
&gt;=C2=A0 ...tutils-prefix-is-inside-staging-area.patch | 10 ++--<br>
&gt;=C2=A0 .../python3/avoid_warning_about_tkinter.patch | 21 ++++-----<br>
&gt;=C2=A0 .../python/python3/crosspythonpath.patch=C2=A0 =C2=A0 =C2=A0 | 2=
2 ++++-----<br>
&gt;=C2=A0 .../python/python3/makerace.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 ++--<br>
&gt;=C2=A0 ...<a href=3D"http://python3_3.10.6.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3_3.10.6.bb</a> =3D&gt; <a href=3D"http://python3_3.11.0=
rc2.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.11.0rc2.bb</a>} | 13=
 ++---<br>
&gt;=C2=A0 15 files changed, 112 insertions(+), 175 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3/0001-Mit=
igate-the-race-condition-in-testSockName.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3/0001-Use=
-FLAG_REF-always-for-interned-strings.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3_3=
.10.6.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> =3D&gt=
; <a href=3D"http://python3_3.11.0rc2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3_3.11.0rc2.bb</a>} (97%)<br>
<br>
It is good to have this ready but given the timing of the final release<br>
compared to ours, and the knock on implications of a python version<br>
change on other layers, I&#39;m likely to hold this until the next release<=
br>
unless there is a pressing reason we need it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000c3858e05e8e0bfb2--

