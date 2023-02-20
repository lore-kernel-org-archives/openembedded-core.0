Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE3C6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:39:52 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.23390.1676921981776983605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 11:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BMDk4E0p;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id r11so1217706vkq.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CV5uU1MwqXY7XVzxjBidCcREfknUsPe3Tb7VRq4AR0Y=;
        b=BMDk4E0pH0oF2aOD/2a0gd2qq35P7JI61/+Lu7UFGdX38MKSZx2RwrlVRbefSmX0Kz
         Dfnh2Ccp6ePCBFpRhU4D7qMlqv4Fj4uFroZDK4DmwweM3luqa67apcgwiMRYDVkYx9CS
         txmXVIC85iu0bEZwUFdtj5KaIoMCwMyHAEaq7V7C/ItZAhk9X5sVFbVBd7BiTzHdTmyr
         3OPIGRcF0FpsaarqIWT/TBIOj3moi/VClTHbisFQJw6O0IJErm+31LR1y/CYI3IOIYf9
         kxZf5W9sPy+mk0vZUAb668nAPBhBLavMI8cgaTjBNOUDNpj72a66swNbw3pue3+qgbaU
         XCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV5uU1MwqXY7XVzxjBidCcREfknUsPe3Tb7VRq4AR0Y=;
        b=3tj9gQtYYcOIkVSuEiswS8qhezXmQgzIgPlHXh4IBMbBtAf6zSckON/nTSlrNwf0Yz
         ElP8iyFjcKVhaHE7yQHPABCacCGXBeG26d2hznU8BA9+pQLoIy4gUz7NsIUNbSkwC3fw
         sj9PAuFQk/3of4J0Ttxd446nyYxHTE9r7d6YesFVnYSvIm4JYDgkXkvNlVxnJOFwWG83
         ZNX2YeehSIrUqITxSEvC0vbneheavZOh/ih711RL/z+lVHHeHi+8ubwn5XOyGYVcj3cC
         +SUeL/lh5L3JHnu22VIA4Zhw1qI4E0oU5fDTWeznEdkZ6vA4bSA/rZ6lX8+n7yoDGfaZ
         H11A==
X-Gm-Message-State: AO0yUKWskOlVrs3kbzcn2eeINTPi2MmWvcIvkt7ttYs2WVgS3IV3s1b7
	/8p4rXAFn2zlNWHbQjtnP/0c28554KURyo6npmg=
X-Google-Smtp-Source: AK7set9ojxRUzDgNOjsx6ox8bd1N2V3swWEGG1goA7hCVhFXxWE80iLrk5T74OmNVFUyb6tS+xcZVqgu3B5OlVrvCIg=
X-Received: by 2002:a1f:a30e:0:b0:3b7:5ff7:cfb8 with SMTP id
 m14-20020a1fa30e000000b003b75ff7cfb8mr287415vke.11.1676921980874; Mon, 20 Feb
 2023 11:39:40 -0800 (PST)
MIME-Version: 1.0
References: <1745992FE05F0A7C.676@lists.openembedded.org>
In-Reply-To: <1745992FE05F0A7C.676@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 Feb 2023 19:39:30 +0000
Message-ID: <CANPvuRn_wn=V=EoCTThZ2-c=6hj4=2CerEZJuQ6Zxqx9ZXTK1g@mail.gmail.com>
Subject: Re: [OE-core] [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs:
 handling the firmware installation with usrmerge
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000fc76ca05f526d29e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 19:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177457

--000000000000fc76ca05f526d29e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wrong mailing list! Sorry, please drop this patch

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia segunda, 20/02/2023 =C3=
=A0(s)
17:41:

> The ti-img-rogue-umlibs package is not obeying usrmerge distro feature.
> /lib should be relocated to /usr. [usrmerge]
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../libgles/ti-img-rogue-umlibs_1.18.6276027.bb               | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.18.6276027.bb
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.b=
b
> index 924e46ba..94d14ded 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.18.6276027.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/
> ti-img-rogue-umlibs_1.18.6276027.bb
> @@ -25,6 +25,10 @@ PVR_WS =3D "lws-generic"
>  RDEPENDS:${PN} +=3D "mesa-megadriver libdrm ti-img-rogue-driver"
>
>  do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true',
> 'false', d)}; then
> +        mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
> +        rmdir ${D}/lib
> +    fi
>      rm -rf "${D}/etc/init.d"
>      rm -rf "${D}/usr/lib/libvulkan.so"
>      rm -rf "${D}/usr/lib/libvulkan.so.0"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177447):
> https://lists.openembedded.org/g/openembedded-core/message/177447
> Mute This Topic: https://lists.openembedded.org/mt/97091194/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fc76ca05f526d29e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong mailing list! Sorry, please drop this patch<div><br>=
</div><div>Jose</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmai=
l.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; escr=
eveu no dia segunda, 20/02/2023 =C3=A0(s) 17:41:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The ti-img-rogue-umlibs package is not obe=
ying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]<=
br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0.../libgles/<a href=3D"http://ti-img-rogue-umlibs_1.18.6276027.bb" re=
l=3D"noreferrer" target=3D"_blank">ti-img-rogue-umlibs_1.18.6276027.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-=
rogue-umlibs_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-r=
ogue-umlibs_1.18.6276027.bb</a> b/meta-ti-bsp/recipes-graphics/libgles/<a h=
ref=3D"http://ti-img-rogue-umlibs_1.18.6276027.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ti-img-rogue-umlibs_1.18.6276027.bb</a><br>
index 924e46ba..94d14ded 100644<br>
--- a/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-rogue-u=
mlibs_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-um=
libs_1.18.6276027.bb</a><br>
+++ b/meta-ti-bsp/recipes-graphics/libgles/<a href=3D"http://ti-img-rogue-u=
mlibs_1.18.6276027.bb" rel=3D"noreferrer" target=3D"_blank">ti-img-rogue-um=
libs_1.18.6276027.bb</a><br>
@@ -25,6 +25,10 @@ PVR_WS =3D &quot;lws-generic&quot;<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;mesa-megadriver libdrm ti-img-rogue-driver&=
quot;<br>
<br>
=C2=A0do_install:append() {<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;usrm=
erge&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}/lib/firmware ${D}${nonarch_base_libdir=
}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir ${D}/lib<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0rm -rf &quot;${D}/etc/init.d&quot;<br>
=C2=A0 =C2=A0 =C2=A0rm -rf &quot;${D}/usr/lib/libvulkan.so&quot;<br>
=C2=A0 =C2=A0 =C2=A0rm -rf &quot;${D}/usr/lib/libvulkan.so.0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177447): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177447" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177447</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97091194/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97091194/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000fc76ca05f526d29e--

