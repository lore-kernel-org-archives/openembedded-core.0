Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B05C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 14:52:14 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web08.41300.1639579933219150522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtXQ42EM;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id e27so14827600vkd.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPxgWjfquAz7cscanVj64E3B+b7XoZJp5+TjxzCumYY=;
        b=GtXQ42EMh93RjF1DHjJNn9PdbUarHt1PWCcZcyaBB1x2mpz1FMr7p2zeBBGBZ9nbdy
         KB2EwNpMGo1Nca+Ru96SPF4CaVT/VN5q6E/a0FwTYn2mXdJOeRb6QGtIO3Uxk8h1k4iv
         8LLHGvvy1L+6ogKZ4/aM7biLcl4DpLi2DTSMJy2T6YN8yNSYdyS5yuwqLcfXajUPiuVx
         GrgAlgR2YXm0g+nLkS94OJS+slH8SdkC8an/yuuwkY0l1HlQ3UL/ODbvNAybfXRGWz2H
         mu+addPmoTs07qJm6vyUdV60RVItbhI6snJr7SUb5LQ5zDtYPL7+6JFhaChpKo+FOZtr
         GGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPxgWjfquAz7cscanVj64E3B+b7XoZJp5+TjxzCumYY=;
        b=KcN2Dh7BVeJuEH+EkshhnMyNIX849vmKPNAy1/1zVjnK6Hj/DaNbr9HKAVXlvmtB0/
         XmPlXD09rvrRRf/tFox3WAYI9YMQ4uNWn9QisIjKmHRd27rpFufnjXX/Fik56Yh2Ykqc
         b4x+39590Ghpcwr/Edu0EDgYW5+SOQ1zDlo5OjFsZxpdnyTaQJ6SMnkEnmjtSHOwJaVs
         joNFnpob4zpNODaNGd0eSlry+9Z7sRH//cPfovGP2PJe0lCyW+xVqwdEW+khJiE9Ci27
         9Qy/diLgJr4RbCF2LPKMBgfHHYDBrbmDcnx5WiEMiJlZDv/tO7JagdPSYGz4IGYhCdQI
         F7WA==
X-Gm-Message-State: AOAM533BIKpKdiR2uYAmGxrF4h+YA8pEwOETSLy5GJyUgdXdzjvs/FqH
	nXOrMhNzpEgz0OUpsWmZdLznGa/bx92Aj3FFfCI=
X-Google-Smtp-Source: 
 ABdhPJxlMrjQe6ACG/bRoLvNIeJ3EhmuyUNPf0UJ1HliXhDdAFOOS8hD46AWA+HiGoo0rv4z2KltpUhWWPuliEsWOc0=
X-Received: by 2002:a05:6122:c6f:: with SMTP id
 i47mr3423665vkr.20.1639579932343;
 Wed, 15 Dec 2021 06:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
In-Reply-To: 
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Dec 2021 15:52:01 +0100
Message-ID: 
 <CANNYZj_eCMyQYHhx7uhZ34NTGekeWAwcGSPCvE1P-tO5wLhp8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000072c0dc05d33073d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 14:52:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159726

--00000000000072c0dc05d33073d9
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Dec 2021 at 15:07, Matt Madison <matt@madison.systems> wrote:

> Inheriting the qemu class unconditionally causes task hash changes for
> allarch recipes
> that use meson (e.g. cantarell-fonts) when MACHINE is changed from, say,
> an x86 architecture
> to an aarch64 architecture, due to the qemu bbclass referencing the
> OLDEST_KERNEL
> variable.
>
> I'm not sure of the best way to fix this; doing an overwrite of
> OLDEST_KERNEL in
> allarch.bbclass as is done for some other variables might be OK? I'm not
> sure it
> makes sense for allarch recipes to reference any QEMU stuff at all, so
> maybe splitting
> all of the exe_wrapper support into a separate bbclass that is only
> inherited when
> EXEWRAPPER_ENABLED is True is better?
>

To be honest, I have no idea why passing '-r OLDEST_KERNEL' is there to
begin with. It's very old code which I didn't write, so maybe you can
submit a patch that removes it and I'll give it a spin?

Alex

--00000000000072c0dc05d33073d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 15 Dec 2021 at 15:07, Matt Madison &lt;matt@madison.systems&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_quote"><div>Inheriting the qemu class uncon=
ditionally causes task hash changes for allarch recipes</div><div>that use =
meson (e.g. cantarell-fonts) when MACHINE is changed from, say, an x86 arch=
itecture</div><div>to an aarch64 architecture, due to the qemu bbclass refe=
rencing the OLDEST_KERNEL</div><div>variable.</div><div><br></div><div>I&#3=
9;m not sure of the best way to fix this; doing an overwrite of OLDEST_KERN=
EL in</div><div>allarch.bbclass as is done for some other variables might b=
e OK? I&#39;m not sure it</div><div>makes sense for allarch recipes to refe=
rence any QEMU stuff at all, so maybe splitting</div><div>all of the exe_wr=
apper support into a separate bbclass that is only inherited when</div><div=
>EXEWRAPPER_ENABLED is True is better?</div></div></div></blockquote></div>=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">To be hones=
t, I have no idea why passing &#39;-r OLDEST_KERNEL&#39; is there to begin =
with. It&#39;s very old code which I didn&#39;t write, so maybe you can sub=
mit a patch that removes it and I&#39;ll give it a spin?</div><div class=3D=
"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000072c0dc05d33073d9--

