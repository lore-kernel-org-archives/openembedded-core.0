Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.5115.1589058766766584536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wh85jgO3;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id i16so4808779ils.12
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y10rURZXAjJGLPfivwcXanUEStrv0KwxktB8xWKkWeI=;
        b=Wh85jgO3mnU4T8+zLROSRHHKm7eXkS+5u3sFbdhB5yOg/xVh69IC+KbBIeAf7JfAIj
         gHB1ZERymi0JYLa6vhf1QpsGKtj3W48e4ejuHqDmPvZCCEcdfh4QQs+5SMGINXpgi5as
         it/6yGKpUeHizRNgQ0WB+A0/Kq2MnhxzFxqbobECOaNjsVfq3JhNm/yJ5LSDj7Kl2SeZ
         ekXCMpm8lxJTngJ1MHdMFyObbBfj8fa2mPaWSnHgCuW5cj/M9KcXvlLUUmffgdf2DxkV
         uFpMbTI/oLnvbWYU1klh/WQbvZOktoLeTublhTpxcYpoALrsfs762BD94K/7Il8e+oT2
         6Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y10rURZXAjJGLPfivwcXanUEStrv0KwxktB8xWKkWeI=;
        b=ucG8MGOFeZqBQHPJ24F/N4fJh8qNb1fHQbexs9Is0o4+qYdGZxMS96OaK9V4E3EqcF
         f/Kk7YzjgRc71QeEo3UMZ+2G75D55+179AfzLYrTwNcnJty0/RhaAUFSxngnWUwxOHo7
         SAQOEoxtE4KOfycuyrzKhkVqVJ/8NolEgTYmUeYByVFmxVtt6/eAxO5fS+wJRA3rmal/
         G6FzV5+/PS1L0IsrU1EdlCWevhQS2qYZkTrbDVgWuASfXfmH7zrZMAhEvXub94ygrGia
         Fzbc2tgQ/EhSs19DtKnj8FCjR7BnrBDcuwh2pCGfEM0td06FpUjTyyLzK/b0YWv46ov/
         PVAQ==
X-Gm-Message-State: AGi0PuYdP7gdl4ZCqS7l/D451Zui8/xypCwZxf6pMhEjejTBjGooToOm
	bAJ5gPczcPw99VaFwWirViQGcHax3vicsLzCu50=
X-Google-Smtp-Source: APiQypJxjOFPc+xAKY01GC4of3kkOCxbhoTluyngtvtoHuEHrXYl22K7rNvh4+GUt8R89iblpzZ1LGQ6qKPhLih6ks4=
X-Received: by 2002:a92:1b91:: with SMTP id f17mr9425127ill.142.1589058766120;
 Sat, 09 May 2020 14:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 9 May 2020 14:12:35 -0700
Message-ID: <CANx9H-DD+Qw3Zb_u53vnL-10-D5BzP0CCXBC1C7gW98=SRZuQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on version check
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000482c0d05a53d93fa"

--000000000000482c0d05a53d93fa
Content-Type: text/plain; charset="UTF-8"

This version looks good.

On Sat, May 9, 2020 at 1:33 PM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> Some pypi packages do have suffixes like dev, or a0 or b1.
> When doing a version check on these, the version will get falsely
> identified as major release versions.
> Add a terminating slash to rule out those false positives
>
> Changes v2:
>
> - ignore suffix versions instead of reporting them
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>

Reviewed-by: Tim Orling <ticotimo@gmail.com>

---
>  meta/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index e5d7ab3ce1..ffa8aa3ff4 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>
>  UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> -UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> +UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> --
> 2.20.1
>
> 
>

--000000000000482c0d05a53d93fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This version looks good.</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 9, 2020 at 1:33 P=
M Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@ou=
tlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Some pypi packages do have suffixes like dev, or a0 or b1.<br>
When doing a version check on these, the version will get falsely<br>
identified as major release versions.<br>
Add a terminating slash to rule out those false positives<br>
<br>
Changes v2:<br>
<br>
- ignore suffix versions instead of reporting them<br>
<br>
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br></blockquote><div>=C2=
=A0</div><div>Reviewed-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail=
.com">ticotimo@gmail.com</a>&gt;</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
---<br>
=C2=A0meta/classes/pypi.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
index e5d7ab3ce1..ffa8aa3ff4 100644<br>
--- a/meta/classes/pypi.bbclass<br>
+++ b/meta/classes/pypi.bbclass<br>
@@ -23,4 +23,4 @@ SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.python.org/pyp=
i/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.p=
ython.org/pypi/${PYPI_PACKAGE}/</a>&quot;<br>
-UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-=
_]*)+)&quot;<br>
+UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-=
_]*)+)/&quot;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000482c0d05a53d93fa--
