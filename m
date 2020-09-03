Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.14242.1599140571289634837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 06:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HTliqhIO;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id o184so1771489vsc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 06:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rK+8WybMB/pTgnRcdx3rxCmA0MJWPczPQ9zUQffIwTA=;
        b=HTliqhIOrkLQ21UF++2YeD9TC16SWdOIIDsCtxcbHCc/vktz8S0KbChNun+Qpm5jHM
         DtTQIpqIjVepI7Rpiub4cLn6ZQOwLM1RrJAN1Qd1bZIadM1MkYhMOTTJ8q3FcUrLTmMI
         6heVpLrpEOLIHHGE+Vn2G0Fv4LUiv21eOP086LTfaYnFkBqqjJ9hoFnPjAMo+j6sVZjk
         EF5/0+5Yqp8xAeSJeBYxaEJnQHd18zVpuXhRbx5FV3snOXs0yvQerDsmC6CZCR8P9wc4
         ejmR7QcWoJVvGpx8qSWILtwNW24FqeQIqjyLWmgKxcVnx+x088q2/MOLookQHTwKrLsR
         bA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rK+8WybMB/pTgnRcdx3rxCmA0MJWPczPQ9zUQffIwTA=;
        b=f+yVXnqemarj063gpsvl9IncOAFpocIiwurhTiOuI4lKz1qB0GoukxkYjy2sk6PIjJ
         yR7E3eyxpzcb9+mcWeKf21T5YZGEFGIf0d6KyZhTpugxaQW8J7FvnUOYZTfjjFA9IeKD
         Hf/uyGdrCVGkVbQoT006lj3CCLvDAuuoXim5F6oT8iDthZCClD6S0EGRl8CFPT7a21iK
         g/nlJPV4cPIN5a9XFsipwcHuzvBsoaTKPEdE2X/k3aCFyvawY6j3pi8gFY980+b7RU8G
         NUhKHnqiJgF2n1Vghpu3Ia7kdZWLz1K0oHK5FNvR7S/xc0aS3PJqD+MQy2vsq9nGoxhN
         s1Ig==
X-Gm-Message-State: AOAM531pQCK2Mpes8puADHZ6w2W5sy4ROpPgXVuBzcOjXNCHjU1oZbv9
	tf/J6u6FiZpTTn3YbVkUjV8uND9l6hK00QA4lRdywGYj
X-Google-Smtp-Source: ABdhPJx5T7Y9sI2x5jpD6oep+RW2jB8HIeoKm0ALonusR+LM05+qew8EhxAUm143HzPYURDKmP07CPoqJNpXkjOjmFQ=
X-Received: by 2002:a67:8783:: with SMTP id j125mr1706016vsd.174.1599140570361;
 Thu, 03 Sep 2020 06:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200903105448.4736-1-ross.burton@arm.com>
In-Reply-To: <20200903105448.4736-1-ross.burton@arm.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Sep 2020 15:42:38 +0200
Message-ID: <CANNYZj-nq1nkOPC06R5raivSuO8_1u+7xCUaerNiAthLfTKj8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] debianutils: change SRC_URI to use snapshot.debian.org
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a4725a05ae68edfe"

--000000000000a4725a05ae68edfe
Content-Type: text/plain; charset="UTF-8"

This breaks automated upgrades unfortunately (upstream check works, but
upgrade itself won't figure out a newer snapshot URI).

Is it possible to convert this to fetch from git instead?

Alex

On Thu, 3 Sep 2020 at 12:54, Ross Burton <ross@burtonini.com> wrote:

> The primary Debian archive only contains tarballs which are currently
> shipped in a release, so it's easy for a tarball we need to disappear.
> Instead, point at snapshot.debian.org to ensure the link remains valid.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/debianutils/debianutils_4.11.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/debianutils/debianutils_4.11.1.bb
> b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
> index 71fc99e29b..ef7aa50408 100644
> --- a/meta/recipes-support/debianutils/debianutils_4.11.1.bb
> +++ b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
> @@ -3,7 +3,7 @@ SECTION = "base"
>  LICENSE = "GPLv2 & SMAIL_GPL"
>  LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
>
> -SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
> +SRC_URI = "
> http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz
> "
>  # the package is taken from snapshots.debian.org; that source is static
> and goes stale
>  # so we check the latest upstream from a directory that does get updated
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
> --
> 2.25.1
>
> 
>

--000000000000a4725a05ae68edfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This breaks automated upgrades unfortunately (upstrea=
m check works, but upgrade itself won&#39;t figure out a newer snapshot URI=
).</div><div><br></div><div>Is it possible to convert this to fetch from gi=
t instead?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 3 Sep 2020 at 12:=
54, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The primary Debian archive only contains tarballs which are currently<br>
shipped in a release, so it&#39;s easy for a tarball we need to disappear.=
<br>
Instead, point at <a href=3D"http://snapshot.debian.org" rel=3D"noreferrer=
" target=3D"_blank">snapshot.debian.org</a> to ensure the link remains vali=
d.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/debianutils/<a href=3D"http://debianutils_4.11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">debianutils_4.11.1.bb</a> | 2 +-=
<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/debianutils/<a href=3D"http://debianutil=
s_4.11.1.bb" rel=3D"noreferrer" target=3D"_blank">debianutils_4.11.1.bb</a>=
 b/meta/recipes-support/debianutils/<a href=3D"http://debianutils_4.11.1.bb=
" rel=3D"noreferrer" target=3D"_blank">debianutils_4.11.1.bb</a><br>
index 71fc99e29b..ef7aa50408 100644<br>
--- a/meta/recipes-support/debianutils/<a href=3D"http://debianutils_4.11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">debianutils_4.11.1.bb</a><br>
+++ b/meta/recipes-support/debianutils/<a href=3D"http://debianutils_4.11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">debianutils_4.11.1.bb</a><br>
@@ -3,7 +3,7 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2 &amp; SMAIL_GPL&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D9b912cd0cc6=
54134c0ef3424a0705b94&quot;<br>
<br>
-SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz&quot=
;<br>
+SRC_URI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debian/20=
200525T145753Z/pool/main/d/$%7BBPN%7D/$%7BBPN%7D_$%7BPV%7D.tar.xz" rel=3D"n=
oreferrer" target=3D"_blank">http://snapshot.debian.org/archive/debian/2020=
0525T145753Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz</a>&quot;<br>
=C2=A0# the package is taken from <a href=3D"http://snapshots.debian.org" =
rel=3D"noreferrer" target=3D"_blank">snapshots.debian.org</a>; that source =
is static and goes stale<br>
=C2=A0# so we check the latest upstream from a directory that does get upd=
ated<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/d/${BPN}/&quot;<b=
r>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--000000000000a4725a05ae68edfe--
