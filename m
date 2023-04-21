Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4ACC77B78
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 02:51:49 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.3452.1682045503398344094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 19:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=dCceBUjk;
 spf=pass (domain: mvista.com, ip: 209.85.167.46, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4ec8149907aso1157303e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 19:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682045501; x=1684637501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vpp+BvUhsuje3KerrKrQcpt8ezmYUnvG+PG+edVJLlg=;
        b=dCceBUjkqcWpwzkKp/O5Mh5YYMyI2EFr9stzRF83ecCoAb3YklunSXF7zkylPp++46
         O5dglf1JDcB3qeEJuZpToxCsW9N7LwvN47SZkMF0y41asCyCn63CpC0s4Fjiko5wWuUA
         lHCH/xh/33D924WIvq3vF3LKoJx2M8fbyl2b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682045501; x=1684637501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vpp+BvUhsuje3KerrKrQcpt8ezmYUnvG+PG+edVJLlg=;
        b=hlSy0gijcfMPeMaOtJmQw3PZafV05usvN9E0cuqX2Tj+XW99DC5yoO5nCks9ThFQkP
         Wu61HjGzdYGdoJJAFkXWolIotG/1XnmMRyYRK/QJ7zQO0o6f0Rh7bRFBZDBnHPht/j/c
         oHIeqZ8X+cpqpWltcy1fmaC9ic1ouKDJg4tT1GYEiZ+n6UWMFKwslNXhXUc3ElaIJ3FF
         4+8ZbsV24gbkTNIAKZsPLsBkIu0w8Ncjkw+8m3DZV49JcVpV8W8jxisUKL/bHVwfyGfd
         84URD+gEUQszQwxGGLbqU9TiZS9234ade9YVgfMeX9NlbVQN2efAYRECqxkBnZT7kSyj
         VjXQ==
X-Gm-Message-State: AAQBX9d8FTNCK/xuq6wZeEpndj58kGC6Zy0e1E96+poEJumqoUU/B+30
	9+i7dk9lWVRi3IbEBXKOeOD/Aubir8IpO55WX74nNca8+iaSzKDP
X-Google-Smtp-Source: AKy350ZEFuWDNPH7u8s4YwDwxjcraekLPBxEZe0WSJX4mczDuLHZH0y2BRrm0sbnH+z8ilsVfxhUCWHOREDnBjCnYD4=
X-Received: by 2002:a2e:855a:0:b0:2a8:bafe:900c with SMTP id
 u26-20020a2e855a000000b002a8bafe900cmr188841ljj.25.1682045500853; Thu, 20 Apr
 2023 19:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230420093128.1209660-1-vkumbhar@mvista.com> <CAGDS+nkga5TXa3E=k1HetU8FjXJZo0NCDnEXxaBQjxXoapiYMg@mail.gmail.com>
In-Reply-To: <CAGDS+nkga5TXa3E=k1HetU8FjXJZo0NCDnEXxaBQjxXoapiYMg@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Fri, 21 Apr 2023 08:21:29 +0530
Message-ID: <CAPun1rFGVGQVr7gn0e-M+TiRpJG1xK48=NhCTGQYSpBxeoT==w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go: fix CVE-2023-24537 Infinite loop
 in parsing
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093278c05f9cfbc65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 02:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180261

--00000000000093278c05f9cfbc65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2 patch has been sent with fuzz error fix.

Kind regards,
Vivek

On Thu, Apr 20, 2023 at 8:27=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> Hi Vivek,
>
> I'm getting fuzz errors with your patch:
>
> WARNING: go-cross-core2-64-1.17.13-r0 do_patch: Fuzz detected:
>
> Applying patch CVE-2023-24537.patch
> patching file src/go/parser/parser_test.go
> patching file src/go/scanner/scanner.go
> Hunk #1 succeeded at 251 with fuzz 1.
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify go-cross-core2-64
>     devtool finish --force-patch-refresh go-cross-core2-64 <layer_path>
>
> Don't forget to review changes done by devtool!
>
> WARNING: go-cross-core2-64-1.17.13-r0 do_patch: QA Issue: Patch log
> indicates that patches do not apply cleanly. [patch-fuzz]
>
> Steve
>
> On Wed, Apr 19, 2023 at 11:31=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> w=
rote:
> >
> > Setting a large line or column number using a //line directive can caus=
e
> > integer overflow even in small source files.
> >
> > Limit line and column numbers in //line directives to 2^30-1, which
> > is small enough to avoid int32 overflow on all reasonbly-sized files.
> >
> > Fixes CVE-2023-24537
> > Fixes #59273
> > For #59180
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
> >  .../go/go-1.18/CVE-2023-24537.patch           | 72 +++++++++++++++++++
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24537.pat=
ch
> >
> > diff --git a/meta/recipes-devtools/go/go-1.17.13.inc
> b/meta/recipes-devtools/go/go-1.17.13.inc
> > index 34d58aec2f..cda9227042 100644
> > --- a/meta/recipes-devtools/go/go-1.17.13.inc
> > +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> > @@ -27,6 +27,7 @@ SRC_URI +=3D "\
> >      file://add_godebug.patch \
> >      file://cve-2022-41725.patch \
> >      file://CVE-2022-41722.patch \
> > +    file://CVE-2023-24537.patch \
> >  "
> >  SRC_URI[main.sha256sum] =3D
> "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
> >
> > diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
> b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
> > new file mode 100644
> > index 0000000000..7733a605e7
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
> > @@ -0,0 +1,72 @@
> > +From bf8c7c575c8a552d9d79deb29e80854dc88528d0 Mon Sep 17 00:00:00 2001
> > +From: Damien Neil <dneil@google.com>
> > +Date: Mon, 20 Mar 2023 10:43:19 -0700
> > +Subject: [PATCH] [release-branch.go1.20] mime/multipart: limit parsed
> mime
> > + message sizes
> > +
> > +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1802456
> > +Reviewed-by: Julie Qiu <julieqiu@google.com>
> > +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> > +Run-TryBot: Damien Neil <dneil@google.com>
> > +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1802611
> > +Reviewed-by: Damien Neil <dneil@google.com>
> > +Change-Id: Ifdfa192d54f722d781a4d8c5f35b5fb72d122168
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/481986
> > +Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> > +TryBot-Result: Gopher Robot <gobot@golang.org>
> > +Run-TryBot: Michael Knyszek <mknyszek@google.com>
> > +Auto-Submit: Michael Knyszek <mknyszek@google.com>
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +Upstream-Status: Backport [
> https://github.com/golang/go/commit/126a1d02da82f93ede7ce0bd8d3c51ef627f2=
104
> ]
> > +CVE: CVE-2023-24537
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + src/go/parser/parser_test.go | 16 ++++++++++++++++
> > + src/go/scanner/scanner.go    |  7 +++++--
> > + 2 files changed, 21 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.=
go
> > +index 1a46c87..993df63 100644
> > +--- a/src/go/parser/parser_test.go
> > ++++ b/src/go/parser/parser_test.go
> > +@@ -746,3 +746,19 @@ func TestScopeDepthLimit(t *testing.T) {
> > +               }
> > +       }
> > + }
> > ++
> > ++// TestIssue59180 tests that line number overflow doesn't cause an
> infinite loop.
> > ++func TestIssue59180(t *testing.T) {
> > ++      testcases :=3D []string{
> > ++              "package p\n//line :9223372036854775806\n\n//",
> > ++              "package p\n//line :1:9223372036854775806\n\n//",
> > ++              "package p\n//line file:9223372036854775806\n\n//",
> > ++      }
> > ++
> > ++      for _, src :=3D range testcases {
> > ++              _, err :=3D ParseFile(token.NewFileSet(), "", src,
> ParseComments)
> > ++              if err =3D=3D nil {
> > ++                      t.Errorf("ParseFile(%s) succeeded unexpectedly"=
,
> src)
> > ++              }
> > ++      }
> > ++}
> > +diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
> > +index f08e28c..2276e07 100644
> > +--- a/src/go/scanner/scanner.go
> > ++++ b/src/go/scanner/scanner.go
> > +@@ -251,13 +251,16 @@ func (s *Scanner) updateLineInfo(next, offs int,
> text []byte) {
> > +               return
> > +       }
> > +
> > ++      // Put a cap on the maximum size of line and column numbers.
> > ++      // 30 bits allows for some additional space before wrapping an
> int32.
> > ++      const maxLineCol =3D 1<<30 - 1
> > +       var line, col int
> > +       i2, n2, ok2 :=3D trailingDigits(text[:i-1])
> > +       if ok2 {
> > +               //line filename:line:col
> > +               i, i2 =3D i2, i
> > +               line, col =3D n2, n
> > +-              if col =3D=3D 0 {
> > ++              if col =3D=3D 0 || col > maxLineCol {
> > +                       s.error(offs+i2, "invalid column number:
> "+string(text[i2:]))
> > +                       return
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180243):
> https://lists.openembedded.org/g/openembedded-core/message/180243
> > Mute This Topic: https://lists.openembedded.org/mt/98385268/3617601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sakoman@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000093278c05f9cfbc65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>v2 patch has been sent with fuzz error fix.</div><div=
><br></div><div>Kind regards,</div><div>Vivek<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 20, 2023=
 at 8:27=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">=
steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi Vivek,<br>
<br>
I&#39;m getting fuzz errors with your patch:<br>
<br>
WARNING: go-cross-core2-64-1.17.13-r0 do_patch: Fuzz detected:<br>
<br>
Applying patch CVE-2023-24537.patch<br>
patching file src/go/parser/parser_test.go<br>
patching file src/go/scanner/scanner.go<br>
Hunk #1 succeeded at 251 with fuzz 1.<br>
<br>
<br>
The context lines in the patches can be updated with devtool:<br>
<br>
=C2=A0 =C2=A0 devtool modify go-cross-core2-64<br>
=C2=A0 =C2=A0 devtool finish --force-patch-refresh go-cross-core2-64 &lt;la=
yer_path&gt;<br>
<br>
Don&#39;t forget to review changes done by devtool!<br>
<br>
WARNING: go-cross-core2-64-1.17.13-r0 do_patch: QA Issue: Patch log<br>
indicates that patches do not apply cleanly. [patch-fuzz]<br>
<br>
Steve<br>
<br>
On Wed, Apr 19, 2023 at 11:31=E2=80=AFPM vkumbhar &lt;<a href=3D"mailto:vku=
mbhar@mvista.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Setting a large line or column number using a //line directive can cau=
se<br>
&gt; integer overflow even in small source files.<br>
&gt;<br>
&gt; Limit line and column numbers in //line directives to 2^30-1, which<br=
>
&gt; is small enough to avoid int32 overflow on all reasonbly-sized files.<=
br>
&gt;<br>
&gt; Fixes CVE-2023-24537<br>
&gt; Fixes #59273<br>
&gt; For #59180<br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-1.17.13.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 .../go/go-1.18/CVE-2023-24537.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 72 +++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 73 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-245=
37.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-de=
vtools/go/go-1.17.13.inc<br>
&gt; index 34d58aec2f..cda9227042 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.17.13.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17.13.inc<br>
&gt; @@ -27,6 +27,7 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://add_godebug.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://cve-2022-41725.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41722.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-24537.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[main.sha256sum] =3D &quot;a1a48b23afb206f95e7bbaa9b898d9=
65f90826f6f1d1fc0c1d784ada0cd300fd&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch b/m=
eta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7733a605e7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +From bf8c7c575c8a552d9d79deb29e80854dc88528d0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_=
blank">dneil@google.com</a>&gt;<br>
&gt; +Date: Mon, 20 Mar 2023 10:43:19 -0700<br>
&gt; +Subject: [PATCH] [release-branch.go1.20] mime/multipart: limit parsed=
 mime<br>
&gt; + message sizes<br>
&gt; +<br>
&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/gol=
ang/go-private/+/1802456" rel=3D"noreferrer" target=3D"_blank">https://team=
-review.git.corp.google.com/c/golang/go-private/+/1802456</a><br>
&gt; +Reviewed-by: Julie Qiu &lt;<a href=3D"mailto:julieqiu@google.com" tar=
get=3D"_blank">julieqiu@google.com</a>&gt;<br>
&gt; +Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.=
com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; +Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" targe=
t=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/gol=
ang/go-private/+/1802611" rel=3D"noreferrer" target=3D"_blank">https://team=
-review.git.corp.google.com/c/golang/go-private/+/1802611</a><br>
&gt; +Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" targ=
et=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; +Change-Id: Ifdfa192d54f722d781a4d8c5f35b5fb72d122168<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/481=
986" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/481986</a><br>
&gt; +Reviewed-by: Matthew Dempsky &lt;<a href=3D"mailto:mdempsky@google.co=
m" target=3D"_blank">mdempsky@google.com</a>&gt;<br>
&gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" t=
arget=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Run-TryBot: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.com=
" target=3D"_blank">mknyszek@google.com</a>&gt;<br>
&gt; +Auto-Submit: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@google.co=
m" target=3D"_blank">mknyszek@google.com</a>&gt;<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/126a1d02da82f93ede7ce0bd8d3c51ef627f2104" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/126a1d02da82f93ede7ce0bd8d3c51=
ef627f2104</a>]<br>
&gt; +CVE: CVE-2023-24537<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/go/parser/parser_test.go | 16 ++++++++++++++++<br>
&gt; + src/go/scanner/scanner.go=C2=A0 =C2=A0 |=C2=A0 7 +++++--<br>
&gt; + 2 files changed, 21 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test=
.go<br>
&gt; +index 1a46c87..993df63 100644<br>
&gt; +--- a/src/go/parser/parser_test.go<br>
&gt; ++++ b/src/go/parser/parser_test.go<br>
&gt; +@@ -746,3 +746,19 @@ func TestScopeDepthLimit(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++// TestIssue59180 tests that line number overflow doesn&#39;t cause =
an infinite loop.<br>
&gt; ++func TestIssue59180(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 testcases :=3D []string{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package p\n//=
line :9223372036854775806\n\n//&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package p\n//=
line :1:9223372036854775806\n\n//&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package p\n//=
line file:9223372036854775806\n\n//&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, src :=3D range testcases {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, err :=3D ParseFi=
le(token.NewFileSet(), &quot;&quot;, src, ParseComments)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err =3D=3D nil {=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;ParseFile(%s) succeeded unexpectedly&quot;, src)<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; +diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go<br=
>
&gt; +index f08e28c..2276e07 100644<br>
&gt; +--- a/src/go/scanner/scanner.go<br>
&gt; ++++ b/src/go/scanner/scanner.go<br>
&gt; +@@ -251,13 +251,16 @@ func (s *Scanner) updateLineInfo(next, offs int=
, text []byte) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Put a cap on the maximum size of line and co=
lumn numbers.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // 30 bits allows for some additional space bef=
ore wrapping an int32.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const maxLineCol =3D 1&lt;&lt;30 - 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var line, col int<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2, n2, ok2 :=3D trailingDigits(text[:i-1]=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ok2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//line filenam=
e:line:col<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, i2 =3D i2, =
i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line, col =3D =
n2, n<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if col =3D=3D 0 {<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if col =3D=3D 0 || =
col &gt; maxLineCol {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0s.error(offs+i2, &quot;invalid column number: &quot;+string(t=
ext[i2:]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180243): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180243" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/180243</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98385268=
/3617601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98385268/3617601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:sakoman@gmail.com" ta=
rget=3D"_blank">sakoman@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000093278c05f9cfbc65--

