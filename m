Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF88C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 09:46:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.6099.1666172801876539308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 02:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=google header.b=arOzeXYC;
 spf=pass (domain: gherzan.ro, ip: 209.85.167.41, mailfrom: andrei@gherzan.ro)
Received: by mail-lf1-f41.google.com with SMTP id b2so27185624lfp.6
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K5F/3ayackbW2LeUXvnkTd0nrHkgYHf26B/jmHZRP/c=;
        b=arOzeXYC7aKlLUwVwFWW/ux7VfJ2+oeMNScNGscfI3fkoSU/AIXFC/UcT9GYPnjRcG
         d7vOPuCvGoaZr7GOpxKoXWBm2JoSPEAi5NspdgbRefI/c5dUffwjrPXYczcoilnTZcPJ
         fyQEAuYgCEGi1lDyZ5+MA9hRFIE9GY+tid9ru/GRbf5LRgpInbiO6EGY1wJWkXfQYm/C
         nqtLq3fzUL0B7VCtBuu3cEgz6kIX8+cws2ue2g+m+ZgUBKGCoypfuFrVmMWIMV/M9Gcm
         I8hTOQiX8/sJUFANP3/68h1lL3J6l3doFSP9iAfz7uOJ4imkCyyeE1doX5E5LFzBkTga
         4E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5F/3ayackbW2LeUXvnkTd0nrHkgYHf26B/jmHZRP/c=;
        b=wWvn7kBtcAx6DmcaEuUneJDb6AhoQcwl8JzyFSbW/90e55EM7CHOqOujfZOGGfscv8
         uHnzaz37LzN1vJhS5m5HbHmJ4ffzbWcK1Zn5COZKc97ibZhDe2vuL/8iJCcBrya9R+z1
         q611nfeJrW/7US9ntng5s3+ROZaTfW6hdMwSOTDbhO9I6kvXlOoRKtXC6Vv/UDH01C66
         LOqK4cbv9/e1vtLe3mevOHkb5g2UNwnuRF8zU5G5OVBeCWFH1tSSU81m0DnYAakbZ8gT
         k0RkYux1KOsQ7CcFJlWSzZn/lBC2AE7mFhNLfAZ1po52P/Pxh2tWmVUOtQBBBu3Ng9xl
         o1wg==
X-Gm-Message-State: ACrzQf1xheZxRwH9ULwwA3erB6eJCvE0msd2G+4p5KTgpuKmPBGgX+ud
	M3dc6DAGjL/AeHrtnVjLI+9XlHGLkRzQwqgMJ8qgtg==
X-Google-Smtp-Source: AMsMyM5CId0l5zTnb8iA+eZ158cEan8ih7BZv20/4m5alYht3HjGmhUy5SIpG1HHYtAI6KfOBs8AdSZIGIuE37O2mpc=
X-Received: by 2002:a05:6512:3e6:b0:4a2:3a88:51c9 with SMTP id
 n6-20020a05651203e600b004a23a8851c9mr2427085lfq.562.1666172799647; Wed, 19
 Oct 2022 02:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <171ECBAF5E33994B.19418@lists.openembedded.org> <20221019025450.1626994-1-mingli.yu@windriver.com>
In-Reply-To: <20221019025450.1626994-1-mingli.yu@windriver.com>
From: Andrei Gherzan <andrei@gherzan.com>
Date: Wed, 19 Oct 2022 10:46:03 +0100
Message-ID: <CAK18fxFV_RHbhhdvMaZBaS3G-p0b4cBnS3PKe5kRh6R=imymrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub: disable build on armv7ve/a with hardfp
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000db99ce05eb60155a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 09:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171963

