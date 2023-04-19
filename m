Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083AAC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 12:39:10 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.36421.1681907946076653231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 05:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=jhgYCVCq;
 spf=pass (domain: mvista.com, ip: 209.85.167.50, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4ec816d64afso13287241e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681907944; x=1684499944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pobMyt+NmbkyJWAobNGwWU7lVW24DzzFhN4xMOdGYb4=;
        b=jhgYCVCq52WQ28+Y/KyWVI7PGVeN1J2DBQ7hjO/P5pESWVa0DmwrorA1uISqtdrzH3
         FSwgfqPB+GVSSVC5wyk85SvYbxZQ9rina4wQWL5C+eFxDgfFLJ+FD1GxsiWI5v1KLh12
         KdoUXWJ6CiwhVlzrxrJXfiXDZatOwJPt9a8aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681907944; x=1684499944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pobMyt+NmbkyJWAobNGwWU7lVW24DzzFhN4xMOdGYb4=;
        b=XTj3iXozM2s31KprCiOrcycF2xc8mkpT68KY+OL1l4ZwIgU1SZizq144qg2G6jrd+i
         TyzEVBev8dxpy2rG8iG0MYbN2F4ccbhPaxsWlQB3LYCvQ2EOhJH0HMg9WWcKO7S0DKDE
         V7ke7yhsDIcDF7S5v13Il8tCGYE9RJ5V4n95AkeXLsG5tFzBqpuWl4SlQkJbhtcjcN8b
         DQgCjsQWg/5tTUpEhwwJanohOX9pzlfv0o4prS0CZRclDDvlwEajQOuW/fZrTXFZg1VF
         +9mOB0GQvWuGmyqCh6DHdKwgXeSjDpStJjAHfgyalgTvdbwO7TtIvyP+ZQ8C/tokXgP4
         mZfw==
X-Gm-Message-State: AAQBX9dLwEqxovSEQSJpn6lbX7qy+Legko0cndRdAk+OOAJZSVkyd5ra
	ev7fadH91mBQdJVsMpA29ggbdFwzDuGebYRq8Xnt36Khr6OlHBd2RFk=
X-Google-Smtp-Source: AKy350aUBSzYFJloZClqvSuORwmHxy0QCpJa3lXUIJCA8D/A4p79oNh2taLYeie+rcD22w8wTmA0SEyYlh+QpSxcM88=
X-Received: by 2002:a05:6512:158f:b0:4e8:49cc:6744 with SMTP id
 bp15-20020a056512158f00b004e849cc6744mr969505lfb.1.1681907943939; Wed, 19 Apr
 2023 05:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <1757560BEE901822.9727@lists.openembedded.org>
In-Reply-To: <1757560BEE901822.9727@lists.openembedded.org>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Wed, 19 Apr 2023 18:08:52 +0530
Message-ID: <CAKzga+z33dA2udYtSo4WsyC4R-Ry56DFkCtO3oQvodxu=Gg9DQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go-runtime: Security fix for CVE-2022-41722
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008b321f05f9afb5fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 12:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180218

--0000000000008b321f05f9afb5fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

I have sent a dunfell branch patch with the subject
"[OE-core][*dunfell*][PATCH]
go-runtime: Security fix for CVE-2022-41722". I am not sure why it's
showing as a reply on kirkstone patch, not a separate email. Please
consider this patch to fix CVE-2022-41722 in dunfell.

Thanks,
Shubham

On Wed, Apr 19, 2023 at 6:03=E2=80=AFPM Shubham Kulkarni via lists.openembe=
dded.org
<skulkarni=3Dmvista.com@lists.openembedded.org> wrote:

> From: Shubham Kulkarni <skulkarni@mvista.com>
>
> path/filepath: do not Clean("a/../c:/b") into c:\b on Windows
>
> Backport from
> https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f=
18c
>
> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc               |   2 +
>  .../go/go-1.14/CVE-2022-41722-1.patch              |  53 +++++++++++
>  .../go/go-1.14/CVE-2022-41722-2.patch              | 104
> +++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.pat=
ch
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.pat=
ch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> index f2a5fc3..74017f4 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -53,6 +53,8 @@ SRC_URI +=3D "\
>      file://CVE-2022-41717.patch \
>      file://CVE-2022-1962.patch \
>      file://CVE-2022-41723.patch \
> +    file://CVE-2022-41722-1.patch \
> +    file://CVE-2022-41722-2.patch \
>  "
>
>  SRC_URI_append_libc-musl =3D "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
> new file mode 100644
> index 0000000..f5bffd7
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
> @@ -0,0 +1,53 @@
> +From 94e0c36694fb044e81381d112fef3692de7cdf52 Mon Sep 17 00:00:00 2001
> +From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
> +Date: Fri, 22 Apr 2022 10:07:51 +0900
> +Subject: [PATCH 1/2] path/filepath: do not remove prefix "." when
> following
> + path contains ":".
> +
> +Fixes #52476
> +
> +Change-Id: I9eb72ac7dbccd6322d060291f31831dc389eb9bb
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/401595
> +Auto-Submit: Ian Lance Taylor <iant@google.com>
> +Reviewed-by: Alex Brainman <alex.brainman@gmail.com>
> +Run-TryBot: Ian Lance Taylor <iant@google.com>
> +Reviewed-by: Ian Lance Taylor <iant@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +Upstream-Status: Backport from
> https://github.com/golang/go/commit/9cd1818a7d019c02fa4898b3e45a323e35033=
290
> +CVE: CVE-2022-41722
> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> +---
> + src/path/filepath/path.go | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
> +index 26f1833..92dc090 100644
> +--- a/src/path/filepath/path.go
> ++++ b/src/path/filepath/path.go
> +@@ -116,9 +116,21 @@ func Clean(path string) string {
> +               case os.IsPathSeparator(path[r]):
> +                       // empty path element
> +                       r++
> +-              case path[r] =3D=3D '.' && (r+1 =3D=3D n ||
> os.IsPathSeparator(path[r+1])):
> ++              case path[r] =3D=3D '.' && r+1 =3D=3D n:
> +                       // . element
> +                       r++
> ++              case path[r] =3D=3D '.' && os.IsPathSeparator(path[r+1]):
> ++                      // ./ element
> ++                      r++
> ++
> ++                      for r < len(path) && os.IsPathSeparator(path[r]) =
{
> ++                              r++
> ++                      }
> ++                      if out.w =3D=3D 0 && volumeNameLen(path[r:]) > 0 =
{
> ++                              // When joining prefix "." and an absolut=
e
> path on Windows,
> ++                              // the prefix should not be removed.
> ++                              out.append('.')
> ++                      }
> +               case path[r] =3D=3D '.' && path[r+1] =3D=3D '.' && (r+2 =
=3D=3D n ||
> os.IsPathSeparator(path[r+2])):
> +                       // .. element: remove to last separator
> +                       r +=3D 2
> +--
> +2.7.4
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
> new file mode 100644
> index 0000000..e1f7a55
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
> @@ -0,0 +1,104 @@
> +From b8803cb711ae163b8e67897deb6cf8c49702227c Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Mon, 12 Dec 2022 16:43:37 -0800
> +Subject: [PATCH 2/2] path/filepath: do not Clean("a/../c:/b") into c:\b =
on
> + Windows
> +
> +Do not permit Clean to convert a relative path into one starting
> +with a drive reference. This change causes Clean to insert a .
> +path element at the start of a path when the original path does not
> +start with a volume name, and the first path element would contain
> +a colon.
> +
> +This may introduce a spurious but harmless . path element under
> +some circumstances. For example, Clean("a/../b:/../c") becomes `.\c`.
> +
> +This reverts CL 401595, since the change here supersedes the one
> +in that CL.
> +
> +Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this issue.
> +
> +Updates #57274
> +Fixes #57276
> +Fixes CVE-2022-41722
> +
> +Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1675249
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1675249+Re=
viewed-by>:
> Roland Shoemaker <bracewell@google.com>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +TryBot-Result: Security TryBots <
> security-trybots@go-security-trybots.iam.gserviceaccount.com>
> +(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1728944
> +Run-TryBot
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1728944+Ru=
n-TryBot>:
> Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/468119
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +Run-TryBot: Michael Pratt <mpratt@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Auto-Submit: Michael Pratt <mpratt@google.com>
> +
> +Upstream-Status: Backport from
> https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f=
18c
> +CVE: CVE-2022-41722
> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> +---
> + src/path/filepath/path.go | 27 ++++++++++++++-------------
> + 1 file changed, 14 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
> +index 92dc090..f0f095e 100644
> +--- a/src/path/filepath/path.go
> ++++ b/src/path/filepath/path.go
> +@@ -14,6 +14,7 @@ package filepath
> + import (
> +       "errors"
> +       "os"
> ++      "runtime"
> +       "sort"
> +       "strings"
> + )
> +@@ -116,21 +117,9 @@ func Clean(path string) string {
> +               case os.IsPathSeparator(path[r]):
> +                       // empty path element
> +                       r++
> +-              case path[r] =3D=3D '.' && r+1 =3D=3D n:
> ++              case path[r] =3D=3D '.' && (r+1 =3D=3D n ||
> os.IsPathSeparator(path[r+1])):
> +                       // . element
> +                       r++
> +-              case path[r] =3D=3D '.' && os.IsPathSeparator(path[r+1]):
> +-                      // ./ element
> +-                      r++
> +-
> +-                      for r < len(path) && os.IsPathSeparator(path[r]) =
{
> +-                              r++
> +-                      }
> +-                      if out.w =3D=3D 0 && volumeNameLen(path[r:]) > 0 =
{
> +-                              // When joining prefix "." and an absolut=
e
> path on Windows,
> +-                              // the prefix should not be removed.
> +-                              out.append('.')
> +-                      }
> +               case path[r] =3D=3D '.' && path[r+1] =3D=3D '.' && (r+2 =
=3D=3D n ||
> os.IsPathSeparator(path[r+2])):
> +                       // .. element: remove to last separator
> +                       r +=3D 2
> +@@ -156,6 +145,18 @@ func Clean(path string) string {
> +                       if rooted && out.w !=3D 1 || !rooted && out.w !=
=3D 0 {
> +                               out.append(Separator)
> +                       }
> ++                      // If a ':' appears in the path element at the
> start of a Windows path,
> ++                      // insert a .\ at the beginning to avoid
> converting relative paths
> ++                      // like a/../c: into c:.
> ++                      if runtime.GOOS =3D=3D "windows" && out.w =3D=3D =
0 &&
> out.volLen =3D=3D 0 && r !=3D 0 {
> ++                              for i :=3D r; i < n &&
> !os.IsPathSeparator(path[i]); i++ {
> ++                                      if path[i] =3D=3D ':' {
> ++                                              out.append('.')
> ++                                              out.append(Separator)
> ++                                              break
> ++                                      }
> ++                              }
> ++                      }
> +                       // copy element
> +                       for ; r < n && !os.IsPathSeparator(path[r]); r++ =
{
> +                               out.append(path[r])
> +--
> +2.7.4
> --
> 2.7.4
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180217):
> https://lists.openembedded.org/g/openembedded-core/message/180217
> Mute This Topic: https://lists.openembedded.org/mt/98365307/7032091
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skulkarni@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008b321f05f9afb5fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Steve,<div><br></div><div>I have sent a dunfell bran=
ch patch with the subject &quot;[OE-core][<b>dunfell</b>][PATCH] go-runtime=
: Security fix for CVE-2022-41722&quot;. I am not sure why it&#39;s showing=
 as a reply on kirkstone patch, not a separate email. Please consider this =
patch to fix CVE-2022-41722 in dunfell.</div><div><br></div><div>Thanks,</d=
iv><div>Shubham</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Apr 19, 2023 at 6:03=E2=80=AFPM Shubham Kulkar=
ni via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;skulkarni=3D<a href=3D"mailto:mvista.com@lists.openembedded.org">mvist=
a.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Shubham Kulkarni &lt;<a href=3D"mailto:sk=
ulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
<br>
path/filepath: do not Clean(&quot;a/../c:/b&quot;) into c:\b on Windows<br>
<br>
Backport from <a href=3D"https://github.com/golang/go/commit/bdf07c2e168baf=
736e4c057279ca12a4d674f18c" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a4d674f18c</a><br>
<br>
Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com"=
 target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../go/go-1.14/CVE-2022-41722-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 53 +++++++++++<br>
=C2=A0.../go/go-1.14/CVE-2022-41722-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 104 +++++++++++++++++++++<br>
=C2=A03 files changed, 159 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.=
patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.=
patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/g=
o/go-1.14.inc<br>
index f2a5fc3..74017f4 100644<br>
--- a/meta/recipes-devtools/go/go-1.14.inc<br>
+++ b/meta/recipes-devtools/go/go-1.14.inc<br>
@@ -53,6 +53,8 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-41717.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-1962.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-41723.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2022-41722-1.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2022-41722-2.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc-dyna=
mic-linker-with-musl.patch&quot;<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch<br>
new file mode 100644<br>
index 0000000..f5bffd7<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch<br>
@@ -0,0 +1,53 @@<br>
+From 94e0c36694fb044e81381d112fef3692de7cdf52 Mon Sep 17 00:00:00 2001<br>
+From: Yasuhiro Matsumoto &lt;<a href=3D"mailto:mattn.jp@gmail.com" target=
=3D"_blank">mattn.jp@gmail.com</a>&gt;<br>
+Date: Fri, 22 Apr 2022 10:07:51 +0900<br>
+Subject: [PATCH 1/2] path/filepath: do not remove prefix &quot;.&quot; whe=
n following<br>
+ path contains &quot;:&quot;.<br>
+<br>
+Fixes #52476<br>
+<br>
+Change-Id: I9eb72ac7dbccd6322d060291f31831dc389eb9bb<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/401595" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/401595</a><br>
+Auto-Submit: Ian Lance Taylor &lt;<a href=3D"mailto:iant@google.com" targe=
t=3D"_blank">iant@google.com</a>&gt;<br>
+Reviewed-by: Alex Brainman &lt;<a href=3D"mailto:alex.brainman@gmail.com" =
target=3D"_blank">alex.brainman@gmail.com</a>&gt;<br>
+Run-TryBot: Ian Lance Taylor &lt;<a href=3D"mailto:iant@google.com" target=
=3D"_blank">iant@google.com</a>&gt;<br>
+Reviewed-by: Ian Lance Taylor &lt;<a href=3D"mailto:iant@google.com" targe=
t=3D"_blank">iant@google.com</a>&gt;<br>
+Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D=
"_blank">dneil@google.com</a>&gt;<br>
+TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport from <a href=3D"https://github.com/golang/go/com=
mit/9cd1818a7d019c02fa4898b3e45a323e35033290" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/golang/go/commit/9cd1818a7d019c02fa4898b3e45a323=
e35033290</a><br>
+CVE: CVE-2022-41722<br>
+Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com=
" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
+---<br>
+ src/path/filepath/path.go | 14 +++++++++++++-<br>
+ 1 file changed, 13 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go<br>
+index 26f1833..92dc090 100644<br>
+--- a/src/path/filepath/path.go<br>
++++ b/src/path/filepath/path.go<br>
+@@ -116,9 +116,21 @@ func Clean(path string) string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case os.IsPathSepar=
ator(path[r]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// empty path element<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r++<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D &#39=
;.&#39; &amp;&amp; (r+1 =3D=3D n || os.IsPathSeparator(path[r+1])):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D &#39=
;.&#39; &amp;&amp; r+1 =3D=3D n:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// . element<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D &#39=
;.&#39; &amp;&amp; os.IsPathSeparator(path[r+1]):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // ./ element<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 r++<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for r &lt; len(path) &amp;&amp; os.IsPathSeparator(path[r]) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if out.w =3D=3D 0 &amp;&amp; volumeNameLen(path[r:]) &gt; 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // When joining prefix &quot;.&quot; and an=
 absolute path on Windows,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // the prefix should not be removed.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.append(&#39;.&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case path[r] =3D=3D=
 &#39;.&#39; &amp;&amp; path[r+1] =3D=3D &#39;.&#39; &amp;&amp; (r+2 =3D=3D=
 n || os.IsPathSeparator(path[r+2])):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// .. element: remove to last separator<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r +=3D 2<br>
+--<br>
+2.7.4<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch<br>
new file mode 100644<br>
index 0000000..e1f7a55<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch<br>
@@ -0,0 +1,104 @@<br>
+From b8803cb711ae163b8e67897deb6cf8c49702227c Mon Sep 17 00:00:00 2001<br>
+From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_blank=
">dneil@google.com</a>&gt;<br>
+Date: Mon, 12 Dec 2022 16:43:37 -0800<br>
+Subject: [PATCH 2/2] path/filepath: do not Clean(&quot;a/../c:/b&quot;) in=
to c:\b on<br>
+ Windows<br>
+<br>
+Do not permit Clean to convert a relative path into one starting<br>
+with a drive reference. This change causes Clean to insert a .<br>
+path element at the start of a path when the original path does not<br>
+start with a volume name, and the first path element would contain<br>
+a colon.<br>
+<br>
+This may introduce a spurious but harmless . path element under<br>
+some circumstances. For example, Clean(&quot;a/../b:/../c&quot;) becomes `=
.\c`.<br>
+<br>
+This reverts CL 401595, since the change here supersedes the one<br>
+in that CL.<br>
+<br>
+Thanks to RyotaK (<a href=3D"https://twitter.com/ryotkak" rel=3D"noreferre=
r" target=3D"_blank">https://twitter.com/ryotkak</a>) for reporting this is=
sue.<br>
+<br>
+Updates #57274<br>
+Fixes #57276<br>
+Fixes CVE-2022-41722<br>
+<br>
+Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1675249+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https=
://team-review.git.corp.google.com/c/golang/go-private/+/1675249<br>
+Reviewed-by</a>: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.c=
om" target=3D"_blank">bracewell@google.com</a>&gt;<br>
+Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"=
_blank">dneil@google.com</a>&gt;<br>
+Reviewed-by: Julie Qiu &lt;<a href=3D"mailto:julieqiu@google.com" target=
=3D"_blank">julieqiu@google.com</a>&gt;<br>
+TryBot-Result: Security TryBots &lt;<a href=3D"mailto:security-trybots@go-=
security-trybots.iam.gserviceaccount.com" target=3D"_blank">security-trybot=
s@go-security-trybots.iam.gserviceaccount.com</a>&gt;<br>
+(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1728944+Run-TryBot" rel=3D"noreferrer" target=3D"_blank">https:=
//team-review.git.corp.google.com/c/golang/go-private/+/1728944<br>
+Run-TryBot</a>: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.co=
m" target=3D"_blank">bracewell@google.com</a>&gt;<br>
+Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@google.c=
om" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
+Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D=
"_blank">dneil@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/468119" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/468119</a><br>
+Reviewed-by: Than McIntosh &lt;<a href=3D"mailto:thanm@google.com" target=
=3D"_blank">thanm@google.com</a>&gt;<br>
+Run-TryBot: Michael Pratt &lt;<a href=3D"mailto:mpratt@google.com" target=
=3D"_blank">mpratt@google.com</a>&gt;<br>
+TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
+Auto-Submit: Michael Pratt &lt;<a href=3D"mailto:mpratt@google.com" target=
=3D"_blank">mpratt@google.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport from <a href=3D"https://github.com/golang/go/com=
mit/bdf07c2e168baf736e4c057279ca12a4d674f18c" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/golang/go/commit/bdf07c2e168baf736e4c057279ca12a=
4d674f18c</a><br>
+CVE: CVE-2022-41722<br>
+Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com=
" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
+---<br>
+ src/path/filepath/path.go | 27 ++++++++++++++-------------<br>
+ 1 file changed, 14 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go<br>
+index 92dc090..f0f095e 100644<br>
+--- a/src/path/filepath/path.go<br>
++++ b/src/path/filepath/path.go<br>
+@@ -14,6 +14,7 @@ package filepath<br>
+ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;errors&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;runtime&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sort&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
+ )<br>
+@@ -116,21 +117,9 @@ func Clean(path string) string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case os.IsPathSepar=
ator(path[r]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// empty path element<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r++<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D &#39=
;.&#39; &amp;&amp; r+1 =3D=3D n:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D &#39=
;.&#39; &amp;&amp; (r+1 =3D=3D n || os.IsPathSeparator(path[r+1])):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// . element<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r++<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case path[r] =3D=3D &#39=
;.&#39; &amp;&amp; os.IsPathSeparator(path[r+1]):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // ./ element<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 r++<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for r &lt; len(path) &amp;&amp; os.IsPathSeparator(path[r]) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r++<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if out.w =3D=3D 0 &amp;&amp; volumeNameLen(path[r:]) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // When joining prefix &quot;.&quot; and an=
 absolute path on Windows,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // the prefix should not be removed.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.append(&#39;.&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case path[r] =3D=3D=
 &#39;.&#39; &amp;&amp; path[r+1] =3D=3D &#39;.&#39; &amp;&amp; (r+2 =3D=3D=
 n || os.IsPathSeparator(path[r+2])):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// .. element: remove to last separator<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r +=3D 2<br>
+@@ -156,6 +145,18 @@ func Clean(path string) string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if rooted &amp;&amp; out.w !=3D 1 || !rooted &amp;&amp; out.w !=
=3D 0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out.append(Separator)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // If a &#39;:&#39; appears in the path element at the start of a Windo=
ws path,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // insert a .\ at the beginning to avoid converting relative paths<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // like a/../c: into c:.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if runtime.GOOS =3D=3D &quot;windows&quot; &amp;&amp; out.w =3D=3D 0 &a=
mp;&amp; out.volLen =3D=3D 0 &amp;&amp; r !=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i :=3D r; i &lt; n &amp;&amp; !os.IsPat=
hSeparator(path[i]); i++ {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path[i] =3D=
=3D &#39;:&#39; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 out.append(&#39;.&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 out.append(Separator)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// copy element<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for ; r &lt; n &amp;&amp; !os.IsPathSeparator(path[r]); r++ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out.append(path[r])<br>
+--<br>
+2.7.4<br>
-- <br>
2.7.4<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180217): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180217" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180217</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98365307/7032=
091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98365307/7032091</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarni@mvista.com" targ=
et=3D"_blank">skulkarni@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008b321f05f9afb5fc--

