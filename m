Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97575D3612B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 20:08:08 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.29832.1730837283785004934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QXJAyOUh;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb51f39394so49873701fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837282; x=1731442082; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LVohmGgfWckzA5dkMfXXus7dxjNrQ3Um3NuRPm9u8sk=;
        b=QXJAyOUhNB2IcmJOtLBmcIbdTLs6lki1RJuLT2gvHwLpw2ftTxUJpxX0wVDALETBtN
         erTFdfAdCD+vr9cPRn3Rub9pGS1YSlRsbXqqL7LjOJ6uz7FEjSZubWMv+YG9aUncw8vg
         d5HM6XVJ/V7brZd+jlkboDwI7Dm6CETwEK7H9sCTAseP/b7VbK0BPnmYvrWFSVqtV5C8
         5n7CUmZwralAlAJcs5O2gQWnKd6RIxXYjRI581cnHpD+9NY8lacl6lLujCgwspn2Bcg+
         C5S1Q0oPqC6+52ij3AsP7b5yoYiOGCgkxy2PHBn5gSCY+Gn91fOJewK3PbKdqHIIDW/o
         AT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837282; x=1731442082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVohmGgfWckzA5dkMfXXus7dxjNrQ3Um3NuRPm9u8sk=;
        b=AW6UHPHJv/SRm0f0nTpUJ/+ghgSY2QEOKXuiSp57RAiYQJgmuyEpSQVhEW7WeciFM1
         MycwDfRRpmrLHz96U8B9M58w5Qj0SIbUBMz67bFZUqD+qF8JdnGIZoQUD6PZIyNPUzS/
         hjynQUO1uqyMpuF9/h8snEFUCznXj0PVCzS9FLsJk3QyoKLNNb4mr5cRt6+K0nvIsXfm
         QQmSSpxiYK4gl+6QyKxWIZa3zhar2/hoCi0kM2fa3RQiC0zyvkaJ5/AyEl5UOtEfuJpK
         zjIjG/FAPt/VehHhqpNNVvUyZuGXKaN6hEWcFWY/UjhoYnpCxn0FNmBldJpSTCLGt6rE
         IAkw==
X-Gm-Message-State: AOJu0YyC87YgweKpn2sCcnhCylycsvGxb/cHFvBiyqC+lWlIpCPZYbNe
	XdaRklo+5fFVHBomA/DcO4rBGfq15UBWNFzGufkN2w0V66/+C9+AIREi0/GRxpr5NlZenKy5pqo
	IZRRzJTrunlG0hrSAZ7K3gATb21A=
X-Google-Smtp-Source: AGHT+IEcUFTtfxwnWxp6N/LcAVB0+Vd3mqZq+u2gCCOOuURXgfUJQa3GCLS+tflo66zQjalBbGiv9WzAR29CNCnKHU0=
X-Received: by 2002:a05:651c:154a:b0:2fb:7e65:cb27 with SMTP id
 38308e7fff4ca-2fcbdf68bf5mr213899471fa.6.1730837280424; Tue, 05 Nov 2024
 12:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20241105194857.3351281-1-ross.burton@arm.com> <20241105194857.3351281-4-ross.burton@arm.com>
In-Reply-To: <20241105194857.3351281-4-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Nov 2024 21:07:49 +0100
Message-ID: <CANNYZj8sK8_i0wSMaiHMWL_qEvvDgEqVfTEcsRGrJ8Yh3nPrtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000438be606262ff58b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206753

--000000000000438be606262ff58b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While we=E2=80=99re at it, should we also remove the dangerous items from
debug-tweaks and require them to be enabled explicitly?

Alex

On Tue 5. Nov 2024 at 20.49, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> debug-tweaks is vague and doesn't give any indication that the root user
> can login over SSH without a password.  This behaviour is incredibly
> dangerous if used unwittingly, so discourage it by using the underlying
> features explicitly to spell out exactly what is being done.
>
> This is not the complete set of features that debug-tweaks enables,
> but I don't think we need to enable serial-autologin-root or
> post-install-logging by default.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-poky/conf/templates/default/local.conf.sample | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-poky/conf/templates/default/local.conf.sample
> b/meta-poky/conf/templates/default/local.conf.sample
> index 72d35662940..cfa77106ab3 100644
> --- a/meta-poky/conf/templates/default/local.conf.sample
> +++ b/meta-poky/conf/templates/default/local.conf.sample
> @@ -145,8 +145,8 @@ DISTRO ?=3D "poky"
>  # There are other application targets that can be used here too, see
>  # meta/classes-recipe/image.bbclass and
>  # meta/classes-recipe/core-image.bbclass for more details.
> -# We default to enabling the debugging tweaks.
> -EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
> +# We default to allowing root login without a password for convenience.
> +EXTRA_IMAGE_FEATURES ?=3D "allow-empty-password empty-root-password
> allow-root-login"
>
>  #
>  # Additional image features
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206751):
> https://lists.openembedded.org/g/openembedded-core/message/206751
> Mute This Topic: https://lists.openembedded.org/mt/109412890/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000438be606262ff58b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><span style=3D"font-family:-apple-system,helveticaneue;font-size:=
16px;font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:n=
one;float:none;display:inline!important;background-color:rgba(0,0,0,0);bord=
er-color:rgb(0,0,0);color:rgb(0,0,0)">While we=E2=80=99re at it, should we =
also remove the dangerous items from debug-tweaks and require them to be en=
abled explicitly?</span></div><br></div><div dir=3D"auto">Alex=C2=A0</div><=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue 5. Nov 2024 at 20.49, Ross Burton via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:ar=
m.com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">debug-tweaks is vague and doesn&#39;t give any i=
ndication that the root user<br>
can login over SSH without a password.=C2=A0 This behaviour is incredibly<b=
r>
dangerous if used unwittingly, so discourage it by using the underlying<br>
features explicitly to spell out exactly what is being done.<br>
<br>
This is not the complete set of features that debug-tweaks enables,<br>
but I don&#39;t think we need to enable serial-autologin-root or<br>
post-install-logging by default.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-poky/conf/templates/default/local.conf.sample | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-poky/conf/templates/default/local.conf.sample b/meta-poky=
/conf/templates/default/local.conf.sample<br>
index 72d35662940..cfa77106ab3 100644<br>
--- a/meta-poky/conf/templates/default/local.conf.sample<br>
+++ b/meta-poky/conf/templates/default/local.conf.sample<br>
@@ -145,8 +145,8 @@ DISTRO ?=3D &quot;poky&quot;<br>
=C2=A0# There are other application targets that can be used here too, see<=
br>
=C2=A0# meta/classes-recipe/image.bbclass and<br>
=C2=A0# meta/classes-recipe/core-image.bbclass for more details.<br>
-# We default to enabling the debugging tweaks.<br>
-EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;<br>
+# We default to allowing root login without a password for convenience.<br=
>
+EXTRA_IMAGE_FEATURES ?=3D &quot;allow-empty-password empty-root-password a=
llow-root-login&quot;<br>
<br>
=C2=A0#<br>
=C2=A0# Additional image features<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206751): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206751" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206751</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109412890/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109412890/1686489</a><br>
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

--000000000000438be606262ff58b--

