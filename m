Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBCCEB64DD
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 08:41:54 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.4026.1688028110432834121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 01:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Tp6XXtMG;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso139362241.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688028109; x=1690620109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQHq/4SsFi17jPcuZb0XWQ7m9O+oXRVtd30vct7g9KI=;
        b=Tp6XXtMG+slJGbtq1YgqQnMnzF7VA5yDh0oB2/PgpndVbXnjd5woBn98i/oTKj4I9k
         iV8jN8O4KNlX71hUU+eXHznofXj/NTq7kp63yIoatQO5uqhjcmuUr6fl7lXoAPP5/iSD
         RBLrpkR5NXSq42aBYopmE3HO78FE7Ygt3HoOWRhWPi/YJ6ngA5zmAnWofjTQJmO7iVOd
         9hMLeM9LYjyUv57KyhcJuTAy3i8Hrz2wPe32GxrDsIj7loOlb4oAkhP6do7yAMRLas4l
         umzQ6Fs9qFxvNCIxsa6lJ0Lej1tyWUgzVpkufY/+w0Xc5sFy+vBx5Te8mgcXklFwChhF
         Z9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688028109; x=1690620109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQHq/4SsFi17jPcuZb0XWQ7m9O+oXRVtd30vct7g9KI=;
        b=Pai6G2quFnIBlyLjf0UmNT0mYdj1h5Tj9UsWikVwgXJLA2DRoeiQe51g4/7JuUCYXP
         UqsP+dlzX/FbkEhInkta+5rchZgUKxFM9VtEYIl9/IioGfyuzTNCU56OEOisWF+sNkEZ
         v8mi7WSOvvK6eXn+DQL/JYz70sS/hNVXP+SmvatE20GoRX9vyFsFgr3mzuS3WA1jzOwe
         d0/xVU69uVLxCPqoOwGm+itK8L0iooM26wa+uaIkQcML5PFt/ZipEgFQOndvjSI5hfoa
         QThzg6xmXIZPnrTHLGj/s+kfuHXCeIg2tfihZ33mmuNJ296J+CTBI0HpeSB29NrfsYJy
         3vBA==
X-Gm-Message-State: AC+VfDyMA9+w5Ns7ro77Z/VZxiEB2i7GsCy4dgdHAztNlNq/duooRKPl
	R+ZYpZRlbaee54o/AwtgJVlCSDnuUI1nUGjierI=
X-Google-Smtp-Source: ACHHUZ6tXz9mUFYDcB/wY8SQDIPdOhSBKQ0pbuq3k835rCXDdPA1uOZojaZx8xUtQzgObBKZ2YgYO18ngpJWXAzoFEU=
X-Received: by 2002:a67:f6c2:0:b0:43f:58a1:b22c with SMTP id
 v2-20020a67f6c2000000b0043f58a1b22cmr17476213vso.16.1688028109466; Thu, 29
 Jun 2023 01:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230627101644.881715-1-jose.quaresma@foundries.io>
 <20230627101644.881715-5-jose.quaresma@foundries.io> <1a0b9d4f242c13cb524d587661b02688d607a30e.camel@linuxfoundation.org>
In-Reply-To: <1a0b9d4f242c13cb524d587661b02688d607a30e.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 29 Jun 2023 09:41:38 +0100
Message-ID: <CANPvuR=brJ8e3BEiBsj9yTqD+RAYXF4JvN9WzZQQUBjPraY+0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] init-manager-systemd: add modulesloaddir
 and modprobedir
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000d5f24f05ff40ab67"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 08:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183610

--000000000000d5f24f05ff40ab67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
28/06/2023 =C3=A0(s) 23:03:

> On Tue, 2023-06-27 at 10:16 +0000, Jose Quaresma wrote:
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >
> > v5: introduced in v5
> >
> >  meta/conf/distro/include/init-manager-systemd.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> b/meta/conf/distro/include/init-manager-systemd.inc
> > index 7867d90028..4989b93502 100644
> > --- a/meta/conf/distro/include/init-manager-systemd.inc
> > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > @@ -5,3 +5,7 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
> >  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
> >  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
> >  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> > +
> > +# Use modules-load and modprobe config path distribution specific
> > +modulesloaddir ?=3D "${libdir}/modules-load.d"
> > +modprobedir ?=3D "${nonarch_base_libdir}/modprobe.d"
>
> Not everyone uses INIT_MANAGER and we don't really want these set in
> every recipe. I think this should be in the bbclass based upon some
> conditional, not here...
>
> Cheers,
>
> Richard
>

Sure, I will add it to the kernel-module-split bbclass conditioned to
systemd dsitro feature.
That is something I have been thinking about in the first versions.

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d5f24f05ff40ab67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quarta, 28/06/2023 =C3=A0(s) 23:03:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, 2023-06-27 at 10:16 +0000, =
Jose Quaresma wrote:<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; v5: introduced in v5<br>
&gt; <br>
&gt;=C2=A0 meta/conf/distro/include/init-manager-systemd.inc | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/=
conf/distro/include/init-manager-systemd.inc<br>
&gt; index 7867d90028..4989b93502 100644<br>
&gt; --- a/meta/conf/distro/include/init-manager-systemd.inc<br>
&gt; +++ b/meta/conf/distro/include/init-manager-systemd.inc<br>
&gt; @@ -5,3 +5,7 @@ VIRTUAL-RUNTIME_init_manager ??=3D &quot;systemd&quot;=
<br>
&gt;=C2=A0 VIRTUAL-RUNTIME_initscripts ??=3D &quot;systemd-compat-units&quo=
t;<br>
&gt;=C2=A0 VIRTUAL-RUNTIME_login_manager ??=3D &quot;shadow-base&quot;<br>
&gt;=C2=A0 VIRTUAL-RUNTIME_dev_manager ??=3D &quot;systemd&quot;<br>
&gt; +<br>
&gt; +# Use modules-load and modprobe config path distribution specific<br>
&gt; +modulesloaddir ?=3D &quot;${libdir}/modules-load.d&quot;<br>
&gt; +modprobedir ?=3D &quot;${nonarch_base_libdir}/modprobe.d&quot;<br>
<br>
Not everyone uses INIT_MANAGER and we don&#39;t really want these set in<br=
>
every recipe. I think this should be in the bbclass based upon some<br>
conditional, not here...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br></div>Sure, I will add it to the kernel-module-=
split bbclass conditioned to systemd dsitro feature.<div>That is something =
I have been thinking about in the first versions.<br><div><br></div><span c=
lass=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</di=
v></div></div></div></div>

--000000000000d5f24f05ff40ab67--

