Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713EFC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 20:15:02 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.66669.1638216900842420634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 12:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PdwzO/o2;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id l24so36740791uak.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wdcuqku0RkNe5xMnR6QHSeRC0YB8OjiBK1a6JHNIX4k=;
        b=PdwzO/o2UlYBR1xCwo7rzepY+cYgxiGEpDCMtXazvKYGm8e/RdXCEGWLEIMQlft8Ub
         t9bqjch3RuQBENUqcKiaheXJmO980cIQZTPkJircjtymFaMIrlX7ljAL/neaeIsaANFu
         Vq12g6x706D20BPlFWJa83BuF3LeAp1qSX4Q7BkSqhkVVTBZuXQNu7YWJpsRDXzhMWdG
         5Yic3SoTNIPUozDMfxldUBGLNgWqBJJCDSQsoejNt0va9EE1kMaf/Ud/M0hxf3+lHdWy
         fVxwipZK7uQurbj/eGTBFJHTvRNTlydSbq2E9AmDi5/oQvLJb9jbSs1ZrPFWXsDK+IMY
         F7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wdcuqku0RkNe5xMnR6QHSeRC0YB8OjiBK1a6JHNIX4k=;
        b=ttirr35JLVgF0g/cWBlN3JIACz+7jx27vs+6i3fXL/pHXI41WC4zbn6u1oadrGvOyb
         2Nv04FzVTMg4FLj5QLyINbewquOIsZlI3ucHR0Xp9VelyVv2ugDothP2e/NLCcMtK0Gv
         Vj3NaVsElyvWf3nk79j0SGtauE0ZVREHKT4L7BwVp9+RFEqX3Ok3YFF/0e7nyZFbuHEJ
         855Odgl7xle1DU7vx/sP+Wy7zP5D1yAlxn+X1o2DHQ+733qvK3SrqGujm05fHhZ9k4PG
         y9Ygw2OS6icw2sXzUu7YIVO7alk2UZjp1VatK1ftFLNXTA4YxAwLiDbD7RxiyL1B/Z6Q
         PuUQ==
X-Gm-Message-State: AOAM531QF9t2enF0GyX4IQw2UuPX4iaMgdcLrTGFkWvbByLO/e2SiW71
	c6rten9lYSO+rjJji+kjJvjYmxpOZX3rYUJnUhs=
X-Google-Smtp-Source: 
 ABdhPJzoRs8R1/d8/WsGZR69R3kFhhEglzLQSUC6/n79NJxe0px3MfgujEVlfXpZS2kM+aDb5ZN/Eg6+Bzvc+0XfBT4=
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr34939218vsf.38.1638216895679;
 Mon, 29 Nov 2021 12:14:55 -0800 (PST)
MIME-Version: 1.0
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
 <20211128094532.1145820-5-jacob.kroon@gmail.com>
 <CANNYZj99aiped+t0cgo+XTLQ=PnTW5yycD=Hyrfa+-EKGT8UWg@mail.gmail.com>
 <3daf5608-6a27-46c3-d44d-2a3ed4885800@gmail.com>
 <16BC1BD946BFDDCE.26361@lists.openembedded.org>
In-Reply-To: <16BC1BD946BFDDCE.26361@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Nov 2021 21:14:44 +0100
Message-ID: 
 <CANNYZj_P155hKFScEMe4Mi=wWUjT46MVbmcqx3UBUgCTyM=-eg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 4/9] perl/perlcross: Improve native
 reproducability
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021d59805d1f31834"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 20:15:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158960

--00000000000021d59805d1f31834
Content-Type: text/plain; charset="UTF-8"

I have fixed this differently, and more reliably - you can cherry-pick into
your branch:
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates&id=40e8c7af7e32045805bab318e66b644c0e8ed3f2

Alex

