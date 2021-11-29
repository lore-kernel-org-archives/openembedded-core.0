Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017DFC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 19:43:05 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.65694.1638214984019934013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 11:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BGQO53mh;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id y5so36466453ual.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GNHlbZi017kOLd4iZ8QITJ/Vzcgr1eNSGCXc5hRCIAc=;
        b=BGQO53mheavY6gou9gILUAsXDPXo1MpvYmLwsY5ZhyI1A86jbQsQIBq5feMbwnJQl9
         8LfMguK75PRIlJhmjFiHE0BbRIC44bCnLv+Am9ZjlNuIU1pG0bv9cWg4vMJ8HH+GoEif
         CGMm0tSRPViMCB6fHKbXuvlGiIVpd23cdepAn384zCRH3AzNID2GCMWa7HcCTAO1ci8c
         Lp7MOwcpVuboXg+wWZVnqNxaqORGwdUQOegkWkgtkyCfZV+ffBwT29JcyPVp9aNBqFmw
         6SaV9qNqmQKwsZ/+6GFshT0ykyEax4DW61H3oa9t1JTYjcqcmwgieJDfwFT7jZfwfLFn
         1eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GNHlbZi017kOLd4iZ8QITJ/Vzcgr1eNSGCXc5hRCIAc=;
        b=wKHj1NkekqmHU2Te/q7phJZT9ChWoyacADpaM7mIBdukYhGt6hVzHx0RRATXZzPrh0
         g6DeuJGgmN+uWJqmalI971JeQZAFGxCFaAAiA1Uni2hep1qq9s1TdlDB+jLhjXDForxz
         Povo5R7ZQLgaNblLsi0pQeBfxp1b+P2lOabZHCi0EQp/qaS7iHeZR9F3gtkhwhpv/eaF
         5NrZOM3ivVWpxFN6RGkHJf0CuB7136+mZ1XiQ/M9UyAfWwPUQ/uCHy8jT+JkgXvnv+hW
         B5OpMcs/hCvzIIe7jb5VGYrU7vEEx8cqmXnYKoWYSyv+cWiPfNAQr9XdjcUbxy2hvxVE
         8Jmw==
X-Gm-Message-State: AOAM531WVL+uGCTIHR3Z7ELk5W5MjZTvivBIaCTAiLK/azFxIrA7+58p
	kL3ghBbvxMN3WN4t01nKAd+0+4irP2Ir6fnl7ZA=
X-Google-Smtp-Source: 
 ABdhPJzrL+0sgHKuJFoejHmEM/A6L1KUBk03xdYmyK35ApusyCSYfvhBFkyPR4wHaEFOGldj8qQ/CStZtQjXS7mDtuM=
X-Received: by 2002:a67:efd5:: with SMTP id s21mr35807571vsp.73.1638214983021;
 Mon, 29 Nov 2021 11:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
 <20211128094532.1145820-5-jacob.kroon@gmail.com>
 <CANNYZj99aiped+t0cgo+XTLQ=PnTW5yycD=Hyrfa+-EKGT8UWg@mail.gmail.com>
 <3daf5608-6a27-46c3-d44d-2a3ed4885800@gmail.com>
In-Reply-To: <3daf5608-6a27-46c3-d44d-2a3ed4885800@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Nov 2021 20:42:51 +0100
Message-ID: 
 <CANNYZj8OOPnPBChpU3qD3E+Yv-Jv1bNUF_fmuONrPhqHJX2NCw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 4/9] perl/perlcross: Improve native
 reproducability
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000020f8c705d1f2a614"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 19:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158959

--00000000000020f8c705d1f2a614
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Nov 2021 at 17:44, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 11/29/21 10:07, Alexander Kanavin wrote:
> > Can you split the determinism patch fix into a separate patch please?
> >
>
> I don't know what exactly is the right fix here. Should both
> "determinism.patch":es be applied when building perl-native ?
>


Right, I'll take a look at this myself then.

Alex


