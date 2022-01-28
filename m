Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11320C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 04:26:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.3148.1643343966104765206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 20:26:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: aehs29@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id o3so4251513qtm.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 20:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Peqy8ED2niZq6BCc6aIcyGzANAZhDgYS7/3bfc0iyws=;
        b=ro9WNJo571xayEEj0evHDh93LA7mHMDA+cJGVZWx6plRcaYCuH6CpFmoSkOkUZ2BF5
         HBIqlNGgTfzdGY60lH/0tmUNwM0LYYmSDewwqIn0/uTJUknvzOqqR6YNrQg4SyBeYpf7
         G4oUH3eZBj17BhjRg+Tvp0n68zkD2+glBWssuHlAk1E77SnAM+l+bh6DY6uB7Me9jJkp
         ifN3NNKbq6lp7+FYuoERKG70nomprikoDJ2GClBO0GIaUgROAVOMG4hXGFk+Nm0LZNxg
         cHEHxiFIcPLGxHKnVNozwk6FuRAUI0oQ8QbNrw0mrUw+VG4B7XrR+4fR4Dmhi5Uc6A+M
         642Q==
X-Gm-Message-State: AOAM533sepTyl8Q3+zA/qLSd+QMPqWF4Pt/gVk+qnHCbS3Aj3q+FBzG+
	ssWJsH851Q1dFyKi17d2wP4wLLga1HMq3VGQ
X-Google-Smtp-Source: 
 ABdhPJwaD2+5IMyasl86OJxNMLAfzgL6lmGi6L8lE+qXnJ2ugDBS2puy+ckdh+XdLrNVFucNmpiaog==
X-Received: by 2002:ac8:58ce:: with SMTP id u14mr1023151qta.299.1643343964969;
        Thu, 27 Jan 2022 20:26:04 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id
 l12sm512933qtk.25.2022.01.27.20.26.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 20:26:04 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id o12so4593071qke.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 20:26:04 -0800 (PST)
X-Received: by 2002:a37:6393:: with SMTP id
 x141mr4783535qkb.197.1643343964374;
 Thu, 27 Jan 2022 20:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20220128014022.3144694-1-alejandro@enedino.org>
 <CAMKF1sp0RjKegHg6nRFW_NSEk+q+ErA78=n9yAjVkocTdeuomg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp0RjKegHg6nRFW_NSEk+q+ErA78=n9yAjVkocTdeuomg@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Fri, 28 Jan 2022 04:25:53 +0000
X-Gmail-Original-Message-ID: 
 <CAHMutray7jYd27rwgGO658FO6KMhj492PhzRg71KuVGNQA=LHw@mail.gmail.com>
Message-ID: 
 <CAHMutray7jYd27rwgGO658FO6KMhj492PhzRg71KuVGNQA=LHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] newlib: Upgrade 4.1.0 -> 4.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003d8f1305d69cd53a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 04:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161066

--0000000000003d8f1305d69cd53a
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jan 2022 at 02:10, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 27, 2022 at 5:40 PM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb}  |  0
> >  meta/recipes-core/newlib/newlib.inc                  | 12 +++++++++---
> >  .../newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb}      |  0
> >  3 files changed, 9 insertions(+), 3 deletions(-)
> >  rename meta/recipes-core/newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb}
> (100%)
> >  rename meta/recipes-core/newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb}
> (100%)
> >
> > diff --git a/meta/recipes-core/newlib/libgloss_4.1.0.bb
> b/meta/recipes-core/newlib/libgloss_4.2.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/newlib/libgloss_4.1.0.bb
> > rename to meta/recipes-core/newlib/libgloss_4.2.0.bb
> > diff --git a/meta/recipes-core/newlib/newlib.inc
> b/meta/recipes-core/newlib/newlib.inc
> > index 23cd172008..5e488d0848 100644
> > --- a/meta/recipes-core/newlib/newlib.inc
> > +++ b/meta/recipes-core/newlib/newlib.inc
> > @@ -15,13 +15,19 @@ LIC_FILES_CHKSUM = " \
> >
>  file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0
> \
> >                 "
> >
> > -SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> > -SRC_URI[sha256sum] =
> "f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154"
> > +# Newlib maintainers sometimes publish the source
> > +# from a specific snapshot, after an upgrade we can
> > +# delete the following line and keep the empty default
> > +NEWLIB_SNAPSHOT = ".20211231"
>
> hmmm so its not 4.2.0 release yet ?
> maybe just rename the recipe accordingly ?
>

Its a little confusing, the source was uploaded with the snapshot suffix,
but the snapshot tag in the git log points to:
Update newlib to 4.2.0
https://sourceware.org/git/?p=newlib-cygwin.git;a=commit;h=484d2ebf8d825b28af47b8ee88cd845f1d2c7c6e
So it seems it is the release, they just didn't upload it that way, I've
waited a few weeks in case they did but no change.
Hence why I decided to keep the recipe name as 4.2.0

Alejandro

