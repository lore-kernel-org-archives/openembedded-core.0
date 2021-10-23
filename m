Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2059CC433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 17:33:44 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.9107.1635010422473695557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 10:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k7TvGCQ1;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id u9so3771178uac.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RefHWSHHqJIFZUiov/ZyfjTFX76GIAzTcgnDLJymAWU=;
        b=k7TvGCQ1jQQ+RXgKCWuGS71o4J8K8vnyO74jPx0sj4VnnfMCcuvCs0oponbmDLJcIq
         gYRzkCzmO+CH9Ws/jPmYSaCuQrb26r20BshKfe4W3c2vdqIoQhpB5AtYiB8pVVLK1+S3
         MbKxaWsmq7WXTmtjWhFazgY8zY9kVcRUA6R0EN/aMLaK8X5TebS7tr3D5rwrl6FNGf0A
         r3Fr359D07tKigzKCUJSjEPwmIVUPUq+9gU7MpbAnK+iGbFgCjG8dC+6vo0GXfiC3Qod
         h43PQRUu2w6UfODmWxT1B++PqCt9H7WQOH8SHu9mfJjU5wRfN80Ts+qwCsKlItYXnvTC
         8Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RefHWSHHqJIFZUiov/ZyfjTFX76GIAzTcgnDLJymAWU=;
        b=2XxGzTKU9seF0DASX4LutHdE4KFwaQSei49PqME6VismGhSROSzviKbGzpMkji13Ch
         5931L/rhgQjrT/Hnp8DPw8qcJ6mSxmzegponQR/ZLDq/DwrsUeENZE0iX7jOo2LSItjZ
         T5hgDrmUsAv950/BiUd0uwNNxYrtU56g3qImfO+VZHTnBEt6PudmEuVeGmGw9Vw39o/t
         /1MTJBabqHRKNhkpqfIM7SN6ExqO9UKpEDDvnPfD5UE5ZBxrDy5q1yo8rr0G5azxuBpP
         xSric3odD8nBQIAfo0Mht/yL1Ql/tV5gKMkM4//Z01sFUU6NP808Ydg/SDLBrdqTmtQz
         oV2A==
X-Gm-Message-State: AOAM533kU8qyZ84uQmRD+Yv/8hFov91W7VBCZ2/3cNMwCMpJWjkHIG9O
	Xg4x7N1QEtJtCXgql3Zu8ZkQm2zfFhs7Zm7uyAA=
X-Google-Smtp-Source: 
 ABdhPJzfeIsatY5Ns1AVQ1Uxxxoe4Y/xKTK/WsJvfIIspmsS17Oa67hNsuUyaPAm5GmBVF5LTjflZrdvVEdCDuv8X2o=
X-Received: by 2002:ab0:30e1:: with SMTP id d1mr4032418uam.22.1635010421483;
 Sat, 23 Oct 2021 10:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-18-alex@linutronix.de>
 <4686739.31r3eYUQgx@linc>
In-Reply-To: <4686739.31r3eYUQgx@linc>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 19:33:29 +0200
Message-ID: 
 <CANNYZj_LwDStdwbCP0NrrgbUQXumck1AqdZA35iAu+OvsRJsaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/65] u-boot: upgrade 2021.07 -> 2021.10
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: Jon Mason <jon.mason@arm.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000606d0505cf0887cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 17:33:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157303

--000000000000606d0505cf0887cb
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Oct 2021 at 03:14, Paul Eggleton <bluelightning@bluelightning.org>
wrote:

> Not sure what the official protocol for this kind of thing is, but
> meta-arm will
> naturally need an update for this (as seen via autobuilder warnings).
>

Yes, I think it's usually done after the fact though.

Alex

--000000000000606d0505cf0887cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 21 Oct 2021 at 03:14, Paul Eggleton &lt;<a href=3D"mailto:bl=
uelightning@bluelightning.org">bluelightning@bluelightning.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Not sure what=
 the official protocol for this kind of thing is, but meta-arm will <br>
naturally need an update for this (as seen via autobuilder warnings).<br></=
blockquote><div><br></div><div>Yes, I think it&#39;s usually done after the=
 fact though.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000606d0505cf0887cb--

