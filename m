Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0162C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 09:17:32 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web08.9279.1636017451613824853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AdPnbFhl;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id e5so9550057uam.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 02:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y1+NBr8hlqI4m89dSyViMDBWheLhCpD35/hncGiQESY=;
        b=AdPnbFhlaPy1cjcSKc2k//bcN6lSHihh5CVF6a1y7gRZYjC5NjRBLeFBdwNDIjUBb8
         IqQb3E2rEN03K0FqxPXfEWBdNynDHmUJfgml4PfWTcF4oC9SZEHPEU3Ur/x7mENZoj79
         h7CfQS+knNwrG63j429DpnRR13MOZv3bBCbYLrW/DeMNnKDYVQPH5kKSpaNM3O8Z6/fD
         OCeYN9TubP3JiA+PEOwnsYY9+qTVtZv8KO3MhERsNut8N4XBaDP3GSfT5coZexfv39+b
         UWNr8R/s7j1MsPDYJnoBmfyd7/Sh7/B4LXKUEDHuILElMHuKDWuMJxMmPnj8ObWciK8R
         PZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y1+NBr8hlqI4m89dSyViMDBWheLhCpD35/hncGiQESY=;
        b=JVMEpmJCCCtntpPYe00OsMQ7tg5PHHFOQKokRDcO0MAA1rpo1TXa8Opns3UKcL0C2j
         RF2qG074DW6lyT7orHSqEEUzlM7ap4B5gKmZ0u+YazEm80wpKpxwThLX+wD+B79JxeOC
         YCBEkDQcZunX9+f59COKnYlf60hJhp64xGtEPihe8LpxcQDFi6zP1sesvD9A4ys7DJBz
         5lwK9ta4yzk64Ttqpb9OCIawJhsHYSRSRbv9A/TIHQXyzvd/kHQupaS/4BgzgJdPXt3J
         RkHobGUf4AAnePqpFqGr2QyiZtkPqxiJyxEdfZWUnSL7vUo2kRkU5ySAWLJF6T78RuGv
         +v2w==
X-Gm-Message-State: AOAM533ShK/CpUIcbt2XKj7rnJ5cxPe/I7mlJOfDz+Et4oD6azoiNf2P
	vb8SKHuW6XWTluNZJQgWcsYQkGyGP3eSx4voMtWt6qTR
X-Google-Smtp-Source: 
 ABdhPJzejoufvsjVb3EE9DqGWCEksKwLf7Osq6BHDZcmCL8WRCWaTRAKEnd8mbgo3W0lEnqbuZpnbx5j3k5bUmCuOCg=
X-Received: by 2002:ab0:30e1:: with SMTP id d1mr54220432uam.22.1636017450726;
 Thu, 04 Nov 2021 02:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211104014027.15729-1-changqing.li@windriver.com>
In-Reply-To: <20211104014027.15729-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Nov 2021 10:17:19 +0100
Message-ID: 
 <CANNYZj89xfqo=4zLkRtAtZqSsXheMC09PPpcOJ87jn1qAct-kA@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] ruby: workaround ptest hang problem
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ff38d005cff2fe59"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 09:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157837

--000000000000ff38d005cff2fe59
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Nov 2021 at 02:42, Changqing Li <changqing.li@windriver.com>
wrote:

> @@ -85,12 +85,12 @@ PTESTS_SLOW = "\
>      tcl-ptest \
>      util-linux-ptest \
>      valgrind-ptest \
> +    ruby-ptest \
>  "
>

Thanks, can you insert this in alphabetical order? Also please add to the
commit message how long does the test take.

Alex

--000000000000ff38d005cff2fe59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 4 Nov 2021 at 02:42, Changqing Li &lt;<a href=3D"mailto:chan=
gqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">@@ -85,12 +85,12 @@ PTEST=
S_SLOW =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0tcl-ptest \<br>
=C2=A0 =C2=A0 =C2=A0util-linux-ptest \<br>
=C2=A0 =C2=A0 =C2=A0valgrind-ptest \<br>
+=C2=A0 =C2=A0 ruby-ptest \<br>
=C2=A0&quot;<br></blockquote><div><br></div><div>Thanks, can you insert thi=
s in alphabetical order? Also please add to the commit message how long doe=
s the test take.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000ff38d005cff2fe59--

