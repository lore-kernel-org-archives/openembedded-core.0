Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.1029.1616686296496083282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G8O6NSMo;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id e7so2857705edu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5+65n6tNlMNFUcFBfh49okCDgSqa1iqJMsnFqMPx2A=;
        b=G8O6NSMoJaUNKP68VSFjBL4HRwfzhnvQC/4J7DCQFFnANwziLu2K9KJvXQik9UUnTk
         SmrrYVebBKM0LLTQblZ46KuGs+thtlYSdjD3UWXb5P9m+Ybziy7olPE1RtPQVx08ebDn
         Z4jd6LuVAeKMUnzt3pxxaPiQweU0zW4OF6Dboyx1Z3J7T1U5qJE9AVjQ+U4JXdzp7Vv6
         FJmAb48CeFQnNW/O5A1bdOUfaiZKx01zrF2g58x23xOXcLzUBgCmVOtzCDagumSn/9rZ
         /NIHdXgOIDSrIEmkSI65ka6CgkqhOimqnzjEsy8c/H3QlBELsIV6bpum0ApeDzRjpg2u
         Q+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5+65n6tNlMNFUcFBfh49okCDgSqa1iqJMsnFqMPx2A=;
        b=Wbb9GOYnUfJYaHoDer9qhJkGkVn0an+zAeLkkxcPfPwTpWqgf7OXzJldzwsqFqgECc
         SSsU/EOg/X2S9aMZIhbi2oY03zYcopb1BCKMcGipD9SQPExO66xFzucvY2CKxlUGHfiN
         Hcu7+Rh1DX6wFd/X/RHoJIYMO2QmqfT+66e/SP0bL9oO/3gOA/SF/N/HBcz4uy0MHBt2
         fvY1HxjBtzYaXjOjJh4KJGsqYWGJSMkhjd8Ar6U5O609bYz7nzn2KRbaCCkPTKOTmVcJ
         OOgX1O4zWODfQlPuY87xXWG0oetCGfCvr9fHrwv4xSOC4OTysDC8qVIxMQn8fQJD0XtI
         sz3w==
X-Gm-Message-State: AOAM533gDeZYOCWxam20vmyPu++Fg7NgGvM7x0jxUvHhNO4FGd3vWQP9
	So63+CHoAFodctVnS2ARn8/FMaGxojJB4NspVa4=
X-Google-Smtp-Source: ABdhPJydmE0DB5a+HGgNijLa/dvGpyN66DMn32NeMUyTpBKZeoseRODdbFIlzL7VGoklTs+xTRkaM5yyFMde9F72eoI=
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr9893725edr.264.1616686294847;
 Thu, 25 Mar 2021 08:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210325152625.32104-1-dzagorui@cisco.com>
In-Reply-To: <20210325152625.32104-1-dzagorui@cisco.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 25 Mar 2021 16:31:23 +0100
Message-ID: <CA+chaQewo00hwx5SAOGK7PT47QPDoU3H-oHtB3QmQXnWMfR1HQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] bpftool: remove recipe from blacklist
To: dzagorui@cisco.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005154c005be5e1cc4"

--0000000000005154c005be5e1cc4
Content-Type: text/plain; charset="UTF-8"

Needs to go to openembedded-devel ML and add bpftool to
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

On Thu, Mar 25, 2021 at 4:26 PM Denys Zagorui -X (dzagorui - GLOBALLOGIC
INC@Cisco) via lists.openembedded.org <dzagorui=
cisco.com@lists.openembedded.org> wrote:

> Have not seen build issues for 5.4 and 5.10
> kernels so allow to build it
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  meta-oe/recipes-kernel/bpftool/bpftool.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> index 1758430bc..e58bdd493 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -32,4 +32,3 @@ python do_package_prepend() {
>  }
>
>  B = "${WORKDIR}/${BPN}-${PV}"
> -PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
> --
> 2.26.2.Cisco
>
>
> 
>
>

--0000000000005154c005be5e1cc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Needs to go to openembedded-devel ML and add bpftool to me=
ta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-oe.bb"=
>packagegroup-meta-oe.bb</a></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 25, 2021 at 4:26 PM Denys Zagoru=
i -X (dzagorui - GLOBALLOGIC INC@Cisco) via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;dzagorui=3D<a href=3D"mailto:cisc=
o.com@lists.openembedded.org">cisco.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Have not seen=
 build issues for 5.4 and 5.10<br>
kernels so allow to build it<br>
<br>
Signed-off-by: Denys Zagorui &lt;<a href=3D"mailto:dzagorui@cisco.com" tar=
get=3D"_blank">dzagorui@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" rel=3D"=
noreferrer" target=3D"_blank">bpftool.bb</a> | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" =
rel=3D"noreferrer" target=3D"_blank">bpftool.bb</a> b/meta-oe/recipes-kerne=
l/bpftool/<a href=3D"http://bpftool.bb" rel=3D"noreferrer" target=3D"_blank=
">bpftool.bb</a><br>
index 1758430bc..e58bdd493 100644<br>
--- a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" rel=3D"=
noreferrer" target=3D"_blank">bpftool.bb</a><br>
+++ b/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" rel=3D"=
noreferrer" target=3D"_blank">bpftool.bb</a><br>
@@ -32,4 +32,3 @@ python do_package_prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0B =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
-PNBLACKLIST[bpftool] ?=3D &quot;Needs forward porting to kernel 5.2+&quot=
;<br>
-- <br>
2.26.2.Cisco<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005154c005be5e1cc4--
