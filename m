Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629A3C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 15:50:46 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.9009.1643125845735346169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 07:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WwBQsmP4;
 spf=pass (domain: gmail.com, ip: 209.85.219.177,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id c6so62930167ybk.3;
        Tue, 25 Jan 2022 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIZ6EGBdXeZNSn2lbknlhd7UsERpBbiSbW9WGOEHWic=;
        b=WwBQsmP4F6jP4GsM8qZKNzZASh79xMi94QJutAfLfQ8zVVuG2mf33PD0OLudDWSD+u
         +ZHPezGOj/Hs9hGTeEWtSayhwvc7p/hElLNJLNZyhuP3T2gwS8QjkuKUY4ANT2LwZ6kM
         Mj118Rq8DhUT43AJSIuU3i0GJF+I5kLEQmUqx3NlrpI10xdTas5aRpTJsTXRUcNwhXMN
         zPBYleCRLGcfdFSIKtPQwxoIar2fCLDMPYUiJsoe+IZr1JZPmHPMaLFShmCNbN2Gck/u
         FLrZKWjQJDc/5i4Agc+PokhzeT5wxPw4PFdmzvGnfj47rosp+njglvfl2pdp/xxjcwmS
         qgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIZ6EGBdXeZNSn2lbknlhd7UsERpBbiSbW9WGOEHWic=;
        b=2IH+qXr5hLVSQHLWxCsjZbjG0EzyB+Ex0kXul6A/rYaiI1oD0B4O3P88iLNorRwfM4
         OMA3uzL95wJlkRCkYnOOIAUZ+07qw2dEeYCJXuMjSxkv/TJAKu4pSiBUP2VnR6GGRNg/
         Xfok6qnujajNt/24taE+omYcIIvAxRupbaHxsUwxPRahQRFaX1h4J2uAIuYPyIERT9Ky
         MF9duqn7EqvNYFYYvF9rPZfxK76AbnUoiYAsHI+197zdV461rdFCBu5+8NNq1bHEzhWA
         EbSD38l8//ZpBF2T1MEUQRXyj/lKI/HpYZX7MJy4An7gMkuUIJywYz5yXY1JLLwTYTO3
         hnbQ==
X-Gm-Message-State: AOAM530M1DjWOa2mpdlklZEwweEL/p5B0yPXoFEu/vn94XyPaPCM475r
	7LUlyt2wSi6If5d8y+B5xDWRk+MDCPiunNRe2b4=
X-Google-Smtp-Source: 
 ABdhPJw0XfzYQgUWH3TFhxAh6A1G8JCvHmNC9tXQaJ6LCiU6SbfOOncU6sh2zO7xGaUn1+lUZB+I3tS3fc7vMWOSY7A=
X-Received: by 2002:a25:d44a:: with SMTP id
 m71mr32204033ybf.173.1643125844777;
 Tue, 25 Jan 2022 07:50:44 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 25 Jan 2022 07:50:33 -0800
Message-ID: 
 <CAB=6tBSszdZEjyKPvMd88HFKZiszcVuGEt4BH6w8YsS0Ew=gNA@mail.gmail.com>
Subject: Re: [OE-core] Inclusive Language Proposal for YP/OE
To: Jon Mason <jdmason@kudzu.us>
Cc: yocto <yocto@lists.yoctoproject.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004c9e7505d66a0c4c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 15:50:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160942

--0000000000004c9e7505d66a0c4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 8:18 AM Jon Mason <jdmason@kudzu.us> wrote:

%< SNIP %<


> Branch Names
> The =E2=80=9Cmaster=E2=80=9D branches on the relevant OpenEmbedded and Yo=
cto Project
> git trees will be changed to an alternative name at some point in the
> future.  The current preferred name is =E2=80=9Cdevel=E2=80=9D.
>

Why devel instead of main [1]?

[1]
https://lore.kernel.org/git/pull.656.v4.git.1593009996.gitgitgadget@gmail.c=
om/

..Ch:W..



--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--0000000000004c9e7505d66a0c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 24, 2022 at 8:18 AM Jon Mason=
 &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><div><br></div><div>%&lt; SNIP %&lt;<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bra=
nch Names<br>
The =E2=80=9Cmaster=E2=80=9D branches on the relevant OpenEmbedded and Yoct=
o Project<br>
git trees will be changed to an alternative name at some point in the<br>
future.=C2=A0 The current preferred name is =E2=80=9Cdevel=E2=80=9D. <br></=
blockquote><div><br></div><div>Why devel instead of main [1]?</div><div><br=
></div><div>[1] <a href=3D"https://lore.kernel.org/git/pull.656.v4.git.1593=
009996.gitgitgadget@gmail.com/">https://lore.kernel.org/git/pull.656.v4.git=
.1593009996.gitgitgadget@gmail.com/</a></div><div><br></div><div>..Ch:W..<b=
r></div><div>=C2=A0</div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><b><span style=3D"font-fa=
mily:monospace">&quot;Perfection must be reached by degrees; she requires t=
he slow hand of time.&quot; - Voltaire</span></b></div></div></div></div>

--0000000000004c9e7505d66a0c4c--

