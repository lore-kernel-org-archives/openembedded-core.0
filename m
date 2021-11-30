Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD83EC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 16:31:41 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web09.79214.1638289900715766233
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 08:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EGfR5PcG;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id p37so42615233uae.8
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ci9fx37hHbRCXs/6S2rarK3F48tTwAmXfq5CzyjvoOI=;
        b=EGfR5PcGhcmASLCEd9w3iJGJXqS+G2MqdzcvYewj3MXZuARKpGoVDETyUAYSpEb0LN
         4CXuz4BQMELsM07CuAFdvWn8/Su/oIfbeRlsskjRJsy36um+4FgYL9+LtezUcktssAuD
         HpmcwbqSTD/8T8OHSFccsUAxaXshHs4rD/ZMH6cuv3QO0+NHOtO5rPIUwzoasUxK8mOT
         oTFl+VWdTgn0H0PPHF7e1wtQdNRN52XPh0zFpwbw5tOEFiE8zUGURFX+7jTTaBi/zodM
         BDKMjZuJfxasxbPxyYCRDZigqC2gME9LaHIQsP69XnmbAvoIpbW3PIuj3W/I1aSS1xN0
         olsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ci9fx37hHbRCXs/6S2rarK3F48tTwAmXfq5CzyjvoOI=;
        b=IHppPz4ppe7hDbcqeWttx5gLxxbc+tPFKIvu1eWX8OfUNAIFpTLRSPM6faViN1rYSI
         c8X6OlhsysDWIy3O6ygGkCFlgKuVwyXD1iP5XTT8aXDxoftxZwxI+3ZZXv2u+0HL3HEj
         6Hyir/IMqAC18xzfdGhK2TxNgZI3++2oBWjmffV25OBnamtUKQ91H6lC5Fgk/6MOArER
         PU/IPGbhbq4E+AgIerB+Kl1FIrUjqSqOqG13JKQpaaShPqQ98JvbnTZxoPjpEpCHobDx
         EpeRyeqL0x7cAfXRSNU1fqH4/ao2CCb71t51pEyvmGcHxYf0CsSg62lCV64x1rw3/LP7
         CDpg==
X-Gm-Message-State: AOAM533be5LyJLEkuP47LS5NWrD2owq8UuOD966ZA2ajBiIsqDDp8S9e
	lVVpoIbZpxohdB8u94yPATajxieLvWnHPZWCkdQu6oXVQKU=
X-Google-Smtp-Source: 
 ABdhPJygZgtq5ONgoxGq1msUzsHEH2jVjfxIFsgIombstIvOlg1MzVyDphPovVo2D9J2oZ3WQ8W9x5q172SOgVPcz6M=
X-Received: by 2002:a67:e90d:: with SMTP id c13mr307296vso.12.1638289899734;
 Tue, 30 Nov 2021 08:31:39 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJ-kkhBuRMLGzV6ks9msbaR7+9KGr2H6VNVL0wb41+sjA@mail.gmail.com>
 <CANNYZj-=BWTJTBhpH-pF0baRxkzCmv8OXggsG=1cXep9Di3oLg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-=BWTJTBhpH-pF0baRxkzCmv8OXggsG=1cXep9Di3oLg@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 08:31:28 -0800
Message-ID: 
 <CABKMkPJSUUDE9fDuzPbV9MLjGHDBZ_dXV0tMrn7+u5c4Z7Actg@mail.gmail.com>
Subject: Re: vulkan-loader
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000834ba305d2041795"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 16:31:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158980

--000000000000834ba305d2041795
Content-Type: text/plain; charset="UTF-8"

[Readable version]

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

Regardless, the bad vulkan.pc is now fixed.


Joel

On Mon, Nov 29, 2021 at 10:58 PM Alexander Kanavin <alex.kanavin@gmail.com>
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

--000000000000834ba305d2041795
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>[Readable version]</div><div><br></div><div><a href=
=3D"https://github.com/KhronosGroup/Vulkan-Loader/commit/3c1ad4b0d54875ff08=
99b77a92aeda53ca236f27">https://github.com/KhronosGroup/Vulkan-Loader/commi=
t/3c1ad4b0d54875ff0899b77a92aeda53ca236f27</a></div><br>Before:<br>$ pkg-co=
nfig --print-errors --define-variable=3Dprefix=3D/opt --variable=3Dincluded=
ir vulkan<br>/usr/include<br><br>After:<br>$ pkg-config --print-errors --de=
fine-variable=3Dprefix=3D/opt --variable=3Dincludedir vulkan<br>/opt/usr/in=
clude<br><br>This is important as meson does not expose<br>PKG_CONFIG_SYSRO=
OT_DIR to pkg-config.<br><br>With change this meson snippet now finds absol=
ute path correctly:<br><br>vulkan_dep =3D dependency(&#39;vulkan&#39;)<br>v=
ulkan_hpp =3D join_paths([<br>=C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variab=
le(&#39;includedir&#39;, define_variable: [&#39;prefix&#39;, get_option(&#3=
9;prefix&#39;)]),<br>=C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=C2=A0 =C2=A0 &#39;=
vulkan.hpp&#39;<br>=C2=A0 =C2=A0 ])<br><br>Another work around for meson&#3=
9;s current limitation would be to implement a pkg-config wrapper that expo=
ses PKG_CONFIG variables, and point to it in meson.bbclass/meson.cross.<br>=
<br>Regardless, the bad vulkan.pc is now fixed.<br><br><br>Joel</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov =
29, 2021 at 10:58 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Can you show what vu=
lkan.pc contains please, and why is that a problem?<br></div><div><br></div=
><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 30 Nov 2021 at 00:51, Joel Winarske &lt;<a href=
=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">joel.winarske@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>I discovered an upstream problem with vulkan-loader=
 today.</div><div><br></div><div>Effectively since 1.2.162 vulkan.pc is bro=
ken for cross compilation scenarios.</div><div><br></div><div>This example =
illustrates current problem with vulkan.pc installed by vulkan-loader:<br><=
/div><div><div><pre><code>$ pkg-config --print-errors --define-variable=3Dp=
refix=3D/opt --variable=3Dincludedir vulkan
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
</blockquote></div>

--000000000000834ba305d2041795--