On Mon, 29 Nov 2021 at 20:43, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Mon, 29 Nov 2021 at 17:44, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
>> On 11/29/21 10:07, Alexander Kanavin wrote:
>> > Can you split the determinism patch fix into a separate patch please?
>> >
>>
>> I don't know what exactly is the right fix here. Should both
>> "determinism.patch":es be applied when building perl-native ?
>>
>
>
> Right, I'll take a look at this myself then.
>
> Alex
>
>
>>
>> Jacob
>>
>> > Alex
>> >
>> > On Sun, 28 Nov 2021 at 10:46, Jacob Kroon <jacob.kroon@gmail.com
>> > <mailto:jacob.kroon@gmail.com>> wrote:
>> >
>> >     In order to make perlcross-native independent of build path we need
>> >     to follow
>> >     the symlinks when copying the patches, otherwise they will point to
>> >     whereever
>> >     oe-core is checked out for that particular build.
>> >
>> >     Doing this reveals an issue in perl-native, where it copies the
>> patches
>> >     from perlcross-native's sysroot, but both perlcross and perl have a
>> >     patch called "determinism.patch", so one of them gets overridden.
>> Rename
>> >     the patch in perlcross so that this doesn't happen.
>> >
>> >     Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com
>> >     <mailto:jacob.kroon@gmail.com>>
>> >     ---
>> >      .../{determinism.patch => perl-cross-determinism.patch}      | 0
>> >      meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>> >     <http://perlcross_1.3.6.bb>          | 4 ++--
>> >      meta/recipes-devtools/perl/perl_5.34.0.bb <http://perl_5.34.0.bb>
>> >                       | 5 +++++
>> >      3 files changed, 7 insertions(+), 2 deletions(-)
>> >      rename meta/recipes-devtools/perl-cross/files/{determinism.patch =>
>> >     perl-cross-determinism.patch} (100%)
>> >
>> >     diff --git
>> >     a/meta/recipes-devtools/perl-cross/files/determinism.patch
>> >
>>  b/meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
>> >     similarity index 100%
>> >     rename from meta/recipes-devtools/perl-cross/files/determinism.patch
>> >     rename to
>> >     meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
>> >     diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>> >     <http://perlcross_1.3.6.bb>
>> >     b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>> >     <http://perlcross_1.3.6.bb>
>> >     index 2759ef8a53..dab7f4558f 100644
>> >     --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>> >     <http://perlcross_1.3.6.bb>
>> >     +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>> >     <http://perlcross_1.3.6.bb>
>> >     @@ -15,7 +15,7 @@ SRC_URI =
>> >     "
>> https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
>> >     <
>> https://github.com/arsv/perl-cross/releases/download/$%7BPV%7D/perl-cross
>> >
>> >
>> >
>>  file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
>> >
>> >     file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
>> >
>> >
>>  file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
>> >     -           file://determinism.patch \
>> >     +           file://perl-cross-determinism.patch \
>> >
>> >
>>  file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
>> >
>> >     file://0001-Makefile-check-the-file-if-patched-or-not.patch \
>> >                 "
>> >     @@ -33,7 +33,7 @@ do_compile () {
>> >
>> >      do_install:class-native() {
>> >          mkdir -p ${D}/${datadir}/perl-cross/
>> >     -    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
>> >     +    cp -rfL ${S}/* ${D}/${datadir}/perl-cross/
>> >      }
>> >
>> >      BBCLASSEXTEND = "native"
>> >     diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> >     <http://perl_5.34.0.bb> b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> >     <http://perl_5.34.0.bb>
>> >     index 16d45ccff3..0b74d5f072 100644
>> >     --- a/meta/recipes-devtools/perl/perl_5.34.0.bb <
>> http://perl_5.34.0.bb>
>> >     +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb <
>> http://perl_5.34.0.bb>
>> >     @@ -97,6 +97,9 @@ do_configure:class-native() {
>> >          -Dvendorprefix=${prefix} \
>> >          -Ui_xlocale \
>> >          ${PACKAGECONFIG_CONFARGS}
>> >     +
>> >     +    # See the comment above
>> >     +    sed -i -e "s,${STAGING_DIR_NATIVE},/non/existent,g" config.h
>> >      }
>> >
>> >      do_configure:append() {
>> >     @@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP = " \
>> >          populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
>> >          populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
>> >          "
>> >     +
>> >     +EXTRA_STAGING_FIXMES:append:class-native = " RPATH_PADDING"
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158959):
> https://lists.openembedded.org/g/openembedded-core/message/158959
> Mute This Topic: https://lists.openembedded.org/mt/87352797/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000021d59805d1f31834
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have fixed this differently, and more reliably - yo=
u can cherry-pick into your branch:</div><div><a href=3D"https://git.yoctop=
roject.org/poky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=
=3D40e8c7af7e32045805bab318e66b644c0e8ed3f2">https://git.yoctoproject.org/p=
oky-contrib/commit/?h=3Dakanavin/package-version-updates&amp;id=3D40e8c7af7=
e32045805bab318e66b644c0e8ed3f2</a></div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, 29 Nov 2021 at 20:43, Alexander Kanavin via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, 29 Nov 2021 at 17:44, Jacob Kroon &lt;<a href=3D"mailto:jacob=
.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/29/21 10:07,=
 Alexander Kanavin wrote:<br>
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
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158959): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158959" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158959</a><br>
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

--00000000000021d59805d1f31834--

