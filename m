Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DF7C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 09:00:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.29336.1641805246352187193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 01:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oc4GKxxl;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id h10so15193065wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 01:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Kuq4H22utUt8EcuvM15VFunQa2to8zAauhccrBKRKo=;
        b=Oc4GKxxlYwzo1mh/tiqGv97SmeyM8/0nWCzdiD0PdDfDoJra0wDQKpzQB5brQocwy/
         uyYoFpcT3XnhM6od2vOqjgkvRStdP7/kDyscTQXukYap1UY/PRlsbBXposNYvlAp44lI
         a1FG25rdqUHNLOIvenBbopwgtDOt7zB8peBgSnHRB/+SoHrvYbbn2nam82/f+j0V3hpU
         QzHFDRK2sEfVWflmgawJr9fYmnd1n2ZjlAxk8sBqUdEjOx4zgsVXrgoQsse2DBagCyVk
         dzhvFs4uo7DtikRxJ+wQ34JltFW0OuhEA1mW6Pz1pKRtE6KcL1tGdth0QOWCzj1DWwUu
         75Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Kuq4H22utUt8EcuvM15VFunQa2to8zAauhccrBKRKo=;
        b=55YFYLicCTXAoKhWBLE/pr8K9trSMItaBqoVv4LKqUWmRzWrVszRpD08RCFWWmiMu9
         +mWPm6tUU5qzDvqh8sTJ1nznP9ivFJPUmV4+HpK43uKcQWH1uwH2j+1Jz/FyUQQwKwRW
         IYCBKTDrpb7jbJmgmVNa7KKtDUQ9B5m9NEvTZMJseKwkhVNemlCgZVY8ZAdc4U/enUD6
         xmPV9PfazzVzi1RwQaszKy/POT75l13Qg8Tdo3fZIewXvAFuL2yFwl8DNCr5z4s9jTFC
         +/lkq13wllUk5b6kmX3FTQMopYiWeAvPDTcKMGaDR6GrhNnBS96HsTxuCWkuzkZGYVK4
         tEuA==
X-Gm-Message-State: AOAM532JJcBOrtS8avBM4g6ZgrNEWLNl4buU19fwCbbtUnqdFJNWhZl+
	Z2t9vY2txJW5AXe6UEboPLfeFWaO5vAsGldupOo=
X-Google-Smtp-Source: 
 ABdhPJz17sdbpdlaWQxEsLcU0o7XZo0Ry34L32+kLuAyfH6AdbuYmzbBpvTsl3BCpN1CH8tvAdof+XLB6xGF7FqpfM0=
X-Received: by 2002:adf:e84f:: with SMTP id d15mr5327271wrn.15.1641805244901;
 Mon, 10 Jan 2022 01:00:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641787452.git.anuj.mittal@intel.com>
 <9c839db1144a8a96f8b848e3e1aad2fd93859abd.1641787452.git.anuj.mittal@intel.com>
In-Reply-To: 
 <9c839db1144a8a96f8b848e3e1aad2fd93859abd.1641787452.git.anuj.mittal@intel.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 10 Jan 2022 10:00:32 +0100
Message-ID: 
 <CAApg2=TisC+MZ9ux2aSGt9Py8wokpmtv_Nr6dQ1AAKZmx-dN3w@mail.gmail.com>
Subject: Re: [OE-core] [honister][PATCH 04/10] grub2: fix CVE-2021-3981
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000069adfe05d53692a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 09:00:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160340

--00000000000069adfe05d53692a3
Content-Type: text/plain; charset="UTF-8"

> diff --git a/meta/recipes-bsp/grub/grub2.inc
> b/meta/recipes-bsp/grub/grub2.inc
> index bb791347dc..a72a562c5a 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
>             file://determinism.patch \
>             file://0001-RISC-V-Restore-the-typcast-to-long.patch \
> +
>  file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
>  "
>
>  SRC_URI[sha256sum] =
> "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
>
>
This one should go to dunfell too. If the original poster would like to
backport,
that would be nice, otherwise it is on my list.

Kind regards,
Marta

--00000000000069adfe05d53692a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc<br>
index bb791347dc..a72a562c5a 100644<br>
--- a/meta/recipes-bsp/grub/grub2.inc<br>
+++ b/meta/recipes-bsp/grub/grub2.inc<br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/grub/grub-${PV}.tar.gz \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-grub.d-10_linux.in-ad=
d-oe-s-kernel-name.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://determinism.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-RISC-V-Restore-the-ty=
pcast-to-long.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3981-grub-mkconfi=
g-Restore-umask-for-the-grub.cfg.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;23b64b4c741569f9426ed2e3d0e6780796fca081=
bee4c99f62aa3f53ae803f5f&quot;<br><br></blockquote><div><br></div><div>This=
 one should go to dunfell too. If the original poster would like to backpor=
t,</div><div>that would be nice, otherwise it is on my list.</div><div><br>=
</div><div>Kind regards,</div><div>Marta</div><div><br></div></div></div>

--00000000000069adfe05d53692a3--

