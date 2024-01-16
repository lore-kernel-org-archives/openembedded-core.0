Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF484C47258
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 09:03:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.8932.1705395788649766674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Qa/IJ00P;
 spf=pass (domain: snapchat.com, ip: 209.85.208.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-557a3ce9942so10573550a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 01:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705395786; x=1706000586; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxVAEuUjgXgNTdeysSW4BZp4c3/U/P+FHaRURzI9BUw=;
        b=Qa/IJ00Pw+NH4hzVKeRdlOTzw23h5MhtjWLQ3v27Mw2q2eQ0wO/mSixYagqs+PNcOL
         d9iVb8KQv0Zl5NZgOU/Dv3UPpXtcbWt9Bk0CIZA8Ii/LAH+yAiSsZN0fJHqUgjwForN1
         +r36o1ypbJy5gzlfTBa/4aDBy8KmLZ/qfXAJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395786; x=1706000586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxVAEuUjgXgNTdeysSW4BZp4c3/U/P+FHaRURzI9BUw=;
        b=EyxSH7+j9EwPvGP6vAlzpT2s5Sev0jwZcB4hZ5m/pQQ3EuMXLocelOYeihm7vgNcB1
         55hM0J99R1Gv7duQ0kREymLAGYlNYAm8Rri3ckOq+ptuA10MdOiQm6hwvcg6H8yVGY4R
         VxQhlBQFRwsLMo8E/IxfNfqX6Yt4JoSD4MdNfk9BJ1h0A8yvHHemo6lXjugzNxqfVjZl
         9GOf0Hptvn3sPv6Gerk1ruJmpZqO1gf2Fr6Kbqu4qr8IGjx3hLOP1T6fSvCcCTW7AmgB
         V/ekBAPY5uzGftR/ulHg+cdfxlVOLHN/TqS/9cwKzyK6nKZmqF2so0qcNQiLzyJJwFN9
         mFSA==
X-Gm-Message-State: AOJu0YyMZVNL7Uaot/l2i8LwcQ37ZNjrC6IDVDpa5hmj/kXw3BiBOrXV
	rwXHoj3Mb5kTsHboi1GpdYw31scbfAhuvqqA0Z8KHpj4mDi96c2qGAJrL0BmG2fZWQ==
X-Google-Smtp-Source: AGHT+IG0LKMt1EULWw3+eShR+63/HFz1mnCobnW58rZn1X9QiRk+L9jo/goH+GyHVsyL9JOHZd/1SXmJ/2r4BoYMZac=
X-Received: by 2002:a17:906:d189:b0:a2b:a568:39fd with SMTP id
 c9-20020a170906d18900b00a2ba56839fdmr2359962ejz.210.1705395786483; Tue, 16
 Jan 2024 01:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20240116090219.220432-1-ecordonnier@snap.com>
In-Reply-To: <20240116090219.220432-1-ecordonnier@snap.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 16 Jan 2024 10:02:55 +0100
Message-ID: <CAHUKmYYJA3nOZupx3bDKh28x_uW2-GaQRfbD9b22-YZ1rrO=rw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] cmake.bbclass: add Darwin support
To: openembedded-core@lists.openembedded.org
Cc: Dominik Schnitzer <dominik@snap.com>
Content-Type: multipart/alternative; boundary="0000000000000ea31d060f0c661f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193844

--0000000000000ea31d060f0c661f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I fixed a typo in the commit message: "directory -> directly".

On Tue, Jan 16, 2024 at 10:02=E2=80=AFAM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> This was initially added by
> https://git.yoctoproject.org/meta-darwin/commit/?id=3D97a84e083d0c2812e44=
231d48fb478e9a9cfac79
> to the meta-darwin repository, however having it directly in
> openembedded-core will make the maintenance of meta-darwin easier.
>
> Signed-off-by: Dominik Schnitzer <dominik@snap.com>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/cmake.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes-recipe/cmake.bbclass
> b/meta/classes-recipe/cmake.bbclass
> index d978b88944..1e353f660f 100644
> --- a/meta/classes-recipe/cmake.bbclass
> +++ b/meta/classes-recipe/cmake.bbclass
> @@ -72,6 +72,8 @@ OECMAKE_TARGET_COMPILE ?=3D "all"
>  OECMAKE_TARGET_INSTALL ?=3D "install"
>
>  def map_host_os_to_system_name(host_os):
> +    if host_os.startswith('darwin'):
> +        return 'Darwin'
>      if host_os.startswith('mingw'):
>          return 'Windows'
>      if host_os.startswith('linux'):
> --
> 2.36.1.vfs.0.0
>
>

--0000000000000ea31d060f0c661f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I fixed a typo in the commit message: &quot;directory -&gt=
; directly&quot;.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Jan 16, 2024 at 10:02=E2=80=AFAM &lt;<a href=3D"ma=
ilto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &lt=
;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap=
.com</a>&gt;<br>
<br>
This was initially added by <a href=3D"https://git.yoctoproject.org/meta-da=
rwin/commit/?id=3D97a84e083d0c2812e44231d48fb478e9a9cfac79" rel=3D"noreferr=
er" target=3D"_blank">https://git.yoctoproject.org/meta-darwin/commit/?id=
=3D97a84e083d0c2812e44231d48fb478e9a9cfac79</a><br>
to the meta-darwin repository, however having it directly in openembedded-c=
ore will make the maintenance of meta-darwin easier.<br>
<br>
Signed-off-by: Dominik Schnitzer &lt;<a href=3D"mailto:dominik@snap.com" ta=
rget=3D"_blank">dominik@snap.com</a>&gt;<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cmake.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.=
bbclass<br>
index d978b88944..1e353f660f 100644<br>
--- a/meta/classes-recipe/cmake.bbclass<br>
+++ b/meta/classes-recipe/cmake.bbclass<br>
@@ -72,6 +72,8 @@ OECMAKE_TARGET_COMPILE ?=3D &quot;all&quot;<br>
=C2=A0OECMAKE_TARGET_INSTALL ?=3D &quot;install&quot;<br>
<br>
=C2=A0def map_host_os_to_system_name(host_os):<br>
+=C2=A0 =C2=A0 if host_os.startswith(&#39;darwin&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;Darwin&#39;<br>
=C2=A0 =C2=A0 =C2=A0if host_os.startswith(&#39;mingw&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;Windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0if host_os.startswith(&#39;linux&#39;):<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
</blockquote></div>

--0000000000000ea31d060f0c661f--

