Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.9584.1618920412900948774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 05:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZHadWxcW;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id t23so2880703vso.11
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GXyUeaW8k7ypwOnnL1nThJitkH4y+/yLRsg1o7Xt2wE=;
        b=ZHadWxcW1F2RxOOqAQkNoayPCQlU91H0QxxjLZy/tQX3ao+TQx/VXmeB6p/Qu+puuY
         DyubEwfI9qNhPRuN+EnoL4GCurjpB0V40oaKoLT3hW7G6pUVGaSjEClPwZRyzoYedtYi
         NjwXdjTZ2c/M4h/S2dlJOjCNsSnKZAekN2+w7oXnsdnOlodbumIk/ccbVcQ0U8U/XOh8
         c7e2Q9XYoFsvSKWwn9LgM51CaIiQHJ6aguKCa6fWJ9zYllQu3D3XdU/ch1/YLKKbakkD
         1/eJO8G0sdwWJwUVX0AiJ1fEozVMwFUOMmYsf5LeFpwK362pmZj2cN0ACDGBV3zWtJ4R
         Ddyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXyUeaW8k7ypwOnnL1nThJitkH4y+/yLRsg1o7Xt2wE=;
        b=VO6a9lUaBlcSCgOLayudp2DpxJxVd9imyaj2QSZRMFqm7mvsIhrLX3xixqaBgtBAuM
         +bmdMRzGTBuwH7IxKKc6MbYUtneQftwagcYNumN+2bVTFqi+X9hW3zrQCaQ01imXcIeF
         mB9YIPeiJuJNHoQ1ZyPNfzGbI/6hPvfGwiGf6KBpf2WABFhoLSxnmKRyJRI2Ze3vhvJN
         f5UJRPwR0lxiWq9KcEspQg+ibSOEyWsnVpNRjuoN5GC5OUHAWsCCTk3gEpegjxTKyqhe
         9tA0rC6WFOq4H1550PVQmdNA3eYXI7hhoooYzHjIDBjHF/GZhao+ClfkOREL3Ml2/2Bl
         puYw==
X-Gm-Message-State: AOAM530H4RVW/6P9CeKmRP6WavsAVckox9ChT5OQmltebycEZdR3DTdG
	HgVaZDafgBtKlIhjxhJ7Ha0LkCG51AR4bD1qaxI=
X-Google-Smtp-Source: ABdhPJxKAdEfUcQZmpzDG87WqOzE92bq/feRJRcqiVvgtfaCJJHFf4XFlHG+hqvplaSVA4O0giKno819jWVKZRufjXg=
X-Received: by 2002:a67:1447:: with SMTP id 68mr18774709vsu.20.1618920412134;
 Tue, 20 Apr 2021 05:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
 <20210419090044.582453-3-alex.kanavin@gmail.com> <16774CB2FBD0E460.32333@lists.openembedded.org>
 <6058118357d8a7604faaa961066937f346fcaa7c.camel@linuxfoundation.org>
In-Reply-To: <6058118357d8a7604faaa961066937f346fcaa7c.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Apr 2021 14:06:40 +0200
Message-ID: <CANNYZj_iSno6T0bJY7GzvHZ7+H2U7TB7PPs3uhRTnYUppdO+3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] default-distrovars.inc: add debuginfod to default DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Naveen Saini <naveen.kumar.saini@intel.com>
Content-Type: multipart/alternative; boundary="00000000000015c20b05c066481c"

--00000000000015c20b05c066481c
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Apr 2021 at 22:42, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > I agree we should do this, it did blow up in testing:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3289/steps/11/logs/stdio
> >
> > Hopefully an easy fix?
>
> Also:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1993
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1705
>
> (elfutils ptest warning)
>

Thanks, I just sent followup patches for both.

Alex

--00000000000015c20b05c066481c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 19 Apr 2021 at 22:42, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I=
 agree we should do this, it did blow up in testing:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/57/=
builds/3289/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3289/steps/11/=
logs/stdio</a><br>
&gt; <br>
&gt; Hopefully an easy fix?<br>
<br>
Also:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/1993" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/1993</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/1705" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/1705</a><br>
<br>
(elfutils ptest warning)<br></blockquote><div><br></div><div>Thanks, I just=
 sent followup patches for both.</div><div><br></div><div>Alex<br></div></d=
iv></div>

--00000000000015c20b05c066481c--
