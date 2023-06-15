Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4647EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 08:57:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.13764.1686819435233277988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 01:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LJPD98Zj;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f841b7a697so857484e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 01:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686819433; x=1689411433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJCmoXPlE6nhFuYEbwJnR+dFys7hVKZNmENY4qwgkU0=;
        b=LJPD98Zjs6I4KywAQ1aflYSlIBKdX5HkGV8vKREAev0Dgul/94TX4XbW/OoECtt0NM
         549GLbVtxWFynmM6OsfV8PC0uQk1zbgSZiUEFe3yzOPxOrC9JVW+h4D7KxcCuJ4yQ5vM
         c2kZ77CV3mCoN7EW2ziaSGCgSsmpxjO5y00otNqDgsxbfloKkSO2EB0HibvsH8uOUulG
         QpJEpur3QUU6GZvoOhDIbN+jAIcxcsKWoEBXjguGUX0OqkLbSRLDkr1KT7JM211k+ULe
         /VJ7/e0tcxnoCPhuCoduFIsJYMEx3EKCNnFKDwDb2wXkyH6GZIvRRoReMn9XO21HE7/p
         kYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686819433; x=1689411433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJCmoXPlE6nhFuYEbwJnR+dFys7hVKZNmENY4qwgkU0=;
        b=Y+r28RGLi+VSAAKxsgNFoQ4Qe6+lAvhg4pGJBE95GF2B2RPVxLNA+sh00df2cNNzKe
         bwr+hVCbpuEW5b73pzidjqPB+qx7r/duXykruFYJdrtOhRn3vB5s2w43FOeD6xuxfJlV
         D3rvtPZbstyQQgatffUva/DBiQDQZqFjrWAl4l5s8LfvEfLi+fInzsjM1liAr4FlUSkw
         k7tDdNReSCKN1Xq40sQoyzg034m5YIl+4EE5ltUnDSfxeriKnTcj9yDHKUlMi2uIRhJQ
         cdaIHHqdSJk6aHpZ0WG6p/SRQHtTHG7D8jRETOQl6wl1cqNyhFA1nIOPeWSghggEVLTf
         sqeA==
X-Gm-Message-State: AC+VfDxtfd1Rrj/XYG8B+x8cRRFDavC11BgeEvUgq0oF6TjDV+9AAosl
	Rh24Ad8RvKhFoUnZwksXRmoLqda2yPEbCbgxCdc=
X-Google-Smtp-Source: ACHHUZ6P2i2LgMYyfHJAnWFkvWzlPEuZxXjpS/SvBdDDdF4w2/E8NU35Ek4W/cp4oFNJ/Fii0ea1vfHQbCJDKCD7zSE=
X-Received: by 2002:a19:4f5a:0:b0:4f8:4780:2c16 with SMTP id
 a26-20020a194f5a000000b004f847802c16mr117222lfk.27.1686819433000; Thu, 15 Jun
 2023 01:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230614092918.4065570-1-alex@linutronix.de> <20230614092918.4065570-14-alex@linutronix.de>
 <0BBA64C7-D551-4FA1-866A-C3CFCB3715E8@arm.com>
In-Reply-To: <0BBA64C7-D551-4FA1-866A-C3CFCB3715E8@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jun 2023 10:57:02 +0200
Message-ID: <CANNYZj8GgMK8WqcV5QZQd4-KH5WTm5HXaLGAcfsssZf-xS2oAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/55] coreutils: upgrade 9.1 -> 9.3
To: Ross Burton <ross.burton@arm.com>
Cc: Alexander Kanavin <alex@linutronix.de>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001ab39905fe274119"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 08:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182840

--0000000000001ab39905fe274119
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This didn=E2=80=99t happen in a-full so can you check wh ere the difference=
 is?

Alex

On Thu 15. Jun 2023 at 10.14, Ross Burton <Ross.Burton@arm.com> wrote:

> With this upgrade I get:
>
> | checking whether MB_CUR_MAX is correct... configure: error: in
> `/yocto/ross/build/tmp/work/cortexa57-poky-linux/coreutils/9.3-r0/build':
> | configure: error: cannot run test program while cross compiling
>
> Ross

--0000000000001ab39905fe274119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This didn=E2=80=99t happen in a-full so can you check wh =
ere the difference is?</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
lex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu 15. Jun 2023 at 10.14, Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)">With this upgrade I get:<br>
<br>
| checking whether MB_CUR_MAX is correct... configure: error: in `/yocto/ro=
ss/build/tmp/work/cortexa57-poky-linux/coreutils/9.3-r0/build&#39;:<br>
| configure: error: cannot run test program while cross compiling<br>
<br>
Ross</blockquote></div></div>

--0000000000001ab39905fe274119--

