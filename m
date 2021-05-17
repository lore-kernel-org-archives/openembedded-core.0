Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web09.16482.1621242760976360465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 02:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aAwia9T/;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id f15so1437332vsq.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIRm1WEMgGwomlf9vpKMnkvFshbaUbDdQLCKhOs3BxA=;
        b=aAwia9T/nhMgBA6mBS4Vvc9XqYE4zf35LOCFFzvRDFq2W+Vr4nWjsxNKTjOEeLgU/5
         3hnTpqx+nB9WfluJCjsNIncjBtVynzGS9QlX49NO26oQXNFTz6YOw44Fiv7UrVcXoyOw
         YU4VryqtisL/WCZhIDZjn5075tO7zorpHoVsgIh/hnMBEvExEHbV213z8SX9Fwrfaaxu
         O7vW297FUkXUjJ7VGByEur2DlymiRRlqgLkAzwX5cT/m1FKpkuRDhlyei51WCuS7R6Ju
         /sdJFL+dDVzNBZFWyqrOA+U0aDb2WEovBM/pz2/FUlMFRrEWjA+wtYGujBTsq3XDzuSh
         XjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIRm1WEMgGwomlf9vpKMnkvFshbaUbDdQLCKhOs3BxA=;
        b=uiV0Wi7sQMvzjlpNk++31Wdrlzhs7MQzhqysBCaeNCYz23oTKQTSOrychvMv0guLiZ
         dqXDqmAcnzTP7F/1v3Q3k6l9wOVR+I/PaaMPtGBTIUGUDBxqiBFqXgxLHovHyk1kBBqi
         MvnyboSESzyc9zJas9JHjvoxXIyjyEk7ZDoxjc9zLY7vfONU5Nmc73hzcIzQVKYHzoDq
         OotsvfZeLDP4TjHctGiyZC0vYw8t3JpQeKQKbrnkw/LzSupIXO6EKQaKOizyWhhEZTZp
         iM8e7Zj5Ojn87ulUB/ssuSW4U6YWG2Iq76oRldl94lTvXAtGQnQSQB7l5sIuRdfjwzf3
         9Jcg==
X-Gm-Message-State: AOAM532zSfVHxcaAUXsZS4RMH6sNG+l4kxvk9SZgjx5pt/+AtpNn+9xc
	TR5GFo0nNj9QkZIQFFZbiJN6m2U6Kh2DNrZRbs4=
X-Google-Smtp-Source: ABdhPJxYAotTZfDxVI0i+IIL0GWYluLlWHDMoqC9V4V92AhUYlo3rybAefWmpZj04yIQBAYx9Hk3/r33emCNAysYA6o=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr48594410vsm.41.1621242760098;
 Mon, 17 May 2021 02:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210517090323.9968-1-Qi.Chen@windriver.com>
In-Reply-To: <20210517090323.9968-1-Qi.Chen@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 11:12:29 +0200
Message-ID: <CANNYZj8zWA-aADeZenSLa=Y8UVPMyHyQ+GvLWtMCE4TT30h7Tw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rt-tests: update SRCREV
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf749d05c282fe7d"

--000000000000cf749d05c282fe7d
Content-Type: text/plain; charset="UTF-8"

Maybe it's better to update to the tagged 1.10 commit?
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?h=unstable/devel/latest&id=32819581cc0509c9d58c33c3061f57abe0c40c88

Alex

On Mon, 17 May 2021 at 11:03, Chen Qi <Qi.Chen@windriver.com> wrote:

> The commit '6af88067da16c6e69243b376c3b6454ec694460b' is not available
> in the repo any more. I think it's due to some mis-operation of the
> upstream
> repo in the past few hours.
>
> Update the SRCREV to use the latest commit on unstable/devel/latest branch.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
> b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 0c89bad91f..1600f5813b 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
>  # Version 1.8
> -SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
> +SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
>  PE = "1"
>
>  SRC_URI = "git://
> git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
> "
> --
> 2.30.2
>
>
> 
>
>

--000000000000cf749d05c282fe7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Maybe it&#39;s better to update to the tagged 1.10 co=
mmit? <a href=3D"https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git=
/commit/?h=3Dunstable/devel/latest&amp;id=3D32819581cc0509c9d58c33c3061f57a=
be0c40c88">https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commi=
t/?h=3Dunstable/devel/latest&amp;id=3D32819581cc0509c9d58c33c3061f57abe0c40=
c88</a></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 17 May 2021 at 11:03=
, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The commit &#39;6af88067da16c6e69243b376c3b6454ec694460b&#39; is not avail=
able<br>
in the repo any more. I think it&#39;s due to some mis-operation of the up=
stream<br>
repo in the past few hours.<br>
<br>
Update the SRCREV to use the latest commit on unstable/devel/latest branch=
.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-te=
sts/rt-tests.inc<br>
index 0c89bad91f..1600f5813b 100644<br>
--- a/meta/recipes-rt/rt-tests/rt-tests.inc<br>
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Version 1.8<br>
-SRCREV =3D &quot;6af88067da16c6e69243b376c3b6454ec694460b&quot;<br>
+SRCREV =3D &quot;c9051a36d934503b4673ca5615f631bae36dead0&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/uti=
ls/rt-tests/rt-tests.git;branch=3Dunstable/devel/latest" rel=3D"noreferrer"=
 target=3D"_blank">git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branc=
h=3Dunstable/devel/latest</a>&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000cf749d05c282fe7d--
