Return-Path: <jim.wilson.gcc@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B899C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 17:55:47 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.41.1637085346059619223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 09:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lFytj5Vz;
 spf=pass (domain: gmail.com, ip: 209.85.210.49,
 mailfrom: jim.wilson.gcc@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so34864217otk.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sI+srk99tYiuvb8C5jFTxYVdgsFAn0tfH68E+JaEXYU=;
        b=lFytj5VzMEHuTH7/zjRPDZvHgBwuQ3ILzbuZfuH4RBmFFoPnjhMUoeCLFtZEftVCeN
         D7KtSw5NPDzuJMxglGGMxxcB086CHqxy+4eySVCWqf/zADAnAO9BVXcCIcY4vTrvG+yf
         s++OnoMHpPlQ/v1lwhWp6yTJFORMt2MLlmRFMSXX4kl1OJtdDLSNEB985hVhfd8drgt3
         6ea4+SiajBx1MTRWsl1RKD29BOvpruxH1LC5unuCm+HjTBZpJjSjmre67OqijQmv5ihl
         wRLqU9A6X1XiU4P+OFlfEZanPxLXzb3PEKJjgoq1kiiNqz2HwDIK/oQnKBDLXhWnCcgU
         VfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sI+srk99tYiuvb8C5jFTxYVdgsFAn0tfH68E+JaEXYU=;
        b=x23OWvXT2eOSXq0ClnXCFW8U0p1wGwzes/xm3g3fjfIJlko6NaFwHkPOwYjYFBlgte
         2pOIvbCfHkqvUzouGnGg3zSPwpBcs7NSHfXb9jp8uLYu3EfzTkv/d73/V0Q6M/aSMcrS
         MtzGvliiHiSocoAizXzG2Nn7h6vrONA0VZp2alOUF6swHO26bnSMawvGdTJikoL9LFEF
         4d+Xxs2ysFy3R4yf2//BccaJNooOc7fsOr6kAh6SdD6aJU+etY/4RvQFsz7i816ki7TK
         H8gRHJ9BPFmAvBwp1a8JMOkZF1DudkkUETGIZuiq3XJYld3YQ8fZZSp9tYSoORtsiSx5
         1GAw==
X-Gm-Message-State: AOAM5336IEjMhPDRHjYlmqiegdjOFzKArrZZF7A5CJbM+vgp8OtubqBy
	WgcTf+9fi8q4ntxxnJZ0bDy2qQVmHTh9kms1pHk=
X-Google-Smtp-Source: 
 ABdhPJxvioA9c/aNKJObrpuKsMuXbC+Ha3Nh+D1dE79c0oGh40ADQqvvhn5gd+2kywiw+NGOmvgMYqM+bZuxF02oEYg=
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr7721382otn.128.1637085345410;
 Tue, 16 Nov 2021 09:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20211116014413.419573-1-jim.wilson.gcc@gmail.com>
 <43d925b8-dc03-21a5-10e1-361b2894373f@gmail.com>
In-Reply-To: <43d925b8-dc03-21a5-10e1-361b2894373f@gmail.com>
From: Jim Wilson <jim.wilson.gcc@gmail.com>
Date: Tue, 16 Nov 2021 09:55:34 -0800
Message-ID: 
 <CALNwTfy6n-hf+0MOPXhdaUdJxT+ARDYdCyqtNbqYbmxk4B70Yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-common: Add --with-liblzma-prefix in xz
 PACKAGECONFIG.
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007af41b05d0eba2d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 17:55:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158368

--0000000000007af41b05d0eba2d4
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 15, 2021 at 6:14 PM Khem Raj <raj.khem@gmail.com> wrote:

> On 11/15/21 17:44, Jim Wilson wrote:
> > This fixes an arch linux gdb configure error with liblzma installed.
>
> this looks ok to me. Although I wonder why gdb's configure is not able
> to find it in staging sysroot automatically, I have seen similar
> behavior in gmp and mpfr in past as well.
>

I have no familiarity with the OE cross native build system.  I didn't
spend much time looking at that.  There might be something wrong with gdb
configure, or there might be something wrong with options or environment
variables passed to gdb configure.  But since we already passed the
--with-expat-prefix option to configure, doing the same for liblzma was the
easiest way to get this working.

Jim

--0000000000007af41b05d0eba2d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 15, 2021 at 6:14 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
On 11/15/21 17:44, Jim Wilson wrote:<br>
&gt; This fixes an arch linux gdb configure error with liblzma installed.<b=
r><br>
this looks ok to me. Although I wonder why gdb&#39;s configure is not able =
<br>
to find it in staging sysroot automatically, I have seen similar <br>
behavior in gmp and mpfr in past as well.<br></blockquote><div><br></div><d=
iv>I have no familiarity with the OE cross native build system.=C2=A0 I did=
n&#39;t spend much time looking at that.=C2=A0 There might be something wro=
ng with gdb configure, or there might be something wrong with options or en=
vironment variables passed to gdb configure.=C2=A0 But since we already pas=
sed the --with-expat-prefix option to configure, doing the same for liblzma=
 was the easiest way to get this working.</div><div><br></div><div>Jim</div=
><div>=C2=A0</div></div></div>

--0000000000007af41b05d0eba2d4--

