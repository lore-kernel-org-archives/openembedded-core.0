Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36027C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 09:07:55 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web08.58635.1638176874314195640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MY6Ptx9B;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id p37so32498815uae.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aae4nGWxBmrqX5rmkndsq0pyLr8cdA4YfdNhNaubM+U=;
        b=MY6Ptx9BOwE0NJ7JGBmwalh1WyzF9NnIaOpDRExEVENQS+6wqiKPuzPtUHu7c6tY77
         x6RWS+fhIrFfdhMmeNmPbDR30aBcp8mJPftM/Q1SH+D3shWUHpm7JXyr+W16NhspvADY
         UeIY8GG1W8ktrLPulbJf0ugSyJNTzPuCuVkt37FHo6RPgvFkqtXs1TKEEzRatmStK33Y
         NUiSWvnzP68C0bVpFQYjDkr84vdrNbzMjYceeMeCsxNYsW69kxJacFMsodwz9WmAau1C
         gihqlKSEquomSVLnzrkYdlM+2v/oLgnGXt3LRmMAtXNvkCrzC9R/HnhVXeoZwfgxa44k
         d2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aae4nGWxBmrqX5rmkndsq0pyLr8cdA4YfdNhNaubM+U=;
        b=7WTarHmyOHAlHJqZ3A8PCSg0K8arY+ZlvkdvE7POaOE4uET7vwiq36BVB8BiooClYQ
         lakQZHwuHDnRk9038yWlg1N2mtQ++k14gablddJavqEWhp4b0ytNwrD8b/T/HmALMZEl
         KaUWT52vXkl4t+OUTUaGUg10MJA43ccZ86FAzqVmms2etogZ70uNk4JhgwnmCZD7NUdF
         CVWnWYWldinVax4rag2ywYawq1DdM7J8Eo4RscBCz8uw18riy39m7KkpHtzS/XyzroEN
         SNvsAyp/W+pZJNTDtoQrjIB4Y0r5D2ebhhZ5cYRiQ5p+VZx12AJ2sK32ec7j2BP8Nffp
         fCnw==
X-Gm-Message-State: AOAM5306CiSy437Xpb0UDjzJEq6NXUY68wWYHDy4ecGCLZ5VrsSA8UYh
	WRuApRbArUPLckOgb0kbtjLkJjo+Gjx+huOYoVM=
X-Google-Smtp-Source: 
 ABdhPJzJbUisnvPZY0qTBj1SQFGEDA8SOAxWZQqAnbqckm15arI2KuFmGzjQ6cnqe/KDLHeEERVG12Ma1JY2la5+7No=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr30769278vsf.38.1638176873374;
 Mon, 29 Nov 2021 01:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
 <20211128094532.1145820-5-jacob.kroon@gmail.com>
In-Reply-To: <20211128094532.1145820-5-jacob.kroon@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Nov 2021 10:07:41 +0100
Message-ID: 
 <CANNYZj99aiped+t0cgo+XTLQ=PnTW5yycD=Hyrfa+-EKGT8UWg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 4/9] perl/perlcross: Improve native
 reproducability
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009de94705d1e9c69b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 09:07:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158931

--0000000000009de94705d1e9c69b
Content-Type: text/plain; charset="UTF-8"

Can you split the determinism patch fix into a separate patch please?

Alex

