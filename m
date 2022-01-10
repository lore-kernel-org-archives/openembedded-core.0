Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34E7C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:01:37 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web08.31094.1641819696744167458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nisgeHFd;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id c36so23111341uae.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hV4VEgjPg9T3jgnkua9z+Ad6I/VU+ScQWo9vOc1Ne6Q=;
        b=nisgeHFdHkbPmZDpOj6RXnunpVY9l7J7TsP8QO2kwk0agDgXvr4tWY7uUrgid+nG1u
         LQzWkPCXhO7QkWoq8DkWIIarVbyIAAFlFk0GCeE1FseDu2bIf15TLY6SFFZbQ+0p6y8F
         WV1nUr6Nl2FyqDJ52Lt1V8ExZeVhGrFc15dL4eis9837Z8fGOIKjvlfo+EiamZWnKVzr
         DW32UG/6sMT4enX1JOZFhxW+EoW+ixQYyVoFLICY4dKeHf9oILOgC6hm6AOqVFsZIuve
         B6h5q277KbOjhOXq2yHvDi4r0lfgY849nYs4frqxNhkXEK0OFxNB0NtDCS602ScgO0hv
         xONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hV4VEgjPg9T3jgnkua9z+Ad6I/VU+ScQWo9vOc1Ne6Q=;
        b=YhCEWRuDtKFSncgT5lOHebG9qbI3rmUEGhaXPLCEylF0Cv7WCp+tCfjW+NT/FfrL/Z
         y+y1F1rL03krDycaAbh2xLCR7HZSkm/LB3Cj0/ohog2COCd4fLK0fzhQs2FsxkwjoZdU
         gHwl5pnxHBugeCNXGcQ2R8T0qgm69nmXQ3p+14EzCKFRQCk3TdC4YrH4mfxbml5a2oAz
         MEjYzhTjV6oSwhiCKP3b75FLHj73zBvwHimV4qiL8mMCiG8Mmj5bM4wGDlxds4NVV5Q4
         X1RzGI74s2wrAy9fiNoYUYdmqC5WogSx/RBmDl7DnJPCZwN1euHEBRYcaWqAfQ1ukvNm
         BqoA==
X-Gm-Message-State: AOAM533D5SV03ZrlCyDggrbF9ym+/bVNA1CvGxLfhnMcUA+9P/BtOSjM
	2eTdIq20xvaGjTqEi42ejSQ33PiaalLILDFRuGw=
X-Google-Smtp-Source: 
 ABdhPJxRkyqlGlvx5qOkTDjEDf2P+oxBmhZLDlHxNb4JaxBY7o/37Wk2shuxetuT2jINGeVEo/bUatn2eYrQoWWZK8c=
X-Received: by 2002:ab0:6f05:: with SMTP id r5mr7606679uah.93.1641819695746;
 Mon, 10 Jan 2022 05:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20220106201234.159792-1-saul.wold@windriver.com>
 <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
 <647ddff7-c27c-4023-aa70-a423876f4e20@www.fastmail.com>
In-Reply-To: <647ddff7-c27c-4023-aa70-a423876f4e20@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jan 2022 14:01:24 +0100
Message-ID: 
 <CANNYZj_DDFsXrftLA3ySaAefWbqO=CRwHROiisY8_x80DDT4nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] perl: Enable threading
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>, bero@lindev.ch
Content-Type: multipart/alternative; boundary="000000000000c014c505d539ef59"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 13:01:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160348

--000000000000c014c505d539ef59
Content-Type: text/plain; charset="UTF-8"

You need to clean before every build. Perl doesn't correctly reconfigure
itself when settings like this change.

Alex

On Mon, 10 Jan 2022 at 13:56, Andrei Gherzan <andrei@gherzan.com> wrote:

