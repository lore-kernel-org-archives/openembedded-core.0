Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.6825.1608277639880944279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nJa8Um3r;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id u7so873414vsg.11
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 23:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwHEfB7NMLhPEnKd943SEeMSdgL5ypel1rsglR6IJFI=;
        b=nJa8Um3rgtX/3XgnF0JwDjI+EkxjIfWApB2bxOi6B9WND7Ohpdx1Ddi4nqDCPnTuwr
         0g4zCX6z2wl9TSrOJWrWSMiGVDn+vLfVyfE9MSrBSWmVAKAJPQ8ZhKqe0431QhH4lBPR
         Y6c9jy8fTR7JfKukmxad0jyJErmUxwzspfGe0NcvVGbBM2agLE5rc0VVph/nRk1RN7M2
         jfQL6Jx4EzZtm8bhA1L+2hbX5gVWsS6G8fY/lAwRm9RMGl6KOEoPxdpw8QGdtHmrRPle
         15ZputhytASdXPTTTlNigvzNYl5PCCkCfCknd5+y8g5t7UcezKJggu93mEk6X7j7sDq+
         WG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwHEfB7NMLhPEnKd943SEeMSdgL5ypel1rsglR6IJFI=;
        b=NRZPdsOaHSykq8GyShN7o/fGQU6A6XlxQOq8Ra41eQvBjRMEUSMB355+5YUmmTmBgj
         83ot4faPwtDtnCnI408kpP9pgvImCMqoUZ8gd+c9G9DPgL95nN6OcjTJqNcgVBoYVESM
         e0xMDvfZRJaoIDlloVf6U3KViDiaWnRd3LecSRlX/qh2boe3TwJun1r3KJAdDc1VGpY1
         BHsWL37+I7BOjM74dB8b4Us6luNwn1EIB39ROvHVQBaM8WgTnpXyZrP2vnZY0Ti1eNAI
         bLXZj0Xf3HfpIIVzbdOO6pUrFWO5etv1K4ycDo5MqAZkChXhVk6UfSLK5V2KTbQGItm/
         XKRg==
X-Gm-Message-State: AOAM533KC9WqFG9GrSLlGP66/jpz0C2FvrR27+Aglgiel6GZQM3F2zK3
	/xmhqu4Z09CfJbyWLazmoLD5+lB8c0q1CY81hP8=
X-Google-Smtp-Source: ABdhPJxVZ01eZmCRgPekNTLl++OzPs8tqjaa5ZOpl9ttYdvDsgcRFL5crCjX3GhjDJy/uuOx6GM1UsGK+5ucyGwAFKA=
X-Received: by 2002:a67:4346:: with SMTP id q67mr2357738vsa.51.1608277639076;
 Thu, 17 Dec 2020 23:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20201218053641.17017-1-mingli.yu@windriver.com>
In-Reply-To: <20201218053641.17017-1-mingli.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 18 Dec 2020 08:47:08 +0100
Message-ID: <CANNYZj9ymh8oCeQjPjY_bM5SCi3qLUNgHD908xbmrApdH7B_LQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-core-base-utils.bb: check the gplv3 license
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000060b3c305b6b851fa"

--00000000000060b3c305b6b851fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m not sure I like this approach. It doesn=E2=80=99t look like the=
 right place to
decide whether to include or not some packages based on specific licensing
requirements, licenses for these and other items change over time, and
there may be more undesirable licenses than just this one.

Why not simply create a new package group?

Alex

On Fri 18. Dec 2020 at 6.37, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> packagegroup-core-base-utils repends on some packages which are
> gplv3 compatilbe.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../packagegroups/packagegroup-core-base-utils.bb  | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-extended/packagegroups/
> packagegroup-core-base-utils.bb b/meta/recipes-extended/packagegroups/
> packagegroup-core-base-utils.bb
> index 1e63da7f16..0a3cb63bc2 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.b=
b
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.b=
b
> @@ -33,18 +33,18 @@ RDEPENDS_${PN} =3D "\
>      grep \
>      gzip \
>      ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "ifupdown",
> d)} \
> -    inetutils \
> -    inetutils-ping \
> -    inetutils-telnet \
> -    inetutils-tftp \
> -    inetutils-traceroute \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'inetutils', d)} \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'inetutils-ping', d)} \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'inetutils-telnet', d)} \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'inetutils-tftp', d)} \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '',
> 'inetutils-traceroute', d)} \
>      iproute2 \
>      ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "kbd", "", d)}=
 \