On Sun, 28 Nov 2021 at 10:46, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> In order to make perlcross-native independent of build path we need to
> follow
> the symlinks when copying the patches, otherwise they will point to
> whereever
> oe-core is checked out for that particular build.
>
> Doing this reveals an issue in perl-native, where it copies the patches
> from perlcross-native's sysroot, but both perlcross and perl have a
> patch called "determinism.patch", so one of them gets overridden. Rename
> the patch in perlcross so that this doesn't happen.
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  .../{determinism.patch => perl-cross-determinism.patch}      | 0
>  meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb          | 4 ++--
>  meta/recipes-devtools/perl/perl_5.34.0.bb                    | 5 +++++
>  3 files changed, 7 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/perl-cross/files/{determinism.patch =>
> perl-cross-determinism.patch} (100%)
>
> diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch
> b/meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
> similarity index 100%
> rename from meta/recipes-devtools/perl-cross/files/determinism.patch
> rename to
> meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
> diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> index 2759ef8a53..dab7f4558f 100644
> --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> @@ -15,7 +15,7 @@ SRC_URI = "
> https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
>
> file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
>             file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
>
> file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
> -           file://determinism.patch \
> +           file://perl-cross-determinism.patch \
>
> file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
>             file://0001-Makefile-check-the-file-if-patched-or-not.patch \
>             "
> @@ -33,7 +33,7 @@ do_compile () {
>
>  do_install:class-native() {
>      mkdir -p ${D}/${datadir}/perl-cross/
> -    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
> +    cp -rfL ${S}/* ${D}/${datadir}/perl-cross/
>  }
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb
> b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index 16d45ccff3..0b74d5f072 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -97,6 +97,9 @@ do_configure:class-native() {
>      -Dvendorprefix=${prefix} \
>      -Ui_xlocale \
>      ${PACKAGECONFIG_CONFARGS}
> +
> +    # See the comment above
> +    sed -i -e "s,${STAGING_DIR_NATIVE},/non/existent,g" config.h
>  }
>
>  do_configure:append() {
> @@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP = " \
>      populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
>      populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
>      "
> +
> +EXTRA_STAGING_FIXMES:append:class-native = " RPATH_PADDING"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158871):
> https://lists.openembedded.org/g/openembedded-core/message/158871
> Mute This Topic: https://lists.openembedded.org/mt/87352797/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009de94705d1e9c69b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you split the determinism patch fix into a separa=
te patch please?</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 28 Nov 2021=
 at 10:46, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com">jacob.k=
roon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">In order to make perlcross-native independent of build path w=
e need to follow<br>
the symlinks when copying the patches, otherwise they will point to whereev=
er<br>
oe-core is checked out for that particular build.<br>
<br>
Doing this reveals an issue in perl-native, where it copies the patches<br>
from perlcross-native&#39;s sysroot, but both perlcross and perl have a<br>
patch called &quot;determinism.patch&quot;, so one of them gets overridden.=
 Rename<br>
the patch in perlcross so that this doesn&#39;t happen.<br>
<br>
Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com" tar=
get=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{determinism.patch =3D&gt; perl-cross-determinism.patch}=C2=A0 =
=C2=A0 =C2=A0 | 0<br>
=C2=A0meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb=
" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.34.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
=C2=A03 files changed, 7 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/perl-cross/files/{determinism.patch =3D&=
gt; perl-cross-determinism.patch} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/met=
a/recipes-devtools/perl-cross/files/perl-cross-determinism.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/perl-cross/files/determinism.patch<br>
rename to meta/recipes-devtools/perl-cross/files/perl-cross-determinism.pat=
ch<br>
diff --git a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1=
.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a> b/meta=
/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
index 2759ef8a53..dab7f4558f 100644<br>
--- a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb=
" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
+++ b/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb=
" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/arsv/perl=
-cross/releases/download/$%7BPV%7D/perl-cross" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cr=
oss</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure_tool.sh-do-=
not-quote-the-argument-to-comma.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-perl-cross-add-LDFLAG=
S-when-linking-libperl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure_path.sh-do-=
not-hardcode-prefix-lib-as-libr.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://determinism.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://perl-cross-determinism.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cnf-configure_func_se=
l.sh-disable-thread_safe_nl_lan.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-check-the-fi=
le-if-patched-or-not.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -33,7 +33,7 @@ do_compile () {<br>
<br>
=C2=A0do_install:class-native() {<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${datadir}/perl-cross/<br>
-=C2=A0 =C2=A0 cp -rf ${S}/* ${D}/${datadir}/perl-cross/<br>
+=C2=A0 =C2=A0 cp -rfL ${S}/* ${D}/${datadir}/perl-cross/<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.34.0.bb</a><br>
index 16d45ccff3..0b74d5f072 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.34.0.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.34.0.bb</a><br>
@@ -97,6 +97,9 @@ do_configure:class-native() {<br>
=C2=A0 =C2=A0 =C2=A0-Dvendorprefix=3D${prefix} \<br>
=C2=A0 =C2=A0 =C2=A0-Ui_xlocale \<br>
=C2=A0 =C2=A0 =C2=A0${PACKAGECONFIG_CONFARGS}<br>
+<br>
+=C2=A0 =C2=A0 # See the comment above<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s,${STAGING_DIR_NATIVE},/non/existent,g&quot=
; config.h<br>
=C2=A0}<br>
<br>
=C2=A0do_configure:append() {<br>
@@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \<br>
=C2=A0 =C2=A0 =C2=A0populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \<b=
r>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+EXTRA_STAGING_FIXMES:append:class-native =3D &quot; RPATH_PADDING&quot;<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158871): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158871" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158871</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87352797/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87352797/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009de94705d1e9c69b--

