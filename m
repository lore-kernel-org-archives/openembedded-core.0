Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F06C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 09:47:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.25765.1704188820578233382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 01:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MCzpDHMq;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e759ece35so6928904e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704188819; x=1704793619; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NlL+5D3Z4VyaSreRG2M3G7egnXK0gbzpvn5FTGOiiK0=;
        b=MCzpDHMqMPaauj39A9YCEyAAqDpzdn3avDCywPTlpOy403wapIPYWKqIhzU6H0OcS4
         cTL+D4N69Gq94VdhZcTecFKl+qZjV8zJORqBTnqU5ys6O6N4k5VdHWXocxQJqF+dF8bn
         Sd0SS/KI6ntW/xPftz6fv+aoEw3rFi2BkUk0eidElKhR73CINl+RskJ+OB54/br2ALdV
         xBS+v+R8YdLt7PBK4TpMaE7Cy/G/MJysF9d2jiRRG66V1XxwxczzCwoiFYZKPxI245AF
         LMbbmf3CwLc0ZQoW0oKHBvelF7Tgacl7gjr0unU7TRBNUH7ccqnKJqUCerNxz9UM6l/0
         bsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704188819; x=1704793619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlL+5D3Z4VyaSreRG2M3G7egnXK0gbzpvn5FTGOiiK0=;
        b=oFpoNFNn1CbXJaGzjGzKiYfgb60BK2BwL7BhaYZPnkOeeWTbyI6gynEomILjOJFaYE
         qM04cNtKXZIxHNUF1dz1/T016faJXMhJArqbRkGMv3ouBH2Ej1TkZZJhesL5YBy+dKL9
         PLCMRtzSmmFgjva20RYMPZEKchjXDQmjPNZO0FwbuODVM9hVoQJzOfSVMWWXyWZXKkMx
         yvSJ4eKEV680s5/Fq2kQfNmw6lHYKMO6equrLyQ5/YBDgQ1ntMGNu5m2q2j3GS0cecjQ
         ry7lfbrNgtZbetggpVgi3NuwD6/M/hzPFYgzjTg4SKS4n5j/Tre5OYQf4oAjwq24F8AK
         cgAQ==
X-Gm-Message-State: AOJu0Yzh48DP0U8P2/l/hQTAQ7Lu7kiInciE9qXexzsP6nGK+jwkkDel
	g1gDWTJsdz6zxv2cfYyfM5we8g2csR9VaGjGyhU=
X-Google-Smtp-Source: AGHT+IF0Oh5ED2F8760eD0PYdC1nQFDDbPn2n70UvR5M5YuULplEw4IWDFFwR+NEsMU1UWmee5vhqlVb594eOtXB/F4=
X-Received: by 2002:ac2:5934:0:b0:50e:7673:54d4 with SMTP id
 v20-20020ac25934000000b0050e767354d4mr4660039lfi.29.1704188818338; Tue, 02
 Jan 2024 01:46:58 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-0DEz5b=P3+qO+ei-hwD4Fb_gL3fXh9uS_NwSpw-OwhQ@mail.gmail.com>
 <25812.1704152544903871733@lists.openembedded.org>
In-Reply-To: <25812.1704152544903871733@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jan 2024 10:46:47 +0100
Message-ID: <CANNYZj9nM2eKQoxi+=ecJ3K4LmL0rPaduayjFKHv+NsD44uaCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] packagegroup-core-x11-xserver: use
 RRECOMMENDS for mesa-driver-swrast
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000025b879060df3616d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 09:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193225

--00000000000025b879060df3616d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps you can set up plain poky, and compare Mesa builds with that? No
one else is reporting the issue, and the changes are invasive, so I=E2=80=
=99d want
to get to the bottom of it first.

Alex

On Tue 2. Jan 2024 at 0.42, Vincent Davis Jr <vince@underview.tech> wrote:

