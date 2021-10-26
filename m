Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4140EC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 21:35:17 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.3147.1635284115690328087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 14:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WtzPllQ9;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id t127so381509vke.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 14:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCCjrAw4EESvAzMl01k/Wmi9RPViFHSdxQy5n+Ib0zU=;
        b=WtzPllQ9zGLOVix7opGKgkkOlkPHeFcvOwVJsR4sj4fmH3fiyWGriK8t8uzsgdd2cI
         oiq2b4x3T6l9Q4KCX0GZsGiZbla97zbGanFcYyTab0E0vnP+8rxRou5Pi/zSfYWJ77os
         GCv+8PyJxwxug/MYS+FasMggfAKySikUeMKojn3kClbzHFxCGxp+bbR6kpljaZnvvM76
         q4VKCiqr9+5wEPpRdjHfDPz+QKdul9wnDSV5GIB9kgDoIB95a/4oh/Eo/8ZIJ8Lgv5/7
         1tSJYVoBv7z0VTzvs7rSExr5hphnx3MzVvlIbJOTr34KMZlGJIfKndXtts3IxulFQFzN
         yQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCCjrAw4EESvAzMl01k/Wmi9RPViFHSdxQy5n+Ib0zU=;
        b=6ZJln/n52joxwXu7QPz04UqFRzdxjsnzNiyPi0PGzVBOxYUrzLaHwQBBkK9mIF7dVH
         cS1Op9+s4ymZ53fpDVTekLoUN+xoKKfcMa1ezL1BRROAAsdIsAL7vaPy9jePkx5f4sxv
         z8u+2Tbe0ZvgKxkHS0xREWH+PClgFViRu4ejP6nwyyItdb2Yeo2lu+zNULz0PZ/iGL/E
         3aeZWvxQ3dwimcZghKDgIrTFVPAFuHMBT+KP878jK7qevG7U17TCdCsS8JQ/S0QSlnRr
         +yBFToiR6pKl/UQ3tDDNm8vgttOsMavjS6vtEQJCG47Wm7j9Td7BFbPJx2KawP2m9LkR
         btFg==
X-Gm-Message-State: AOAM530VCzPuQB+v+e5KX8Nfn/TVekvono0/82shppSaNmWKpH8RfVtA
	JjQV9PFXO05uykgRsXjzPM+t6f/fYvmOzitwkgA=
X-Google-Smtp-Source: 
 ABdhPJwvKpvTKP1zGdDEOvaUkZ5QsBLJkJeopwYOSOqr3BShUDkVwm0I1QY155M4jN5yJ/5Z9BpQhpk8FdZhVZlICxs=
X-Received: by 2002:a05:6122:1811:: with SMTP id
 ay17mr1421781vkb.24.1635284114919;
 Tue, 26 Oct 2021 14:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
 <CANNYZj8NPhV_b9QapAG=SYqhy60Z6cRxqE76Cpxs=qpjQ0F=7g@mail.gmail.com>
 <CA+chaQc13DNKNTFUc4u1EBvOs3ejtNaFiggEVL7rqtfXymq-Bw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQc13DNKNTFUc4u1EBvOs3ejtNaFiggEVL7rqtfXymq-Bw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 23:35:03 +0200
Message-ID: 
 <CANNYZj9HxF_wLCVECqbfoM-X1uTeN4E=d4=gDkRyz46dV4Di3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c6d44b05cf48401a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 21:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157454

--000000000000c6d44b05cf48401a
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Oct 2021 at 22:40, Martin Jansa <martin.jansa@gmail.com> wrote:

>
> No, this one was with opengl enabled, which was failing in do_configure do
> to missing gperf-native, but now when that was fixed it fails in do_compile.
>
> Build without opengl still works with works with my patch.
>

I can no longer see the issue the patch was supposed to be fixing :-/ Maybe
I had a broken build tree at some point. The patch can probably be dropped,
but I need to run it on the AB to be sure.

What does 'bitbake-getvar -r webkitgtk PACKAGECONFIG' say on your side? I
wonder what combination of options triggers your issue.

Alex

--000000000000c6d44b05cf48401a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 26 Oct 2021 at 22:40, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><br><div>No, this one was with opengl enabled, which was failin=
g in do_configure do to missing gperf-native, but now when that was fixed i=
t fails in do_compile.</div><div><br></div><div>Build without opengl still =
works with works with my patch.</div></div></div></blockquote><div><br></di=
v><div>I can no longer see the issue the patch was supposed to be fixing :-=
/ Maybe I had a broken build tree at some point. The patch can probably be =
dropped, but I need to run it on the AB to be sure.<br></div><div><br></div=
><div>What does &#39;bitbake-getvar -r webkitgtk PACKAGECONFIG&#39; say on =
your side? I wonder what combination of options triggers your issue.</div><=
div><br></div><div>Alex<br></div></div></div>

--000000000000c6d44b05cf48401a--

