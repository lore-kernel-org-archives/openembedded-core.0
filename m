Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75D6C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 08:12:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.9978.1675325530191162944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 00:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MPWFCFjC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id bg26so747011wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 00:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aSC346Sgvs9ggiuqL1gCDjeUE5m4nRWk0WMv6/yA8Q8=;
        b=MPWFCFjCkxUPTUOKyetTQ1XiyNeAkVe1KlAT3dH29IW2gjp2kGDmCMHlg3t2iAb8nj
         LWZVeIUiKqHA9lhGYsF2o2AU3ksMrEJVi79+mI411WdbfE4cCVcP5soLbEXofpGKRcLy
         OBIbi6I1g5hlmD8r0GWlyAH/T5fFHM2GlDBjvTLo8QVEXTBUhgOT7F9dA1Wl7fpOrZ77
         b1mABPLzQXo4t8KAZ0tGCkXhSrNDxRk9UO66svlYeuqap7tO/GpbBIdaewtQpqCOcPx/
         DNewtkaaniJrggOYlACpK7quviImf+pMD6JHtbE87VAK22MiZNGMENt8TCKjV00PCfbO
         1Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSC346Sgvs9ggiuqL1gCDjeUE5m4nRWk0WMv6/yA8Q8=;
        b=ZmIMbpy+BjAjipdnlTt8N5vSMBvDagqZrtBMWEUPn2IPaGMVXJVEbE0AKxtEJe3ZBg
         flNCrBjDCCwxZzkdpnCyWTqfvGKHLvh3Tx6niAl9L2TJndVzpfSkQY82xRJSZLYOqnFS
         Psm0qFcw9zUttmCYezyVnppFgfgQcc4X4RRZtUyMc36assroCgdZjsoKmtTgFZN4tfRZ
         cMeF+UqUQCFZp4/DKApwl008IeqAAP/Qc4rNJWbKxtEZcA2YS3VoD6BohADsv97WqSdw
         Tc33jsFjOSnAv1Jhyh3toDZUoW1/qLpLiwUBUcC2Bbdl/6WPN4B/9IndJ0DxMgp1NN7I
         dgqQ==
X-Gm-Message-State: AO0yUKVbVE/KYJYkJTB6OBQsIeXSeShAnNkplO9KkKNui9rED7el4AEG
	itJH2xhMCCTdAyUf4yRSbcl8uMq5XADAY0Pvc70=
X-Google-Smtp-Source: AK7set96U5Rk9UffM0M1i+Ke9FOswJSel8F66OjjPp81WrTzEYs2ndsPP5GSPwYM0YPdFTqICV7jjNKNvg/QVxGRe6U=
X-Received: by 2002:a1c:f209:0:b0:3db:f34:e9f2 with SMTP id
 s9-20020a1cf209000000b003db0f34e9f2mr113056wmc.102.1675325528371; Thu, 02 Feb
 2023 00:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20230130050342.130715-1-raj.khem@gmail.com>
In-Reply-To: <20230130050342.130715-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Feb 2023 09:11:54 +0100
Message-ID: <CA+chaQe-vy57fG89YtbAh-Eq+or=_hDTcLMaUUmJti7ZDaCvOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scons: Pass MAXLINELENGTH to scons invocation
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000000749005f3b31f93"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 08:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176682

--00000000000000749005f3b31f93
Content-Type: text/plain; charset="UTF-8"

Can we pass this through some variable (maybe even as default
EXTRA_OESCONS)?

Some recipes seem to use older scons which don't support this and fail with:
Unknown variables: MAXLINELENGTH
ERROR: scons build execution failed.

I've seen this with arm-compute-library-22.08

On Mon, Jan 30, 2023 at 6:03 AM Khem Raj <raj.khem@gmail.com> wrote:

> This helps in overcoming a problem when using scons with ccache enabled.
> When commands get longer, then it resorts to using response files to do
> the operations e.g. @/tmp/tmp96j6icra.lnk when this response file is
> inboked by compiler it works ok, however, this does not when ccache is
> used to invoke the complilation. We see errors e.g.
>
> ccache @/tmp/tmppsyij_0v.lnk
> ccache: error: execute_noreturn of @/tmp/tmppsyij_0v.lnk failed: No such
> file or directory
>
> Using MAXLINELENGTH setting ensures that we can use ARG_MAX to extend
> the length of commandline and hence avoid using response files. This
> issue is also reported in mongodb [1]
>
> [1] https://jira.mongodb.org/browse/SERVER-38389
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes-recipe/scons.bbclass | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-recipe/scons.bbclass
> b/meta/classes-recipe/scons.bbclass
> index 5f0d4a910b..d510c12b9b 100644
> --- a/meta/classes-recipe/scons.bbclass
> +++ b/meta/classes-recipe/scons.bbclass
> @@ -9,11 +9,12 @@ inherit python3native
>  DEPENDS += "python3-scons-native"
>
>  EXTRA_OESCONS ?= ""
> -
> +# This value below is derived from $(getconf ARG_MAX)
> +SCONS_MAXLINELENGTH ?= "2097152"
>  do_configure() {
>         if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" = "${B}" ]; then
>                 if [ -e "${CONFIGURESTAMPFILE}" -a "`cat
> ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ];
> then
> -                       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
> +                       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> --clean PREFIX=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH}
> prefix=${prefix} ${EXTRA_OESCONS}
>                 fi
>
>                 mkdir -p `dirname ${CONFIGURESTAMPFILE}`
> @@ -22,13 +23,17 @@ do_configure() {
>  }
>
>  scons_do_compile() {
> -       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE}
> PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
> +       ${STAGING_BINDIR_NATIVE}/scons --directory=${S} ${PARALLEL_MAKE}
> PREFIX=${prefix} prefix=${prefix} MAXLINELENGTH=${SCONS_MAXLINELENGTH}
> ${EXTRA_OESCONS} || \
>         die "scons build execution failed."
>  }
>
>  scons_do_install() {
> -       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix}
> ${EXTRA_OESCONS} install || \
> +       ${STAGING_BINDIR_NATIVE}/scons --directory=${S}
> install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix}
> MAXLINELENGTH=${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \
>         die "scons install execution failed."
>  }
>
> +do_configure[vardepsexclude] = "SCONS_MAXLINELENGTH"
> +do_compile[vardepsexclude] = "SCONS_MAXLINELENGTH"
> +do_install[vardepsexclude] = "SCONS_MAXLINELENGTH"
> +
>  EXPORT_FUNCTIONS do_compile do_install
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176479):
> https://lists.openembedded.org/g/openembedded-core/message/176479
> Mute This Topic: https://lists.openembedded.org/mt/96622121/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000000749005f3b31f93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we pass this through some variable (maybe even as defa=
ult EXTRA_OESCONS)?<div><br></div><div>Some recipes seem to use older scons=
 which don&#39;t support this and fail with:</div><div>Unknown variables: M=
