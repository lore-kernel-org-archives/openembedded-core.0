Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0617DC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 09:22:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6300.1676107323234006881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 01:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JplROtFx;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id by3so6140094wrb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 01:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cDebtum4DM9+qZedhBfMxPb5IuQzoMtE0JaRezhmfbQ=;
        b=JplROtFxOT/BMLJWKjcHwBcp+e5/9pUOHE71MDHH36+MSQfrJ7NsZLgYTPtYeEu+LO
         Kq+CfcP6JKuoT3OSTdoZVaOBhCEGZ3Hw7w4boSsWZWvt67wZO5jWfSbbyxXUjRaPL7BO
         1XPvbi3G23dXmtqptvac8fExKy6d4o7CaikueV4W6jPE+TShOHJPfoKLvMjhnSSy8UgW
         q7hbmIgHSim7U5t1FTBCWwuxYZvopywoIH+lgnBlLLWGRCBBUJ7OawMOfKXhAK7KBu7J
         RdpLSRg3oRvjGox0e+IAnHxSuW+c0E69LezYhCm2kqNlVEsZlVn7DMdHJw0FvSK8u9+e
         +9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDebtum4DM9+qZedhBfMxPb5IuQzoMtE0JaRezhmfbQ=;
        b=54zfdXGo/+H22ylsYclTPQ5OAmDNPax/TTVduu9PoF0fYQnEj2bQbXoZP4pK8XuEev
         0yHtLquWDO1qFZgypKI6B0G2imCbvGk+ZfBPvwnZO9BbV3FgUSSBR8SRSslnUTZuBWUm
         LuZDWM1PzhNki6ckttcg/0tUxhHhCUIO5wYqmwlNivhv8TMQ5AQvgAhPz3P56/aDPao2
         qxbcYR7SSlU7QkmBTQ7qJPQ2odPwRwNS5kHy520ZcoOlnjF98QBj906PbrHmon6t4e0z
         jL4BGF81liZddXqgWfndGTg4QupZIqF+XZzuaw4XtrFNUfVVz8THKdrmTnRUSBOqqGo8
         oZYg==
X-Gm-Message-State: AO0yUKUSty8lLdzKcQ5Fh6SfEwcgiaDSjCWZdL9iwbv4XxBKXMdcXdnO
	wTqxNFiH2u+K+MzADFXihg6CSAcrML9SXLUN+eE=
X-Google-Smtp-Source: AK7set9D950bDBKa9XQjqwxJ+AxzqDyofIDaJOo/egEMC5JkkyFuGmLf4+YUSwsIG4eHJdWkv32GNriHGWipxE9/EC4=
X-Received: by 2002:a05:6000:1a53:b0:2bf:c9bc:e04e with SMTP id
 t19-20020a0560001a5300b002bfc9bce04emr484845wry.697.1676107321501; Sat, 11
 Feb 2023 01:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20230202084116.2583868-1-raj.khem@gmail.com>
In-Reply-To: <20230202084116.2583868-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 Feb 2023 10:21:50 +0100
Message-ID: <CA+chaQfohEhko1oBEm-k46QBG0To9D3-b9c458kSdtr13=ONgw@mail.gmail.com>
Subject: Re: [PATCH] scons.bbclass: Make MAXLINELENGTH overridable
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000080ee7a05f469251c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 09:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177003

--00000000000080ee7a05f469251c
Content-Type: text/plain; charset="UTF-8"

Steve,

I've noticed that you have:
b0e7777a91 scons: Pass MAXLINELENGTH to scons invocation
in contrib/stable/kirkstone-nut, but not this follow-up fix.

Please either take both of them or neither.

Cheers,

On Thu, Feb 2, 2023 at 9:41 AM Khem Raj <raj.khem@gmail.com> wrote:

