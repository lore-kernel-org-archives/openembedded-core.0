Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5328CC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 19:38:36 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.1528.1637005115230890039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P1o1Eb1f;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id y5so19347069ual.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 11:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xhboWRuASeLQLCdZravpJHJSH1EP+FqqeiEj5wTyil8=;
        b=P1o1Eb1fYZMRTUqIi+K69UapqyklWRsM6hmvrUgYllaxOZOMGqHRBCp5LjzxebvSYJ
         lS1AVZFo9yr99grIW+fvasw1QBO3hv79pvcDO2EQ+yGIvMcTlr5iuT1CeomR6Tzx7sLO
         LqWXlsO3wBPLY+i/TAmwWD4dWs5cyDD5Tg5K4ltnPPD927nFgs5K4Gni+Q4PomoSwN3M
         Gv6klXMz4zolw3Lj/y+iAPAX091wZXXz6RsSpyKbxYBoJgNNifC+n+UMoZT8p04yBst8
         178bHNjY/TCCg/XNJ7WRGsdBtLL7/AKkImn92GFulRjLR4jumofsvIBgCAoW+YnEWQCb
         4Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xhboWRuASeLQLCdZravpJHJSH1EP+FqqeiEj5wTyil8=;
        b=u1os4UzsoaepaIBw9KKp+dOiH68l/ifJ1o/D58Xv6eRZxCSbdepo4WyZsZErGjmcP9
         uKDhjIvMUj8J2SRE1GLO8UgbQlsGG7slquwSm/1/tV2LT/INkIExbSLZnxPKvASJB6nu
         g3X5pKL6J2SZbwMIKaNBUqHpBR8P1aJpuVXTsyV9XjPU7qmB8jpxA7gygPFsIOo3tI+p
         pWbANn9fZPBR5yH3G5epnFX5e0obIHXjYiQm6YJ6CO4QyiOezCIQY5aV5PLbXjkoH2E5
         UqTHhcyvfI+wGVcZieP42nw12QlC+Rak/OzIlnZIkgEeN56FuN4wG4myiHtBhu0QMbhf
         QVog==
X-Gm-Message-State: AOAM531wOy3Wfm1T+Fmp1DIjt5oy0tufyKbyOfSqg3PuvGWi1ZEKRBNQ
	REVePnTJu7OZiYpFxKTy2hUiXxg3TlNdDuo2HGk=
X-Google-Smtp-Source: 
 ABdhPJyrfWkazQ5K6Vfl3Y/NMNeBJ8jtOGNbxuthkBSE2TFOGCVWIFHlSlwDmPmkGBzHVj3W1FO+dIslR4iTf8OZGyw=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr47570981vsh.13.1637005114383;
 Mon, 15 Nov 2021 11:38:34 -0800 (PST)
MIME-Version: 1.0
References: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
In-Reply-To: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Nov 2021 20:38:23 +0100
Message-ID: 
 <CANNYZj-xeJS_+3r-Lwg=Nzyr+KrtFA8hCpGj-DeDpaihzB_TQg@mail.gmail.com>
Subject: Re: [OE-core] Suggestion to use python-parameterized for QA
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000056a1ad05d0d8f4d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 19:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158310

--00000000000056a1ad05d0d8f4d3
Content-Type: text/plain; charset="UTF-8"

It would be helpful to provide an example of improvements that can be
enabled with it.

Alex

On Mon, 15 Nov 2021 at 20:34, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> Hi guys,
> I have a suggestion to add https://pypi.org/project/parameterized/ as a
> required package for QA selftests. Together with python unittest module
> it can be useful to increase code coverage and reduce duplication in
> case you want to do the same test with different input values.
>
> Anything speaks against it?
>
> Cheers,
> Vyacheslav
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158309):
> https://lists.openembedded.org/g/openembedded-core/message/158309
> Mute This Topic: https://lists.openembedded.org/mt/87078063/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000056a1ad05d0d8f4d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It would be helpful to provide an example of improvem=
ents that can be enabled with it.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 15 Nov 2021 at 20:34, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mai=
l@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi guys,<br>
I have a suggestion to add <a href=3D"https://pypi.org/project/parameterize=
d/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/parameter=
ized/</a> as a <br>
required package for QA selftests. Together with python unittest module <br=
>
it can be useful to increase code coverage and reduce duplication in <br>
case you want to do the same test with different input values.<br>
<br>
Anything speaks against it?<br>
<br>
Cheers,<br>
Vyacheslav<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158309): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158309" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158309</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87078063/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87078063/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000056a1ad05d0d8f4d3--

