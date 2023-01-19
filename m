Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3130C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 18:47:52 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.53853.1674154065399317302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 10:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hvpJhxp9;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-12c8312131fso3625015fac.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 10:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lXCYHAISKt+n2uJiIiVDpvGxnXJg/3eqLe9/sGwRdhc=;
        b=hvpJhxp9HOXLaMMlG1P6dLP3z4aaZaMGc4bFfMbvGse3cbLkOWVKa43JBkfDH2qpK9
         u9DZeOIaMGIzRUNMsCGS7sjnBpnivAZlsiW1LGJ62CAPwgiLMCoGruSpKLpYjgr9RZLZ
         Ml65k8Fw6WVh/9ng8uoofzu+Y1PHjiqKx7bgobYl+7r9pTEz7jKWsj40IIEKSnVwKEWD
         Y5iF+MJS2yHHSUDpkYj36IF4XUTl37+rwW0TaIRNPtfQx8pmiRl1pBXdzZj1duEsDwqB
         rFmJxbE4KKn53BOnBL4snmt/PB1oDepwFKwrIaqrx+uqL01ER6fE6CHFTcJ42Cp1+YWh
         YTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXCYHAISKt+n2uJiIiVDpvGxnXJg/3eqLe9/sGwRdhc=;
        b=nCRXEs+ymIiBAaTFyJatjE5Ktjln/MAU6rhRz1N9hGePOxEOvYTmzcAUvGeW7M3MNr
         BxYQhnNPoc7tAM4wMPi7lYri3+Z7KNSKKR3H2piXF80ZZuL8axfwr1h/Aymgdt8HHUBr
         ZbFKDdJ4H0qhDTnt9HBufqB1ZOMmc+Fe/0HPgXQUS/ZCe0eEDEg5YsQw6Wm2+8A1QvsC
         v2dUCNCLcU2VW6/GNQi6IQGC7Gy93GdSFkCEIHMXBFIYVjGxUmZtzbBrWWx48fmPafiz
         lU3sNp+cy9Lea3pH/lnSDFB9b+I8yg2JlNUxReokcFThRIRoPee5wcR1Hu8RgaKNNxcL
         GTdg==
X-Gm-Message-State: AFqh2krpMiI4D3X79MztZAT/O8h+U02pTS4kvp+/DVXcKGxdmHTOybEW
	aINNPuGrXk0vvCjDXlfXjCX330ocLYyReTac1To=
X-Google-Smtp-Source: AMrXdXuJkfvT4gLRS5l1TPIS+TiBuxhLyp2IqKKZAE6xzC1KcMzkJaOaWt6SOFPVTe2kKjny4MtTuEvJm6zPD8yQvVs=
X-Received: by 2002:a05:6870:ebc3:b0:144:e1eb:419 with SMTP id
 cr3-20020a056870ebc300b00144e1eb0419mr1017629oab.262.1674154064534; Thu, 19
 Jan 2023 10:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20230119042724.1413857-1-raj.khem@gmail.com> <a42ac89e-a844-6790-ad68-d5f7852b4e87@ventanamicro.com>
In-Reply-To: <a42ac89e-a844-6790-ad68-d5f7852b4e87@ventanamicro.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2023 10:47:34 -0800
Message-ID: <CAMKF1srw_61ryc88dZReenaut1JkijQTo1798cjVGV+qG8WnjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
To: Jeff Law <jlaw@ventanamicro.com>
Cc: Alejandro Hernandez <aehs29@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nelson Chu <nelson@rivosinc.com>, Richard Purdie <rpurdie@rpsys.net>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050e1cc05f2a25eeb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 18:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176161

--00000000000050e1cc05f2a25eeb
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 9:25 AM Jeff Law <jlaw@ventanamicro.com> wrote:

>
>
> On 1/18/23 21:27, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v1 -> v2:
> > - Fix build on mingw
> > - Backport fix to build with --disable-gdb
> [ ... ]
> Note I think this is going to run afoul of grub2 mkimage.
>

Yes I am seeing that in local builds for both rv32 and rv64


> In binutils-2.40 the assembler for risc-v was changed to use CALL_PLT
> relocations rather than CALL relocations.  grub2 does not handle
> CALL_PLT relocations which in turn will cause a failure when
> grub2-mkimage is used on risc-v.
>
> As far as I can tell, the assembler change literally just changes the
> relocation number, they are otherwise treated the same.  So I think
> grub2 can be fixed by just treating R_RISCV_CALL_PLT just like
> R_RISCV_CALL in kern/riscv/dl.c.


I will try this and let you know


>
> Nelson, can you confirm that all your assembler change did was change
> the relocation used in the resultant object?
>
> Jeff
>

--00000000000050e1cc05f2a25eeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 19, 2023 at 9:25 AM Jeff Law &lt;<a href=3D"mai=
lto:jlaw@ventanamicro.com">jlaw@ventanamicro.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
<br>
On 1/18/23 21:27, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v1 -&gt; v2:<br>
&gt; - Fix build on mingw<br>
&gt; - Backport fix to build with --disable-gdb<br>
[ ... ]<br>
Note I think this is going to run afoul of grub2 mkimage.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes I am seeing =
that in local builds for both rv32 and rv64</div><div dir=3D"auto"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
In binutils-2.40 the assembler for risc-v was changed to use CALL_PLT <br>
relocations rather than CALL relocations.=C2=A0 grub2 does not handle <br>
CALL_PLT relocations which in turn will cause a failure when <br>
grub2-mkimage is used on risc-v.<br>
<br>
As far as I can tell, the assembler change literally just changes the <br>
relocation number, they are otherwise treated the same.=C2=A0 So I think <b=
r>
grub2 can be fixed by just treating R_RISCV_CALL_PLT just like <br>
R_RISCV_CALL in kern/riscv/dl.c.</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I will try this and let you know=C2=A0</div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Nelson, can you confirm that all your assembler change did was change <br>
the relocation used in the resultant object?<br>
<br>
Jeff<br>
</blockquote></div></div>

--00000000000050e1cc05f2a25eeb--

