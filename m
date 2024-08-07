Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED99C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 04:18:06 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.25782.1723004282514991892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 21:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNNFiBgd;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efd530a4eso1965462e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723004280; x=1723609080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJsPZkJ6u14nljkfTQK37fS8vhsQl7lB78F02r+8cfQ=;
        b=VNNFiBgdm53PqpsMP9Ie2reHb+UQLWy/ZjlyipIxL7skfS4iIp6mLd0Bl3E2msLnin
         voUua7nEidgUKGVHsN8VZzx4GKbcaR9LeHtaibJk2QA2K/NL2IIy7PNhXGvaXK6Wky7w
         K9PMUp8Ze8jlrS2iTQuSvZWeFq3d7AsxuipS0Iqge/l8E6cyoqi9tYL7DE94YZqTsQ1A
         CVZC8M32DBLexcUjZHUyf7lmkWBwguVi6Hty/DwLIMRCBVCKSZBli2afUMeUGyBnJGXw
         I1sj1qZQd19A5BGsMZCTnAb8iTKalg3yfUbTFU2IFoy8dZdw0tqYGQOgjgPUuw6XRdcm
         Ep9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723004280; x=1723609080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJsPZkJ6u14nljkfTQK37fS8vhsQl7lB78F02r+8cfQ=;
        b=OfNzlJ7/WKoeFN46Aq+BbzxARps2jx0fQRrEPthQGLIeIsrWMc10eIXlMZQ4M/jJ84
         mIluoCgHLJ5hAoV8TbHHR0y3n78pjkXlgkBkHNYLvL5RyVYfjB37Na2vj5qT3nG/WTex
         JOi2eyN6ffsv+uTHpBMoeuTXsgLJloJko9CPUR4SdK/xL1Gt8tXs5kCb/2QEsMpZF+pZ
         2gWDloTOAYmSar0AYizQYAn/sZUr02DME2E/7e2BIMDats6HIEu/hbnRuw/WR8au70ZF
         W0X/wlWKmwnM2aMYxvKKXzADNxCUrxvXh62qx976ec1lRZtjx3kUJHQ9gFYh3Axw5WLe
         fBKA==
X-Gm-Message-State: AOJu0YwPJ5suanAZvy5di1gF6FcTDr52T1zamVGrl9ylX5OpQKv9Itop
	DIBW3DpZKNCmEJWL2rCQXonZNQRUO2n7VgYetUS/kHR6avardpkMfOkSbv1yLtOD4gAwtWFZkbk
	Bnc7AwQLUjxE0IGh8UjstBt5vPUo=
X-Google-Smtp-Source: AGHT+IExkgL0z5B1m8ALs8r6E97K5C1RX5dqDFjZs6KzMfKfIWYFdIPu88tjOxbANYX3OVo4n9/xtWm+dROHE0ZcV+0=
X-Received: by 2002:a05:6512:2209:b0:52e:9670:e40b with SMTP id
 2adb3069b0e04-530bb39b7bfmr11791273e87.39.1723004279561; Tue, 06 Aug 2024
 21:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240807033404.1513069-1-Qi.Chen@windriver.com>
In-Reply-To: <20240807033404.1513069-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Aug 2024 07:17:48 +0300
Message-ID: <CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kexec-tools: avoid kernel warning
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000007a671061f1032f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 04:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203053

--00000000000007a671061f1032f7
Content-Type: text/plain; charset="UTF-8"

What is oe specific in this patch and why that makes it inappropriate for
upstream? Please do explain.

I think it should be sent upstream.

Alex

