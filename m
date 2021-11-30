Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896B2C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 14:11:10 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.77158.1638281469856462605
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 06:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ETnGMXvw;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id l24so41713860uak.2
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 06:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FuWu+z1K3VZoaQViqXrlLTLkBnv7pfNFfiEnDUncqOk=;
        b=ETnGMXvwgbd7pBU6TjYzypNMOXWi4XTjCGkLAnbkInKkFER2GloSVyQOmG3WfyE+0C
         6N4eXSTI8Xft7Ix2S3/3eO9lUvEm9+BPZ1k/QKJg/BTkSOfAzxb7L+3yuHuU81A7g6I0
         Tv32flO5txzt+cxgywXXNrsZWcCYtB9iCESd+wmDPA4SdzRm0J7lSjo+Cwj47EEwOJhk
         vfHVHNwG9cVyYxCh55QBPdJEem1a2BbaesMptdcvIFsITOWu+zTnbqfJjjgnqAO5qNZp
         +AiEceAU97YoBwVd82SZ23/aMfixIF0jGZHGP+kbb6YhJbUkbHw2NLsrAYRpyLkGngJY
         pFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FuWu+z1K3VZoaQViqXrlLTLkBnv7pfNFfiEnDUncqOk=;
        b=wchtTpfYnrM6NEcHDSTXwLxS5EGWGj2qk0gJdtnyxsqHnOFSfT2kx2sD30BazNTFtY
         TNwtTQQ3XlqqyKTvDefrHXFLQlhq9I6JjLQE6TnaOY46C60oP5PT/+tvRjiN8a2emlEA
         kANKSVb6Nyp8zfuRCcUp5RJodPQjbxqEu6P0CaTKmtk+TH92sQNX96H/9RdupUUe/38h
         dFLV/u7KsPEWZqOe3nCrXxbNDsNoTGZuZ7pdA8BOY7311xshSColsvhk1Mr8/h91exJY
         U3EqSKLS6luneSjoZeriifUdWzMA7KxzZTKD1Y/0+Qe4TibsVHqoQXOfdqK4MIkAkbmG
         WlJA==
X-Gm-Message-State: AOAM5304LeLtviv0yHhO0ljCBIRYTi97gatNmzB0w9vq5pAANWVbXkDy
	gHVclgJGUsWnqxqRG9ThgsOZBdAlACO91FxfuD8=
X-Google-Smtp-Source: 
 ABdhPJxj7uignEo5CCcOXfdFwnjX3faaeHKaAOBAGZz+EUFqxK7rFlEc9dDqnpZF6CxLIMNjrIFCbuG9jcRbyX6SAyo=
X-Received: by 2002:a67:cb92:: with SMTP id h18mr40048220vsl.7.1638281468585;
 Tue, 30 Nov 2021 06:11:08 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJ-kkhBuRMLGzV6ks9msbaR7+9KGr2H6VNVL0wb41+sjA@mail.gmail.com>
 <CANNYZj-=BWTJTBhpH-pF0baRxkzCmv8OXggsG=1cXep9Di3oLg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-=BWTJTBhpH-pF0baRxkzCmv8OXggsG=1cXep9Di3oLg@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 06:10:57 -0800
Message-ID: 
 <CABKMkPK+9jb-fFzU5z0BLUT+PWL604DKtLWL7=iD6yrDvHUOtA@mail.gmail.com>
Subject: Re: vulkan-loader
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fa2ac705d202202e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 14:11:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158974

--000000000000fa2ac705d202202e
Content-Type: text/plain; charset="UTF-8"

https://github.com/KhronosGroup/Vulkan-Loader/commit/3c1ad4b0d54875ff0899b77a92aeda53ca236f27

Before:
$ pkg-config --print-errors --define-variable=prefix=/opt
--variable=includedir vulkan
/usr/include

After:
$ pkg-config --print-errors --define-variable=prefix=/opt
--variable=includedir vulkan
/opt/usr/include

This is important as meson does not expose
PKG_CONFIG_SYSROOT_DIR to pkg-config.

With change this meson snippet now finds absolute path correctly:

vulkan_dep = dependency('vulkan')
vulkan_hpp = join_paths([
    vulkan_dep.get_pkgconfig_variable('includedir', define_variable:
['prefix', get_option('prefix')]),
    'vulkan',
    'vulkan.hpp'
    ])

Another work around for meson's current limitation would be to implement a
pkg-config wrapper that exposes PKG_CONFIG variables, and point to it in
meson.bbclass/meson.cross.

Regardless the bad vulkan.pc is now fixed.


Joel


On Mon, Nov 29, 2021, 10:58 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Can you show what vulkan.pc contains please, and why is that a problem?
>
> Alex
>
> On Tue, 30 Nov 2021 at 00:51, Joel Winarske <joel.winarske@gmail.com>
> wrote:
>
>> I discovered an upstream problem with vulkan-loader today.
>>
>> Effectively since 1.2.162 vulkan.pc is broken for cross compilation
>> scenarios.
>>
>> This example illustrates current problem with vulkan.pc installed by
>> vulkan-loader:
>>
>> $ pkg-config --print-errors --define-variable=prefix=/opt --variable=includedir vulkan
>> /usr/include
>>
>> It should return /opt/usr/include
>> So doing this in a meson project does not produce the expected result:
>>
>> vulkan_hpp = join_paths([
>>     vulkan_dep.get_pkgconfig_variable('includedir', define_variable: ['prefix', get_option('prefix')])
>>     'vulkan',
>>     'vulkan.hpp'
>>     ])
>>
>>
>> What is the suggested approach to address this?  A patch for each branch
>> up to master?
>>
>> Joel
>>
>>

