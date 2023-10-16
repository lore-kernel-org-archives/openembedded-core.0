Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA68CDB482
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 16:31:51 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.131732.1697473908646656067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 09:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bnh8R7ad;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-49aa8518df8so3145201e0c.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697473907; x=1698078707; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SxnA4TxRoBoMZod+yPJ3kuAzpkVTM6l+5kRcqFyApQY=;
        b=Bnh8R7adptxUKnM/V88HzZ6UbbGIzrJr/icF9dTXbDv7gfNVbyLwwQJwAui2JMGlEM
         YTpe5bk51H9dIBi0G8wBzfgnKbx2JQFqJENSxa8fLn3vw6qaaQTyNXbEpMkBLVCxjTs4
         SMlPbrUJERNccjY4itCJsWxzFVRchMm0rsBTDEEBOaqoxyb3A9y1uJjSyVMaeWqo2vrO
         cRE59ppiZkGN/wojvM18UoVgExvgCUeqWn9QzlTbVwvbEFUttd6+RLk1Yon9gGt/jcWe
         iEninl+20379gPpxUuk3Vbwmt1DFYYGKBLz64MNjfknIcHPW4D1ikA0Njv6maoCp9/e4
         viiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697473907; x=1698078707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxnA4TxRoBoMZod+yPJ3kuAzpkVTM6l+5kRcqFyApQY=;
        b=eGh5e+eNwBStEXWo21fZlZv6xZV1+ZE1Pb4592vB+FEqYDPQOLI/HbdqkZoefyEvz/
         w2Iqo37C6hMrhttleMKCwGNZ0IVnMc+UpWIWxjGTBDIT47Bu9reUE5+2f/GrNvAMwen6
         4e+alNgpj11oqH1tB8JfqnNRYpj4hpaIsjIngYAGIUcQQnST2TSU7YeT/HOXdIQl9Aei
         OjlayotL+9o2nvbgseZ9K6o1O19OlVV69pjF02vXMUSpq2z7LTZA48raMhhOEoa2c+lP
         WPVLkQiGcz6vLZEwTII54dx1R5Xxd78F1Wo/ZDz6VTVAK/nCPKd+hxz/F19SjlY/ARLZ
         yi2Q==
X-Gm-Message-State: AOJu0YzkgL+RAtb1fYDDXO7b3+vpj3QO+G/va7lqVELZ8kXY7qAbgHxI
	nbgu7wFWZl7wBfYOIuSNR1VAO/qHTWgon13ldkM=
X-Google-Smtp-Source: AGHT+IE50Nw/cAOt0AD6CIoCkBv7Xz+ylNfKyMHna5OoaSAGfHG0CQC9rJrcXww0PU2Vukr3UvUX9jrC7wFxNxoEGVo=
X-Received: by 2002:a05:6122:1790:b0:49d:2a13:58fc with SMTP id
 o16-20020a056122179000b0049d2a1358fcmr4730522vkf.2.1697473907384; Mon, 16 Oct
 2023 09:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org>
In-Reply-To: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 16 Oct 2023 17:31:36 +0100
Message-ID: <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for cryptsetup
To: Erik Schilling <erik.schilling@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Kristian Klausen <kristian@klausen.dk>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000043e8a70607d7f1b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189306

--00000000000043e8a70607d7f1b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Erik Schilling <erik.schilling@linaro.org> escreveu no dia segunda,
16/10/2023 =C3=A0(s) 13:02:

> When building with `cryptsetup` and `tpm2` in the
> PACKAGECONFIG, this plugin will be emitted.
>
> Cc: Kristian Klausen <kristian@klausen.dk>
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> Cc: Javier Tia <javier.tia@linaro.org>
> Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> index 77724eb822..6ecfbaf293 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
>                  ${rootlibexecdir}/systemd/* \
>                  ${rootlibdir}/systemd/libsystemd-core* \
> +
> ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
>

The systemd-cryptenroll was packed in the systemd-extra-utils so packing
the plugin
on the main systemd package is a bit weird.
I wonder if a new package like systemd-crypt is better appropriate for this
where we
going to put the systemd-cryptenroll and all the plugins available in
${rootlibdir}/cryptsetup

Jose

                 ${libdir}/pam.d \
>                  ${nonarch_libdir}/pam.d \
>                  ${systemd_unitdir}/* \
>
> ---
> base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189288):
> https://lists.openembedded.org/g/openembedded-core/message/189288
> Mute This Topic: https://lists.openembedded.org/mt/101993740/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000043e8a70607d7f1b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Erik Schilling &lt;<a href=3D"mailto:=
erik.schilling@linaro.org">erik.schilling@linaro.org</a>&gt; escreveu no di=
a segunda, 16/10/2023 =C3=A0(s) 13:02:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">When building with `cryptsetup` and `tpm2` in the<br=
>
PACKAGECONFIG, this plugin will be emitted.<br>
<br>
Cc: Kristian Klausen &lt;<a href=3D"mailto:kristian@klausen.dk" target=3D"_=
blank">kristian@klausen.dk</a>&gt;<br>
Cc: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_=
blank">mikko.rapeli@linaro.org</a>&gt;<br>
Cc: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" target=3D"_blan=
k">javier.tia@linaro.org</a>&gt;<br>
Fixes: 7b7dfbfaed (&quot;systemd: Add tpm2 PACKAGECONFIG&quot;)<br>
Signed-off-by: Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.o=
rg" target=3D"_blank">erik.schilling@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_254.4.bb</a><br>
index 77724eb822..6ecfbaf293 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
@@ -645,6 +645,7 @@ FILES:${PN} =3D &quot; ${base_bindir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/X11/xinit/xinitrc.d/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootlibexec=
dir}/systemd/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootlibdir}=
/systemd/libsystemd-core* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootlibdir}/cryp=
tsetup/libcryptsetup-token-systemd-tpm2* \<br></blockquote><div><br></div><=
div>The systemd-cryptenroll was packed in the systemd-extra-utils so packin=
g the plugin</div><div>on the main systemd package=C2=A0is a bit weird.<br>=
I wonder if a new package like systemd-crypt is better appropriate=C2=A0for=
 this where we</div><div>going to put the systemd-cryptenroll=C2=A0and all =
the plugins available in ${rootlibdir}/cryptsetup</div><div><br>Jose</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/pam=
.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_lib=
dir}/pam.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_uni=
tdir}/* \<br>
<br>
---<br>
base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d<br>
change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726<br>
<br>
Best regards,<br>
-- <br>
Erik Schilling &lt;<a href=3D"mailto:erik.schilling@linaro.org" target=3D"_=
blank">erik.schilling@linaro.org</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189288): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189288" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189288</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101993740/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101993740/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000043e8a70607d7f1b7--

