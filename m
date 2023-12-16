Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B1EC46CCD
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 11:35:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.13545.1702726510503789783
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 03:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDuSdwpX;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cc259392a6so17092431fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 03:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702726508; x=1703331308; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aat4bANIRTa8Fz7Ajqa1M7yorTYx5kFKVe+hMh21x9A=;
        b=iDuSdwpXfd6kfKNZR3o977J9gPMNOG4mQmBfRzkgzG4OsfApeDA9pPP6XuHiwHnom0
         vn8WY/M+2HYbG75C854OcyZVNkvrJeM1fA1i4TW7WC9DkrHgmEKxIKtJZqyS6SXMqI8R
         B+9sDP2cQdu+/ShLQqWU8k/FYRtinJOApE2Xpt1uKapWc7xTmSoaIydrfplOh8uCPKCS
         7AiNyFJ0Sdt7AV/sYfZAptoIh9V3cGBD0IbQGl/lm23gZxTkep0feO3CReBPwuUn/pbc
         /twOD8kPJA3YodqxI3txsO7xIl4NvRvMetdV2rU5dqT9vbQkBNSfdSAugeehee/MqvQk
         +ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702726508; x=1703331308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aat4bANIRTa8Fz7Ajqa1M7yorTYx5kFKVe+hMh21x9A=;
        b=pu4UPl58htNPicNtoZONqZHFk4EDu3WCPb+aC5y8uqynQDn1HhBwXZsVjsavtznAq2
         JW/l+M+Vp6jRgJGo+MeUxSdvXjdn1gY3tqEdXYQJVzCUpfYl2XnXiCplngjYD0X4oN95
         Ey0V3UItXfgy68FAQjrBhCGUn/gPsf4fc3k+z/AhGYUxMClz1UfOX70elJH9ZipatytS
         kcpzSqjpH39a5pVNVx6bhlq3yn9pieKJ4lWyib6NWVYLJ+mD4yBaIXHw4k/+BgQZulmv
         wYcfh6eLxW9F3wIeAkvI6Pcf5YXYmRe01InTqbupYPIVcRvTBxu22Y5PWh0FK+PFMe49
         cbjw==
X-Gm-Message-State: AOJu0YxS6XlxZyZ20vJrcz048xLbOmreTzA8mWRcA4N5MJFV6NLGSNwI
	eey2hpq1mD9cv+OZsgpaPs7rei+W+ZliuKlESmY=
X-Google-Smtp-Source: AGHT+IFASO4/SydjlehTZKqPW4KhocTs544mvOVe0i97FbLRJ1+rRpA8tWX7eOFeXYgtEf2a1SkfVI8Pdvmo/o/vOnE=
X-Received: by 2002:ac2:46c6:0:b0:50e:2d2d:7582 with SMTP id
 p6-20020ac246c6000000b0050e2d2d7582mr113847lfo.137.1702726507988; Sat, 16 Dec
 2023 03:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20231216002503.3681891-1-quic_vkraleti@quicinc.com>
In-Reply-To: <20231216002503.3681891-1-quic_vkraleti@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Dec 2023 12:34:57 +0100
Message-ID: <CANNYZj8GSbSGGDGWSchn5G=mqv7z99g2p_KVgnDcwO=LSJXALg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd-boot: Add recipe to compile native
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a88e06060c9ee890"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 11:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192556

--000000000000a88e06060c9ee890
Content-Type: text/plain; charset="UTF-8"

Can we rather fold it into systemd-boot with bbassextend?

Alex

On Sat 16. Dec 2023 at 1.26, Viswanath Kraleti <quic_vkraleti@quicinc.com>
wrote:

> systemd-boot native recipe provides ukify tool to build
> UKI images for systemd-boot
>
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> new file mode 100644
> index 0000000000..73db59b14e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> @@ -0,0 +1,15 @@
> +require systemd.inc
> +
> +inherit native
> +
> +deltask do_configure
> +deltask do_compile
> +
> +do_install () {
> +       install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +}
> +addtask install after do_unpack
> +
> +PACKAGES = "${PN}"
> +
> +FILES:${PN} = "${bindir}/ukify"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192554):
> https://lists.openembedded.org/g/openembedded-core/message/192554
> Mute This Topic: https://lists.openembedded.org/mt/103202155/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a88e06060c9ee890
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can we rather fold it into systemd-boot with bbassextend?=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 16. Dec=
 2023 at 1.26, Viswanath Kraleti &lt;<a href=3D"mailto:quic_vkraleti@quicin=
c.com">quic_vkraleti@quicinc.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
systemd-boot native recipe provides ukify tool to build<br>
UKI images for systemd-boot<br>
<br>
Signed-off-by: Viswanath Kraleti &lt;<a href=3D"mailto:quic_vkraleti@quicin=
c.com" target=3D"_blank">quic_vkraleti@quicinc.com</a>&gt;<br>
---<br>
=C2=A0.../systemd/<a href=3D"http://systemd-boot-native_254.4.bb" rel=3D"no=
referrer" target=3D"_blank">systemd-boot-native_254.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-boot-native_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-n=
ative_254.4.bb</a><br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot-nativ=
e_254.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_254.4.=
bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot-native_25=
4.4.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_254.4.bb</=
a><br>
new file mode 100644<br>
index 0000000000..73db59b14e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot-native_254.4=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot-native_254.4.bb</a><=
br>
@@ -0,0 +1,15 @@<br>
+require systemd.inc<br>
+<br>
+inherit native<br>
+<br>
+deltask do_configure<br>
+deltask do_compile<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${=
bindir}/ukify<br>
+}<br>
+addtask install after do_unpack<br>
+<br>
+PACKAGES =3D &quot;${PN}&quot;<br>
+<br>
+FILES:${PN} =3D &quot;${bindir}/ukify&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192554): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192554" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192554</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103202155/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103202155/1686489</a><br>
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

--000000000000a88e06060c9ee890--

