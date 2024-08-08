Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A37C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 18:08:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.66675.1723140535366997995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 11:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S+8lZvBy;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so1711463e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723140533; x=1723745333; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLJk6tktA/T3aEvHu9usKtEYaEJsbwFVZopaVqxyr6U=;
        b=S+8lZvBysVHjJVxygfgltNHRXHbNgH/vXffznu6tNCKIZisDBK/SuUhcv8+uq2hheY
         ro+jwumZNXZtRDNBC5oxE252LCBHMKbbB0YVkF1GPMwBXS5NpjEQuxWN82zIZoyYTsoD
         lk2B+EPzoKNwm+ZBn2q7k5SDqlsv1M2EhQcgnpVJNMFOrD8n2zJrJYdqFVPUmUg5dze9
         8huQwXQJbN3n4PCrFXQb7yPocuQ3WBbJsrTOWICGbqcQfgyFg/qUAogWbKozrWiDp+Q4
         0PqQvugnf8a2Rc1lNXsVoCLIhSjdtFWbC9HxJPcT6vBDwgDpBbapN2jnGf6K/9K1/a3g
         +W/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723140533; x=1723745333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLJk6tktA/T3aEvHu9usKtEYaEJsbwFVZopaVqxyr6U=;
        b=e8EtX2ztHbEQywVoRLAl+oCS+yvkeQtnl0D+sm/Cmh2dCAkVoGNL3litA+MWL8sSW1
         0TjGPAF7CWWVQPgrKuzRjXxaCm8QW/O999KZmljpRdBqkZ3gSqQsISzIjBKLiKVLaQI5
         TrIY8vRIPSmYoaFBRh9iwLgdtgipu6zL59rbt07/zrfXrz1hYbbuZw2ZIawQ29lCGJ2F
         RjQM6J9Bx/lFW4EkXcCLLhGKozV1iMIezOa/Zcm2cp/bPFnCNQ1VoQomWLvamk2254Y5
         Y5Fi0undPVx3doUrosQTJoAuugZGgl70EAZcpGV8I4KbYAduvisdzNBP7c026BX+NAjs
         UtCg==
X-Gm-Message-State: AOJu0YyXEq5Ij4hzove5GdArZr5GkbQZ0yq5SoGP+7EqozdOVzXTLeJI
	7/HC34Kb9/CaWlDyXiQIwqpq1nexMdlMGw1kFzsGicaUG0YumxWClHI3jd7gyckEZLyz68SVk0m
	U5Ynhf0PjglPsacnGiPTaFMW+CeI=
X-Google-Smtp-Source: AGHT+IE3Zt8Uav91Si+im8sf+YyNn818gp6TzWy/zdMUHfVEY3ztUl/3meO/vNtWFZ/3xbkEem4qG5YCotAGeBGxRjE=
X-Received: by 2002:a05:6512:696:b0:52c:dd0c:4c57 with SMTP id
 2adb3069b0e04-530e583c4c3mr1710912e87.27.1723140532924; Thu, 08 Aug 2024
 11:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240808171608.1312222-1-ross.burton@arm.com>
In-Reply-To: <20240808171608.1312222-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Aug 2024 21:08:41 +0300
Message-ID: <CANNYZj-Bhps54WVsy0i35HysSvRrmgDsrm_kufyzNzrMr1gn5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: fix build with binutils 2.43 on arm
 with commerical codecs
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005cfbee061f2febd6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 18:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203144

--0000000000005cfbee061f2febd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I know you don=E2=80=99t need to be lectured about pending, but at least do=
 provide
an explanation/plan for it in brackets.

Alex

