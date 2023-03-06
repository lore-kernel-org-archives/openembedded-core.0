Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1506C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 20:22:09 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.172.1678134119656330059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 12:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BkpEYRt6;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ernstp@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id r23-20020a05683001d700b00690eb18529fso6050083ota.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 12:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678134119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ3Mx5oVRiJJijcdbusT8gDOVM8EBqgkBsbjpf/xooM=;
        b=BkpEYRt61IOcQTOiRYdYUR7ElKlLFMH0ZG+bacd8Zqpp4HmOKwiJR4+WpSLMy8Z9X9
         MduE+F3N7qXVGzFcF3lakJkyGSH9C2+CUEWVkiKhpPkN7JOjA+g6RG8D9i/F2RO6cdY/
         ZqRBkWXQSbzH4Q0yUQM/JM856dJcW+nKm54peRHBvxiD4Uh1Fq+s3HE7ypfNPfNN2LbG
         PvimsdLHqg3sqEaM+xzOvhFEA02g5rwLBca8us1EIcI+qyafaMrG/l5/XSo5DolqIPh2
         dhOkxWF01sIge9x0QYYsHeRv8HAZHkmG2bqptyg9WPSiXG4muMrhId5ZfR1bgR1ZumUe
         g1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678134119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJ3Mx5oVRiJJijcdbusT8gDOVM8EBqgkBsbjpf/xooM=;
        b=GcVHOdNIxkcZG3GI5fQiXmsOgR8ySh0iYS1zElr8gTgOPT8ueBFN3rL+Op7shIQ9zB
         8KHDPOkXfipW3PmrH1GMmTZAvf8WAvJekBSwuaBKDbJBwUwQkzRi+2Ncz8LT8bNjFfmK
         rDvCbQm74y2nF5JZn6hx2nR/CL6fzK24/YdQC1ACrHcNqSY5fCCKwPAbQhVF93wfygXj
         PZYqVFOqXl3aiyLCfs2hFxHOtchUZRyVXCKsOSex94xSUsS7RMEkXiClBQNPxiY6+ORd
         SeTTkVVjO9ovhpNudfjBWM+QizPzU+RYiU6+w51uZhy9Tmdfv71o+7UEqk0DYrdDDRJu
         unlg==
X-Gm-Message-State: AO0yUKUqPdB9Zvc+y2kAxktrRZMWeVD/LBA9hb6NonhCEZMROvssh3Tt
	rnf2MwH78YiOLHfV4esRW3pYch3jI1qFmPZPJaA=
X-Google-Smtp-Source: AK7set/6tPG1ZLyes1CWL/tksY2q3UgByFQLVoY3H6mrLCPUndpbXayHtX0da/lUkTlogjDW1unKkfCsTmWlarls4Fc=
X-Received: by 2002:a9d:7156:0:b0:693:d403:4967 with SMTP id
 y22-20020a9d7156000000b00693d4034967mr4072530otj.4.1678134118794; Mon, 06 Mar
 2023 12:21:58 -0800 (PST)
MIME-Version: 1.0
References: <CAD=4a=Xi3cEf9KM-iB3nsLPEEJGupxVJZrMQ7qP9c7aSb3bJQQ@mail.gmail.com>
 <DDD6EA4D-08CA-473B-B291-ECBB71686B92@arm.com>
In-Reply-To: <DDD6EA4D-08CA-473B-B291-ECBB71686B92@arm.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Mon, 6 Mar 2023 21:21:47 +0100
Message-ID: <CAD=4a=WecpyaoA_9xmKMTzzXGZQcdUrNsRiPHoyjukJfTw-E+Q@mail.gmail.com>
Subject: Re: [OE-core] PEP 517 and PEP 621 support on Dunfell?
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000949ce05f6410c04"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 20:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178084

--0000000000000949ce05f6410c04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh I didn't see your reply, Gmail threw it in the spam folder.

I made a prototype here if anyone's interested:
https://github.com/ernstp/meta-setuptools-backport

//E

Den tis 28 feb. 2023 kl 17:14 skrev Ross Burton <Ross.Burton@arm.com>:

> On 28 Feb 2023, at 15:00, Ernst Sj=C3=B6strand via lists.openembedded.org
> <ernstp=3Dgmail.com@lists.openembedded.org> wrote:
> > more and more Python projects are removing their setup.py and setup.cfg
> and switching to pyproject.toml. That unfortunately means you can't insta=
ll
> those packages on Yocto Dunfell.
> >
> > Would it be reasonable to backport support for this to Dunfell? I see
> that the changes done for this support was actually kindof big, and as
> usual updating setuptools will probably cause some old package version to
> fail to install instead.
>
> The changes were kind of big, and I do worry that they=E2=80=99d break st=
uff that
> is expected to work.
>
> A =E2=80=9Cmixin=E2=80=9D layer which just contains the new classes and r=
ecipes would be a
> much better approach for Dunfell.
>
> Ross

--0000000000000949ce05f6410c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Oh I didn&#39;t see your reply, Gmail threw it in the s=
pam folder.</div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif">I made a prototype here if anyone&#39;s in=
terested: <a href=3D"https://github.com/ernstp/meta-setuptools-backport">ht=
tps://github.com/ernstp/meta-setuptools-backport</a></div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">/=
/E<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Den tis 28 feb. 2023 kl 17:14 skrev Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 28 Feb 2023, at 15:00, Ernst Sj=
=C3=B6strand via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a> &lt;ernstp=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.ope=
nembedded.org</a>&gt; wrote:<br>
&gt; more and more Python projects are removing their setup.py and setup.cf=
g and switching to pyproject.toml. That unfortunately means you can&#39;t i=
nstall those packages on Yocto Dunfell.<br>
&gt; <br>
&gt; Would it be reasonable to backport support for this to Dunfell? I see =
that the changes done for this support was actually kindof big, and as usua=
l updating setuptools will probably cause some old package version to fail =
to install instead.<br>
<br>
The changes were kind of big, and I do worry that they=E2=80=99d break stuf=
f that is expected to work.<br>
<br>
A =E2=80=9Cmixin=E2=80=9D layer which just contains the new classes and rec=
ipes would be a much better approach for Dunfell.<br>
<br>
Ross</blockquote></div>

--0000000000000949ce05f6410c04--