> Yea, I can try to find root cause. May just be my setup.
>
> In my setup mesa-driver-swrast package doesn't exists or rather doesn't
> get generated
> which is why during rootfs creation the package manager opkg fails on me.
>
> *Exact error:*
>
>   Solver encountered 1 problem(s):
>   Problem 1/1:
>     - package packagegroup-core-x11-1.0-r0.all requires
> packagegroup-core-x11-xserver, but none of the providers can be installed
>     - conflicting requests
>     - nothing provides mesa-driver-swrast needed by
> packagegroup-core-x11-xserver-1.0-r0.qemux86_64
>
>   Solution 1:
>     - do not ask to install a package providing packagegroup-core-x11
>
> Can see that it doesn't exists with
>
> *ls
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/**=
/mesa**
>
>
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-dbg_23.3.1-r0_core2-64.ipk
>
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-dev_23.3.1-r0_core2-64.ipk
>
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-megadriver_23.3.1-r0_core2-64.ipk
>
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-src_23.3.1-r0_core2-64.ipk
>
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-tools_23.3.1-r0_core2-64.ipk
>
> tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/co=
re2-64/mesa-vulkan-drivers_23.3.1-r0_core2-64.ipk
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193193):
> https://lists.openembedded.org/g/openembedded-core/message/193193
> Mute This Topic: https://lists.openembedded.org/mt/103471043/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000025b879060df3616d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Perhaps you can set up plain poky, and compare Mesa build=
s with that? No one else is reporting the issue, and the changes are invasi=
ve, so I=E2=80=99d want to get to the bottom of it first.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 2. Jan 2024 at 0.42, Vinc=
ent Davis Jr &lt;vince@underview.tech&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<p>Yea, I can try to find root cause. May just be my setup.<br><br>In my se=
tup mesa-driver-swrast package doesn&#39;t exists or rather doesn&#39;t get=
 generated<br>which is why during rootfs creation the package manager opkg =
fails on me.</p>
<p><strong>Exact error:</strong></p>
<blockquote>
<p>=C2=A0 Solver encountered 1 problem(s):<br>=C2=A0 Problem 1/1:<br>=C2=A0=
=C2=A0=C2=A0 - package packagegroup-core-x11-1.0-r0.all requires packagegro=
up-core-x11-xserver, but none of the providers can be installed<br>=C2=A0=
=C2=A0=C2=A0 - conflicting requests<br>=C2=A0=C2=A0=C2=A0 - nothing provide=
s mesa-driver-swrast needed by packagegroup-core-x11-xserver-1.0-r0.qemux86=
_64<br>=C2=A0 <br>=C2=A0 Solution 1:<br>=C2=A0=C2=A0=C2=A0 - do not ask to =
install a package providing packagegroup-core-x11</p>
</blockquote>
<p>Can see that it doesn&#39;t exists with</p>
<blockquote>
<p><strong>ls tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-ro=
otfs-repo/**/mesa*</strong><br><br>tmp/work/qemux86_64-underview-linux/core=
-image-base/1.0/oe-rootfs-repo/core2-64/mesa-dbg_23.3.1-r0_core2-64.ipk<br>=
tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-rootfs-repo/core=
2-64/mesa-dev_23.3.1-r0_core2-64.ipk<br>tmp/work/qemux86_64-underview-linux=
/core-image-base/1.0/oe-rootfs-repo/core2-64/mesa-megadriver_23.3.1-r0_core=
2-64.ipk<br>tmp/work/qemux86_64-underview-linux/core-image-base/1.0/oe-root=
fs-repo/core2-64/mesa-src_23.3.1-r0_core2-64.ipk<br>tmp/work/qemux86_64-und=
erview-linux/core-image-base/1.0/oe-rootfs-repo/core2-64/mesa-tools_23.3.1-=
r0_core2-64.ipk<br>tmp/work/qemux86_64-underview-linux/core-image-base/1.0/=
oe-rootfs-repo/core2-64/mesa-vulkan-drivers_23.3.1-r0_core2-64.ipk</p>
</blockquote>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193193): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193193" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193193</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103471043/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103471043/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000025b879060df3616d--

