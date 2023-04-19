Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF32C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 05:55:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.31025.1681883730749603957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 22:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Q27uuaWJ;
 spf=pass (domain: mvista.com, ip: 209.85.208.171, mailfrom: skulkarni@mvista.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2a8dc00ade2so9492461fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681883729; x=1684475729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eMlNbYELAWOFyKds20xJCzJenzH08K1iiZn2ZUl7DIw=;
        b=Q27uuaWJG0GAJ7ZeDSCnFFtKMrghAoefdNc08YaJMBq7OH7OENQvnuMZ8yUiqL6Xx2
         6lGheQrJr/z1Wbrfmm/sSXQ42+Vry6ePiI1xDIlg4v2RHKOjJg6jDBPcvSQj95H+SYkX
         F1jF5BRmyPXdl03SkeTJ09iZevthTkpYBBGzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681883729; x=1684475729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMlNbYELAWOFyKds20xJCzJenzH08K1iiZn2ZUl7DIw=;
        b=CnkBLNjWlfZa9+63Yvh/8EmUMIEmKYNp4YjkmKumE35fMp1sEmR7Ok+rGAPfz9V7tZ
         ZdyK3/x0PSKR70F/TV2jkuqo5/In33fgF1Y6YBujgCAuFc95EeqieZOuE1+qprH4sEip
         x76YF1xu9pypzmT+npWHnF5BqVPMZh+qYomHs7jKvNoblnV/l8iyhibcTmXP5jA/TB16
         HAabNHq8X7pBg0HOtsYkMNHqfxIvKkIrWjUSuh7P/zjrxrZ7u9OU33yZhUK2nfxHwwM3
         tG/oGwo3BRUjBhj9PPiEHmqZ74Q3sX5FbCV85s9bCAzhbQq8pdJPQlauw/AiFt5oS0ix
         IEBQ==
X-Gm-Message-State: AAQBX9dDraHpwManTO1lWfhgiUqf2dy97D5VxeS4D6mTstVbK/h17x/E
	m7JR9Sf8kpimJJdm0OExbr9cVXrQCaWxFXVHpNawQg==
X-Google-Smtp-Source: AKy350YgS41a87fjcUttT74/MxfmMajQbVN1/0ZpGIc+DzKEccSn646/sGqQAhxTm8MaeMqOz+gc9y//Z7ze8tKvdzY=
X-Received: by 2002:ac2:5394:0:b0:4dd:a058:f08f with SMTP id
 g20-20020ac25394000000b004dda058f08fmr3950582lfh.3.1681883728369; Tue, 18 Apr
 2023 22:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230418115423.30752-1-skulkarni@mvista.com> <CAOSpxdY6vJ85rT9mQ6B+8z8NRiXVam+uMqmLfX2U9MeKLqb1yw@mail.gmail.com>
In-Reply-To: <CAOSpxdY6vJ85rT9mQ6B+8z8NRiXVam+uMqmLfX2U9MeKLqb1yw@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Wed, 19 Apr 2023 11:25:16 +0530
Message-ID: <CAKzga+wEpXYq_750m5K15U-2ir0vLUbjc1HjLWo8mMCEt4chig@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go-runtime: Security fix for CVE-2022-41722
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ef8cd05f9aa12c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180210

--0000000000002ef8cd05f9aa12c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Steve! Apologies for the inconvenience caused. I will take care
next time.

Thanks,
Shubham

On Tue, Apr 18, 2023 at 8:04=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> There were a couple of issues with this patch.  I've fixed both so no
> need to resubmit, but in the future please be sure to check the
> following:
>
> 1. Patch should be based on the latest kirkstone head -- you were
> using an earlier state which was missing "go: fix CVE-2022-41724,
> 41725" so the patch didn't apply.
> 2. CVE patch files should have a CVE: tag in addition to the
> Upstream-status: and Signed-off-by: tags
>
> Thanks for helping fix CVEs!
>
> Steve
>
> On Tue, Apr 18, 2023 at 1:54=E2=80=AFAM Shubham Kulkarni <skulkarni@mvist=
a.com>
> wrote:
> >
> > From: Shubham Kulkarni <skulkarni@mvista.com>
> >
> > path/filepath: do not Clean("a/../c:/b") into c:\b on Windows
> >
> > Backport from
> https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f=
18c
> >
> > Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > ---
> >  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
> >  .../go/go-1.18/CVE-2022-41722.patch           | 102 ++++++++++++++++++
> >  2 files changed, 103 insertions(+)
> >  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41722.pat=
ch
> >
> > diff --git a/meta/recipes-devtools/go/go-1.17.13.inc
> b/meta/recipes-devtools/go/go-1.17.13.inc
> > index 14d58932dc..d104e34408 100644
> > --- a/meta/recipes-devtools/go/go-1.17.13.inc
> > +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> > @@ -23,6 +23,7 @@ SRC_URI +=3D "\
> >      file://CVE-2022-2879.patch \
> >      file://CVE-2022-41720.patch \
> >      file://CVE-2022-41723.patch \
> > +    file://CVE-2022-41722.patch \
> >  "
> >  SRC_URI[main.sha256sum] =3D
> "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
> >
> > diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
> b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
> > new file mode 100644
> > index 0000000000..447c3d45bd
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
> > @@ -0,0 +1,102 @@
> > +From a826b19625caebed6dd0f3fbd9d0111f6c83737c Mon Sep 17 00:00:00 2001
> > +From: Damien Neil <dneil@google.com>
> > +Date: Mon, 12 Dec 2022 16:43:37 -0800
> > +Subject: [PATCH] path/filepath: do not Clean("a/../c:/b") into c:\b on
> Windows
> > +
> > +Do not permit Clean to convert a relative path into one starting
> > +with a drive reference. This change causes Clean to insert a .
> > +path element at the start of a path when the original path does not
> > +start with a volume name, and the first path element would contain
> > +a colon.
> > +
> > +This may introduce a spurious but harmless . path element under
> > +some circumstances. For example, Clean("a/../b:/../c") becomes `.\c`.
> > +
> > +This reverts CL 401595, since the change here supersedes the one
> > +in that CL.
> > +
> > +Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this
> issue.
> > +
> > +Updates #57274
> > +Fixes #57276
> > +Fixes CVE-2022-41722
> > +
> > +Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17
> > +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1675249
> > +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> > +Run-TryBot: Damien Neil <dneil@google.com>
> > +Reviewed-by: Julie Qiu <julieqiu@google.com>
> > +TryBot-Result: Security TryBots <
> security-trybots@go-security-trybots.iam.gserviceaccount.com>
> > +(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)
> > +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1728944
> > +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> > +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> > +Reviewed-by: Damien Neil <dneil@google.com>
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/468119
> > +Reviewed-by: Than McIntosh <thanm@google.com>
> > +Run-TryBot: Michael Pratt <mpratt@google.com>
> > +TryBot-Result: Gopher Robot <gobot@golang.org>
> > +Auto-Submit: Michael Pratt <mpratt@google.com>
> > +
> > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f=
18
> > +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > +---
> > + src/path/filepath/path.go | 27 ++++++++++++++-------------
> > + 1 file changed, 14 insertions(+), 13 deletions(-)
> > +
> > +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
> > +index 8300a32..94621a0 100644
> > +--- a/src/path/filepath/path.go
> > ++++ b/src/path/filepath/path.go
> > +@@ -15,6 +15,7 @@ import (
> > +       "errors"
> > +       "io/fs"
> > +       "os"
> > ++      "runtime"
> > +       "sort"
> > +       "strings"
> > + )
> > +@@ -117,21 +118,9 @@ func Clean(path string) string {
> > +               case os.IsPathSeparator(path[r]):
> > +                       // empty path element
> > +                       r++
> > +-              case path[r] =3D=3D '.' && r+1 =3D=3D n:
> > ++              case path[r] =3D=3D '.' && (r+1 =3D=3D n ||
> os.IsPathSeparator(path[r+1])):
> > +                       // . element
> > +                       r++
> > +-              case path[r] =3D=3D '.' && os.IsPathSeparator(path[r+1]=
):
> > +-                      // ./ element
> > +-                      r++
> > +-
> > +-                      for r < len(path) && os.IsPathSeparator(path[r]=
)
> {
> > +-                              r++
> > +-                      }
> > +-                      if out.w =3D=3D 0 && volumeNameLen(path[r:]) > =
0 {
> > +-                              // When joining prefix "." and an
> absolute path on Windows,
> > +-                              // the prefix should not be removed.
> > +-                              out.append('.')
> > +-                      }
> > +               case path[r] =3D=3D '.' && path[r+1] =3D=3D '.' && (r+2=
 =3D=3D n ||
> os.IsPathSeparator(path[r+2])):
> > +                       // .. element: remove to last separator
> > +                       r +=3D 2
> > +@@ -157,6 +146,18 @@ func Clean(path string) string {
> > +                       if rooted && out.w !=3D 1 || !rooted && out.w !=
=3D 0
> {
> > +                               out.append(Separator)
> > +                       }
> > ++                      // If a ':' appears in the path element at the
> start of a Windows path,
> > ++                      // insert a .\ at the beginning to avoid
> converting relative paths
> > ++                      // like a/../c: into c:.
> > ++                      if runtime.GOOS =3D=3D "windows" && out.w =3D=
=3D 0 &&
> out.volLen =3D=3D 0 && r !=3D 0 {
> > ++                              for i :=3D r; i < n &&
> !os.IsPathSeparator(path[i]); i++ {
> > ++                                      if path[i] =3D=3D ':' {
> > ++                                              out.append('.')
> > ++                                              out.append(Separator)
> > ++                                              break
> > ++                                      }
> > ++                              }
> > ++                      }
> > +                       // copy element
> > +                       for ; r < n && !os.IsPathSeparator(path[r]); r+=
+
> {
> > +                               out.append(path[r])
> > +--
> > +2.7.4
> > --
> > 2.33.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180187):
> https://lists.openembedded.org/g/openembedded-core/message/180187
> > Mute This Topic: https://lists.openembedded.org/mt/98341957/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002ef8cd05f9aa12c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:1lv" class=3D"gmail-Am gmail-aO9 gmail-A=
l editable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Message Body=
" role=3D"textbox" aria-multiline=3D"true" tabindex=3D"1" style=3D"directio=
n:ltr;min-height:85px" aria-controls=3D":1oo">Thank you Steve! Apologies=C2=
=A0for the inconvenience=C2=A0caused. I will take care next=C2=A0time.<div>=
<br></div><div>Thanks,</div><div>Shubham</div></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 18, 2023 at=
 8:04=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">ste=
ve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">There were a couple of issues with this patch.=C2=A0 I&#39;ve=
 fixed both so no<br>
need to resubmit, but in the future please be sure to check the<br>
following:<br>
<br>
1. Patch should be based on the latest kirkstone head -- you were<br>
using an earlier state which was missing &quot;go: fix CVE-2022-41724,<br>
41725&quot; so the patch didn&#39;t apply.<br>
2. CVE patch files should have a CVE: tag in addition to the<br>
Upstream-status: and Signed-off-by: tags<br>
<br>
Thanks for helping fix CVEs!<br>
<br>
Steve<br>
<br>
On Tue, Apr 18, 2023 at 1:54=E2=80=AFAM Shubham Kulkarni &lt;<a href=3D"mai=
lto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com" tar=
get=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;<br>
&gt; path/filepath: do not Clean(&quot;a/../c:/b&quot;) into c:\b on Window=
s<br>
&gt;<br>
&gt; Backport from <a href=3D"https://github.com/golang/go/commit/bdf07c2e1=
68baf736e4c057279ca12a4d674f18c" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c</a>=
<br>
&gt;<br>
&gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista=
.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-1.17.13.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../go/go-1.18/CVE-2022-41722.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 102 ++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 103 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-417=
22.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-de=
vtools/go/go-1.17.13.inc<br>
&gt; index 14d58932dc..d104e34408 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.17.13.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17.13.inc<br>
&gt; @@ -23,6 +23,7 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-2879.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41720.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41723.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2022-41722.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[main.sha256sum] =3D &quot;a1a48b23afb206f95e7bbaa9b898d9=
65f90826f6f1d1fc0c1d784ada0cd300fd&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch b/m=
eta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..447c3d45bd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch<br>
&gt; @@ -0,0 +1,102 @@<br>
&gt; +From a826b19625caebed6dd0f3fbd9d0111f6c83737c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_=
blank">dneil@google.com</a>&gt;<br>
&gt; +Date: Mon, 12 Dec 2022 16:43:37 -0800<br>
&gt; +Subject: [PATCH] path/filepath: do not Clean(&quot;a/../c:/b&quot;) i=
nto c:\b on Windows<br>
&gt; +<br>
&gt; +Do not permit Clean to convert a relative path into one starting<br>
&gt; +with a drive reference. This change causes Clean to insert a .<br>
&gt; +path element at the start of a path when the original path does not<b=
r>
&gt; +start with a volume name, and the first path element would contain<br=
>
&gt; +a colon.<br>
&gt; +<br>
&gt; +This may introduce a spurious but harmless . path element under<br>
&gt; +some circumstances. For example, Clean(&quot;a/../b:/../c&quot;) beco=
mes `.\c`.<br>
&gt; +<br>
&gt; +This reverts CL 401595, since the change here supersedes the one<br>
&gt; +in that CL.<br>
&gt; +<br>
&gt; +Thanks to RyotaK (<a href=3D"https://twitter.com/ryotkak" rel=3D"nore=
ferrer" target=3D"_blank">https://twitter.com/ryotkak</a>) for reporting th=
is issue.<br>
&gt; +<br>
&gt; +Updates #57274<br>
&gt; +Fixes #57276<br>
&gt; +Fixes CVE-2022-41722<br>
&gt; +<br>
&gt; +Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17<br>
&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/gol=
ang/go-private/+/1675249" rel=3D"noreferrer" target=3D"_blank">https://team=
-review.git.corp.google.com/c/golang/go-private/+/1675249</a><br>
&gt; +Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.=
com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; +Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" targe=
t=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; +Reviewed-by: Julie Qiu &lt;<a href=3D"mailto:julieqiu@google.com" tar=
get=3D"_blank">julieqiu@google.com</a>&gt;<br>
&gt; +TryBot-Result: Security TryBots &lt;<a href=3D"mailto:security-trybot=
s@go-security-trybots.iam.gserviceaccount.com" target=3D"_blank">security-t=
rybots@go-security-trybots.iam.gserviceaccount.com</a>&gt;<br>
&gt; +(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)<=
br>
&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/gol=
ang/go-private/+/1728944" rel=3D"noreferrer" target=3D"_blank">https://team=
-review.git.corp.google.com/c/golang/go-private/+/1728944</a><br>
&gt; +Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.c=
om" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; +Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@goo=
gle.com" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
&gt; +Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" targ=
et=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/468=
119" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/468119</a><br>
&gt; +Reviewed-by: Than McIntosh &lt;<a href=3D"mailto:thanm@google.com" ta=
rget=3D"_blank">thanm@google.com</a>&gt;<br>
&gt; +Run-TryBot: Michael Pratt &lt;<a href=3D"mailto:mpratt@google.com" ta=
rget=3D"_blank">mpratt@google.com</a>&gt;<br>
&gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" t=
arget=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Auto-Submit: Michael Pratt &lt;<a href=3D"mailto:mpratt@google.com" t=
arget=3D"_blank">mpratt@google.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport from <a href=3D"https://github.com/golang/g=
o/commit/bdf07c2e168baf736e4c057279ca12a4d674f18" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279c=
a12a4d674f18</a><br>
&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvist=
a.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/path/filepath/path.go | 27 ++++++++++++++-------------<br>
&gt; + 1 file changed, 14 insertions(+), 13 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go<br=
>
&gt; +index 8300a32..94621a0 100644<br>
&gt; +--- a/src/path/filepath/path.go<br>
&gt; ++++ b/src/path/filepath/path.go<br>
&gt; +@@ -15,6 +15,7 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io/fs&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;runtime&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sort&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; + )<br>
&gt; +@@ -117,21 +118,9 @@ func Clean(path string) string {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case os.IsPath=
Separator(path[r]):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// empty path element<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0r++<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D=
 &#39;.&#39; &amp;&amp; r+1 =3D=3D n:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D=
 &#39;.&#39; &amp;&amp; (r+1 =3D=3D n || os.IsPathSeparator(path[r+1])):<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// . element<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0r++<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D=
 &#39;.&#39; &amp;&amp; os.IsPathSeparator(path[r+1]):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // ./ element<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r++<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for r &lt; len(path) &amp;&amp; os.IsPathSeparator(path[r]) {<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r++<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if out.w =3D=3D 0 &amp;&amp; volumeNameLen(path[r:]) &gt; 0 {<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // When joining prefix &quot;.&quot;=
 and an absolute path on Windows,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // the prefix should not be removed.=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.append(&#39;.&#39;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case path[r] =
=3D=3D &#39;.&#39; &amp;&amp; path[r+1] =3D=3D &#39;.&#39; &amp;&amp; (r+2 =
=3D=3D n || os.IsPathSeparator(path[r+2])):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// .. element: remove to last separator<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0r +=3D 2<br>
&gt; +@@ -157,6 +146,18 @@ func Clean(path string) string {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if rooted &amp;&amp; out.w !=3D 1 || !rooted &amp;&amp; out.w=
 !=3D 0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out.append(Separator)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // If a &#39;:&#39; appears in the path element at the start of =
a Windows path,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // insert a .\ at the beginning to avoid converting relative pat=
hs<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // like a/../c: into c:.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if runtime.GOOS =3D=3D &quot;windows&quot; &amp;&amp; out.w =3D=
=3D 0 &amp;&amp; out.volLen =3D=3D 0 &amp;&amp; r !=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i :=3D r; i &lt; n &amp;&amp; !o=
s.IsPathSeparator(path[i]); i++ {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path[=
i] =3D=3D &#39;:&#39; {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 out.append(&#39;.&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 out.append(Separator)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 break<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// copy element<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0for ; r &lt; n &amp;&amp; !os.IsPathSeparator(path[r]); r++ {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out.append(path[r])<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; --<br>
&gt; 2.33.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180187): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180187" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/180187</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98341957=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98341957/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000002ef8cd05f9aa12c3--

