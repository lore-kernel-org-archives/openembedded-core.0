Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10761.1793364989544704588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 05:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TDGPPw7a;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b09e07e149so5352617b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364988; cv=none;
        d=google.com; s=arc-20260327;
        b=WkVksjsV0eGWZFyYD5Imxv3Nsoqs0uLlKRXvP2ztCriHoiySxgwd6ECSP7oHok3OFN
         4Olzpt91DUT2Omh5c6vMCuIQkTACR7ZLevube0lvB2qORQ7rjOOnVg6W125EZnSgyPgx
         Kcap+OzmIkxdYlbNZL0r+ZXWDsNVgXFf+65RlhfE4gWdIZJXXinInxgDXm0lNV0ytgd1
         lvxZtQDTQWZ1S+dsoUVpds1jGi8AviCXux0Co9LZx3+sFYorNGxqoL0hD30QVDyW52P8
         DSqc4xiPCUNtKqoEalBew8NdJGXuOMlUH+kSj8ERgwvX5hTltqAVTAtGQ7XHlXlDNQVO
         0mVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pKmfbLjgSKr5rgLGjDo+Zyl2yEDElFZemM6BWUfR9WA=;
        fh=Dc7M/NYC+XWAgsAQXsVZfrS+oEsbMTk6OlSI4qIWfk0=;
        b=ImHHg5hfBXi/Zwr2vYHHcaGd1Qcb5v7OOuZVo5dkIBxBAsB4DnWOq5sDKcuYfMIUWQ
         W3/2NU6lk1x4KqpPsg74fem7nQiKOrHMeNg9QcomDalsCN6/jSd/eZBTVcS/q6cJbfwx
         Ky1wUww/JjhuiyFYez+37jWe6uLqWxnd5PQU7T0MixOLMEUCuSECGWH5bq+Q3LnMJaKc
         s9o63F6fHZ0PAK9bSLITX5gUU6Twbd7ZutwOY4fKomUTrbDOJQfdwhl1zWrejNUV3p5a
         sRW00hu7m3ukgVDVfpn+UEkk/uvtLCp4HZiKFCD+xt3HjlVP1MyRqQL6Z71Z+j1Hz68d
         /hPA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364988; x=1793969788; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKmfbLjgSKr5rgLGjDo+Zyl2yEDElFZemM6BWUfR9WA=;
        b=TDGPPw7aAGt9PIJoM3syTVZBOjSdBa2+bIasvyqbfAsurq7qs6cqULasNoFeCz+Mdy
         9BYpwsCw1MJBYbNTi9Ycr9lyMztL5Pl/XuDuGdv2fAVWu+nHSTbV5UztOb+SiCOSJ88y
         uQc51pqg+C0GBdQyxqL5fmUIzshokO7QTlkcvyLXadOP+FRRP89P5pzqS6Tu/OzHFV0w
         TOmZl4LuH26tEBPvDGB01QwRY6Wj25WwOiEjs6xfnDTgsRmBA2XGbwYukD2X3qXrPcx4
         NFPIJHyI0dhqBqseJdQEtWb/OpQvWyiDauBVsIoJlbCZF3vLE2vtVTBzPMKUvbOP7kpx
         xYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364988; x=1793969788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pKmfbLjgSKr5rgLGjDo+Zyl2yEDElFZemM6BWUfR9WA=;
        b=bOQti9dijofFykqQ06o8oK/mOg1ThjD2IbFtgOBBWEruPbnCjwjQYkJqtFWx6q6QAc
         2YVvR8u8Z7StIKBiEoNUAXF2ISzjI5ly4U7lQF05gJAEnBTsgl2TTfxdWms4zOZUi+AW
         j3s8vpVvYaClNsH9JoSQokCFigITFWLQY1lxqM6O4WMjXFYB2sJuwo/tkf5F3LaQkJ9S
         sWlDcTlRxFR5uOFSvMivcXL8sOZJynIOVEWqM648Yf52AXPbjdCEzJcoafgxUePOIgyf
         kY5Qa1bNL7lSHd9zi/BgOLx9jNKnB8TcaHg2hYPB737BNCLN6cIixAy4k4KiDRe8uDPv
         zqpA==
X-Gm-Message-State: AFq9FYLIcWf9BSR4euu0WWu2HNFTQ8Fd7irtqTnrn4s9o3H+lSR09aDZ
	tTd2zFeYSVsDlTihBFh+fhcasPaiI1k4KaFZkV5Gg0KHqNdTwOrWDkzMXKWf51+2kPPibUyBVMs
	0S8QdgiibWktgD8MtI/Ycz1Q/MfiQ3c8=
X-Gm-Gg: AYBFou2/oAwwYISujR/KgPeyhkMSgWQh46XlKvJqtYnRqhkmUP0ta3MP5ra9LGwPJ1N
	TsN6PcgGzoOrIauEuHy8zNhtYLWutNuUOG3ZNCOkoMfKpHEQQkArzRV73UEJmG0XejXmCbum/HC
	+dUARam1EWVL6mJxmn5oAr1fRXkfpgwr0g4hJWJgvsApczEaDjsvLs8FezdOJJeiIZwsFylfBSj
	3IaG6PrV5+fU4i8WvbBmxjE/pLur+TROu64I2HcWBoKnl/h1Rv9MRav2+mxbnrflNt651SNXUkt
	8pra9MOUrcFaDdsQN0UylHZpQ/EsiXwcYW+AEiKrexhyVTAIHd0DUqyVkc8lzh9sJNUT+SlAgvR
	aaAiT6/ir4TFP3QYslK0KgcoMqb6UUNcYZWt6+T2p9v4FpTKEOvtb9nLaGU7FgssGsgf6rdTVb7
	zrnkFHQi4sF7Xd1IIwN6ctQbpHieBnshHmZ3DAPkpw0ofYmxTlWdRqyhc=
