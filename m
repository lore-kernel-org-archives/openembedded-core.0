Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B63C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 06:58:18 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.73124.1638255491388254380
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 22:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ln5w9CdP;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id f7so12890708vkf.10
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45TyA1aM264RmrO7a9o35R1aHBOfI9DdiYMLP/3vuGs=;
        b=Ln5w9CdPkMRuq28f0QgHZZWDih7frIa24+qme33jDFfBLPE2dBCYGIhHOT9xry6WJ3
         +/juzxlma6g3bCqCoAJIz2dokgSnh8luL3MFPOVKH65wIdh9AMK85flizTKnPmzym9LW
         gAirTXNmdeVgCBxqNJVXaw1Ug9onwgIn0ggV9RZHpZH6nSXHabQ4BiNR2A+/ln1Ci6Mw
         HLpYaXgVY7gHL7opxYBs+eMHEM0guDetzTqvKDssRuR1uWHHH+Xkm383c6Xmbsuok6ro
         c65jeNVc4rdx4yV2jWlfs2tLvbiRTidEGJxyI1Biq6KeCqe7D1ij38qFwCMpfS/XY36C
         lowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45TyA1aM264RmrO7a9o35R1aHBOfI9DdiYMLP/3vuGs=;
        b=swizNGW5X5XatdX95YXYtqIlCBahHwa3AR7LoQrAuilwYcsOoRRSHjCw+E7klEytrN
         EbGYe7y57ml4QJmlPowLVbyXEWupvowLTq/HKkCohZvQr6hkB6+Ukizcvt7vTDHpxuLG
         6BB9eLmteF9AgelJRLTT6+HzDcXn653lnrNyJI5+TEcmzaGOc4jNOorbODH4ZauGumxl
         yUj5ZdCfMU9uITjWBHNaVxFpRioerYaS3yXBL2TP4OEn6joJofhnTcznm5M6SgM6d83b
         aXMoK707qfJPRTjR/mY8EPTh/T5yMTDFW4fv19z4H9jJVVd+xjtkpGlh/xMggqJgqkhF
         3XAg==
X-Gm-Message-State: AOAM533R09bNIRx+Sm3hqciotkAeCxTcdJ6me0ZG2UHCi5k/ottS+g8u
	omNdaDQMMgfmLCueRuOp/bd+yHSpLCyC6UFQzLnV3cm3/Ds=
X-Google-Smtp-Source: 
 ABdhPJwBpQCnUHDG+Sfj2aCGPRfcF7AvddnloJgpL0bYhslVVnUs8J0dmmcev35TJSyBPeyTYPQj6bswZAL81TaVYYE=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr43658436vkd.4.1638255490594;
 Mon, 29 Nov 2021 22:58:10 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJ-kkhBuRMLGzV6ks9msbaR7+9KGr2H6VNVL0wb41+sjA@mail.gmail.com>
In-Reply-To: 
 <CABKMkPJ-kkhBuRMLGzV6ks9msbaR7+9KGr2H6VNVL0wb41+sjA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Nov 2021 07:57:59 +0100
Message-ID: 
 <CANNYZj-=BWTJTBhpH-pF0baRxkzCmv8OXggsG=1cXep9Di3oLg@mail.gmail.com>
Subject: Re: vulkan-loader
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000917b8a05d1fc144b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 06:58:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158970

--000000000000917b8a05d1fc144b
Content-Type: text/plain; charset="UTF-8"

Can you show what vulkan.pc contains please, and why is that a problem?

Alex

On Tue, 30 Nov 2021 at 00:51, Joel Winarske <joel.winarske@gmail.com> wrote:

> I discovered an upstream problem with vulkan-loader today.
>
> Effectively since 1.2.162 vulkan.pc is broken for cross compilation
> scenarios.
>
> This example illustrates current problem with vulkan.pc installed by
> vulkan-loader:
>
> $ pkg-config --print-errors --define-variable=prefix=/opt --variable=includedir vulkan
> /usr/include
>
> It should return /opt/usr/include
> So doing this in a meson project does not produce the expected result:
>
> vulkan_hpp = join_paths([
>     vulkan_dep.get_pkgconfig_variable('includedir', define_variable: ['prefix', get_option('prefix')])
>     'vulkan',
>     'vulkan.hpp'
>     ])
>
>
> What is the suggested approach to address this?  A patch for each branch
> up to master?
>
> Joel
>
>

--000000000000917b8a05d1fc144b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you show what vulkan.pc contains please, and why =
is that a problem?<br></div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 No=
v 2021 at 00:51, Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.co=
m">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div>I discovered an upstream pr=
oblem with vulkan-loader today.</div><div><br></div><div>Effectively since =
1.2.162 vulkan.pc is broken for cross compilation scenarios.</div><div><br>=
</div><div>This example illustrates current problem with vulkan.pc installe=
d by vulkan-loader:<br></div><div><div><pre><code>$ pkg-config --print-erro=
rs --define-variable=3Dprefix=3D/opt --variable=3Dincludedir vulkan
/usr/include
</code></pre></div>
<p>It should return /opt/usr/include</p></div><div>So doing this in a meson=
 project does not produce the expected result:</div><div><pre><code>vulkan_=
hpp =3D join_paths([
    vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;, define_variable=
: [&#39;prefix&#39;, get_option(&#39;prefix&#39;)])
    &#39;vulkan&#39;,
    &#39;vulkan.hpp&#39;
    ])<br></code></pre></div><div><br></div><div>What is the suggested appr=
oach to address this?=C2=A0 A patch for each branch up to master?</div><div=
><br></div><div>Joel</div><br></div>
</blockquote></div>

--000000000000917b8a05d1fc144b--

