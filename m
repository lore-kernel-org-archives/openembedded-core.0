Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3788C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:38:18 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.2325.1686029891332925798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dt6EEaDs;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b1b86146afso41508091fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 22:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686029889; x=1688621889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qn77cL9PRbpNpthOoziQS6C/rulwWP1X1E4VcZHY0cs=;
        b=dt6EEaDsgpSvKOp8sZsl+oBstSJblcQbmRcYlHNjFkWOS0irpoukklU1aa4Yh0kGsP
         9RocwBsGV/XnwO/6RqhkZaOoK/glJ7bW7P3/PqucZEJIJQdS1dRCO1oFTjz3c+D7AjR9
         vzjb53H8UNJwxQ9XHnT4IlS4ufeWNdOpbk/um3EnuRfURs6QZi02dAhrVFes98fD3+pW
         rtDZjGaGtbxJ04bUz5oLD4lALPcoxSUvWmqlwifeigBC4HN5RAQGZUZ5bJ3/K0DWfOzL
         hoTDHUjYVEgi+TPgnpZ36GrWYdoLJldSYIf6KQVLLxDaK9yi62wbn2rSuf+XF7Gp59Hk
         h/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029889; x=1688621889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qn77cL9PRbpNpthOoziQS6C/rulwWP1X1E4VcZHY0cs=;
        b=PObgU+VKAj5MpzNf087gbLoMhNEp/B26m5WYLrO8xCmH+S3YwqDzx4Xnr8jKHp6BBV
         42bwj1otXLMsepgl+gWakaKP+T7zR5+IkiLGTaxlKhA8+3n3w9XWUncQzY6m1HCYmUeq
         bLVRxAZbVDTR/eh+wxxEbuiqGiqMpe+HyG+hFLgMg7GjwmqB0XNx/M39Ud/AjjT5n2Do
         eZpJS9VLoh/ZMjZsnNrKmXQ9amHVllD9iFXLzSqUbi6xnFI8l6roh2lNe3vYOnXZJ5xv
         SwNGWeKmk8C33NpZJ1Xsu4/EByQ55BMzzpLHXbwmHmtJiv9t/jprzeb3fbAlsNMi0tML
         g0Vw==
X-Gm-Message-State: AC+VfDyDEpSHCFHwflLrNaXcLNz4Yw2ruYd8KcDNWluZbXoqf2z1i/my
	yk7/FuHe2idiz4m6fKjbFfcqEuhi4CLIdOdct8w=
X-Google-Smtp-Source: ACHHUZ5AL7VKGE4pVelYyfDmhI1D+xRCbmpIFZbibdiYhYNR2X/LBa372zsakubFS2H+49AF1F3aKkkSq6c/TpwS5S4=
X-Received: by 2002:a2e:9009:0:b0:2b1:e900:3ca5 with SMTP id
 h9-20020a2e9009000000b002b1e9003ca5mr693896ljg.29.1686029889465; Mon, 05 Jun
 2023 22:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230605162546.3012555-1-ross.burton@arm.com>
In-Reply-To: <20230605162546.3012555-1-ross.burton@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 6 Jun 2023 07:37:57 +0200
Message-ID: <CAApg2=RzfvyjBnn6v-vn5eNH0X=q=kypFr2OYLt7EptTdar1dw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] cve-extra-exclusions: add more linux-yocto
 CVE ignores
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000a46ffe05fd6f6cd8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182412

--000000000000a46ffe05fd6f6cd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 5, 2023 at 6:25=E2=80=AFPM Ross Burton <ross.burton@arm.com> wr=
ote:

> From: Ross Burton <ross.burton@arm.com>
>
> These CVEs have all been fixed <6.1.30, which is the default linux-yocto
> kernel version.
>
>
Those are pretty new ones, should be all covered by the new CVE format. Is
anyone already
sending pull requests to include that information in the CVE database
directly (not NVD)?

Kind regards,
Marta

--000000000000a46ffe05fd6f6cd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 5, 2023 at 6:25=E2=80=AFP=
M Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
<br>
These CVEs have all been fixed &lt;6.1.30, which is the default linux-yocto=
<br>
kernel version.<br>
<br></blockquote><div><br></div><div>Those are pretty new ones, <span class=
=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!importan=
t">should</span> be all covered by the new CVE format. Is anyone already</d=
iv><div>sending pull requests to include that information in the CVE databa=
se directly (not NVD)?<br></div><div><br></div><div>Kind regards,</div><div=
>Marta <br></div></div></div>

--000000000000a46ffe05fd6f6cd8--

