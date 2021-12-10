Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C46C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:56:56 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.8916.1639151815344444714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hqDETykW;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id bu11so8403729qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2YbVOCmFUsDEdT+oGKNTDi0hvqHD0aIF8ao28Rvv0Pw=;
        b=hqDETykWpaLy/Yt3hahmbRkBV4w8PiAjz/tNWGYjgQB2EYuci+EuQuvOAa7r1Bx+Qa
         7gjjTSLdkRW5tYc5jCzPJWpfE1mRWLAjMssFcOBNQj/HZYGvrHuJajghjFup/OUOnoKT
         Y460n+NlEfC7seRcwjiq74WBS+oVYtaXmTwwnzYUhfmtPA8MnwjsRFXZb4ZEQBdtaviF
         OoPp2rGa2w2/gwJENuEyUl29hPdgcSxB3e2GK3OnFbkAeSm/SHlgjMMJPHuHlbXbN13Q
         WlfwkTINVL6/55vUSX6zRlGHv0nCxCfcfBj/OuRlln6NiTLb8dOzgvfKvS0tgyLigxoo
         +GkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2YbVOCmFUsDEdT+oGKNTDi0hvqHD0aIF8ao28Rvv0Pw=;
        b=q+BXOlhfI4HlhLb2c73p2vZXlr6HNZ+XXM2u5SjcfNYTXX7iW4WxZbjE2MNda0jhAL
         J8T3VPk4yHbRiQNHvD+xE9DL0YgtK/yp8fGRe1nDCy7J7D8l1Yemr9diUIsK39uXU93e
         8HhqWJGiiLiKGOXAYezdWxWpwmzs0W4qNPOWUmEGP+ycD+QxOQaOcfo4SyMSDd2t/Z6p
         qdHa578la35YZsV/HdkxiPpEEIm4C3vivg1tAiwT6NxEreqMaKCap6SKBbJrCc8oyfG+
         H9TmLiQjgCGr5E4tJCI8mSktndzraEW7fqoWH5nRi/PncKcUBEjms95sNv7qkVKYrR3I
         VSNw==
X-Gm-Message-State: AOAM5339wyilHAg1p4cHDsfKx6zWt1eLeIXq1UHhFi6tdhLHkX6Vjoml
	2m+1/67dY3GhSVIqncb7/O6MPEeFuYT/Gzjmnew=
X-Google-Smtp-Source: 
 ABdhPJxP1C/ohrHwE+/1SsZejVOaT27tAomTeH1r0Au+BBDoOpR/FdZ9ojH3jlG9ghhUuh6PrSyxGcr6QQ4lKNFTlYQ=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr26070940qvr.110.1639151814432;
 Fri, 10 Dec 2021 07:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20211210120524.670148-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211210120524.670148-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Dec 2021 07:56:43 -0800
Message-ID: 
 <CAMKF1spkNvS0BXqXd2r_RMjFnEUKYz4jP-mqPb58tVp1efSkfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Tweak for mips n64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a1e49b05d2ccc541"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:56:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159549

--000000000000a1e49b05d2ccc541
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 4:05 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> With the changes to binutils, perf's direct calls to ld break for mips n6=
4.
> We already have tweaks for n32 so match those with the ones for n64.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/perf/perf.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 7bbc1ad70c5..ec0c6efe15f 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -125,9 +125,11 @@ PERF_SRC ?=3D "Makefile \
>
>  PERF_EXTRA_LDFLAGS =3D ""
>
> -# MIPS N32
> +# MIPS N32/N64
>  PERF_EXTRA_LDFLAGS:mipsarchn32eb =3D "-m elf32btsmipn32"
>  PERF_EXTRA_LDFLAGS:mipsarchn32el =3D "-m elf32ltsmipn32"
> +PERF_EXTRA_LDFLAGS:mipsarchn64eb =3D "-m elf64btsmip"
> +PERF_EXTRA_LDFLAGS:mipsarchn64el =3D "-m elf64ltsmip"
>

Hmm this tells me that the default is not really changed in binutils to use
n64 abi with out the patch to binutils configure

N32 patch above is perhaps fine because that=E2=80=99s not our default

Perhaps we need to check a bit more here as to what=E2=80=99s going on


>  do_compile() {
>         # Linux kernel build system is expected to do the right thing
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159507):
> https://lists.openembedded.org/g/openembedded-core/message/159507
> Mute This Topic: https://lists.openembedded.org/mt/87634357/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a1e49b05d2ccc541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 10, 2021 at 4:05 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">With the chan=
ges to binutils, perf&#39;s direct calls to ld break for mips n64.<br>
We already have tweaks for n32 so match those with the ones for n64.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 7bbc1ad70c5..ec0c6efe15f 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -125,9 +125,11 @@ PERF_SRC ?=3D &quot;Makefile \<br>
<br>
=C2=A0PERF_EXTRA_LDFLAGS =3D &quot;&quot;<br>
<br>
-# MIPS N32<br>
+# MIPS N32/N64<br>
=C2=A0PERF_EXTRA_LDFLAGS:mipsarchn32eb =3D &quot;-m elf32btsmipn32&quot;<br=
>
=C2=A0PERF_EXTRA_LDFLAGS:mipsarchn32el =3D &quot;-m elf32ltsmipn32&quot;<br=
>
+PERF_EXTRA_LDFLAGS:mipsarchn64eb =3D &quot;-m elf64btsmip&quot;<br>
+PERF_EXTRA_LDFLAGS:mipsarchn64el =3D &quot;-m elf64ltsmip&quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hmm this tells m=
e that the default is not really changed in binutils to use n64 abi with ou=
t the patch to binutils configure=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">N32 patch above is perhaps fine because that=E2=80=99s not =
our default=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Perhap=
s we need to check a bit more here as to what=E2=80=99s going on</div><div =
dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux kernel build system is expected to do t=
he right thing<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159507): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159507" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159507</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87634357/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87634357/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a1e49b05d2ccc541--