--000000000000fa2ac705d202202e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><a href=3D"https://github.com/KhronosGr=
oup/Vulkan-Loader/commit/3c1ad4b0d54875ff0899b77a92aeda53ca236f27">https://=
github.com/KhronosGroup/Vulkan-Loader/commit/3c1ad4b0d54875ff0899b77a92aeda=
53ca236f27</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Befor=
e:</div><div dir=3D"auto">$ pkg-config --print-errors --define-variable=3Dp=
refix=3D/opt --variable=3Dincludedir vulkan<br></div><div dir=3D"auto">/usr=
/include</div><div dir=3D"auto"><br></div><div dir=3D"auto">After:</div><di=
v dir=3D"auto"><div dir=3D"auto">$ pkg-config --print-errors --define-varia=
ble=3Dprefix=3D/opt --variable=3Dincludedir vulkan</div><div dir=3D"auto">/=
opt/usr/include</div><div dir=3D"auto"><br></div><div dir=3D"auto">This is =
important as meson does not expose</div><div dir=3D"auto"><span style=3D"ba=
ckground-color:rgb(22,27,34);color:rgb(240,246,252);font-family:-apple-syst=
em,blinkmacsystemfont,&quot;segoe ui&quot;,helvetica,arial,sans-serif,&quot=
;apple color emoji&quot;,&quot;segoe ui emoji&quot;;font-size:14px">PKG_CON=
FIG_SYSROOT_DIR to pkg-config.</span></div><div dir=3D"auto"><span style=3D=
"background-color:rgb(22,27,34);color:rgb(240,246,252);font-family:-apple-s=
ystem,blinkmacsystemfont,&quot;segoe ui&quot;,helvetica,arial,sans-serif,&q=
uot;apple color emoji&quot;,&quot;segoe ui emoji&quot;;font-size:14px"><br>=
</span></div><div dir=3D"auto"><span style=3D"background-color:rgb(22,27,34=
)">With change this meson snippet now finds absolute path correctly:</span>=
</div><div dir=3D"auto"><pre style=3D"font-family:ui-monospace,sfmono-regul=
ar,&quot;sf mono&quot;,menlo,consolas,&quot;liberation mono&quot;,monospace=
;font-size:11.9px;margin-top:0px;margin-bottom:16px;padding:16px;line-heigh=
t:1.45;border-radius:6px;color:rgb(240,246,252)"><code style=3D"font-family=
:ui-monospace,sfmono-regular,&quot;sf mono&quot;,menlo,consolas,&quot;liber=
ation mono&quot;,monospace;padding:0px;margin:0px;background-image:initial;=
background-position:initial;background-size:initial;background-repeat:initi=
al;background-origin:initial;background-clip:initial;border-radius:6px;bord=
er:0px;display:inline;line-height:inherit">vulkan_dep =3D dependency(&#39;v=
ulkan&#39;)
vulkan_hpp =3D join_paths([
    vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;, define_variable=
: [&#39;prefix&#39;, get_option(&#39;prefix&#39;)]),
    &#39;vulkan&#39;,
    &#39;vulkan.hpp&#39;
    ])</code></pre></div><div dir=3D"auto"><span style=3D"background-color:=
rgb(22,27,34)">Another work around for meson&#39;s current limitation would=
 be to implement a pkg-config wrapper that exposes PKG_CONFIG variables, an=
d point to it in meson.bbclass/meson.cross.</span></div><div dir=3D"auto"><=
span style=3D"background-color:rgb(22,27,34)"><br></span></div><div dir=3D"=
auto"><span style=3D"background-color:rgb(22,27,34)">Regardless the bad vul=
kan.pc is now fixed.</span></div><div dir=3D"auto"><span style=3D"backgroun=
d-color:rgb(22,27,34)"><br></span></div><div dir=3D"auto"><span style=3D"ba=
ckground-color:rgb(22,27,34)"><br></span></div><div dir=3D"auto"><span styl=
e=3D"background-color:rgb(22,27,34)">Joel</span></div><div dir=3D"auto"><sp=
an style=3D"background-color:rgb(22,27,34)"><br></span></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 29=
, 2021, 10:58 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Can you=
 show what vulkan.pc contains please, and why is that a problem?<br></div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov 2021 at 00:51, Joel Winarsk=
e &lt;<a href=3D"mailto:joel.winarske@gmail.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I discov=
ered an upstream problem with vulkan-loader today.</div><div><br></div><div=
>Effectively since 1.2.162 vulkan.pc is broken for cross compilation scenar=
ios.</div><div><br></div><div>This example illustrates current problem with=
 vulkan.pc installed by vulkan-loader:<br></div><div><div><pre><code>$ pkg-=
config --print-errors --define-variable=3Dprefix=3D/opt --variable=3Dinclud=
edir vulkan
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
</blockquote></div></div>

--000000000000fa2ac705d202202e--