On Wed 7. Aug 2024 at 6.34, Chen Qi via lists.openembedded.org <Qi.Chen=
windriver.com@lists.openembedded.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Running command 'kexec -p /path/to/crash-kernel --reuse-cmdline' will
> give out the following warning:
>
>   kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL set
>
> Add MFD_NOEXEC_SEAL explicitly to avoid such warning.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36 +++++++++++++++++++
>  .../kexec/kexec-tools_2.0.28.bb               |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644
> meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
>
> diff --git
> a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
> new file mode 100644
> index 0000000000..3b11555a1b
> --- /dev/null
> +++
> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
> @@ -0,0 +1,36 @@
> +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 6 Aug 2024 19:41:30 -0700
> +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
> +
> +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
> +
> +  kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL
> set
> +
> +As the above two flags are only available in newer kernels, ideally
> +we need to do some fallback. But we know for sure that OE scarthgap/master
> +is using >6.6 kernel, so we don't need to do such fallback.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + kexec/kexec.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/kexec/kexec.c b/kexec/kexec.c
> +index 08edfca..c5f52d4 100644
> +--- a/kexec/kexec.c
> ++++ b/kexec/kexec.c
> +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char *kernel_buf,
> size_t size)
> + {
> +       int fd, count;
> +
> +-      fd = memfd_create("kernel", MFD_ALLOW_SEALING);
> ++      fd = memfd_create("kernel", MFD_ALLOW_SEALING | MFD_NOEXEC_SEAL);
> +       if (fd == -1)
> +               return fd;
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
> index f0a484f884..830d9ce585 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
> @@ -19,6 +19,7 @@ SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>
> file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
>             file://Fix-building-on-x86_64-with-binutils-2.41.patch \
>             file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
> +           file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203052):
> https://lists.openembedded.org/g/openembedded-core/message/203052
> Mute This Topic: https://lists.openembedded.org/mt/107763946/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000007a671061f1032f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What is oe specific in this patch and why that makes it i=
nappropriate for upstream? Please do explain.=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I think it should be sent upstream.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 2024 at 6.34=
, Chen Qi via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.openembedded.or=
g">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Running command &#39;kexec -p /path/to/crash-kernel --reuse-cmdline&#39; wi=
ll<br>
give out the following warning:<br>
<br>
=C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEA=
L set<br>
<br>
Add MFD_NOEXEC_SEAL explicitly to avoid such warning.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36 ++++++++++++++++++=
+<br>
=C2=A0.../kexec/<a href=3D"http://kexec-tools_2.0.28.bb" rel=3D"noreferrer"=
 target=3D"_blank">kexec-tools_2.0.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 37 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c=
-add-MFD_NOEXEC_SEAL-flag-explicitly.patch<br>
<br>
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOE=
XEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001=
-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch<br>
new file mode 100644<br>
index 0000000000..3b11555a1b<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEA=
L-flag-explicitly.patch<br>
@@ -0,0 +1,36 @@<br>
+From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17 00:00:00 2001<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 6 Aug 2024 19:41:30 -0700<br>
+Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly<br>
+<br>
+Add MFD_NOEXEC_SEAL to avoid kernel warning like below:<br>
+<br>
+=C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SE=
AL set<br>
+<br>
+As the above two flags are only available in newer kernels, ideally<br>
+we need to do some fallback. But we know for sure that OE scarthgap/master=
<br>
+is using &gt;6.6 kernel, so we don&#39;t need to do such fallback.<br>
+<br>
+Upstream-Status: Inappropriate [OE Specific]<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ kexec/kexec.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/kexec/kexec.c b/kexec/kexec.c<br>
+index 08edfca..c5f52d4 100644<br>
+--- a/kexec/kexec.c<br>
++++ b/kexec/kexec.c<br>
+@@ -655,7 +655,7 @@ static int copybuf_memfd(const char *kernel_buf, size_=
t size)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, count;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create(&quot;kernel&quot;, MFD_ALLOW_SE=
ALING);<br>
++=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create(&quot;kernel&quot;, MFD_ALLOW_SE=
ALING | MFD_NOEXEC_SEAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.28=
.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a> b/meta/=
recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.28.bb" rel=3D"norefe=
rrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
index f0a484f884..830d9ce585 100644<br>
--- a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.28.bb" re=
l=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
+++ b/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.28.bb" re=
l=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.28.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/kernel/=
kexec/kexec-tools-${PV}.tar.gz<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-arm64-kexec-disabled-=
check-if-kaslr-seed-dtb-propert.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-building-on-x86_64-wit=
h-binutils-2.41.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-x86-linux-setup.c-Use=
-POSIX-basename-API.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-kexec.c-add-MFD_NOEXE=
C_SEAL-flag-explicitly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f33d2660b3e38d25a127e87097978e0f7a9a73ab=
5151a29eb80974d169ff6a29&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203052): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203052" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203052</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107763946/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107763946/1686489</a><br>
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

--00000000000007a671061f1032f7--