> older scons do not support MAXLINELENGTH and some packages still may be
> using older scons, these recipes can clear SCONS_MAXLINELENGTH in them
> and get going. Set
>
> SCONS_MAXLINELENGTH = ""
>
> in such recipes.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes-recipe/scons.bbclass | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-recipe/scons.bbclass
> b/meta/classes-recipe/scons.bbclass
> index d510c12b9b..d20a78dc6e 100644
> --- a/meta/classes-recipe/scons.bbclass
> +++ b/meta/classes-recipe/scons.bbclass
> @@ -10,11 +10,12 @@ DEPENDS += "python3-scons-native"
>
>  EXTRA_OESCONS ?= ""
>  # This value below is derived from $(getconf ARG_MAX)
> -SCONS_MAXLINELENGTH ?= "2097152"
> +SCONS_MAXLINELENGTH ?= "MAXLINELENGTH=2097152"
> +EXTRA_OESCONS:append = " ${SCONS_MAXLINELENGTH}"
>  do_configure() {
>         if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" = "${B}" ]; then
>                 if [ -e "${CONFIGURESTAMPFILE}" -a "`cat
> ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ];
> then
> -                       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> --clean PREFIX=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH}
> prefix=${prefix} ${EXTRA_OESCONS}
> +                       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
>                 fi
>
>                 mkdir -p `dirname ${CONFIGURESTAMPFILE}`
> @@ -23,12 +24,12 @@ do_configure() {
>  }
>
>  scons_do_compile() {
> -       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE}
> PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH}
> ${EXTRA_OESCONS} || \
> +       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE}
> PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
>         die "scons build execution failed."
>  }
>
>  scons_do_install() {
> -       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix}
> MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \
> +       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix}
> ${EXTRA_OESCONS} install || \
>         die "scons install execution failed."
>  }
>
> --
> 2.39.1
>
>

--00000000000080ee7a05f469251c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Steve,<div><br></div><div>I&#39;ve noticed that you have:<=
/div><div>b0e7777a91 scons: Pass MAXLINELENGTH to scons invocation<br></div=
><div>in=C2=A0contrib/stable/kirkstone-nut, but not this follow-up fix.</di=
v><div><br></div><div>Please either take both of them or neither.</div><div=
><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Feb 2, 2023 at 9:41 AM Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">older scons do not s=
upport MAXLINELENGTH and some packages still may be<br>
using older scons, these recipes can clear SCONS_MAXLINELENGTH in them<br>
and get going. Set<br>
<br>
SCONS_MAXLINELENGTH =3D &quot;&quot;<br>
<br>
in such recipes.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/scons.bbclass | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/scons.bbclass b/meta/classes-recipe/scons.=
bbclass<br>
index d510c12b9b..d20a78dc6e 100644<br>
--- a/meta/classes-recipe/scons.bbclass<br>
+++ b/meta/classes-recipe/scons.bbclass<br>
@@ -10,11 +10,12 @@ DEPENDS +=3D &quot;python3-scons-native&quot;<br>
<br>
=C2=A0EXTRA_OESCONS ?=3D &quot;&quot;<br>
=C2=A0# This value below is derived from $(getconf ARG_MAX)<br>
-SCONS_MAXLINELENGTH ?=3D &quot;2097152&quot;<br>
+SCONS_MAXLINELENGTH ?=3D &quot;MAXLINELENGTH=3D2097152&quot;<br>
+EXTRA_OESCONS:append =3D &quot; ${SCONS_MAXLINELENGTH}&quot;<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${CONFIGURESTAMPFILE}&quot; -a &q=
uot;${S}&quot; =3D &quot;${B}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e &quot;${CON=
FIGURESTAMPFILE}&quot; -a &quot;`cat ${CONFIGURESTAMPFILE}`&quot; !=3D &quo=
t;${BB_TASKHASH}&quot; -a &quot;${CLEANBROKEN}&quot; !=3D &quot;1&quot; ]; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} --clean PREFIX=
=3D${prefix} MAXLINELENGTH=3D${SCONS_MAXLINELENGTH} prefix=3D${prefix} ${EX=
TRA_OESCONS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} --clean PREFIX=
=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p `dirname $=
{CONFIGURESTAMPFILE}`<br>
@@ -23,12 +24,12 @@ do_configure() {<br>
=C2=A0}<br>
<br>
=C2=A0scons_do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} ${PARALLEL_MAKE} PREFIX=3D${prefix} prefix=3D${prefix} MAXLINELENGTH=3D$=
{SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} ${PARALLEL_MAKE} PREFIX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} =
|| \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 die &quot;scons build execution failed.&quot;<b=
r>
=C2=A0}<br>
<br>
=C2=A0scons_do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} install_root=3D${D}${prefix} PREFIX=3D${prefix} prefix=3D${prefix} MAXLI=
NELENGTH=3D${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} install_root=3D${D}${prefix} PREFIX=3D${prefix} prefix=3D${prefix} ${EXT=
RA_OESCONS} install || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 die &quot;scons install execution failed.&quot;=
<br>
=C2=A0}<br>
<br>
-- <br>
2.39.1<br>
<br>
</blockquote></div>

--00000000000080ee7a05f469251c--

