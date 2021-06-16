Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web08.5417.1623837937287618180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=unzHNVJv;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id x13so699539vsf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=dO8KDq/BXTm/K5DhqgkFTt6wve4H+GsCq6pKp31viHc=;
        b=unzHNVJvITfLlA3ZBVBqr1QH5avsVuki9mj4iGpMFAIJReW8cMM0rdWiUJGKvDC7MK
         O6olPFQu5bCfj+5YSVb0x6NQmWg/+TIJ3D1y8dgXNfnhNzphlZ048l+NbXe174MekH5Z
         xi1Fhj2LaYkBzNiEH5GiiUabcaIGk5NDPXGeO1sRbaDZHfiKPWZItHySciyjgBc8LDxq
         qjiLH8f06REVp2FRBKt8kzQEKQn4sCoT4dk8XdPxhH9ZQSIN1ZCgGANcLy1liZQB0sN5
         ijyGGqOLiw6510EdQgL/xqwOeRQVKvUDkvRLp2xWPqJJBHQsYCz02MK9zVoWpmyUr59l
         jeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=dO8KDq/BXTm/K5DhqgkFTt6wve4H+GsCq6pKp31viHc=;
        b=Ut13rGgA2oaRTQDNiB6tr4AQQio/pMArJwJ+2v6vfz2AhpZMqBzn3BVLJ8NzqDL5Iu
         yIaGVZ+5eGEoXsCZ0s50CqSvvwtvR9QPdY2a948fXcJwf0Rv8j0x1EV2lUQH+qu8y8Nc
         wLVYi4DPbRv6zlUPHB7Wupkd6pc3fZ/HKEj837C8a845tQyMen8d3WbUhRr0fO/To8X6
         Yby6cpXKl6JkCmahPC6/TIxOOwbBgC3UTzvnJoVDz2JWkoq+wX5csjmVIUuFIivICYaD
         tQKXI5EZ8M9wCR1NRWFqNes2n1Gd2ebxrkHQYA3ogt+eb4IMDPKrC1MDaH0zkoEKdAqF
         7ryQ==
X-Gm-Message-State: AOAM5329LgrzNpId1qE+B+7NCqlvp3MpJDvpvMPDyONJZTL+0+bMLF1U
	z4097gDdsbrEpqqkwcVlqPwiIcuXGVfxqOP5/mMzsyERzyg=
X-Google-Smtp-Source: ABdhPJxig+clB1dBoxBhhQqlsyxRF6m2d25Pi+GQqtOH7nyv1GrzZ5q9FVETMA1SCx+7go3YUWBCYC0ICnRPgKChlSY=
X-Received: by 2002:a67:f4cb:: with SMTP id s11mr9465360vsn.20.1623837936385;
 Wed, 16 Jun 2021 03:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <1688B34361FD8BD3.6379@lists.openembedded.org>
In-Reply-To: <1688B34361FD8BD3.6379@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 16 Jun 2021 12:05:24 +0200
Message-ID: <CANNYZj9j_SpcYSdQBTgqfCW4KALpD-DxD9fyDDbebMP82S_pKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/31] core-image-weston: bump QB_MEM to 1G in qemuarm64
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005f03a605c4df3b98"

--0000000000005f03a605c4df3b98
Content-Type: text/plain; charset="UTF-8"

I'd like to take a deeper look at this, please hold.

Alex

On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> weston tests start additional compositors, other tests are also
> heavy on RAM, weston itself takes 256M with opengl enabled,
> so 512M causes OOM errors on arm64.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-graphics/images/core-image-weston.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/images/core-image-weston.bb
> b/meta/recipes-graphics/images/core-image-weston.bb
> index 62305cc1ce..e332e19368 100644
> --- a/meta/recipes-graphics/images/core-image-weston.bb
> +++ b/meta/recipes-graphics/images/core-image-weston.bb
> @@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
>  CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
>
>  QB_MEM = "-m 512"
> +QB_MEM_qemuarm64 = "-m 1024"
> --
> 2.31.1
>
>
> 
>
>

--0000000000005f03a605c4df3b98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d like to take a deeper look at this, please ho=
ld.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Jun 2021 at 10:12, Al=
exander Kanavin via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">weston tests start additional com=
positors, other tests are also<br>
heavy on RAM, weston itself takes 256M with opengl enabled,<br>
so 512M causes OOM errors on arm64.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/images/<a href=3D"http://core-image-wes=
ton.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a> b/met=
a/recipes-graphics/images/<a href=3D"http://core-image-weston.bb" rel=3D"no=
referrer" target=3D"_blank">core-image-weston.bb</a><br>
index 62305cc1ce..e332e19368 100644<br>
--- a/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
+++ b/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
@@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL +=3D &quot;gtk+3-demo&quot;<br>
=C2=A0CORE_IMAGE_BASE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;x11&#39;, &#39;weston-xwayland matchbox-terminal&#39;, =
&#39;&#39;, d)}&quot;<br>
<br>
=C2=A0QB_MEM =3D &quot;-m 512&quot;<br>
+QB_MEM_qemuarm64 =3D &quot;-m 1024&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005f03a605c4df3b98--