AXLINELENGTH<br>ERROR: scons build execution failed.<br></div><div><br></di=
v><div>I&#39;ve seen this with=C2=A0arm-compute-library-22.08</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Jan 30, 2023 at 6:03 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">This helps in overcoming a problem when using scons with =
ccache enabled.<br>
When commands get longer, then it resorts to using response files to do<br>
the operations e.g. @/tmp/tmp96j6icra.lnk when this response file is<br>
inboked by compiler it works ok, however, this does not when ccache is<br>
used to invoke the complilation. We see errors e.g.<br>
<br>
ccache @/tmp/tmppsyij_0v.lnk<br>
ccache: error: execute_noreturn of @/tmp/tmppsyij_0v.lnk failed: No such fi=
le or directory<br>
<br>
Using MAXLINELENGTH setting ensures that we can use ARG_MAX to extend<br>
the length of commandline and hence avoid using response files. This<br>
issue is also reported in mongodb [1]<br>
<br>
[1] <a href=3D"https://jira.mongodb.org/browse/SERVER-38389" rel=3D"norefer=
rer" target=3D"_blank">https://jira.mongodb.org/browse/SERVER-38389</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/scons.bbclass | 13 +++++++++----<br>
=C2=A01 file changed, 9 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/scons.bbclass b/meta/classes-recipe/scons.=
bbclass<br>
index 5f0d4a910b..d510c12b9b 100644<br>
--- a/meta/classes-recipe/scons.bbclass<br>
+++ b/meta/classes-recipe/scons.bbclass<br>
@@ -9,11 +9,12 @@ inherit python3native<br>
=C2=A0DEPENDS +=3D &quot;python3-scons-native&quot;<br>
<br>
=C2=A0EXTRA_OESCONS ?=3D &quot;&quot;<br>
-<br>
+# This value below is derived from $(getconf ARG_MAX)<br>
+SCONS_MAXLINELENGTH ?=3D &quot;2097152&quot;<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${CONFIGURESTAMPFILE}&quot; -a &q=
uot;${S}&quot; =3D &quot;${B}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e &quot;${CON=
FIGURESTAMPFILE}&quot; -a &quot;`cat ${CONFIGURESTAMPFILE}`&quot; !=3D &quo=
t;${BB_TASKHASH}&quot; -a &quot;${CLEANBROKEN}&quot; !=3D &quot;1&quot; ]; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} --clean PREFIX=
=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} --clean PREFIX=
=3D${prefix} MAXLINELENGTH=3D${SCONS_MAXLINELENGTH} prefix=3D${prefix} ${EX=
TRA_OESCONS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p `dirname $=
{CONFIGURESTAMPFILE}`<br>
@@ -22,13 +23,17 @@ do_configure() {<br>
=C2=A0}<br>
<br>
=C2=A0scons_do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} ${PARALLEL_MAKE} PREFIX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} =
|| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} ${PARALLEL_MAKE} PREFIX=3D${prefix} prefix=3D${prefix} MAXLINELENGTH=3D$=
{SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 die &quot;scons build execution failed.&quot;<b=
r>
=C2=A0}<br>
<br>
=C2=A0scons_do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} install_root=3D${D}${prefix} PREFIX=3D${prefix} prefix=3D${prefix} ${EXT=
RA_OESCONS} install || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/scons --directory=3D${=
S} install_root=3D${D}${prefix} PREFIX=3D${prefix} prefix=3D${prefix} MAXLI=
NELENGTH=3D${SCONS_MAXLINELENGTH} ${EXTRA_OESCONS} install || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 die &quot;scons install execution failed.&quot;=
<br>
=C2=A0}<br>
<br>
+do_configure[vardepsexclude] =3D &quot;SCONS_MAXLINELENGTH&quot;<br>
+do_compile[vardepsexclude] =3D &quot;SCONS_MAXLINELENGTH&quot;<br>
+do_install[vardepsexclude] =3D &quot;SCONS_MAXLINELENGTH&quot;<br>
+<br>
=C2=A0EXPORT_FUNCTIONS do_compile do_install<br>
-- <br>
2.39.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176479): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176479" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176479</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96622121/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96622121/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000000749005f3b31f93--

