Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE29C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:45:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.796.1700498722784761300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=REVKSDPS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so11635365e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700498721; x=1701103521; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7+UrHA28P+Js3FyDBIdd3XhZb4WF1waYfZ+0nkZjZIQ=;
        b=REVKSDPSQ4yvNlfwEIKQjoZ24TBmu67YGVpjeQGBl4v8g4DWFA3uujdgqPAsmuiDu2
         b85Gm0Qd9nmrMpJmiS+exDA8LJXua8aoP1CRnZSVsZajHjiHdAxxsWhe3hoPym8rdT6p
         gIWPvekY3t34vbz2+32VJv9EaxIgomzE6CMHgF8qFCJS9FsNzjlwUDTI4vZQn7aDDe0s
         04FSa8+zOMq/ojt5eAfs4xMYCnPI52xoiIDMvGjN3CvCYTvTCSisQkh1Yv2WTwe9JWOz
         1sjI4/GqmolMU7B5WD+2po766dSh5uBalnIi4ZPbQ/0ZXHd6EEyXjZFV6GfGHVwAke2f
         NVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498721; x=1701103521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+UrHA28P+Js3FyDBIdd3XhZb4WF1waYfZ+0nkZjZIQ=;
        b=XSlwf7Yde2J/75IOYdUm250YZz7Ug/Wy8NXryEQKH1HP2DKXNDbKQCJ0UcnflDE3dz
         sbbJsbxgzT18vPF/W4A7zLb2aZBF+AeQz8rZAgKM1T8aKWteD20UmsQNU75cdxqFh9IJ
         QCbYq9xYms+zIMqKR15qDnrKfb7a2DlVpwGdTnT48SGs/0fpfQEFDP0r1byH2z7ThdgN
         CkGSd8aDmEmOT2De2+TCASJGnR1W/z2wlvxsx7whUMcjkdMifsXsBL56xotwr2VRMwhg
         XQ0kT4vuOMPjDJ0Sxunmyxw7n+kVwZnLtAEvamoGZWWQ8y+1eP2B+KsDVpVAwTUgLLqQ
         Zzcg==
X-Gm-Message-State: AOJu0YzfP/5/tlgOCbVWY7KS6mshOlV2W64BT04VWRdMA+2i4lYSP0+D
	l7FkNra+2k0zavLKNCqjxQlXtLVZbo50qnS10bw=
X-Google-Smtp-Source: AGHT+IGDy3wWFikR9kaPupcL46a9ZYEtDjwIRmaIQqi+UTu/FEZDvZGXu1ZZ2VpnDHTW8IIyuGyqBV236uvE1YmQITY=
X-Received: by 2002:a5d:6d83:0:b0:332:c9f5:e5b5 with SMTP id
 l3-20020a5d6d83000000b00332c9f5e5b5mr71961wrs.0.1700498721053; Mon, 20 Nov
 2023 08:45:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700496737.git.steve@sakoman.com> <e0bd7ce93a75c7ddb6b1c572453c37407e7e32da.1700496737.git.steve@sakoman.com>
In-Reply-To: <e0bd7ce93a75c7ddb6b1c572453c37407e7e32da.1700496737.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Nov 2023 17:45:07 +0100
Message-ID: <CA+chaQe2x+xrL5ChW9RzdffcO-CCpyaRj6dSvhzzLO70yLcshA@mail.gmail.com>
Subject: Re: [OE-core][nanbield 11/33] kernel.bbclass: Use strip utility used
 for kernel build in do_package
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000359ed9060a983612"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190923

--000000000000359ed9060a983612
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This requires additional fix from:
https://git.openembedded.org/openembedded-core/commit/?id=3D41f019afc41f800=
b622c46a6d7cf1beffc97716a

Cheers,

On Mon, Nov 20, 2023 at 5:39=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> From: Khem Raj <raj.khem@gmail.com>
>
> os.environ does not pass this down to runstrip() function and in
> strip_execs() its using STRIP bitbake variable to find the strip utility
> to use. Since there might be a trailing whitespace in KERNEL_STRIP
> remove that otherwise python is not able to launch it.
> e.g.
>
> FileNotFoundError: [Errno 2] No such file or directory:
> 'riscv64-yoe-linux-strip '
>
> This is more evident when STRIP and KERNEL_STRIP are different utilities
> e.g. when using clang as default toolchain but using gcc+binutils only fo=
r
> kernel build.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 77497dbdca92ab4d6386a071bc281c42a7e8a14b)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 2ec9ea2091..16b85dbca4 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
>  do_transform_bundled_initramfs[dirs] =3D "${B}"
>
>  python do_package:prepend () {
> -    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
> +    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
>  }
>
>  python do_devshell:prepend () {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190900):
> https://lists.openembedded.org/g/openembedded-core/message/190900
> Mute This Topic: https://lists.openembedded.org/mt/102710661/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000359ed9060a983612
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This requires additional fix from:<div><a=
 href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D41f019=
afc41f800b622c46a6d7cf1beffc97716a">https://git.openembedded.org/openembedd=
ed-core/commit/?id=3D41f019afc41f800b622c46a6d7cf1beffc97716a</a></div><div=
><br></div><div>Cheers,=C2=A0<br></div></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 20, 2023 at 5:39=
=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sa=
koman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
os.environ does not pass this down to runstrip() function and in<br>
strip_execs() its using STRIP bitbake variable to find the strip utility<br=
>
to use. Since there might be a trailing whitespace in KERNEL_STRIP<br>
remove that otherwise python is not able to launch it.<br>
e.g.<br>
<br>
FileNotFoundError: [Errno 2] No such file or directory: &#39;riscv64-yoe-li=
nux-strip &#39;<br>
<br>
This is more evident when STRIP and KERNEL_STRIP are different utilities<br=
>
e.g. when using clang as default toolchain but using gcc+binutils only for<=
br>
kernel build.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 77497dbdca92ab4d6386a071bc281c42a7e8a14b)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 2ec9ea2091..16b85dbca4 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {<br>
=C2=A0do_transform_bundled_initramfs[dirs] =3D &quot;${B}&quot;<br>
<br>
=C2=A0python do_package:prepend () {<br>
-=C2=A0 =C2=A0 os.environ[&#39;STRIP&#39;] =3D d.getVar(&#39;KERNEL_STRIP&#=
39;)<br>
+=C2=A0 =C2=A0 d.setVar(&#39;STRIP&#39;,=C2=A0 d.getVar(&#39;KERNEL_STRIP&#=
39;).strip())<br>
=C2=A0}<br>
<br>
=C2=A0python do_devshell:prepend () {<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190900): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190900" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190900</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102710661/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102710661/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000359ed9060a983612--