On Thu 8. Aug 2024 at 20.20, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> binutils 2.43 is stricter with label names, so rename a label to stop
> assembler errors.
>
> [ YOCTO #15570 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...lpdsp_armv5te-fix-label-format-to-wo.patch | 52 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5te-=
fix-label-format-to-wo.patch
>
> diff --git
> a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5t=
e-fix-label-format-to-wo.patch
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5t=
e-fix-label-format-to-wo.patch
> new file mode 100644
> index 00000000000..a5947af668e
> --- /dev/null
> +++
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv5t=
e-fix-label-format-to-wo.patch
> @@ -0,0 +1,52 @@
> +From 0b541aa54b9573d8eef7401a0cc58c422fe60a9a Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 8 Aug 2024 18:04:17 +0100
> +Subject: [PATCH] libavcodec/arm/mlpdsp_armv5te: fix label format to work
> with
> + binutils 2.43
> +
> +binutils 2.43 has stricter validation for labels[1] and results in error=
s
> +when building ffmpeg for armv5:
> +
> +src/libavcodec/arm/mlpdsp_armv5te.S:232: Error: junk at end of line,
> first unrecognized character is `0'
> +
> +Remove the leading zero in the "01" label to resolve this error.
> +
> +[1]
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D226749d5a=
6ff0d5c607d6428d6c81e1e7e7a994b
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + libavcodec/arm/mlpdsp_armv5te.S | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/libavcodec/arm/mlpdsp_armv5te.S
> b/libavcodec/arm/mlpdsp_armv5te.S
> +index 4f9aa48..d315686 100644
> +--- a/libavcodec/arm/mlpdsp_armv5te.S
> ++++ b/libavcodec/arm/mlpdsp_armv5te.S
> +@@ -229,7 +229,7 @@ A .endif
> +   .endif
> +
> +         // Begin loop
> +-01:
> ++1:
> +   .if TOTAL_TAPS =3D=3D 0
> +         // Things simplify a lot in this case
> +         // In fact this could be pipelined further if it's worth it...
> +@@ -241,7 +241,7 @@ A .endif
> +         str     ST0, [PST, #-4]!
> +         str     ST0, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
> +         str     ST0, [PSAMP], #4 * MAX_CHANNELS
> +-        bne     01b
> ++        bne     1b
> +   .else
> +     .if \fir_taps & 1
> +       .set LOAD_REG, 1
> +@@ -333,7 +333,7 @@ T       orr     AC0, AC0, AC1
> +         str     ST3, [PST, #-4]!
> +         str     ST2, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
> +         str     ST3, [PSAMP], #4 * MAX_CHANNELS
> +-        bne     01b
> ++        bne     1b
> +   .endif
> +         b       99f
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> index dea1f545804..fe34b87ccf5 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D " \
>      file://av1_ordering_info.patch \
>      file://vulkan_av1_stable_API.patch \
>      file://vulkan_fix_gcc14.patch \
> +
> file://0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch \
>  "
>
>  SRC_URI[sha256sum] =3D
> "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203143):
> https://lists.openembedded.org/g/openembedded-core/message/203143
> Mute This Topic: https://lists.openembedded.org/mt/107794004/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005cfbee061f2febd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I know you don=E2=80=99t need to be lectured about pendin=
g, but at least do provide an explanation/plan for it in brackets.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 8. Aug 2024 at 2=
0.20, Ross Burton via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembed=
ded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">binutils 2.43 is stricter with label names, so rename a label to stop=
<br>
assembler errors.<br>
<br>
[ YOCTO #15570 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0...lpdsp_armv5te-fix-label-format-to-wo.patch | 52 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_6.1.1.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 53 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavco=
dec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpd=
sp_armv5te-fix-label-format-to-wo.patch b/meta/recipes-multimedia/ffmpeg/ff=
mpeg/0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch<br>
new file mode 100644<br>
index 00000000000..a5947af668e<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavcodec-arm-mlpdsp_armv=
5te-fix-label-format-to-wo.patch<br>
@@ -0,0 +1,52 @@<br>
+From 0b541aa54b9573d8eef7401a0cc58c422fe60a9a Mon Sep 17 00:00:00 2001<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
+Date: Thu, 8 Aug 2024 18:04:17 +0100<br>
+Subject: [PATCH] libavcodec/arm/mlpdsp_armv5te: fix label format to work w=
ith<br>
+ binutils 2.43<br>
+<br>
+binutils 2.43 has stricter validation for labels[1] and results in errors<=
br>
+when building ffmpeg for armv5:<br>
+<br>
+src/libavcodec/arm/mlpdsp_armv5te.S:232: Error: junk at end of line, first=
 unrecognized character is `0&#39;<br>
+<br>
+Remove the leading zero in the &quot;01&quot; label to resolve this error.=
<br>
+<br>
+[1] <a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit=
;h=3D226749d5a6ff0d5c607d6428d6c81e1e7e7a994b" rel=3D"noreferrer" target=3D=
"_blank">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D22=
6749d5a6ff0d5c607d6428d6c81e1e7e7a994b</a><br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+---<br>
+ libavcodec/arm/mlpdsp_armv5te.S | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/libavcodec/arm/mlpdsp_armv5te.S b/libavcodec/arm/mlpdsp_armv5=
te.S<br>
+index 4f9aa48..d315686 100644<br>
+--- a/libavcodec/arm/mlpdsp_armv5te.S<br>
++++ b/libavcodec/arm/mlpdsp_armv5te.S<br>
+@@ -229,7 +229,7 @@ A .endif<br>
+=C2=A0 =C2=A0.endif<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Begin loop<br>
+-01:<br>
++1:<br>
+=C2=A0 =C2=A0.if TOTAL_TAPS =3D=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Things simplify a lot in this case<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// In fact this could be pipelined furth=
er if it&#39;s worth it...<br>
+@@ -241,7 +241,7 @@ A .endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0ST0, [PST, #-4]!<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0ST0, [PST, #4 * (=
MAX_BLOCKSIZE + MAX_FIR_ORDER)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0ST0, [PSAMP], #4 =
* MAX_CHANNELS<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A001b<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A01b<br>
+=C2=A0 =C2=A0.else<br>
+=C2=A0 =C2=A0 =C2=A0.if \fir_taps &amp; 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set LOAD_REG, 1<br>
+@@ -333,7 +333,7 @@ T=C2=A0 =C2=A0 =C2=A0 =C2=A0orr=C2=A0 =C2=A0 =C2=A0AC0=
, AC0, AC1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0ST3, [PST, #-4]!<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0ST2, [PST, #4 * (=
MAX_BLOCKSIZE + MAX_FIR_ORDER)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0 =C2=A0ST3, [PSAMP], #4 =
* MAX_CHANNELS<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A001b<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A01b<br>
+=C2=A0 =C2=A0.endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=C2=A0 =C2=A0 =C2=A0 =C2=A099f<br>
+ <br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.1.1.=
bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_6.1.1.bb</a> b/meta/recipes=
-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.1.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ffmpeg_6.1.1.bb</a><br>
index dea1f545804..fe34b87ccf5 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_6.1.1.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_6.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_6.1.1.bb</a><br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://av1_ordering_info.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://vulkan_av1_stable_API.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://vulkan_fix_gcc14.patch \<br>
+=C2=A0 =C2=A0 file://0001-libavcodec-arm-mlpdsp_armv5te-fix-label-format-t=
o-wo.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8684f4b00f94b85461884c3719382f1261f0d9eb=
3d59640a1f4ac0873616f968&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203143): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203143" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203143</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107794004/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107794004/1686489</a><br>
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

--0000000000005cfbee061f2febd6--

