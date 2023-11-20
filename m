Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C889BC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:17:45 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.1798.1700500658523625558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMnklMNL;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b2e4107f47so3345769b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 09:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700500658; x=1701105458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fENz7eAXN2qcT671wPU7JtqrAqjRpaeh2xfkr9HhbcM=;
        b=gMnklMNLoZdNYk54laSFNk/U9QM8auKacr69wmlFOxfnQU/TDFwVJLPcoVXA1u6BTj
         +HjVatW8E5cwfENUL5LWX/yZLOI+9WwVBrBpdX/1GXro3mGO6of2LFzVD1d/b/85XgFc
         GA0uDSbfwsN86nq22yUMkxblQwZiOtxZp1aqbIqtCmENaM09wDUZB2ZBb0foLGPZsmNc
         8bXi+hZkAnWsC7UYgJJ3S5TdCzNk+Yd39KKehuStaAXPpjQCV86Vm7OqfwmSvt6IcL3j
         wIC2wYWiQQYajvfCiLkSJ/GfoHf8pscGG+epwnWwV1dS6qje7+EZkPJf38zZPKThA3Cs
         IdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500658; x=1701105458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fENz7eAXN2qcT671wPU7JtqrAqjRpaeh2xfkr9HhbcM=;
        b=C+MWyElC+p6JOQZLnZpMg/TSrHaKD5t/g58YouXFZIXWnBiFOrkt7LjpszVBAncZt6
         YE9X0/dEPcYVJT3tGCWMeOPoLAGW4kzGr20l032fhR8lyvt5NrY6HNqB+arUd5xZoSSW
         +9sNxnWdqJzxYqwn2dzbzrNSc2AYgWPRuhgsYhzEYWyqYaOdR/RH3TxrExGpOPhnKeXu
         LCRs3tO4AH+3iD7x3k5gAeKNbTMTWildgVOxeoJtEYuEoFc6EiRYsZJFQ0xgNY89lFCP
         czWZJQjzFClozjxRUJfd6BPUFHxeMTHAFlAXijI+Pcj+dh1b4sw2eYblRfLWEU8bEVUM
         H6XA==
X-Gm-Message-State: AOJu0Yx5McbqvS30SPbx6UXMoCf8QFdMQJvRt73Vtt9R/XLnOdG56N2a
	AxYM1a1Apo7gUhHpF26hUih8IxbhqwDGdDc/bPp8VFsjwr8=
X-Google-Smtp-Source: AGHT+IG2xNEbnxKolu9xdttgFG2C8hWA6DV3ndhzWyCAJYrHBd0xTLdxDtnlnBC4Scsi7Yx0pvjMHlgIndAl72sruZY=
X-Received: by 2002:a05:6808:150d:b0:3b6:da98:4381 with SMTP id
 u13-20020a056808150d00b003b6da984381mr12619363oiw.33.1700500657799; Mon, 20
 Nov 2023 09:17:37 -0800 (PST)
MIME-Version: 1.0
References: <20231120144628.52664-1-adrian.freihofer@siemens.com> <20231120144628.52664-3-adrian.freihofer@siemens.com>
In-Reply-To: <20231120144628.52664-3-adrian.freihofer@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 Nov 2023 17:17:26 +0000
Message-ID: <CANPvuRmdbP1EoDtRgkfsrm_u=KR8DMJDf_jjANvDNiDz31cVcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000a60400060a98a959"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 17:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190925

--000000000000a60400060a98a959
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

Adrian Freihofer <adrian.freihofer@gmail.com> escreveu no dia segunda,
20/11/2023 =C3=A0(s) 14:46:

> Provide an easy way to enable cmake-qemu e.g. on distro level for all
> recipes inheriting the cmake.bbclass.
>
> Therefore a new variable is introduced: OECMAKE_EXEWRAPPER_QEMU.
>
> If set to "1" all recipes built with CMake can use qemu to execute
> cross-compiled binaries on the build machine.
> One use case is the execution of cross-compiled unit tests or ptests,
> e.g. in an SDK context. Therefore, a variable that activates Qemu for
> all CMake recipes is much more useful than just providing the optional
> cmake-qemu.bbclass.
> Further information can be found in the CMake documentation in the
> CMAKE_CROSSCOMPILING_EMULATOR section.
>
> There are some use cases for qemu-user, but users should not be
> encouraged to use it as an alternative for clean cross-compilation.
> Since the core does not need it either it is optional.
>