> On Mon, 10 Jan 2022, at 12:39, Andrei Gherzan wrote:
> > Hi,
> >
> > On Thu, 6 Jan 2022, at 20:12, Saul Wold wrote:
> >> From: Saul Wold <Saul.Wold@windriver.com>
> >>
> >> When the tranisiton to perl-cross occured, the threading define
> >> seems to have been missed.  The perl tests for threading where
> >> simply skipped, so there was no direct failures.  This was verified
> >> by running perl ptest before and after the change to see PASS vs SKIP
> >> results of threaded related tests.
> >>
> >> NOTE: Perl officially discourges the use of threads, so this
> >> functionality maybe depercated in the future [0][1]
> >>
> >> v2: adds the usethreads to native and nativesdk. This was tested by
> >> builing postresql and rrdtool which use perl and automake.
> >>
> >> [0] https://perldoc.perl.org/5.34.0-RC2/threads#WARNING
> >> [1] https://perldoc.perl.org/perlpolicy#discouraged
> >>
> >> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> >> ---
> >>  meta/recipes-devtools/perl/perl_5.34.0.bb | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> b/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> index a6ae80f07e1..e4bcfe3ce69 100644
> >> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> >> @@ -53,6 +53,7 @@ do_configure:class-target() {
> >>      ./configure --prefix=${prefix} --libdir=${libdir} \
> >>      --target=${TARGET_SYS} \
> >>      -Duseshrplib \
> >> +    -Dusethreads \
> >>      -Dsoname=libperl.so.5 \
> >>      -Dvendorprefix=${prefix} \
> >>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
> >> @@ -80,6 +81,7 @@ do_configure:class-nativesdk() {
> >>      ./configure --prefix=${prefix} \
> >>      --target=${TARGET_SYS} \
> >>      -Duseshrplib \
> >> +    -Dusethreads \
> >>      -Dsoname=libperl.so.5 \
> >>      -Dvendorprefix=${prefix} \
> >>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
> >> @@ -94,6 +96,7 @@ do_configure:class-native() {
> >>      ./configure --prefix=${prefix} \
> >>      -Dbin=${bindir}/perl-native \
> >>      -Duseshrplib \
> >> +    -Dusethreads \
> >>      -Dsoname=libperl.so.5 \
> >>      -Dvendorprefix=${prefix} \
> >>      -Ui_xlocale \
> >
> > This patch seems to break perl-native with musl:
>
> It seems like it is persistent and it can be workaround-ed with a
> cleansstate. the way to reproduce (if anyone is interested) is to:
> 0. I've only tested it with musl so it might be musl specific
> 1. cleansstate perl-native
> 2. build without this patch - reverted
> 3. build with this patch
>
> Andrei
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160347):
> https://lists.openembedded.org/g/openembedded-core/message/160347
> Mute This Topic: https://lists.openembedded.org/mt/88246693/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c014c505d539ef59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to clean before every build. Perl doesn&#39;=
t correctly reconfigure itself when settings like this change.</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 10 Jan 2022 at 13:56, Andrei Gherzan &lt=
;<a href=3D"mailto:andrei@gherzan.com">andrei@gherzan.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 10 Jan 202=
2, at 12:39, Andrei Gherzan wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Thu, 6 Jan 2022, at 20:12, Saul Wold wrote:<br>
&gt;&gt; From: Saul Wold &lt;<a href=3D"mailto:Saul.Wold@windriver.com" tar=
get=3D"_blank">Saul.Wold@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; When the tranisiton to perl-cross occured, the threading define<br=
>
&gt;&gt; seems to have been missed.=C2=A0 The perl tests for threading wher=
e<br>
&gt;&gt; simply skipped, so there was no direct failures.=C2=A0 This was ve=
rified<br>
&gt;&gt; by running perl ptest before and after the change to see PASS vs S=
KIP<br>
&gt;&gt; results of threaded related tests.<br>
&gt;&gt;<br>
&gt;&gt; NOTE: Perl officially discourges the use of threads, so this<br>
&gt;&gt; functionality maybe depercated in the future [0][1]<br>
&gt;&gt;<br>
&gt;&gt; v2: adds the usethreads to native and nativesdk. This was tested b=
y<br>
&gt;&gt; builing postresql and rrdtool which use perl and automake.<br>
&gt;&gt;<br>
&gt;&gt; [0] <a href=3D"https://perldoc.perl.org/5.34.0-RC2/threads#WARNING=
" rel=3D"noreferrer" target=3D"_blank">https://perldoc.perl.org/5.34.0-RC2/=
threads#WARNING</a><br>
&gt;&gt; [1] <a href=3D"https://perldoc.perl.org/perlpolicy#discouraged" re=
l=3D"noreferrer" target=3D"_blank">https://perldoc.perl.org/perlpolicy#disc=
ouraged</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:saul.wold@windriver=
.com" target=3D"_blank">saul.wold@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a> | 3 +++<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.3=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a> <br>
&gt;&gt; b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb" rel=
=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a><br>
&gt;&gt; index a6ae80f07e1..e4bcfe3ce69 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.34.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">perl_5.34.0.bb</a><br>
&gt;&gt; @@ -53,6 +53,7 @@ do_configure:class-target() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ./configure --prefix=3D${prefix} --libdir=3D${=
libdir} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 --target=3D${TARGET_SYS} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Duseshrplib \<br>
&gt;&gt; +=C2=A0 =C2=A0 -Dusethreads \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dsoname=3Dlibperl.so.5 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dvendorprefix=3D${prefix} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Darchlibexp=3D${STAGING_LIBDIR}/perl5/${PV}/$=
{TARGET_ARCH}-linux \<br>
&gt;&gt; @@ -80,6 +81,7 @@ do_configure:class-nativesdk() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ./configure --prefix=3D${prefix} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 --target=3D${TARGET_SYS} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Duseshrplib \<br>
&gt;&gt; +=C2=A0 =C2=A0 -Dusethreads \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dsoname=3Dlibperl.so.5 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dvendorprefix=3D${prefix} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Darchlibexp=3D${STAGING_LIBDIR}/perl5/${PV}/$=
{TARGET_ARCH}-linux \<br>
&gt;&gt; @@ -94,6 +96,7 @@ do_configure:class-native() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ./configure --prefix=3D${prefix} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dbin=3D${bindir}/perl-native \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Duseshrplib \<br>
&gt;&gt; +=C2=A0 =C2=A0 -Dusethreads \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dsoname=3Dlibperl.so.5 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Dvendorprefix=3D${prefix} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -Ui_xlocale \<br>
&gt;<br>
&gt; This patch seems to break perl-native with musl:<br>
<br>
It seems like it is persistent and it can be workaround-ed with a cleanssta=
te. the way to reproduce (if anyone is interested) is to:<br>
0. I&#39;ve only tested it with musl so it might be musl specific<br>
1. cleansstate perl-native<br>
2. build without this patch - reverted<br>
3. build with this patch<br>
<br>
Andrei<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160347): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160347" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160347</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88246693/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88246693/1686489</a><br>
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

--000000000000c014c505d539ef59--