X-Received: by 2002:a05:690c:660c:b0:8b0:9e07:d8b3 with SMTP id
 00721157ae682-8b2b671b69dmr11606417b3.48.1793364988322; Fri, 30 Oct 2026
 05:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261030100214.3111726-1-roshs@qti.qualcomm.com>
In-Reply-To: <20261030100214.3111726-1-roshs@qti.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Oct 2026 08:56:14 -0400
X-Gm-Features: AclHuK807bwaexNQ7XNiVZd8t9omkoywDcG3Q12yMBRigVwiYYUYpxHorjXfh3M
Message-ID: <CADkTA4NWzzaT11ssicpviaA3AgYtOPbpg_HGuciPSttkQUggdQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on sed
To: roshs@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Sumanth Gavini <sumanth.gavini@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000014e762065f0e536f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249035

--00000000000014e762065f0e536f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 6:03=E2=80=AFAM Roshan Sivakumar via openembedded-c=
ore
<roshs=3Dqti.qualcomm.com@lists.openembedded.org> wrote:

> kernel-devsrc ships scripts/mksysmap, which is a sed script
> (#!/bin/sed -f). The package therefore has a runtime dependency on
> sed that was not declared.
>

We probably shouldn't be shipping that script, some broader copies
than I'd prefer of scripts/ have snuck into devsrc over time.

I say "probably" above, because you aren't saying what you are
building that triggered that script to be called at all. From a quick
grep of the kernel it is only linking vmlinux that uses that.

Are you rebuilding the kernel completely from -devsrc ? (which
shouldn't work)  Or doing something else that is triggering it to be
called ?

Bruce


>
> Declare it explicitly in RDEPENDS, alongside the other interpreters
> the kernel scripts need (bc, python3, flex, bison, gawk, ...), rather
> than relying on the packaging backend to infer it from the shebang.
>
> Assisted-by: Claude Code:claude-opus-4.8
> Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 90bdbfc534..92fd0e0c66 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -468,3 +468,5 @@ RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH',
> 'powerpc', 'elfutils-dev', '', d
>  RDEPENDS:${PN} +=3D "gcc-plugins libmpc-dev"
>  # 5.13+ needs grep for powerpc
>  RDEPENDS:${PN}:append:powerpc =3D " grep"
> +# scripts/mksysmap is a #!/bin/sed -f script
> +RDEPENDS:${PN} +=3D "sed"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249012):
> https://lists.openembedded.org/g/openembedded-core/message/249012
> Mute This Topic: https://lists.openembedded.org/mt/122008476/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000014e762065f0e536f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2026 at 6:03=
=E2=80=AFAM Roshan Sivakumar via openembedded-core &lt;roshs=3D<a href=3D"m=
ailto:qti.qualcomm.com@lists.openembedded.org">qti.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">kernel-devsrc ships scripts/mksysmap, which is a sed script<br>
(#!/bin/sed -f). The package therefore has a runtime dependency on<br>
sed that was not declared.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">We probably shouldn&#39;t be s=
hipping that script, some broader copies</div><div class=3D"gmail_default" =
style=3D"font-size:small">than I&#39;d prefer of scripts/ have snuck into d=
evsrc over time.</div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I say &quot;probably&quot; above, because you aren&#39;t s=
aying what you are</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">building that triggered that script to be called at all. From a quick</=
div><div class=3D"gmail_default" style=3D"font-size:small">grep of the kern=
el it is only linking vmlinux that uses that.=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Are you rebuilding the kernel completely from -d=
evsrc ?=C2=A0(which=C2=A0</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">shouldn&#39;t work)=C2=A0 Or doing something else that is trigge=
ring it to be</div><div class=3D"gmail_default" style=3D"font-size:small">c=
alled ?</div></div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Declare it explicitly in RDEPENDS, alongside the other interpreters<br>
the kernel scripts need (bc, python3, flex, bison, gawk, ...), rather<br>
than relying on the packaging backend to infer it from the shebang.<br>
<br>
Assisted-by: Claude Code:claude-opus-4.8<br>
Signed-off-by: Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.co=
m" target=3D"_blank">roshs@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 90bdbfc534..92fd0e0c66 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -468,3 +468,5 @@ RDEPENDS:${PN} +=3D &quot;${@bb.utils.contains(&#39;ARC=
H&#39;, &#39;powerpc&#39;, &#39;elfutils-dev&#39;, &#39;&#39;, d<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;gcc-plugins libmpc-dev&quot;<br>
=C2=A0# 5.13+ needs grep for powerpc<br>
=C2=A0RDEPENDS:${PN}:append:powerpc =3D &quot; grep&quot;<br>
+# scripts/mksysmap is a #!/bin/sed -f script<br>
+RDEPENDS:${PN} +=3D &quot;sed&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249012): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249012" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249012</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122008476/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122008476/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000014e762065f0e536f--