--000000000000db99ce05eb60155a
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Oct 19, 2022 at 3:54 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> The commit(75dbdea940 grub: Allow build on armv7ve/a with softfp)
> enable build on armv7ve/a with softfp, but it acutally enable
> build on armv7ve/a with hardfp altogether and result in below build
> failure:
>  | checking for compile options to get strict alignment...
> -mno-unaligned-access
>  | checking if compiler generates unaligned accesses... no
>  | checking if C symbols get an underscore after compilation... no
>  | checking whether target compiler is working... no
>  | configure: error: cannot compile for the target
>
> So update the check to disable build on armv7ve/a with hardfp.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-bsp/grub/grub2.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub2.inc
> b/meta/recipes-bsp/grub/grub2.inc
> index 2545b99b6a..7161c4560b 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -50,8 +50,8 @@ COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
>  # Grub doesn't support hard float toolchain and won't be able to
> forcefully
>  # disable it on some of the target CPUs. See 'configure.ac' for
>  # supported/unsupported CPUs in hardfp.
> -COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') ==
> 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
> -COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') ==
> 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
> +COMPATIBLE_HOST:armv7a = "${@'null' if
> bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', True, False, d) else
> d.getVar('GRUB_COMPATIBLE_HOST')}"
> +COMPATIBLE_HOST:armv7ve = "${@'null' if
> bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', True, False, d) else
> d.getVar('GRUB_COMPATIBLE_HOST')}"
>

Sounds like a typo on my side. I'll check my testing as I'm curious how
I've managed to miss this. Thanks for fixing it!

Andrei

--000000000000db99ce05eb60155a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 3:54 AM Yu, Mi=
ngli &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank">mingl=
i.yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver=
.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
The commit(75dbdea940 grub: Allow build on armv7ve/a with softfp)<br>
enable build on armv7ve/a with softfp, but it acutally enable<br>
build on armv7ve/a with hardfp altogether and result in below build<br>
failure:<br>
=C2=A0| checking for compile options to get strict alignment... -mno-unalig=
ned-access<br>
=C2=A0| checking if compiler generates unaligned accesses... no<br>
=C2=A0| checking if C symbols get an underscore after compilation... no<br>
=C2=A0| checking whether target compiler is working... no<br>
=C2=A0| configure: error: cannot compile for the target<br>
<br>
So update the check to disable build on armv7ve/a with hardfp.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/grub/grub2.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc<br>
index 2545b99b6a..7161c4560b 100644<br>
--- a/meta/recipes-bsp/grub/grub2.inc<br>
+++ b/meta/recipes-bsp/grub/grub2.inc<br>
@@ -50,8 +50,8 @@ COMPATIBLE_HOST =3D &quot;${GRUB_COMPATIBLE_HOST}&quot;<b=
r>
=C2=A0# Grub doesn&#39;t support hard float toolchain and won&#39;t be able=
 to forcefully<br>
=C2=A0# disable it on some of the target CPUs. See &#39;<a href=3D"http://c=
onfigure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>&#39; for=
<br>
=C2=A0# supported/unsupported CPUs in hardfp.<br>
-COMPATIBLE_HOST:armv7a =3D &quot;${@&#39;null&#39; if d.getVar(&#39;TUNE_C=
CARGS_MFLOAT&#39;) =3D=3D &#39;hardfp&#39; else d.getVar(&#39;GRUB_COMPATIB=
LE_HOST&#39;)}&quot;<br>
-COMPATIBLE_HOST:armv7ve =3D &quot;${@&#39;null&#39; if d.getVar(&#39;TUNE_=
CCARGS_MFLOAT&#39;) =3D=3D &#39;hardfp&#39; else d.getVar(&#39;GRUB_COMPATI=
BLE_HOST&#39;)}&quot;<br>
+COMPATIBLE_HOST:armv7a =3D &quot;${@&#39;null&#39; if bb.utils.contains(&#=
39;TUNE_CCARGS_MFLOAT&#39;, &#39;hard&#39;, True, False, d) else d.getVar(&=
#39;GRUB_COMPATIBLE_HOST&#39;)}&quot;<br>
+COMPATIBLE_HOST:armv7ve =3D &quot;${@&#39;null&#39; if bb.utils.contains(&=
#39;TUNE_CCARGS_MFLOAT&#39;, &#39;hard&#39;, True, False, d) else d.getVar(=
&#39;GRUB_COMPATIBLE_HOST&#39;)}&quot;<br>
</blockquote><br></div><div class=3D"gmail_quote">Sounds like a typo on my =
side. I&#39;ll check my testing as I&#39;m curious how I&#39;ve managed to =
miss this. Thanks for fixing it!</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Andrei<br></div></div>

--000000000000db99ce05eb60155a--