>
> > +NEWLIB_SNAPSHOT ?= ""
> > +SRC_URI = "
> https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAPSHOT}.tar.gz"
> > +SRC_URI[sha256sum] =
> "c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d139867607369cb2915ffc54435"
> > +
> >
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  DEPENDS = "virtual/${TARGET_PREFIX}gcc"
> >
> > -S = "${WORKDIR}/newlib-${PV}"
> > +S = "${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}"
> >  B = "${WORKDIR}/build"
> >
> >  ## disable stdlib
> > diff --git a/meta/recipes-core/newlib/newlib_4.1.0.bb
> b/meta/recipes-core/newlib/newlib_4.2.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/newlib/newlib_4.1.0.bb
> > rename to meta/recipes-core/newlib/newlib_4.2.0.bb
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161064):
> https://lists.openembedded.org/g/openembedded-core/message/161064
> > Mute This Topic: https://lists.openembedded.org/mt/88736577/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000003d8f1305d69cd53a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 28 Jan 2022 =
at 02:10, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, Jan 27, 2022 at 5:40 PM Alejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@en=
edino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 .../newlib/{<a href=3D"http://libgloss_4.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">libgloss_4.1.0.bb</a> =3D&gt; <a href=3D"http://libgl=
oss_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">libgloss_4.2.0.bb</a>}=
=C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 meta/recipes-core/newlib/newlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++++++---<br>
&gt;=C2=A0 .../newlib/{<a href=3D"http://newlib_4.1.0.bb" rel=3D"noreferrer=
" target=3D"_blank">newlib_4.1.0.bb</a> =3D&gt; <a href=3D"http://newlib_4.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">newlib_4.2.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 3 files changed, 9 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-core/newlib/{<a href=3D"http://libgloss_4.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libgloss_4.1.0.bb</a> =3D&gt; <a=
 href=3D"http://libgloss_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">lib=
gloss_4.2.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-core/newlib/{<a href=3D"http://newlib_4.1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">newlib_4.1.0.bb</a> =3D&gt; <a hre=
f=3D"http://newlib_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">newlib_4.=
2.0.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/newlib/<a href=3D"http://libgloss_4.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libgloss_4.1.0.bb</a> b/meta/reci=
pes-core/newlib/<a href=3D"http://libgloss_4.2.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgloss_4.2.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-core/newlib/<a href=3D"http://libgloss_4.1.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libgloss_4.1.0.bb</a><br>
&gt; rename to meta/recipes-core/newlib/<a href=3D"http://libgloss_4.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">libgloss_4.2.0.bb</a><br>
&gt; diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/n=
ewlib/newlib.inc<br>
&gt; index 23cd172008..5e488d0848 100644<br>
&gt; --- a/meta/recipes-core/newlib/newlib.inc<br>
&gt; +++ b/meta/recipes-core/newlib/newlib.inc<br>
&gt; @@ -15,13 +15,19 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ne=
wlib/libc/sys/linux/linuxthreads/LICENSE;md5=3D73640207fbc79b198c7ffd4ad4d9=
7aa0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/newlib/newlib=
-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://sourceware.=
org/pub/newlib/newlib-${PV}.tar.gz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;f296e372f51324224d387cc116dc37a6bd397198=
756746f93a2b02e9a5d40154&quot;<br>
&gt; +# Newlib maintainers sometimes publish the source<br>
&gt; +# from a specific snapshot, after an upgrade we can<br>
&gt; +# delete the following line and keep the empty default<br>
&gt; +NEWLIB_SNAPSHOT =3D &quot;.20211231&quot;<br>
<br>
hmmm so its not 4.2.0 release yet ?<br>
maybe just rename the recipe accordingly ?<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small">Its a little confusing, the source was uploaded with the snaps=
hot suffix, but the snapshot tag in the git log points to:<br><div class=3D=
"gmail-page_body" style=3D"padding:8px;font-family:monospace;color:rgb(0,0,=
0)">Update=C2=A0newlib=C2=A0to=C2=A04.2.0<br></div><div class=3D"gmail-page=
_body" style=3D"padding:8px;font-family:monospace;color:rgb(0,0,0)"><a href=
=3D"https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dcommit;h=3D484d2e=
bf8d825b28af47b8ee88cd845f1d2c7c6e">https://sourceware.org/git/?p=3Dnewlib-=
cygwin.git;a=3Dcommit;h=3D484d2ebf8d825b28af47b8ee88cd845f1d2c7c6e</a><br><=
/div>So it seems it is the release, they just didn&#39;t upload it that way=
, I&#39;ve waited a few weeks in case they did but no change.</div><div cla=
ss=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"=
>Hence why I decided to keep the recipe name as 4.2.0</div><br></div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:smal=
l">Alejandro</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +NEWLIB_SNAPSHOT ?=3D &quot;&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/newlib/newlib=
-$%7BPV%7D$%7BNEWLIB_SNAPSHOT%7D.tar.gz" rel=3D"noreferrer" target=3D"_blan=
k">https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAPSHOT}.tar.gz<=
/a>&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d13=
9867607369cb2915ffc54435&quot;<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc&quot;<br>
&gt;<br>
&gt; -S =3D &quot;${WORKDIR}/newlib-${PV}&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}&quot;<br>
&gt;=C2=A0 B =3D &quot;${WORKDIR}/build&quot;<br>
&gt;<br>
&gt;=C2=A0 ## disable stdlib<br>
&gt; diff --git a/meta/recipes-core/newlib/<a href=3D"http://newlib_4.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">newlib_4.1.0.bb</a> b/meta/recipes-=
core/newlib/<a href=3D"http://newlib_4.2.0.bb" rel=3D"noreferrer" target=3D=
"_blank">newlib_4.2.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-core/newlib/<a href=3D"http://newlib_4.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">newlib_4.1.0.bb</a><br>
&gt; rename to meta/recipes-core/newlib/<a href=3D"http://newlib_4.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">newlib_4.2.0.bb</a><br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#161064): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/161064" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/161064</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88736577=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88736577/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000003d8f1305d69cd53a--