Are you sure this works in the majority of scenarios?
Last time I worked on this qemu user mode failed to run
multithreading applications.

Jose


> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-recipe/cmake.bbclass
> b/meta/classes-recipe/cmake.bbclass
> index d978b88944..4d8e2a206f 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -14,6 +14,10 @@ B =3D "${WORKDIR}/build"
>  # The supported options are "Unix Makefiles" or "Ninja".
>  OECMAKE_GENERATOR ?=3D "Ninja"
>
> +# qemu-user can be used for special use cases, but not by default
> +OECMAKE_EXEWRAPPER_QEMU ??=3D "0"
> +inherit ${@'cmake-qemu' if d.getVar('OECMAKE_EXEWRAPPER_QEMU') else ''}
> +
>  python() {
>      generator =3D d.getVar("OECMAKE_GENERATOR")
>      if "Unix Makefiles" in generator:
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190880):
> https://lists.openembedded.org/g/openembedded-core/message/190880
> Mute This Topic: https://lists.openembedded.org/mt/102708283/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a60400060a98a959
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Adrian,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Adrian Freihofer &lt;<a href=3D"mailto:adri=
an.freihofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; escreveu no dia =
segunda, 20/11/2023 =C3=A0(s) 14:46:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Provide an easy way to enable cmake-qemu e.g. on distr=
o level for all<br>
recipes inheriting the cmake.bbclass.<br>
<br>
Therefore a new variable is introduced: OECMAKE_EXEWRAPPER_QEMU.<br>
<br>
If set to &quot;1&quot; all recipes built with CMake can use qemu to execut=
e<br>
cross-compiled binaries on the build machine.<br>
One use case is the execution of cross-compiled unit tests or ptests,<br>
e.g. in an SDK context. Therefore, a variable that activates Qemu for<br>
all CMake recipes is much more useful than just providing the optional<br>
cmake-qemu.bbclass.<br>
Further information can be found in the CMake documentation in the<br>
CMAKE_CROSSCOMPILING_EMULATOR section.<br>
<br>
There are some use cases for qemu-user, but users should not be<br>
encouraged to use it as an alternative for clean cross-compilation.<br>
Since the core does not need it either it is optional.<br></blockquote><div=
><br></div><div>Are you sure this works in the majority of scenarios?<br>La=
st time I worked on this qemu user mode failed to run multithreading=C2=A0a=
pplications.</div><div><br>Jose</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cmake.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.=
bbclass<br>
index d978b88944..4d8e2a206f 100644<br>
--- a/meta/classes-recipe/cmake.bbclass<br>
+++ b/meta/classes-recipe/cmake.bbclass<br>
@@ -14,6 +14,10 @@ B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0# The supported options are &quot;Unix Makefiles&quot; or &quot;Ninja=
&quot;.<br>
=C2=A0OECMAKE_GENERATOR ?=3D &quot;Ninja&quot;<br>
<br>
+# qemu-user can be used for special use cases, but not by default<br>
+OECMAKE_EXEWRAPPER_QEMU ??=3D &quot;0&quot;<br>
+inherit ${@&#39;cmake-qemu&#39; if d.getVar(&#39;OECMAKE_EXEWRAPPER_QEMU&#=
39;) else &#39;&#39;}<br>
+<br>
=C2=A0python() {<br>
=C2=A0 =C2=A0 =C2=A0generator =3D d.getVar(&quot;OECMAKE_GENERATOR&quot;)<b=
r>
=C2=A0 =C2=A0 =C2=A0if &quot;Unix Makefiles&quot; in generator:<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190880): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190880" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190880</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102708283/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102708283/5052612</a><br>
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

--000000000000a60400060a98a959--