>
> Jacob
>
> > Alex
> >
> > On Sun, 28 Nov 2021 at 10:46, Jacob Kroon <jacob.kroon@gmail.com
> > <mailto:jacob.kroon@gmail.com>> wrote:
> >
> >     In order to make perlcross-native independent of build path we need
> >     to follow
> >     the symlinks when copying the patches, otherwise they will point to
> >     whereever
> >     oe-core is checked out for that particular build.
> >
> >     Doing this reveals an issue in perl-native, where it copies the
> patches
> >     from perlcross-native's sysroot, but both perlcross and perl have a
> >     patch called "determinism.patch", so one of them gets overridden.
> Rename
> >     the patch in perlcross so that this doesn't happen.
> >
> >     Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com
> >     <mailto:jacob.kroon@gmail.com>>
> >     ---
> >      .../{determinism.patch => perl-cross-determinism.patch}      | 0
> >      meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> >     <http://perlcross_1.3.6.bb>          | 4 ++--
> >      meta/recipes-devtools/perl/perl_5.34.0.bb <http://perl_5.34.0.bb>
> >                       | 5 +++++
> >      3 files changed, 7 insertions(+), 2 deletions(-)
> >      rename meta/recipes-devtools/perl-cross/files/{determinism.patch =>
> >     perl-cross-determinism.patch} (100%)
> >
> >     diff --git
> >     a/meta/recipes-devtools/perl-cross/files/determinism.patch
> >     b/meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
> >     similarity index 100%
> >     rename from meta/recipes-devtools/perl-cross/files/determinism.patch
> >     rename to
> >     meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
> >     diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> >     <http://perlcross_1.3.6.bb>
> >     b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> >     <http://perlcross_1.3.6.bb>
> >     index 2759ef8a53..dab7f4558f 100644
> >     --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> >     <http://perlcross_1.3.6.bb>
> >     +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> >     <http://perlcross_1.3.6.bb>
> >     @@ -15,7 +15,7 @@ SRC_URI =
> >     "
> https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
> >     <
> https://github.com/arsv/perl-cross/releases/download/$%7BPV%7D/perl-cross>
> >
> >
>  file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
> >
> >     file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
> >
> >
>  file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
> >     -           file://determinism.patch \
> >     +           file://perl-cross-determinism.patch \
> >
> >
>  file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
> >
> >     file://0001-Makefile-check-the-file-if-patched-or-not.patch \
> >                 "
> >     @@ -33,7 +33,7 @@ do_compile () {
> >
> >      do_install:class-native() {
> >          mkdir -p ${D}/${datadir}/perl-cross/
> >     -    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
> >     +    cp -rfL ${S}/* ${D}/${datadir}/perl-cross/
> >      }
> >
> >      BBCLASSEXTEND = "native"
> >     diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb
> >     <http://perl_5.34.0.bb> b/meta/recipes-devtools/perl/perl_5.34.0.bb
> >     <http://perl_5.34.0.bb>
> >     index 16d45ccff3..0b74d5f072 100644
> >     --- a/meta/recipes-devtools/perl/perl_5.34.0.bb <
> http://perl_5.34.0.bb>
> >     +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb <
> http://perl_5.34.0.bb>
> >     @@ -97,6 +97,9 @@ do_configure:class-native() {
> >          -Dvendorprefix=${prefix} \
> >          -Ui_xlocale \
> >          ${PACKAGECONFIG_CONFARGS}
> >     +
> >     +    # See the comment above
> >     +    sed -i -e "s,${STAGING_DIR_NATIVE},/non/existent,g" config.h
> >      }
> >
> >      do_configure:append() {
> >     @@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP = " \
> >          populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
> >          populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
> >          "
> >     +
> >     +EXTRA_STAGING_FIXMES:append:class-native = " RPATH_PADDING"
> >
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#158871):
> >     https://lists.openembedded.org/g/openembedded-core/message/158871
> >     <https://lists.openembedded.org/g/openembedded-core/message/158871>
> >     Mute This Topic: https://lists.openembedded.org/mt/87352797/1686489
> >     <https://lists.openembedded.org/mt/87352797/1686489>
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://lists.openembedded.org/g/openembedded-core/unsub>
> >     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000020f8c705d1f2a614
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 29 Nov 2021 at 17:44, Jacob Kroon &lt;<a href=3D"mailto:jaco=
b.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 11/29/21 10:07, Alexander Kanavi=
n wrote:<br>
&gt; Can you split the determinism patch fix into a separate patch please?<=
br>
&gt; <br>
<br>
I don&#39;t know what exactly is the right fix here. Should both<br>
&quot;determinism.patch&quot;:es be applied when building perl-native ?<br>=
</blockquote><div><br></div><div><br></div><div>Right, I&#39;ll take a look=
 at this myself then.</div><div><br></div><div>Alex<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Jacob<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Sun, 28 Nov 2021 at 10:46, Jacob Kroon &lt;<a href=3D"mailto:jacob.=
kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jacob.kroon@gmail.com" target=3D"_blank">=
jacob.kroon@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In order to make perlcross-native independent of bu=
ild path we need<br>
&gt;=C2=A0 =C2=A0 =C2=A0to follow<br>
&gt;=C2=A0 =C2=A0 =C2=A0the symlinks when copying the patches, otherwise th=
ey will point to<br>
&gt;=C2=A0 =C2=A0 =C2=A0whereever<br>
&gt;=C2=A0 =C2=A0 =C2=A0oe-core is checked out for that particular build.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Doing this reveals an issue in perl-native, where i=
t copies the patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0from perlcross-native&#39;s sysroot, but both perlc=
ross and perl have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch called &quot;determinism.patch&quot;, so one =
of them gets overridden. Rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0the patch in perlcross so that this doesn&#39;t hap=
pen.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:ja=
cob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jacob.kroon@gmail.com"=
 target=3D"_blank">jacob.kroon@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../{determinism.patch =3D&gt; perl-cross-det=
erminism.patch}=C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-devtools/perl-cross/<a href=3D"h=
ttp://perlcross_1.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.=
3.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perlcross_1.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://perlcross_1.3.6.bb</a>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-devtools/perl/<a href=3D"http://=
perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a> &lt=
;<a href=3D"http://perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://perl_5.34.0.bb</a>&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A03 files changed, 7 insertions(+), 2 deletions=
(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recipes-devtools/perl-cross/files=
/{determinism.patch =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0perl-cross-determinism.patch} (100%)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/perl-cross/files/determinis=
m.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/perl-cross/files/perl-cross=
-determinism.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0similarity index 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename from meta/recipes-devtools/perl-cross/files/=
determinism.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/perl-cross/files/perl-cross-d=
eterminism.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-devtools/perl-cross/<a hr=
ef=3D"http://perlcross_1.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlc=
ross_1.3.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perlcross_1.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://perlcross_1.3.6.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/perl-cross/<a href=3D"http:=
//perlcross_1.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perlcross_1.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://perlcross_1.3.6.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 2759ef8a53..dab7f4558f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devtools/perl-cross/<a href=3D"h=
ttp://perlcross_1.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.=
3.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perlcross_1.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://perlcross_1.3.6.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-devtools/perl-cross/<a href=3D"h=
ttp://perlcross_1.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.=
3.6.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perlcross_1.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">http://perlcross_1.3.6.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -15,7 +15,7 @@ SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://github.com/arsv/perl-cross=
/releases/download/$%7BPV%7D/perl-cross" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/arsv/perl-cross/r=
eleases/download/$%7BPV%7D/perl-cross" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/arsv/perl-cross/releases/download/$%7BPV%7D/perl-cross<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-configure_tool.sh-do-not-quote-the-argu=
ment-to-comma.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-perl-cross-add-LDFLAGS-when-linking-lib=
perl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-configure_path.sh-do-not-hardcode-prefi=
x-lib-as-libr.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://de=
terminism.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pe=
rl-cross-determinism.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-cnf-configure_func_sel.sh-disable-threa=
d_safe_nl_lan.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-Makefile-check-the-file-if-patched-or-n=
ot.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -33,7 +33,7 @@ do_compile () {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0do_install:class-native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${datadir}/perl-c=
ross/<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 cp -rf ${S}/* ${D}/${datadir}/perl-c=
ross/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cp -rfL ${S}/* ${D}/${datadir}/perl-=
cross/<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-devtools/perl/<a href=3D"=
http://perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perl_5.34.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://perl_5.34.0.bb</a>&gt; b/meta/recipes-devtoo=
ls/perl/<a href=3D"http://perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">perl_5.34.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://perl_5.34.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://perl_5.34.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 16d45ccff3..0b74d5f072 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devtools/perl/<a href=3D"http://=
perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a> &lt=
;<a href=3D"http://perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://perl_5.34.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-devtools/perl/<a href=3D"http://=
perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a> &lt=
;<a href=3D"http://perl_5.34.0.bb" rel=3D"noreferrer" target=3D"_blank">htt=
p://perl_5.34.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -97,6 +97,9 @@ do_configure:class-native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0-Dvendorprefix=3D${prefix} \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0-Ui_xlocale \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0${PACKAGECONFIG_CONFARGS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 # See the comment above<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sed -i -e &quot;s,${STAGING_DIR_NATI=
VE},/non/existent,g&quot; config.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0do_configure:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP =3D &q=
uot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0populate_sysroot:*/lib*/perl5/c=
onfig.sh:${TMPDIR} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0populate_sysroot:*/lib*/perl5/c=
onfig.sh:${COREBASE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+EXTRA_STAGING_FIXMES:append:class-native =3D &quot=
; RPATH_PADDING&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#158871):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/158871" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/158871</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/158871" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/158871</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/87352797/1686489" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/mt/87352797/1686489</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/87=
352797/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/87352797/1686489</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--00000000000020f8c705d1f2a614--

