Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.7833.1602225659169963671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 23:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bIpINqM/;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id 5so4429772vsu.5
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RCIVtTYRB/R8AsG7EvHuhDZHHoBv/55IIEx6FLHVPOE=;
        b=bIpINqM/4ArpBluFF1BMUSqxHOnNqdGGHRNxrBHXkyYRQfoZtHgYpVHqLpcBGCobdL
         O+JYu7L+pKPHxiVy8l4RliTa2EeBHc+yraaaBeZcKa9qlLtrzgQS5by5VKK3jwp4cwSz
         N9/ctfzbqz2B7Cp+LluWMtNlhr0PpxtLmbENbeAX+5xDRXGJO5fAtkZyqWUlxpzq5MrR
         HkaP/IkNvPeJpXMiAjxvPyfPdbWvnHkTyZcBOWGSy0l7o39IuAdS0a2AsDzQYXkDpQym
         aIPg98VeigfmuzRO6scGY/yLiRbaB87o46u/GCjV/DZPprTNBPEmNbwvpKlQt66F1nIM
         lWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RCIVtTYRB/R8AsG7EvHuhDZHHoBv/55IIEx6FLHVPOE=;
        b=Zbb0pMkn5BCnSL69svlSe5d3MW1XXYqsgGlIaA+8fGd/tKUFZIH3CecVbKcy5Hp40k
         FyLpWBdA1G4bMZQM62g+t73Uil9lDBYvntZcahW92l5WfZpJKowmcuplmxh6wuqORl+Z
         7xPrVUuHV72lcVbuFlGJtL8LODq+K01Y5cS3adB9x61R+Kt9/Eh/9hwjiOrVSKqVzSga
         GR1N58aDQBXYJSM/+QrE//UdBGtQwblBwguG6KJFhRUY1saZJ18Z4RPUCTC+r9x656ij
         C5Ew1SeUiz/qPEYS7qTdI6SxIkFo67cV/6ZZp7TwvpSutGlDbxmZ0LIxV2HS1XSLhTyy
         pzzg==
X-Gm-Message-State: AOAM533DmLGN+YMir3eK8PQoNsFwP9DGXvxFRiz4IMXwR+ZXyycNQlTl
	YwlParbmSM0oQ1ixbsnhz7PDs58Z/DEOhUs8E+U=
X-Google-Smtp-Source: ABdhPJwOC2+ShBBmh074+PppgLBkoGnb9fqeY1SQb/zES1n6xH3feShNk1u2/opfVYesSXgPSVhFXpBnG7wZbEag+uY=
X-Received: by 2002:a67:504:: with SMTP id 4mr6537299vsf.20.1602225658239;
 Thu, 08 Oct 2020 23:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201009043246.20465-1-douglas.royds@taitradio.com>
In-Reply-To: <20201009043246.20465-1-douglas.royds@taitradio.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 9 Oct 2020 08:40:47 +0200
Message-ID: <CANNYZj9bKH9=6omUiNiO3ekNRP-2poF4jVyhvby-Jp6tCnn3yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] allarch: Remove MACHINEOVERRIDES
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000359e6d05b1373ba8"

--000000000000359e6d05b1373ba8
Content-Type: text/plain; charset="UTF-8"

Wait, I thought this specifically sets MACHINEOVERRIDES to a static value,
replacing the target specific one.

Alex

On Fri, 9 Oct 2020 at 06:36, Douglas via lists.openembedded.org
<douglas.royds=taitradio.com@lists.openembedded.org> wrote:

> Avoid machine-specific settings sneaking into allarch tasks.
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/allarch.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index 5bd5c44a27..2365691fae 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -42,6 +42,7 @@ python () {
>          d.setVar("TARGET_CXXFLAGS", "none")
>          d.setVar("TARGET_LDFLAGS", "none")
>          d.setVar("POPULATESYSROOTDEPS", "")
> +        d.setVar("MACHINEOVERRIDES", "allarch")
>
>          # Avoid this being unnecessarily different due to nuances of
>          # the target machine that aren't important for "all" arch
> --
> 2.17.1
>
>
> 
>
>

--000000000000359e6d05b1373ba8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, I thought this specifically sets MACHINEOVERRID=
ES to a static value, replacing the target specific one.</div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 9 Oct 2020 at 06:36, Douglas via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;douglas.royds=
=3D<a href=3D"mailto:taitradio.com@lists.openembedded.org">taitradio.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Avoid machine-specific settings sneaking into allarch =
tasks.<br>
<br>
Signed-off-by: Douglas Royds &lt;<a href=3D"mailto:douglas.royds@taitradio=
.com" target=3D"_blank">douglas.royds@taitradio.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/allarch.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass<b=
r>
index 5bd5c44a27..2365691fae 100644<br>
--- a/meta/classes/allarch.bbclass<br>
+++ b/meta/classes/allarch.bbclass<br>
@@ -42,6 +42,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;TARGET_CXXFLAGS&quot;, &q=
uot;none&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;TARGET_LDFLAGS&quot;, &qu=
ot;none&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;POPULATESYSROOTDEPS&quot;=
, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;MACHINEOVERRIDES&quot;, &quot;=
allarch&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Avoid this being unnecessarily differe=
nt due to nuances of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the target machine that aren&#39;t imp=
ortant for &quot;all&quot; arch<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000359e6d05b1373ba8--
