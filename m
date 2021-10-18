Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D509CC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:37:18 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.37777.1634567838352313553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Se3cQXVR;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so115731pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhCT6RjPdpua7d48b7AebC156tT8uKjUOQL888KCs3g=;
        b=Se3cQXVRZ9HzIHJpzXyvcOrEHyrGLLGjABJX1Sb2l4MU7fQAXf8Zv36DLAZ5PEpYyB
         KmblwM3sMoAuAA9ML9n7u53mp80CiDkGPqEJLSXEdr7OV9WBBxn/q05+Ssaco33EPMXG
         ORGDJlCfD+v4bEYX7LQ4YrWaAJwMwuNAYwb/UXd06L6voWDP9/41qMlflGc7aCgIFgTH
         LkbKJTZZLZNYtcIyvBq2r7J3BQT8s69lwxBNAkSwS5k9wz1p5W2xe2P9fSgfDEurLVIh
         6BptRD90WnTjnmyAYFimH1U7jnGTsw2zS0dtcWuTvmB20HOfufdx18Xp+9Y67542lReN
         u8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhCT6RjPdpua7d48b7AebC156tT8uKjUOQL888KCs3g=;
        b=hA3orRDLu5i7FjioXUQrFRHlpo8oul0PNGoEwMQjlVWSYMhzK3r6xf+S/ABoT2KvUW
         r1mXJggiIwwW648tbobQT56rOl6hWzv3t6B/xbLNttKQnj7bUbaHiPNzFAOSy/K1iist
         VFbvBuGFKvvf2gxdvJBf7MfTJkMT19IST7vNxkYVfdTakzIMc6CD+lb4SS8XfHf/nNQ8
         Ho1NodLXUQ9qQ/jRhFH8S3ax3diQKKTJnV/U3jOnYkgxGOhECECSxniQ4YEdSfZYB0Fp
         a6eagwZGhnbqgJr5olvJ1FCox5XJQI0pEFLKpmY4Metq1Gfr51ShxbXesZJKt4WiGDtA
         EtGg==
X-Gm-Message-State: AOAM531ZS04HR5diWfiJ8fUQnMpDvlt2UWzf6DO1FCD2Q2jkZaUpNltt
	Vs2wI5T6K4D05RM9p4QA4glKZCpptUAKQWqEix4=
X-Google-Smtp-Source: 
 ABdhPJx3GU97QzyLJnvh+klT94saE3U/BA/LINVz0mhs0XCTWiHWqbdITZfIZLv3TB33Gj/6dGe3pFcuVAN5dVWMdwQ=
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr33630038pjb.35.1634567837804;
 Mon, 18 Oct 2021 07:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
 <16AF25A15C500BAB.24927@lists.openembedded.org>
 <CANNYZj_md-5xjssO5icG2fKP1KPVf9axD9nW7Ji-S+hKrstkOA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_md-5xjssO5icG2fKP1KPVf9axD9nW7Ji-S+hKrstkOA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:37:07 +0200
Message-ID: 
 <CA+chaQcF51RFCBU+_km3h4J4BRp+=_+FPxya=ctUyMDCp=cP6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000556f8205cea17bfc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:37:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157072

--000000000000556f8205cea17bfc
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 4:20 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> ... especially if you don't actually have a use case for this, and wrote
> the patch just to keep your private CI happy.
>

yeah, my private CI testing _the default oe-core setup_. But I can stop
doing that, if it's not welcome, there are better things in life than
spending time on patches to be deleted.

--000000000000556f8205cea17bfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 4:20 PM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>... es=
pecially if you don&#39;t actually have a use case for this, and wrote the =
patch just to keep your private CI happy.</div></div></blockquote><div><br>=
</div><div>yeah, my private CI testing _the default oe-core setup_. But I c=
an stop doing that, if it&#39;s not welcome, there are better things in lif=
e than spending time on patches to be deleted.</div></div></div>

--000000000000556f8205cea17bfc--

