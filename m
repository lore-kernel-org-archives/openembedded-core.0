Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8A8C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:12:35 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web12.12.1637766753983662317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UtYStEP8;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id b125so1719607vkb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kPVXyysNKUbZkKuEYjo2U99lvKIrO3uGCUlhnPlnURg=;
        b=UtYStEP8vm7NU5j7DN8Gwx4605QvzOkAlGzQsIEmVuOXsUjp+1PG6x2BdhsbnJlLs4
         3w2SkLhqAmW4T+n6YlARcNgLAoNpjYmml1C5+ShyTdHvOV6KqCmRB2oN4lFuLaWYiw5u
         0XJ7O24b9+fLtQfUmL/teua4Iiqzh1yLAiR6ELdckjB9sVgrhRrDcIVUjx+vYTGQ5lqA
         TeERv934wQfkkeVi9kigCt8GKvb4RSQITNZMJKUo6MizmYjNk9UvxNTDbLPhNFz2XKKU
         PDcnN7J0+HLNoVX6ADVFLrAnYpk41A7MVq1VkUjCOITwYMM/G8bMpgufM1st6hSfMpY+
         QADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kPVXyysNKUbZkKuEYjo2U99lvKIrO3uGCUlhnPlnURg=;
        b=fPonA0f87Qkji5CtemvU8vgHw1b4KJ1lYXhLK1BA9Ig7M3hqf119mUh6ib7ef9bc3/
         4+lqGW4CENSXVnTp1fJBDtXKxddIoS0YhCClBySNktxbJd5SKHgwihQQIsJaX9SgImzK
         2SEZLZ4YQNEI6b4iNlDfS5lRcZMYVFLEj5i74hXlrTjHjkkIc8dsMJ0YXpk2OmHbThAS
         7UtxMe1hiYLF0V+eu74Om5NptG7wetDxLZbFhhgsrNMBO1K+uAc0yZ4Va+Hak+kgrQmc
         RekK3TjTW73Un+HWrvbueVDbAtezN9y3yiuXyAcz+RXowPlyuW6xpma+zq4IqAb2s8nP
         ESEQ==
X-Gm-Message-State: AOAM531ierI6ui6/yuIhNyUJzycvmIm1lDySds4967W5JkFaRKQFxl3s
	kgvQVQ4j/MOcOLfcxavIBrkZuZFik8ug5bglwaM=
X-Google-Smtp-Source: 
 ABdhPJztm3ik3huFbCBD7w2f+f1EgKpwgy5erOz4sJE5swjLuH74e16CycE4WYv7lVWG4FQfU4FIEIn7V3ntgyOmJAg=
X-Received: by 2002:a1f:b697:: with SMTP id g145mr28499553vkf.1.1637766753187;
 Wed, 24 Nov 2021 07:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-4-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-4-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:12:21 +0100
Message-ID: 
 <CANNYZj8j5sZ0Smzh7Kr3mvUjewZTN+XfAY9AykS8L526=FcMjg@mail.gmail.com>
Subject: Re: [RFC PATCH 03/15] externalsrc: Remove subsequent slash from B
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000008c7c7f05d18a49c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158716

--0000000000008c7c7f05d18a49c9
Content-Type: text/plain; charset="UTF-8"

Please explain what problem occurs if this change is not applied (again, in
the commit message, not in the response to me).

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index abfe24bace..959f2d7bc3 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -60,7 +60,7 @@ python () {
>          if externalsrcbuild:
>              d.setVar('B', externalsrcbuild)
>          else:
> -            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> +            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>
>          local_srcuri = []
>          fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
> --
> 2.20.1
>
>

--0000000000008c7c7f05d18a49c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please explain what problem occurs if this change is =
not applied (again, in the commit message, not in the response to me).</div=
><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 2021 at 15:48, Stefan Her=
brechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.c=
om">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Stefan Herbrechtsmeier =
&lt;<a href=3D"mailto:stefan.herbrechtsmeier@weidmueller.com" target=3D"_bl=
ank">stefan.herbrechtsmeier@weidmueller.com</a>&gt;<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/classes/externalsrc.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class<br>
index abfe24bace..959f2d7bc3 100644<br>
--- a/meta/classes/externalsrc.bbclass<br>
+++ b/meta/classes/externalsrc.bbclass<br>
@@ -60,7 +60,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if externalsrcbuild:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;B&#39;, exter=
nalsrcbuild)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, &#39;${WOR=
KDIR}/${BPN}-${PV}/&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, &#39;${WOR=
KDIR}/${BPN}-${PV}&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_srcuri =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetch =3D bb.fetch2.Fetch((d.getVar(&#39;=
SRC_URI&#39;) or &#39;&#39;).split(), d)<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000008c7c7f05d18a49c9--

