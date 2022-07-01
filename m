Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57ABCCA483
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:43:20 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.41021.1656693799482635113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pr7Z79gO;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id fw3so5010014ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHHmKV7IzArli3+0lIe3MwYeOSgpCPnvWrHMkfKApL8=;
        b=Pr7Z79gO8lqOllZgMc+923FKGW2v3Zb9hviXzBjRNbDe/jCbVcXCa8qzs2Ae9T3J3X
         o/7ejrEQGu0pV5UFBfNhJTaowtMjWPgyHY7xdgtRPgNQwz889VoxEABv4H9ZUc0AcQ6X
         XzBxrJQjeZjMC9vvK8jYl5aK7yUeXELyYVx3fXXKR7jpUx3NOkavRmQYKD2KBFa6A0nq
         E8FvxY2tumuwEDsft7Ezp20QWXeFNdZH747NRC43FQD5SvWOzRieu9R21TJ2pJlArTIE
         yaOJj8JMHPa63qIqcAnUN/gAqm/UnV0KkIQ82XRr+jjCDVJA/OgqzGHtQY7EQWoU7sCC
         99cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHHmKV7IzArli3+0lIe3MwYeOSgpCPnvWrHMkfKApL8=;
        b=1IAb0f1ToJ0eXRE8dwRkpQf1tmGgHA3fB2ZqXL19f9n0k3LSGWauk5RAuuzOP1u8Vz
         BUoiBy2k/ynCQFqMWWFWqYj+YDPbHN52o+Ij1W8l6LkA7dP+Cseo3kVNHqR7iUfucB52
         1RB7tZ5ArPqHyL4KU6bPjDfbhwcLAG7ktxYnEZcM7WMaY6wq1QiwXX1+F3Y/JqAPMJi1
         N+vSw+9muZgt/Ag6Kh+tCZOZ92cUZ2OI2NZ6hXbdbIM2SBCFGFDtWTQXabS57/Cy5Tk0
         DdfI0stN8jMGh149+gbGVKBfuaFuoBdBII3BAuc9dnc655xSizMwJNTPsfxKLnC+Chg0
         F1XA==
X-Gm-Message-State: AJIora+8MfVrzGcvzZx4TM8/2oH1aBJjkCDM5L3H8kWdoiAoTA/666pY
	T5LMrG36Y33pFJLvggBEfg7BUZuLKgYR4N20CnM=
X-Google-Smtp-Source: 
 AGRyM1sHK0BOKi3sfVYJSquQGZprESYMnJxgmBcMUEL0qNVD3/SP+Uggle7DxxKirWvCoIGyMWryggwE4UjXifUDpog=
X-Received: by 2002:a17:907:cc14:b0:726:3555:ac63 with SMTP id
 uo20-20020a170907cc1400b007263555ac63mr14551862ejc.697.1656693797831; Fri, 01
 Jul 2022 09:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220629113459.8666-1-ranjitsinh.rathod@kpit.com>
In-Reply-To: <20220629113459.8666-1-ranjitsinh.rathod@kpit.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Fri, 1 Jul 2022 22:13:06 +0530
Message-ID: 
 <CACpMEhOsjP1Atv=evnj40ytdc6Oyc-drEP716d8Ym5jdKpuUXw@mail.gmail.com>
Subject: Re: [OE-Core][master][kirkstone][PATCH] ruby: Add ruby-native
 dependency for nativesdk class
To: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000524b3b05e2c11593"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 16:43:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167537

--000000000000524b3b05e2c11593
Content-Type: text/plain; charset="UTF-8"

Ping

On Wed, 29 Jun, 2022, 5:08 pm Ranjitsinh Rathod, <ranjitsinh.rathod@kpit.com>
wrote:

> We need to add ruby-native dependency for nativesdk class too
> to fix the compilation issue
> Earlier this dependency is part of DEPENDS variable but the below
> commit removes it from DEPENDS and add only for
> DEPENDS_append_class-target which triggers the failure in
> nativesdk-ruby:do_compile task
> Link:
> https://git.yoctoproject.org/poky/commit/?h=dunfell&id=6060b500b952754c595fdf5de5de35c886e0e1d5
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc      | 1 +
>  meta/recipes-devtools/ruby/ruby_3.1.2.bb | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/ruby/ruby.inc
> b/meta/recipes-devtools/ruby/ruby.inc
> index ebff5efd1f..efa40331e0 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
>
>  DEPENDS = "zlib openssl libyaml gdbm readline libffi"
>  DEPENDS:append:class-target = " ruby-native"
> +DEPENDS:append:class-nativesdk = " ruby-native"
>
>  SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "
> http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> index 38ba46731b..a9e6765939 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
> @@ -104,4 +104,4 @@ FILES:${PN}-ptest:append:class-target = "\
>      ${libdir}/ruby/${SHRT_VER}.0/*/-test- \
>  "
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>

--000000000000524b3b05e2c11593
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 29 Jun, 2022, 5:08 pm Ranjitsinh Rathod, &lt;=
<a href=3D"mailto:ranjitsinh.rathod@kpit.com">ranjitsinh.rathod@kpit.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We need to add ruby-na=
tive dependency for nativesdk class too<br>
to fix the compilation issue<br>
Earlier this dependency is part of DEPENDS variable but the below<br>
commit removes it from DEPENDS and add only for<br>
DEPENDS_append_class-target which triggers the failure in<br>
nativesdk-ruby:do_compile task<br>
Link: <a href=3D"https://git.yoctoproject.org/poky/commit/?h=3Ddunfell&amp;=
id=3D6060b500b952754c595fdf5de5de35c886e0e1d5" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://git.yoctoproject.org/poky/commit/?h=3Ddunfell&a=
mp;id=3D6060b500b952754c595fdf5de5de35c886e0e1d5</a><br>
<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kp=
it.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>=
&gt;<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@gmail=
.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/ruby/ruby.inc=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.1.2.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">ruby_3.1.2.bb</a> | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ru=
by/ruby.inc<br>
index ebff5efd1f..efa40331e0 100644<br>
--- a/meta/recipes-devtools/ruby/ruby.inc<br>
+++ b/meta/recipes-devtools/ruby/ruby.inc<br>
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5b8c87559=
868796979806100db3f3805 \<br>
<br>
=C2=A0DEPENDS =3D &quot;zlib openssl libyaml gdbm readline libffi&quot;<br>
=C2=A0DEPENDS:append:class-target =3D &quot; ruby-native&quot;<br>
+DEPENDS:append:class-nativesdk =3D &quot; ruby-native&quot;<br>
<br>
=C2=A0SHRT_VER =3D &quot;${@oe.utils.trim_version(&quot;${PV}&quot;, 2)}&qu=
ot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://cache.ruby-lang.org/pub/ruby/$%7B=
SHRT_VER%7D/ruby-$%7BPV%7D.tar.gz" rel=3D"noreferrer noreferrer" target=3D"=
_blank">http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz</=
a> \<br>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.1.2.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">ruby_3.1.2.bb</a> b/meta/reci=
pes-devtools/ruby/<a href=3D"http://ruby_3.1.2.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">ruby_3.1.2.bb</a><br>
index 38ba46731b..a9e6765939 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.1.2.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">ruby_3.1.2.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.1.2.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">ruby_3.1.2.bb</a><br>
@@ -104,4 +104,4 @@ FILES:${PN}-ptest:append:class-target =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/ruby/${SHRT_VER}.0/*/-test- \<br>
=C2=A0&quot;<br>
<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.<br>
</blockquote></div>

--000000000000524b3b05e2c11593--