>      kmod \
>      less \
>      ncurses-tools \
>      net-tools \
> -    parted \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'parted',
> d)} \
>      patch \
>      procps \
>      psmisc \
> @@ -55,7 +55,7 @@ RDEPENDS_${PN} =3D "\
>      unzip \
>      util-linux \
>      ${VIRTUAL-RUNTIME_vim} \
> -    wget \
> +    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'wget', d=
)}
> \
>      which \
>      xz \
>      "
> --
> 2.26.2
>
>
>=20
>
>

--00000000000060b3c305b6b851fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m not sure I like this approach. It doesn=E2=80=
=
=99t look like the right place to decide whether to include or not some pa=
ckages based on specific licensing requirements, licenses for these and oth=
er items change over time, and there may be more undesirable licenses than =
just this one.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Why not s=
imply create a new package group?=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri 18. Dec 2020 at 6.37, Yu, Mingli &lt;<a hre=
f=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@=
windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
packagegroup-core-base-utils repends on some packages which are<br>
gplv3 compatilbe.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-core-base-utils.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-core-base-utils.bb</a>=
=C2=A0 | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/packagegroups/<a href=3D"http://package=
group-core-base-utils.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-core-base-utils.bb</a> b/meta/recipes-extended/packagegroups/<a href=3D"ht=
tp://packagegroup-core-base-utils.bb" rel=3D"noreferrer" target=3D"_blank">=
packagegroup-core-base-utils.bb</a><br>
index 1e63da7f16..0a3cb63bc2 100644<br>
--- a/meta/recipes-extended/packagegroups/<a href=3D"http://packagegroup-c=
ore-base-utils.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-b=
ase-utils.bb</a><br>
+++ b/meta/recipes-extended/packagegroups/<a href=3D"http://packagegroup-c=
ore-base-utils.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-b=
ase-utils.bb</a><br>
@@ -33,18 +33,18 @@ RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0grep \<br>
=C2=A0 =C2=A0 =C2=A0gzip \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quo=
t;systemd&quot;, &quot;&quot;, &quot;ifupdown&quot;, d)} \<br>
-=C2=A0 =C2=A0 inetutils \<br>
-=C2=A0 =C2=A0 inetutils-ping \<br>
-=C2=A0 =C2=A0 inetutils-telnet \<br>
-=C2=A0 =C2=A0 inetutils-tftp \<br>
-=C2=A0 =C2=A0 inetutils-traceroute \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;inetutils&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;inetutils-ping&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;inetutils-telnet&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;inetutils-tftp&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;inetutils-traceroute&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0iproute2 \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;MACHINE_FEATURES&quot;, &qu=
ot;keyboard&quot;, &quot;kbd&quot;, &quot;&quot;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0kmod \<br>
=C2=A0 =C2=A0 =C2=A0less \<br>
=C2=A0 =C2=A0 =C2=A0ncurses-tools \<br>
=C2=A0 =C2=A0 =C2=A0net-tools \<br>
-=C2=A0 =C2=A0 parted \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;parted&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0patch \<br>
=C2=A0 =C2=A0 =C2=A0procps \<br>
=C2=A0 =C2=A0 =C2=A0psmisc \<br>
@@ -55,7 +55,7 @@ RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0unzip \<br>
=C2=A0 =C2=A0 =C2=A0util-linux \<br>
=C2=A0 =C2=A0 =C2=A0${VIRTUAL-RUNTIME_vim} \<br>
-=C2=A0 =C2=A0 wget \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;INCOMPATIBLE_LICENSE&#39;, &#39;G=
PLv3&#39;, &#39;&#39;, &#39;wget&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0which \<br>
=C2=A0 =C2=A0 =C2=A0xz \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000060b3c305b6b851fa--
