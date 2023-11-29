Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52813C46CA3
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 09:38:12 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.28474.1701250688435001400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 01:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CIE0/y6W;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4b2899dcb2fso157671e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701250687; x=1701855487; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T8iAooneuvXlm4Y4/mfr6c0Iw8KdKZ/BrOQ9bQpCsfo=;
        b=CIE0/y6WmhgHzw/5UlrucJ9PumeP5CBMvLhJt2fgBcVkLbq2qaSbvWawQ32KmVcgRQ
         1JdApJDrHzGa+uoEryLaDqB0N7QFcnnA5mvj3cZZsr5V1yITeUDN2FWRw7JBiGLIlJTP
         u3lZoyxAo/JmO9He+cVqH0VrUu8Cczm5PmZ7I8oi7M5awr4UERzeDfGmM/ALQwDDh5ye
         LmppaHag/JN2KhZTQl5dzkZj/vcd8jrlHH0UTBlmmcw3S3Tls0RKFO93IXbCqIOt7kKX
         KcP4ulzedlrq84zSZL1dC0+OoFqZlStEssgfZXEGRNp5W9wxxpFua7FO5oW9Lh7B6/02
         JivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701250687; x=1701855487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8iAooneuvXlm4Y4/mfr6c0Iw8KdKZ/BrOQ9bQpCsfo=;
        b=cY4HWM14bVhS6juML//9WKVjyZ4nomw4ljAjaLDGXR/k7HU0Q1QwaYHc82xUCxcF5D
         DffdBfefb2d5k2ddH5a46aMpS6aWhtakrZnGowDAJQVevYQWP1Y3Tno+ExoRiaNF76KN
         Di/jTCelpBY7w+TGJTemx2afFq4bGDSGY5wflTG+zEWKduxwrCU+JGYmTnwB4b5f1Kne
         1TkArrL2gpyF0E/TyuWbv+8Xa9tr73Cuw7M+vLMTXmzyGU80h3bjnJ/PeFOsGzXBbBr8
         uMCnthtXTjLMT6P6ih2FoTqUyMrGAK+vM+3fG8hcn05mGzn0heQlqpHS8wIEJaj1TFdx
         6vgw==
X-Gm-Message-State: AOJu0YyNNP7naye0iJKr5QisSrk76arcM7pWW1mKNpCPZs97N1n8w2pV
	zyo7BIg5R6JBDa2ys+wuHVcR+HPU21ojPbX02+8=
X-Google-Smtp-Source: AGHT+IFlG0wj/Mcilb8t5JsDW0+gUTgTw3xIDkbCSaxUPTlYhytwo11ply8bfVYMbgvaoB6QGwlKwp7k1DMmFQqbYQU=
X-Received: by 2002:a05:6122:2212:b0:495:dcd0:471 with SMTP id
 bb18-20020a056122221200b00495dcd00471mr20261878vkb.5.1701250687344; Wed, 29
 Nov 2023 01:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20231128095518.2088391-1-jose.quaresma@foundries.io> <CAMKF1sqOkz+89g9NJ+9MaBCEeJX8SmBUk2UsbEG4-6G_oDzG0w@mail.gmail.com>
In-Reply-To: <CAMKF1sqOkz+89g9NJ+9MaBCEeJX8SmBUk2UsbEG4-6G_oDzG0w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 29 Nov 2023 09:37:51 +0000
Message-ID: <CANPvuR=LORKn+2kgaqheB3iHzzBnDGsDaYvmmxKi5vqETm4UJQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] initramfs-module-install-efi: add GPL-3.0 licenses
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000e4a62a060b474a4b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 09:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191435

--000000000000e4a62a060b474a4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 28/11/2023 =C3=A0=
(s) 17:06:

> On Tue, Nov 28, 2023 at 1:55=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> > Some of the tools used the script init-install-efi.sh are GPL-3.0:
> >
> > parted: GPL-3.0-or-later
> > dosfstools: GPL-3.0-only
>
> if these tools are used and not provided by this recipe then I would
> expect that concerning recipe providing them will mark the LICENSE
> field correctly.
> we do not need to reflect the use here.
>

Yes, these tools are provided in other recipes and the license of these is
correct.
It makes sense to still with the MIT license here even though the script
uses GPL-3.0 tooling.

Thanks for your time and please drop this patch.

Jose


> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  .../initrdscripts/initramfs-module-install-efi_1.0.bb           | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/initrdscripts/
> initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/
> initramfs-module-install-efi_1.0.bb
> > index b7499644f0..0f18ecaca0 100644
> > --- a/meta/recipes-core/initrdscripts/
> initramfs-module-install-efi_1.0.bb
> > +++ b/meta/recipes-core/initrdscripts/
> initramfs-module-install-efi_1.0.bb
> > @@ -1,5 +1,5 @@
> >  SUMMARY =3D "initramfs-framework module for EFI installation option"
> > -LICENSE =3D "MIT"
> > +LICENSE =3D "MIT & GPL-3.0-only & GPL-3.0-or-later"
> >  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> >  RDEPENDS:${PN} =3D "initramfs-framework-base parted e2fsprogs-mke2fs
> dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
> >  RRECOMMENDS:${PN} =3D "${VIRTUAL-RUNTIME_base-utils-syslog}"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191350):
> https://lists.openembedded.org/g/openembedded-core/message/191350
> > Mute This Topic: https://lists.openembedded.org/mt/102847882/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e4a62a060b474a4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 28/11/=
2023 =C3=A0(s) 17:06:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Nov 28, 2023 at 1:55=E2=80=AFAM Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; Some of the tools used the script init-install-efi.sh are GPL-3.0:<br>
&gt;<br>
&gt; parted: GPL-3.0-or-later<br>
&gt; dosfstools: GPL-3.0-only<br>
<br>
if these tools are used and not provided by this recipe then I would<br>
expect that concerning recipe providing them will mark the LICENSE<br>
field correctly.<br>
we do not need to reflect the use here.<br></blockquote><div><br></div><div=
>Yes, these tools are provided in other recipes and the license of these is=
 correct.</div><div>It makes sense to still with the MIT license here even =
though the script uses GPL-3.0 tooling.<br></div><div><br>Thanks=C2=A0for y=
our time and please drop this patch.<br><br></div><div>Jose</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../initrdscripts/<a href=3D"http://initramfs-module-install-efi=
_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-module-install-efi_=
1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/<a href=3D"http://initram=
fs-module-install-efi_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramf=
s-module-install-efi_1.0.bb</a> b/meta/recipes-core/initrdscripts/<a href=
=3D"http://initramfs-module-install-efi_1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">initramfs-module-install-efi_1.0.bb</a><br>
&gt; index b7499644f0..0f18ecaca0 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/<a href=3D"http://initramfs-modu=
le-install-efi_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-modul=
e-install-efi_1.0.bb</a><br>
&gt; +++ b/meta/recipes-core/initrdscripts/<a href=3D"http://initramfs-modu=
le-install-efi_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-modul=
e-install-efi_1.0.bb</a><br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;initramfs-framework module for EFI installatio=
n option&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; +LICENSE =3D &quot;MIT &amp; GPL-3.0-only &amp; GPL-3.0-or-later&quot;=
<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;m=
d5=3D3da9cfbcb788c80a0384361b4de20420&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;initramfs-framework-base parted e2fspro=
gs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}&quot;<b=
r>
&gt;=C2=A0 RRECOMMENDS:${PN} =3D &quot;${VIRTUAL-RUNTIME_base-utils-syslog}=
&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#191350): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/191350" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/191350</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10284788=
2/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102847882/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000e4a62a060b474a4b--

