Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.5718.1625139616566236996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jul 2021 04:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kMX0rDr5;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id p13so2321713uao.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jul 2021 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lyukosbsvuz9HY9+0HUv7nh6/bIqfQoolsAYlNGcXsg=;
        b=kMX0rDr5ezjAEd6yxONk5PeX6sYYD6OK63NMxVdcM9ezWlcV+bun1P+7a3IfanNvXZ
         D2FSpp2cB3onUPwG+uPYcUzQC6uD8zhiHyfYvQUMEPrjNr2y+huSGEKSp9ELzWfJ4tpk
         JoMV7R/Uek1vZhEz+yK+WPomUAiD+GtztBFfn+EKIaNEIT6RtOn4Zjri3Muf+6uBevwR
         NxPT+xyyuYFheX3ZCHas3MO/AYdg3zmUZ9OLGjaWWRGdHSB/S1kD5ndIMbiQB64Cpm/O
         VESnaAFTSs5YdTEgym6bheRuVXZ7MvHhYphmfvRdhHQDp5NTemD9M2udiC1RoIU3Uw4r
         40DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lyukosbsvuz9HY9+0HUv7nh6/bIqfQoolsAYlNGcXsg=;
        b=CkcDlwbSGbZmx9wxEUmR/gvNhW4bc3brwowhyhSszC27qG1XkY+bIgxJI0NrglI/WE
         i0iVGEQiXl5m8xQ5Dl7/i/mYWboCfRFrob0ndUlJkprjshQtPf4UWNFMOJH4Xq3ag9vN
         d+Me31cbknHE0EhXB1Ik6PDxF8No+UqdR3yPsEfRCjNgEswfKfPcpfV8EnerlLRCN6fB
         dfm1+tArPVMNP1DhWbn4XmmZsDYLuDd1b/mkgUsI1Jusz4nenwVKz0tjn4b4lJhdpjo2
         i3bF2o5+oRLZEp+8YvUhd7PaDUJiEEmE59lo8OueFckXBFY3v8TdTv/1O0srdnFbMNXo
         yadQ==
X-Gm-Message-State: AOAM530dM1HZBDhB7I24swwEdTM8QO+zp6S+jA7Et43klGVwbUMWGewp
	1E74ZswuhmukFvhMTXv52J/mW5r6RQDKgg/r+7s=
X-Google-Smtp-Source: ABdhPJxBr4h5UZFclQtzsSY65vLgvpbwrv16F4oqjK36NKhMLLEXl2T1IFKMvs+VCaNg/rsEWbMRNqh76+cKXc7+bvk=
X-Received: by 2002:ab0:5962:: with SMTP id o31mr38605808uad.89.1625139615705;
 Thu, 01 Jul 2021 04:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210630205233.23046-1-rasmus.villemoes@prevas.dk>
 <CANNYZj_BzozcbaQ27aD2WsJ0e_cCmNCzBzzmT=8yvWVXJJyyhw@mail.gmail.com> <cec2d722-095e-5ca6-eea5-80b4d906f679@prevas.dk>
In-Reply-To: <cec2d722-095e-5ca6-eea5-80b4d906f679@prevas.dk>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 1 Jul 2021 13:40:04 +0200
Message-ID: <CANNYZj9grFii0C45oCAOXy6CYvBn4DM_PduJLj34811J8DW=Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: vdsotest: new recipe
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000812f1405c60e4dc7"

--000000000000812f1405c60e4dc7
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Jul 2021 at 11:46, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
wrote:

> > Should this be in meta-oe rather than oe-core?
>
> Perhaps. Could you share some of your thought process that led you to
> ask that question? I honestly didn't think much about it, but it did
> seem to fit well with the other "userspace tools closely tied to how the
> linux kernel works".
>

The bar for adding new recipes to oe-core is pretty high; the recipe needs
to be a basic requirement for a functioning embedded use case, a core
toolchain piece, a broadly useful diagnostic tool, or a hard dependency for
any of those. This recipe does not seem to fulfil that.

Alex

--000000000000812f1405c60e4dc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 1 Jul 2021 at 11:46, Rasmus Villemoes &lt;<a href=3D"mailto:=
rasmus.villemoes@prevas.dk">rasmus.villemoes@prevas.dk</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Should this be i=
n meta-oe rather than oe-core?<br>
<br>
Perhaps. Could you share some of your thought process that led you to<br>
ask that question? I honestly didn&#39;t think much about it, but it did<br=
>
seem to fit well with the other &quot;userspace tools closely tied to how t=
he<br>
linux kernel works&quot;.<br></blockquote><div><br></div><div>The bar for a=
dding new recipes to oe-core is pretty high; the recipe needs to be a basic=
 requirement for a functioning embedded use case, a core toolchain piece, a=
 broadly useful diagnostic tool, or a hard dependency for any of those. Thi=
s recipe does not seem to fulfil that.</div><div><br></div><div>Alex<br></d=
iv></div></div>

--000000000000812f1405c60e4dc7--
