Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web12.11918.1588449343577061518
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 12:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h2JstaIe;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id z16so5007690uae.11
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Q+gRTcBtEoGKMMhK+kWtG5wv6f0B6VLI4OSQfwXdx8=;
        b=h2JstaIepkAFVmC6n665HnOyafNd43RKrifzv2WEMBZa4zGsGUAmDg7SGFNDup1kkK
         +i8TDdYiAAVinn94la+5UVVWmLJCQAYhioC3XgXSL93oM4lXjpvGV0XzWVMnoRDJw5z6
         Bs8paa6UOJK1ESj7S2AK9BrFdr7p4F8iPWWsQMjFaKQJoUaEn3O7FFV8bODMShwCpJZs
         F7vVahVptDRxNB5MpFcdybMWU17j6nKunDFVtWWRvz+EWtQWW14oJB/ZaepdaVVT01/a
         wWiV8HHdMlza5SrQZ+zDX1n1dIUF+b1WDET+wouthr7HngSM81SH36Q+vI8wyIP24VsR
         kHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Q+gRTcBtEoGKMMhK+kWtG5wv6f0B6VLI4OSQfwXdx8=;
        b=l1WUl81X8Q0/lxP5ksZswH/IcTOcxFl6kOgdlj7B0x6lGaHfMoWCvxz9nzYo9MILnD
         yQ5MihYnXvGt5UIo2e0tXwPoV3WquJGlOMFAYuEmc1/gW5de/702Ayjhv89D4bZgGj/D
         oDFw93MRNLs95kYIhCVNd4ugg2+BtJIRs4JJDEp/F8S+N3nUvwVCgqafMqMAdxLHv3cK
         pIx5bQY4Byqvv/lQHADYrxu2WHMqg0f+Nc55875kNlqYQ09eauOXaM4/yT2yzksYKGQW
         oVZkpS0/zDR7nPcjq410YWf/lztFcAkg8wTjotWxX/gdjUsyLvPrDxC4Nl8T8tDd8XNH
         xXrA==
X-Gm-Message-State: AGi0PuZvBbt03ebrmLN+UM0X+z7Eu+wPPuvJ7BBnh+FG1YpWIe4HVBwd
	7V/ki2ar2FSfxAuleT0eoP6MpZsmUEjiOFIJxOA=
X-Google-Smtp-Source: APiQypKB+4KCvDMp1V4kqZYNgcN5pTSHksiUAdbo1zh5/CNJPUb6PXd3srohl/F4U8AFuwvql5ppaFgffz5y00+ihKs=
X-Received: by 2002:ab0:6313:: with SMTP id a19mr1370606uap.71.1588449342698;
 Sat, 02 May 2020 12:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-16-alex.kanavin@gmail.com>
 <2e66b913ad106592755b0a53e2440dd46c21eb4c.camel@linuxfoundation.org> <CANNYZj_ofd+w6ERJJHQSeu=H15k9mq3Q0K20GfTXbz0+Pz8G_A@mail.gmail.com>
In-Reply-To: <CANNYZj_ofd+w6ERJJHQSeu=H15k9mq3Q0K20GfTXbz0+Pz8G_A@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 2 May 2020 21:55:31 +0200
Message-ID: <CANNYZj9R6D5SVg39bAOGPUXg-o408TxB0VOZHQgG0jRuxYAp0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] glib-2.0: update 2.62.4 -> 2.64.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d0b8e205a4afaef7"

--000000000000d0b8e205a4afaef7
Content-Type: text/plain; charset="UTF-8"

Other than the non-gpl3 issue, I have corrected the issues, and just sent
the updated patches.

Alex

On Sat, 2 May 2020 at 20:16, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 2 May 2020 at 17:00, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:
>> > Add a couple of missing ptest dependencies.
>>
>> That causes problems for non-gplv3:
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1848
>>
>
> "Missing or unbuildable dependency chain was: ['core-image-minimal',
> 'packagegroup-core-boot', 'udev', 'glib-2.0', 'python3-dbusmock']"
> The offending package is pulled in via ptests RDEPENDS.
>
> This can be addressed either via
> DISTRO_FEATURES_remove = "ptest"
>
> or setting license restrictions per-image:
> INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
>
> I prefer the latter - thoughts?
>
> Alex
>

--000000000000d0b8e205a4afaef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Other than the non-gpl3 issue, I have corrected the i=
ssues, and just sent the updated patches.</div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sat, 2 May 2020 at 20:16, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr">On Sat, 2 May 2020 at 17:00, Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, 2020-04-30 at 11:58 +0200, Alex=
ander Kanavin wrote:<br>
&gt; Add a couple of missing ptest dependencies.<br>
<br>
That causes problems for non-gplv3:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/build=
s/1848" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/75/builds/1848</a><br></blockquote><div><br></div=
><div><div>&quot;Missing or unbuildable dependency chain was: [&#39;core-im=
age-minimal&#39;, &#39;packagegroup-core-boot&#39;, &#39;udev&#39;, &#39;gl=
ib-2.0&#39;, &#39;python3-dbusmock&#39;]&quot;</div></div><div>The offendin=
g package is pulled in via ptests RDEPENDS.<br></div><div><br></div><div>Th=
is can be addressed either via</div><div>DISTRO_FEATURES_remove =3D &quot;p=
test&quot; </div><div><br></div><div>or setting license restrictions per-im=
age:</div><div>INCOMPATIBLE_LICENSE_pn-core-image-minimal =3D &quot;GPL-3.0=
 LGPL-3.0&quot;</div><div><br></div><div>I prefer the latter - thoughts?<br=
></div><div>=C2=A0</div><div>Alex<br></div></div></div>
</blockquote></div>

--000000000000d0b8e205a4afaef7--
