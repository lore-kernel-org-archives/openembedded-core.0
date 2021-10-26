Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC163C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 20:07:27 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.1960.1635278846696989396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 13:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qrK3tNDl;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id f24so562099uav.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZRpREU35ELPiuG6B92u8T8qjnHQ4a5ZGudf2Mdcsds=;
        b=qrK3tNDlzKPztCB7mvmnrINmk8Ck4BcD8HhdHaCvXd9WUyxYiQd0wmhBTxEskbsBGW
         aP9/duy5iy5OLP1nqhsv8hewic7x5vEEfEaOQmHU0xx1UcHItyYnKL1Sb0Pj0+a7Mv3V
         w3rS5LWPXtoiMbLt8scsZ11kCtOYh9HsSg4rFRT3X+/isPaxJE1zd1uvFEtDr0jOdi5e
         BylJR72l4IW2MeHagcHT0XL/hzmc2lFeYtoXvcqeXFIKixzWPijrykKREJB3GQT182X3
         XccYmMmxsmbn4I8MDvQdPssvP0CwkKC4jZ81IaEYC+NXXceX8jcGZsE59lEmy26QRvPf
         646A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZRpREU35ELPiuG6B92u8T8qjnHQ4a5ZGudf2Mdcsds=;
        b=pP5DT+doicn95xvCs4zQdq/Eyfo2ovqNcgzh56KJkgEwleR2AY2VlV5a2b345mfEfp
         5DqgsQ9bt44zv+K97Q673JwWhAIgSTxh0nDtyhf75AndW7Yv/dN6MogY18yaHtnyD1ce
         iLwwAH5Wq/6qm0/+th74QMxGrQluig9ZduXgQLCs5DcgMmp39lPm4CtxXwgIWTUZTa9g
         3JjX+bQkKnZKy9TFBCcjPWUToH2Zc6XLz1IxKJuVgTtV5+0vyISlMjFM7Ss528iQkWJ8
         ufxg9oprhlXzGhMwYYgD7XstFgwgmYfvV49nh83I/f6NfgEIDve3qjBBGNhpbnko1lbx
         XX3A==
X-Gm-Message-State: AOAM530SVaoZd2TMSn+PZ7C3v3Tn4IwlOxCevfjTew3YxMDSkJGuCrXm
	ZPWGRvZ/s4ITD1YBy/c0X//KPZ6Qmfr8TsVmf7U=
X-Google-Smtp-Source: 
 ABdhPJzoE7ycLP48cflsj5DE/fwFfA8ma7Rj1612QC9L6UFAwclz+v/V8TMcr07uxFIFGi1x2EtFfyojAo6H+Cw2mgo=
X-Received: by 2002:a67:f48d:: with SMTP id o13mr8360396vsn.18.1635278845852;
 Tue, 26 Oct 2021 13:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-24-alex@linutronix.de>
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
In-Reply-To: 
 <CA+chaQc7S7fmdDaWQfqPGv+o6UYrp_hUKgdr08uoegESuDPqew@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Oct 2021 22:07:14 +0200
Message-ID: 
 <CANNYZj8NPhV_b9QapAG=SYqhy60Z6cRxqE76Cpxs=qpjQ0F=7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/25] webkitgtk: update 2.32.3 -> 2.34.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b7409105cf47068e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 20:07:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157451

--000000000000b7409105cf47068e
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Oct 2021 at 21:38, Martin Jansa <martin.jansa@gmail.com> wrote:

> 0200
>
>> +Subject: [PATCH] ANGLE: do not enable SSE on x86
>> +
>> +The code does not actually build there.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> +---
>> + Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h
>> b/Source/ThirdParty/ANGLE/src/common/platform.h
>> +index 41f3cf4f..cab85a82 100644
>> +--- a/Source/ThirdParty/ANGLE/src/common/platform.h
>> ++++ b/Source/ThirdParty/ANGLE/src/common/platform.h
>> +@@ -89,7 +89,7 @@
>> + #if defined(_MSC_VER) && !defined(_M_ARM) && !defined(_M_ARM64)
>> + #    include <intrin.h>
>> + #    define ANGLE_USE_SSE
>> +-#elif defined(__GNUC__) && (defined(__x86_64__) || defined(__i386__))
>> ++#elif defined(__GNUC__) && (defined(__x86_64__))
>> + #    include <x86intrin.h>
>> + #    define ANGLE_USE_SSE
>> + #endif
>>
>
> Can you improve the commit message of this patch to show what "does not
> actually build there"?
>
> Because it fails to build here for qemux86 with:
>
> webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/ThirdParty/ANGLE/src/libANGLE/Constants.h:20:7:
> error: 'size_t' does not name a type
>    20 | const size_t kDefaultMaxProgramCacheMemoryBytes = 0;
>       |       ^~~~~~
>
> and deleting this patch fixes the build.
>

Is it in the same 'building nodistro without enabling opengl' setup? Please
try to use plain poky, with opengl, and you'll see the issue.

Alex

--000000000000b7409105cf47068e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 26 Oct 2021 at 21:38, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">0200<br><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+Subject: [PATCH] ANGLE: do not enable SSE on x86<br>
+<br>
+The code does not actually build there.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ Source/ThirdParty/ANGLE/src/common/platform.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Source/ThirdParty/ANGLE/src/common/platform.h b/Source/ThirdP=
arty/ANGLE/src/common/platform.h<br>
+index 41f3cf4f..cab85a82 100644<br>
+--- a/Source/ThirdParty/ANGLE/src/common/platform.h<br>
++++ b/Source/ThirdParty/ANGLE/src/common/platform.h<br>
+@@ -89,7 +89,7 @@<br>
+ #if defined(_MSC_VER) &amp;&amp; !defined(_M_ARM) &amp;&amp; !defined(_M_=
ARM64)<br>
+ #=C2=A0 =C2=A0 include &lt;intrin.h&gt;<br>
+ #=C2=A0 =C2=A0 define ANGLE_USE_SSE<br>
+-#elif defined(__GNUC__) &amp;&amp; (defined(__x86_64__) || defined(__i386=
__))<br>
++#elif defined(__GNUC__) &amp;&amp; (defined(__x86_64__))<br>
+ #=C2=A0 =C2=A0 include &lt;x86intrin.h&gt;<br>
+ #=C2=A0 =C2=A0 define ANGLE_USE_SSE<br>
+ #endif<br></blockquote><div><br></div><div>Can you improve the commit mes=
sage of this patch to show what &quot;does not actually build there&quot;?<=
/div><div><br></div><div>Because it fails to build here for qemux86 with:</=
div><div><br></div><div>webkitgtk/2.34.0-r0/webkitgtk-2.34.0/Source/ThirdPa=
rty/ANGLE/src/libANGLE/Constants.h:20:7: error: &#39;size_t&#39; does not n=
ame a type<br>=C2=A0 =C2=A020 | const size_t kDefaultMaxProgramCacheMemoryB=
ytes =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br></div>=
<div><br></div><div>and deleting this patch fixes the build.</div></div></d=
iv></blockquote><div><br></div><div>Is it in the same &#39;building nodistr=
o without enabling opengl&#39; setup? Please try to use plain poky, with op=
engl, and you&#39;ll see the issue.</div><div><br></div><div>Alex<br></div>=
</div></div>

--000000000000b7409105cf47068e--

