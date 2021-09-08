Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web12.10533.1631102746184830015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 05:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YcK+/Ns9;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id s126so669697vkd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6ollksr8K5V2re1n+d05m8lQpptA/RNjgOV0A4dOdU=;
        b=YcK+/Ns9ip/94IxxllJVmdcHkV6h4E4Fyd9sND+iZDIxQKwgTBW3zytS3ehy2um+58
         g+EEDaFJEqLntcHYPR8KVgjbtI1orGh+778fok/RH53sfgoHnESpbUJbyRjrc95ayWDj
         yF/fnipjIG56mavt+oXp8D88oW4t6n1EyjXVqHeQ5jWwdA190Zd4uYVXKCiphA0+jGjh
         y2RAiBHvOimrhZUi1VPLS5zGvKEGJYhDQp9qNFXGziZ4DVSW+TReT5Qy2+2lVq0EYY6w
         HGdA+IfJEUEq8Jf93N7bH5XUn/rKgNESwLMJHpPVg8UnUfGVJGpecsdfKNU19eSMS+rg
         FXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6ollksr8K5V2re1n+d05m8lQpptA/RNjgOV0A4dOdU=;
        b=rwN+th/3RGw8x1XuaFW0XBtHc36Xss0AE+FjuQIxzIhdOFyJ+RPCnHD3sCEmQqQPvy
         hCGOgU8e0J870O2Cb/yzH3mdau9sRcV2Wtn/C1NO20oH+oyx7OW8iCehBe+cbUuDhqFa
         LVXsFLYFsGYagIcd+l0p4TUn4S8BS6dLszlYpfN/XgGLSufdqArRybhMYWF2px8Z3pQD
         e8yTir2cPEAQN60i0GALX1krn/PlMyGkPfnNqEoaTOHhd99kFSIUbszcYxL8saoSHId+
         y+xS8pY4ynFGjBI1cb2oN6oCKpnLhUdmwv2eXWaDJmtrNa+pXdZ2zxn4GASlLBwyjRbw
         /BoQ==
X-Gm-Message-State: AOAM5335lndr2smcfTMCU3alZtrR/Q4nRVK0BhEfg+Q3ddphe6OUHhk7
	F9CnQ2DF7i4Oe9NdVUv2L5XUn0PEi5U2HZHqZSpcpjI0
X-Google-Smtp-Source: ABdhPJwM/wfrDNWao/319EF7V47G2kDM1gbnmVDsck8O9ZSQ5z6SV/tAN3ABxcFi5iwD11VWCY9Vtf48ARo95ElEGKU=
X-Received: by 2002:a1f:608e:: with SMTP id u136mr1580913vkb.15.1631102745198;
 Wed, 08 Sep 2021 05:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
 <20210830184800.954770-7-alex.kanavin@gmail.com> <YTie/qN+H1Yo4qjp@piout.net>
In-Reply-To: <YTie/qN+H1Yo4qjp@piout.net>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 8 Sep 2021 14:05:34 +0200
Message-ID: <CANNYZj9BCohUTvCt0GJs-VLtih47xi4k=ptVrSYjV2Z9abJLdQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 7/7] package_rpm: use zstd instead of xz
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8452105cb7ab319"

--000000000000b8452105cb7ab319
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Sept 2021 at 13:31, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 30/08/2021 20:48:00+0200, Alexander Kanavin wrote:
> > zstd has similar time and space performance in compression but is
> > vastly faster in decompression, which benefits rootfs creation
> > (especially when installing very large packages) and on-target
> > package installation.
> >
>
> I believe this caused the following repo failures:
>
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210907-bv62etev/packages/diff-html/
>
> I started a subsequent build without the patch and it have the issue.
>

Can you provide the link to the build itself please?

Alex

--000000000000b8452105cb7ab319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 8 Sept 2021 at 13:31, Alexandre Belloni &lt;<a href=3D"mailt=
o:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 30/08/2021=
 20:48:00+0200, Alexander Kanavin wrote:<br>
&gt; zstd has similar time and space performance in compression but is<br>
&gt; vastly faster in decompression, which benefits rootfs creation<br>
&gt; (especially when installing very large packages) and on-target<br>
&gt; package installation.<br>
&gt; <br>
<br>
I believe this caused the following repo failures:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2021=
0907-bv62etev/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210907-bv62etev/=
packages/diff-html/</a><br>
<br>
I started a subsequent build without the patch and it have the issue.<br></=
blockquote><div><br></div><div>Can you provide the link to the build itself=
 please?</div><div><br></div><div>Alex<br></div></div></div>

--000000000000b8452105cb7ab319--
