Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE300E728C7
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 16:16:01 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.21886.1696004159210293454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 09:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MZW8oMZ5;
 spf=pass (domain: mvista.com, ip: 209.85.167.41, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5046bf37daeso13302184e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696004157; x=1696608957; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHgC/pwyTQ2S5k5DXPZcbxjnaUKdnrqPUWqZKqcLX8Y=;
        b=MZW8oMZ5XCVaCbkr8oPGfa6XD/oSL1x/rOoFfcajmoDou5yY8zFBAX0+iNHMUAnrqe
         DNNTfiCgIY0oGMB/GWaWoDv+YjXthfUN470E4gw1DaFyjQscHZYUdHhFtrs0rFCWTs61
         vP12rhOZvJ8uuTlOhhRIdtEPVQyqgBqokG8h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696004157; x=1696608957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHgC/pwyTQ2S5k5DXPZcbxjnaUKdnrqPUWqZKqcLX8Y=;
        b=iwriLI1LR6dQGmuAeAJ3GOo7uFwirWST2lN0siD1mNBtDIea8+HrrDauX51M1+S83x
         0bxmA8gF978ejiZ6YqhEiE93iVRKIYxMNLVg996zzJeICEtjx8vATtjDyGhVqFCkoKqu
         g3xpcU8+F+UtdvV74K5qu8DOs+peA0vN1NFefmQwRGj46MJP76cpY539ZafcN8vf2Du2
         iCX1xmHDZFLI0yr7HG6d/PslmLPdz8h9BMCcAR4SKHZToySBFQneUm+Ohlk6/5mEC2Sw
         VfE57mnn12tUUwTLMcp4ViybNl0qRXA9DWdzy1xmAJjIai7WmOWWdJYtgtbfYAbDigFO
         3jhA==
X-Gm-Message-State: AOJu0YxxyOq/hGEUQLAUeJTrVahWydc1M1xG5Y3ES/TS/tTwXTDC+DZ2
	GthDLLr1SF6yE49DqRfr6CX5a5krm6XYKB0UaD2KVw==
X-Google-Smtp-Source: AGHT+IE+b51oy3f7t73IrUDOSPQ0I+QqlSflQjJjs9yBvRwfjf7DYswU47Np4cILyRGYk4oabVtSF2klkxC8ulHnEvY=
X-Received: by 2002:a05:6512:acb:b0:502:d743:9fc4 with SMTP id
 n11-20020a0565120acb00b00502d7439fc4mr5586956lfu.37.1696004156643; Fri, 29
 Sep 2023 09:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230926040754.6166-1-sdoshi@mvista.com> <CAKzga+zhofsNbpJkqg0beJNdNUfzMK4GKUdf_Ft0y-6zvsEFCQ@mail.gmail.com>
 <CAOSpxdbPjopHw4PKeK5GiV_svBWGTHFW_jrJaEv=8CAu_0UUhQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbPjopHw4PKeK5GiV_svBWGTHFW_jrJaEv=8CAu_0UUhQ@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Fri, 29 Sep 2023 21:45:45 +0530
Message-ID: <CAKzga+yH_5q_=G9vHEnPd03iHe_tm5mJNBgM1_uMcyLgA3VkUg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Fix CVE-2023-39318 and CVE-2023-39319
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, sdoshi@mvista.com
Content-Type: multipart/alternative; boundary="0000000000004b769c060681bd08"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 16:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188411

--0000000000004b769c060681bd08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the update Steve!

Thanks,
Shubham Kulkarni

On Fri, Sep 29, 2023 at 9:18=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Fri, Sep 29, 2023 at 4:47=E2=80=AFAM Shubham Kulkarni <skulkarni@mvist=
a.com>
> wrote:
> >
> > Hi Steve,
> >
> > Is there any update on this?
>
> It is in my current test queue:
>
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/du=
nfell-nut
>
> Steve
>
> > On Tue, Sep 26, 2023 at 9:38=E2=80=AFAM Siddharth via lists.openembedde=
d.org
> <sdoshi=3Dmvista.com@lists.openembedded.org> wrote:
> >>
> >> From: Siddharth Doshi <sdoshi@mvista.com>
> >>
> >> Upstream-Status: Backport from [
> https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401=
b4c
> ]
> >> CVE: CVE-2023-39318
> >> Upstream-Status: Backport from [
> https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab=
2f5
> ]
> >> CVE: CVE-2023-39319
> >> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> >> ---
> >>  meta/recipes-devtools/go/go-1.14.inc          |   2 +
> >>  .../go/go-1.14/CVE-2023-39318.patch           | 238 +++++++++++++++++=
+
> >>  .../go/go-1.14/CVE-2023-39319.patch           | 230 +++++++++++++++++
> >>  3 files changed, 470 insertions(+)
> >>  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> >>  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> >>
> >> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> >> index 20377e095b..9fc5eb130f 100644
> >> --- a/meta/recipes-devtools/go/go-1.14.inc
> >> +++ b/meta/recipes-devtools/go/go-1.14.inc
> >> @@ -70,6 +70,8 @@ SRC_URI +=3D "\
> >>      file://CVE-2023-29400.patch \
> >>      file://CVE-2023-29406.patch \
> >>      file://CVE-2023-29409.patch \
> >> +    file://CVE-2023-39318.patch \
> >> +    file://CVE-2023-39319.patch \
> >>  "
> >>
> >>  SRC_URI_append_libc-musl =3D "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> >> new file mode 100644
> >> index 0000000000..20e70c0485
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> >> @@ -0,0 +1,238 @@
> >> +From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00 200=
1
> >> +From: Roland Shoemaker <bracewell@google.com>
> >> +Date: Thu, 3 Aug 2023 12:24:13 -0700
> >> +Subject: [PATCH] [release-branch.go1.20] html/template: support
> HTML-like
> >> + comments in script contexts
> >> +
> >> +Per Appendix B.1.1 of the ECMAScript specification, support HTML-like
> >> +comments in script contexts. Also per section 12.5, support hashbang
> >> +comments. This brings our parsing in-line with how browsers treat the=
se
> >> +comment types.
> >> +
> >> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
> >> +reporting this issue.
> >> +
> >> +Fixes #62196
> >> +Fixes #62395
> >> +Fixes CVE-2023-39318
> >> +
> >> +Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181
> >> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1976593
> >> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> >> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> >> +Reviewed-by: Damien Neil <dneil@google.com>
> >> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> >> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/2014620
> >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/526098
> >> +Run-TryBot: Cherry Mui <cherryyz@google.com>
> >> +TryBot-Result: Gopher Robot <gobot@golang.org>
> >> +
> >> +Upstream-Status: Backport from [
> https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401=
b4c
> ]
> >> +CVE: CVE-2023-39318
> >> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> >> +---
> >> + src/html/template/context.go      |  6 ++-
> >> + src/html/template/escape.go       |  5 +-
> >> + src/html/template/escape_test.go  | 10 ++++
> >> + src/html/template/state_string.go |  4 +-
> >> + src/html/template/transition.go   | 80 ++++++++++++++++++++---------=
--
> >> + 5 files changed, 72 insertions(+), 33 deletions(-)
> >> +
> >> +diff --git a/src/html/template/context.go
> b/src/html/template/context.go
> >> +index 0b65313..4eb7891 100644
> >> +--- a/src/html/template/context.go
> >> ++++ b/src/html/template/context.go
> >> +@@ -124,6 +124,10 @@ const (
> >> +       stateJSBlockCmt
> >> +       // stateJSLineCmt occurs inside a JavaScript // line comment.
> >> +       stateJSLineCmt
> >> ++      // stateJSHTMLOpenCmt occurs inside a JavaScript <!-- HTML-lik=
e
> comment.
> >> ++      stateJSHTMLOpenCmt
> >> ++      // stateJSHTMLCloseCmt occurs inside a JavaScript --> HTML-lik=
e
> comment.
> >> ++      stateJSHTMLCloseCmt
> >> +       // stateCSS occurs inside a <style> element or style attribute=
.
> >> +       stateCSS
> >> +       // stateCSSDqStr occurs inside a CSS double quoted string.
> >> +@@ -149,7 +153,7 @@ const (
> >> + // authors & maintainers, not for end-users or machines.
> >> + func isComment(s state) bool {
> >> +       switch s {
> >> +-      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt,
> stateCSSBlockCmt, stateCSSLineCmt:
> >> ++      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt,
> stateJSHTMLOpenCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCSSLineCm=
t:
> >> +               return true
> >> +       }
> >> +       return false
> >> +diff --git a/src/html/template/escape.go b/src/html/template/escape.g=
o
> >> +index 435f912..ad2ec69 100644
> >> +--- a/src/html/template/escape.go
> >> ++++ b/src/html/template/escape.go
> >> +@@ -698,9 +698,12 @@ func (e *escaper) escapeText(c context, n
> *parse.TextNode) context {
> >> +               if c.state !=3D c1.state && isComment(c1.state) &&
> c1.delim =3D=3D delimNone {
> >> +                       // Preserve the portion between written and th=
e
> comment start.
> >> +                       cs :=3D i1 - 2
> >> +-                      if c1.state =3D=3D stateHTMLCmt {
> >> ++                      if c1.state =3D=3D stateHTMLCmt || c1.state =
=3D=3D
> stateJSHTMLOpenCmt {
> >> +                               // "<!--" instead of "/*" or "//"
> >> +                               cs -=3D 2
> >> ++                      } else if c1.state =3D=3D stateJSHTMLCloseCmt =
{
> >> ++                              // "-->" instead of "/*" or "//"
> >> ++                              cs -=3D 1
> >> +                       }
> >> +                       b.Write(s[written:cs])
> >> +                       written =3D i1
> >> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> >> +index f550691..5f41e52 100644
> >> +--- a/src/html/template/escape_test.go
> >> ++++ b/src/html/template/escape_test.go
> >> +@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {
> >> +                       "<script>var a/*b*///c\nd</script>",
> >> +                       "<script>var a \nd</script>",
> >> +               },
> >> ++              {
> >> ++                      "JS HTML-like comments",
> >> ++                      "<script>before <!--
> beep\nbetween\nbefore-->boop\n</script>",
> >> ++                      "<script>before \nbetween\nbefore\n</script>",
> >> ++              },
> >> ++              {
> >> ++                      "JS hashbang comment",
> >> ++                      "<script>#! beep\n</script>",
> >> ++                      "<script>\n</script>",
> >> ++              },
> >> +               {
> >> +                       "CSS comments",
> >> +                       "<style>p// paragraph\n" +
> >> +diff --git a/src/html/template/state_string.go
> b/src/html/template/state_string.go
> >> +index 05104be..b5cfe70 100644
> >> +--- a/src/html/template/state_string.go
> >> ++++ b/src/html/template/state_string.go
> >> +@@ -4,9 +4,9 @@ package template
> >> +
> >> + import "strconv"
> >> +
> >> +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> >> ++const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSH=
TMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstat=
eCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
> >> +
> >> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00,
> 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286=
,
> 296}
> >> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00,
> 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293=
,
> 304, 320, 335, 345, 354}
> >> +
> >> + func (i state) String() string {
> >> +       if i >=3D state(len(_state_index)-1) {
> >> +diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> >> +index 92eb351..12aa4c4 100644
> >> +--- a/src/html/template/transition.go
> >> ++++ b/src/html/template/transition.go
> >> +@@ -14,32 +14,34 @@ import (
> >> + // the updated context and the number of bytes consumed from the
> front of the
> >> + // input.
> >> + var transitionFunc =3D [...]func(context, []byte) (context, int){
> >> +-      stateText:        tText,
> >> +-      stateTag:         tTag,
> >> +-      stateAttrName:    tAttrName,
> >> +-      stateAfterName:   tAfterName,
> >> +-      stateBeforeValue: tBeforeValue,
> >> +-      stateHTMLCmt:     tHTMLCmt,
> >> +-      stateRCDATA:      tSpecialTagEnd,
> >> +-      stateAttr:        tAttr,
> >> +-      stateURL:         tURL,
> >> +-      stateSrcset:      tURL,
> >> +-      stateJS:          tJS,
> >> +-      stateJSDqStr:     tJSDelimited,
> >> +-      stateJSSqStr:     tJSDelimited,
> >> +-      stateJSBqStr:     tJSDelimited,
> >> +-      stateJSRegexp:    tJSDelimited,
> >> +-      stateJSBlockCmt:  tBlockCmt,
> >> +-      stateJSLineCmt:   tLineCmt,
> >> +-      stateCSS:         tCSS,
> >> +-      stateCSSDqStr:    tCSSStr,
> >> +-      stateCSSSqStr:    tCSSStr,
> >> +-      stateCSSDqURL:    tCSSStr,
> >> +-      stateCSSSqURL:    tCSSStr,
> >> +-      stateCSSURL:      tCSSStr,
> >> +-      stateCSSBlockCmt: tBlockCmt,
> >> +-      stateCSSLineCmt:  tLineCmt,
> >> +-      stateError:       tError,
> >> ++      stateText:           tText,
> >> ++      stateTag:            tTag,
> >> ++      stateAttrName:       tAttrName,
> >> ++      stateAfterName:      tAfterName,
> >> ++      stateBeforeValue:    tBeforeValue,
> >> ++      stateHTMLCmt:        tHTMLCmt,
> >> ++      stateRCDATA:         tSpecialTagEnd,
> >> ++      stateAttr:           tAttr,
> >> ++      stateURL:            tURL,
> >> ++      stateSrcset:         tURL,
> >> ++      stateJS:             tJS,
> >> ++      stateJSDqStr:        tJSDelimited,
> >> ++      stateJSSqStr:        tJSDelimited,
> >> ++      stateJSBqStr:        tJSDelimited,
> >> ++      stateJSRegexp:       tJSDelimited,
> >> ++      stateJSBlockCmt:     tBlockCmt,
> >> ++      stateJSLineCmt:      tLineCmt,
> >> ++      stateJSHTMLOpenCmt:  tLineCmt,
> >> ++      stateJSHTMLCloseCmt: tLineCmt,
> >> ++      stateCSS:            tCSS,
> >> ++      stateCSSDqStr:       tCSSStr,
> >> ++      stateCSSSqStr:       tCSSStr,
> >> ++      stateCSSDqURL:       tCSSStr,
> >> ++      stateCSSSqURL:       tCSSStr,
> >> ++      stateCSSURL:         tCSSStr,
> >> ++      stateCSSBlockCmt:    tBlockCmt,
> >> ++      stateCSSLineCmt:     tLineCmt,
> >> ++      stateError:          tError,
> >> + }
> >> +
> >> + var commentStart =3D []byte("<!--")
> >> +@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int) {
> >> +
> >> + // tJS is the context transition function for the JS state.
> >> + func tJS(c context, s []byte) (context, int) {
> >> +-      i :=3D bytes.IndexAny(s, "\"`'/")
> >> ++      i :=3D bytes.IndexAny(s, "\"`'/<-#")
> >> +       if i =3D=3D -1 {
> >> +               // Entire input is non string, comment, regexp tokens.
> >> +               c.jsCtx =3D nextJSCtx(s, c.jsCtx)
> >> +@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int) {
> >> +                               err:   errorf(ErrSlashAmbig, nil, 0,
> "'/' could start a division or regexp: %.32q", s[i:]),
> >> +                       }, len(s)
> >> +               }
> >> ++      // ECMAScript supports HTML style comments for legacy reasons,
> see Appendix
> >> ++      // B.1.1 "HTML-like Comments". The handling of these comments
> is somewhat
> >> ++      // confusing. Multi-line comments are not supported, i.e.
> anything on lines
> >> ++      // between the opening and closing tokens is not considered a
> comment, but
> >> ++      // anything following the opening or closing token, on the sam=
e
> line, is
> >> ++      // ignored. As such we simply treat any line prefixed with
> "<!--" or "-->"
> >> ++      // as if it were actually prefixed with "//" and move on.
> >> ++      case '<':
> >> ++              if i+3 < len(s) && bytes.Equal(commentStart, s[i:i+4])=
 {
> >> ++                      c.state, i =3D stateJSHTMLOpenCmt, i+3
> >> ++              }
> >> ++      case '-':
> >> ++              if i+2 < len(s) && bytes.Equal(commentEnd, s[i:i+3]) {
> >> ++                      c.state, i =3D stateJSHTMLCloseCmt, i+2
> >> ++              }
> >> ++      // ECMAScript also supports "hashbang" comment lines, see
> Section 12.5.
> >> ++      case '#':
> >> ++              if i+1 < len(s) && s[i+1] =3D=3D '!' {
> >> ++                      c.state, i =3D stateJSLineCmt, i+1
> >> ++              }
> >> +       default:
> >> +               panic("unreachable")
> >> +       }
> >> +@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (context,
> int) {
> >> +       return c, i + 2
> >> + }
> >> +
> >> +-// tLineCmt is the context transition function for //comment states.
> >> ++// tLineCmt is the context transition function for //comment states,
> and the JS HTML-like comment state.
> >> + func tLineCmt(c context, s []byte) (context, int) {
> >> +       var lineTerminators string
> >> +       var endState state
> >> +       switch c.state {
> >> +-      case stateJSLineCmt:
> >> ++      case stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt:
> >> +               lineTerminators, endState =3D "\n\r\u2028\u2029", stat=
eJS
> >> +       case stateCSSLineCmt:
> >> +               lineTerminators, endState =3D "\n\f\r", stateCSS
> >> +--
> >> +2.24.4
> >> +
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> >> new file mode 100644
> >> index 0000000000..69106e3e05
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> >> @@ -0,0 +1,230 @@
> >> +From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 200=
1
> >> +From: Roland Shoemaker <bracewell@google.com>
> >> +Date: Thu, 3 Aug 2023 12:28:28 -0700
> >> +Subject: [PATCH] [release-branch.go1.20] html/template: properly hand=
le
> >> + special tags within the script context
> >> +
> >> +The HTML specification has incredibly complex rules for how to handle
> >> +"<!--", "<script", and "</script" when they appear within literals in
> >> +the script context. Rather than attempting to apply these restriction=
s
> >> +(which require a significantly more complex state machine) we apply
> >> +the workaround suggested in section 4.12.1.3 of the HTML specificatio=
n
> [1].
> >> +
> >> +More precisely, when "<!--", "<script", and "</script" appear within
> >> +literals (strings and regular expressions, ignoring comments since we
> >> +already elide their content) we replace the "<" with "\x3C". This
> avoids
> >> +the unintuitive behavior that using these tags within literals can
> cause,
> >> +by simply preventing the rendered content from triggering it. This ma=
y
> >> +break some correct usages of these tags, but on balance is more likel=
y
> >> +to prevent XSS attacks where users are unknowingly either closing or
> not
> >> +closing the script blocks where they think they are.
> >> +
> >> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
> >> +reporting this issue.
> >> +
> >> +Fixes #62197
> >> +Fixes #62397
> >> +Fixes CVE-2023-39319
> >> +
> >> +[1]
> https://html.spec.whatwg.org/#restrictions-for-contents-of-script-element=
s
> >> +
> >> +Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc
> >> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1976594
> >> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> >> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> >> +Reviewed-by: Damien Neil <dneil@google.com>
> >> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> >> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/2014621
> >> +TryBot-Result: Security TryBots <
> security-trybots@go-security-trybots.iam.gserviceaccount.com>
> >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/526099
> >> +TryBot-Result: Gopher Robot <gobot@golang.org>
> >> +Run-TryBot: Cherry Mui <cherryyz@google.com>
> >> +
> >> +Upstream-Status: Backport from [
> https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab=
2f5
> ]
> >> +CVE: CVE-2023-39319
> >> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> >> +---
> >> + src/html/template/context.go     | 14 ++++++++++
> >> + src/html/template/escape.go      | 26 ++++++++++++++++++
> >> + src/html/template/escape_test.go | 47 ++++++++++++++++++++++++++++++=
+-
> >> + src/html/template/transition.go  | 15 ++++++++++
> >> + 4 files changed, 101 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/src/html/template/context.go
> b/src/html/template/context.go
> >> +index 4eb7891..feb6517 100644
> >> +--- a/src/html/template/context.go
> >> ++++ b/src/html/template/context.go
> >> +@@ -168,6 +168,20 @@ func isInTag(s state) bool {
> >> +       return false
> >> + }
> >> +
> >> ++// isInScriptLiteral returns true if s is one of the literal states
> within a
> >> ++// <script> tag, and as such occurances of "<!--", "<script", and
> "</script"
> >> ++// need to be treated specially.
> >> ++func isInScriptLiteral(s state) bool {
> >> ++      // Ignore the comment states (stateJSBlockCmt, stateJSLineCmt,
> >> ++      // stateJSHTMLOpenCmt, stateJSHTMLCloseCmt) because their
> content is already
> >> ++      // omitted from the output.
> >> ++      switch s {
> >> ++      case stateJSDqStr, stateJSSqStr, stateJSBqStr, stateJSRegexp:
> >> ++              return true
> >> ++      }
> >> ++      return false
> >> ++}
> >> ++
> >> + // delim is the delimiter that will end the current HTML attribute.
> >> + type delim uint8
> >> +
> >> +diff --git a/src/html/template/escape.go b/src/html/template/escape.g=
o
> >> +index ad2ec69..de8cf6f 100644
> >> +--- a/src/html/template/escape.go
> >> ++++ b/src/html/template/escape.go
> >> +@@ -10,6 +10,7 @@ import (
> >> +       "html"
> >> +       "internal/godebug"
> >> +       "io"
> >> ++      "regexp"
> >> +       "text/template"
> >> +       "text/template/parse"
> >> + )
> >> +@@ -650,6 +651,26 @@ var delimEnds =3D [...]string{
> >> +       delimSpaceOrTagEnd: " \t\n\f\r>",
> >> + }
> >> +
> >> ++var (
> >> ++      // Per WHATWG HTML specification, section 4.12.1.3, there are
> extremely
> >> ++      // complicated rules for how to handle the set of opening tags
> <!--,
> >> ++      // <script, and </script when they appear in JS literals (i.e.
> strings,
> >> ++      // regexs, and comments). The specification suggests a simple
> solution,
> >> ++      // rather than implementing the arcane ABNF, which involves
> simply escaping
> >> ++      // the opening bracket with \x3C. We use the below regex for
> this, since it
> >> ++      // makes doing the case-insensitive find-replace much simpler.
> >> ++      specialScriptTagRE          =3D
> regexp.MustCompile("(?i)<(script|/script|!--)")
> >> ++      specialScriptTagReplacement =3D []byte("\\x3C$1")
> >> ++)
> >> ++
> >> ++func containsSpecialScriptTag(s []byte) bool {
> >> ++      return specialScriptTagRE.Match(s)
> >> ++}
> >> ++
> >> ++func escapeSpecialScriptTags(s []byte) []byte {
> >> ++      return specialScriptTagRE.ReplaceAll(s,
> specialScriptTagReplacement)
> >> ++}
> >> ++
> >> + var doctypeBytes =3D []byte("<!DOCTYPE")
> >> +
> >> + // escapeText escapes a text template node.
> >> +@@ -708,6 +729,11 @@ func (e *escaper) escapeText(c context, n
> *parse.TextNode) context {
> >> +                       b.Write(s[written:cs])
> >> +                       written =3D i1
> >> +               }
> >> ++              if isInScriptLiteral(c.state) &&
> containsSpecialScriptTag(s[i:i1]) {
> >> ++                      b.Write(s[written:i])
> >> ++                      b.Write(escapeSpecialScriptTags(s[i:i1]))
> >> ++                      written =3D i1
> >> ++              }
> >> +               if i =3D=3D i1 && c.state =3D=3D c1.state {
> >> +                       panic(fmt.Sprintf("infinite loop from %v to %v
> on %q..%q", c, c1, s[:i], s[i:]))
> >> +               }
> >> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> >> +index 5f41e52..0cacb20 100644
> >> +--- a/src/html/template/escape_test.go
> >> ++++ b/src/html/template/escape_test.go
> >> +@@ -513,6 +513,21 @@ func TestEscape(t *testing.T) {
> >> +                       "<script>#! beep\n</script>",
> >> +                       "<script>\n</script>",
> >> +               },
> >> ++              {
> >> ++                      "Special tags in <script> string literals",
> >> ++                      `<script>var a =3D "asd < 123 <!-- 456 < fgh
> <script jkl < 789 </script"</script>`,
> >> ++                      `<script>var a =3D "asd < 123 \x3C!-- 456 < fg=
h
> \x3Cscript jkl < 789 \x3C/script"</script>`,
> >> ++              },
> >> ++              {
> >> ++                      "Special tags in <script> string literals
> (mixed case)",
> >> ++                      `<script>var a =3D "<!-- <ScripT
> </ScripT"</script>`,
> >> ++                      `<script>var a =3D "\x3C!-- \x3CScripT
> \x3C/ScripT"</script>`,
> >> ++              },
> >> ++              {
> >> ++                      "Special tags in <script> regex literals (mixe=
d
> case)",
> >> ++                      `<script>var a =3D /<!-- <ScripT
> </ScripT/</script>`,
> >> ++                      `<script>var a =3D /\x3C!-- \x3CScripT
> \x3C/ScripT/</script>`,
> >> ++              },
> >> +               {
> >> +                       "CSS comments",
> >> +                       "<style>p// paragraph\n" +
> >> +@@ -1501,8 +1516,38 @@ func TestEscapeText(t *testing.T) {
> >> +                       context{state: stateJS, element: elementScript=
},
> >> +               },
> >> +               {
> >> ++                      // <script and </script tags are escaped, so
> </script> should not
> >> ++                      // cause us to exit the JS state.
> >> +
>  `<script>document.write("<script>alert(1)</script>");`,
> >> +-                      context{state: stateText},
> >> ++                      context{state: stateJS, element: elementScript=
},
> >> ++              },
> >> ++              {
> >> ++                      `<script>document.write("<script>`,
> >> ++                      context{state: stateJSDqStr, element:
> elementScript},
> >> ++              },
> >> ++              {
> >> ++
> `<script>document.write("<script>alert(1)</script>`,
> >> ++                      context{state: stateJSDqStr, element:
> elementScript},
> >> ++              },
> >> ++              {
> >> ++                      `<script>document.write("<script>alert(1)<!--`=
,
> >> ++                      context{state: stateJSDqStr, element:
> elementScript},
> >> ++              },
> >> ++              {
> >> ++
> `<script>document.write("<script>alert(1)</Script>");`,
> >> ++                      context{state: stateJS, element: elementScript=
},
> >> ++              },
> >> ++              {
> >> ++                      `<script>document.write("<!--");`,
> >> ++                      context{state: stateJS, element: elementScript=
},
> >> ++              },
> >> ++              {
> >> ++                      `<script>let a =3D /</script`,
> >> ++                      context{state: stateJSRegexp, element:
> elementScript},
> >> ++              },
> >> ++              {
> >> ++                      `<script>let a =3D /</script/`,
> >> ++                      context{state: stateJS, element: elementScript=
,
> jsCtx: jsCtxDivOp},
> >> +               },
> >> +               {
> >> +                       `<script type=3D"text/template">`,
> >> +diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> >> +index 12aa4c4..3d2a37c 100644
> >> +--- a/src/html/template/transition.go
> >> ++++ b/src/html/template/transition.go
> >> +@@ -214,6 +214,11 @@ var (
> >> + // element states.
> >> + func tSpecialTagEnd(c context, s []byte) (context, int) {
> >> +       if c.element !=3D elementNone {
> >> ++              // script end tags ("</script") within script literals
> are ignored, so that
> >> ++              // we can properly escape them.
> >> ++              if c.element =3D=3D elementScript &&
> (isInScriptLiteral(c.state) || isComment(c.state)) {
> >> ++                      return c, len(s)
> >> ++              }
> >> +               if i :=3D indexTagEnd(s,
> specialTagEndMarkers[c.element]); i !=3D -1 {
> >> +                       return context{}, i
> >> +               }
> >> +@@ -353,6 +358,16 @@ func tJSDelimited(c context, s []byte) (context,
> int) {
> >> +                       inCharset =3D true
> >> +               case ']':
> >> +                       inCharset =3D false
> >> ++              case '/':
> >> ++                      // If "</script" appears in a regex literal,
> the '/' should not
> >> ++                      // close the regex literal, and it will later
> be escaped to
> >> ++                      // "\x3C/script" in escapeText.
> >> ++                      if i > 0 && i+7 <=3D len(s) &&
> bytes.Compare(bytes.ToLower(s[i-1:i+7]), []byte("</script")) =3D=3D 0 {
> >> ++                              i++
> >> ++                      } else if !inCharset {
> >> ++                              c.state, c.jsCtx =3D stateJS, jsCtxDiv=
Op
> >> ++                              return c, i + 1
> >> ++                      }
> >> +               default:
> >> +                       // end delimiter
> >> +                       if !inCharset {
> >> +--
> >> +2.24.4
> >> +
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#188215):
> https://lists.openembedded.org/g/openembedded-core/message/188215
> >> Mute This Topic: https://lists.openembedded.org/mt/101589537/7032091
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> skulkarni@mvista.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000004b769c060681bd08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the update Steve!<div><br></div><div>Thanks,=
</div><div>Shubham Kulkarni</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 29, 2023 at 9:18=E2=80=AFPM St=
eve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, Sep 29, 2023 at 4:47=E2=80=AFAM Shubham Kulkarni &lt;<a href=3D"mailto:s=
kulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Is there any update on this?<br>
<br>
It is in my current test queue:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
stable/dunfell-nut" rel=3D"noreferrer" target=3D"_blank">https://git.openem=
bedded.org/openembedded-core-contrib/log/?h=3Dstable/dunfell-nut</a><br>
<br>
Steve<br>
<br>
&gt; On Tue, Sep 26, 2023 at 9:38=E2=80=AFAM Siddharth via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> &lt;sdoshi=3D<a href=3D"mailto:mvista.com@lists.openembedded=
.org" target=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; From: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Upstream-Status: Backport from [<a href=3D"https://github.com/gola=
ng/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/golang/go/commit/023b542edf38e2a1f87fce=
fb9f75ff2f99401b4c</a>]<br>
&gt;&gt; CVE: CVE-2023-39318<br>
&gt;&gt; Upstream-Status: Backport from [<a href=3D"https://github.com/gola=
ng/go/commit/2070531d2f53df88e312edace6c8dfc9686ab2f5" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/golang/go/commit/2070531d2f53df88e312ed=
ace6c8dfc9686ab2f5</a>]<br>
&gt;&gt; CVE: CVE-2023-39319<br>
&gt;&gt; Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista=
.com" target=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-39318.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 238 ++++++++++++++++++<br>
&gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-39319.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 230 +++++++++++++++++<br>
&gt;&gt;=C2=A0 3 files changed, 470 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023=
-39318.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023=
-39319.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-d=
evtools/go/go-1.14.inc<br>
&gt;&gt; index 20377e095b..9fc5eb130f 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/go/go-1.14.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14.inc<br>
&gt;&gt; @@ -70,6 +70,8 @@ SRC_URI +=3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-29400.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-29406.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-29409.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-39318.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-39319.patch \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-g=
libc-dynamic-linker-with-musl.patch&quot;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch=
 b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..20e70c0485<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
&gt;&gt; @@ -0,0 +1,238 @@<br>
&gt;&gt; +From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com=
" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt;&gt; +Date: Thu, 3 Aug 2023 12:24:13 -0700<br>
&gt;&gt; +Subject: [PATCH] [release-branch.go1.20] html/template: support H=
TML-like<br>
&gt;&gt; + comments in script contexts<br>
&gt;&gt; +<br>
&gt;&gt; +Per Appendix B.1.1 of the ECMAScript specification, support HTML-=
like<br>
&gt;&gt; +comments in script contexts. Also per section 12.5, support hashb=
ang<br>
&gt;&gt; +comments. This brings our parsing in-line with how browsers treat=
 these<br>
&gt;&gt; +comment types.<br>
&gt;&gt; +<br>
&gt;&gt; +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for<b=
r>
&gt;&gt; +reporting this issue.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #62196<br>
&gt;&gt; +Fixes #62395<br>
&gt;&gt; +Fixes CVE-2023-39318<br>
&gt;&gt; +<br>
&gt;&gt; +Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181<br>
&gt;&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c=
/golang/go-private/+/1976593" rel=3D"noreferrer" target=3D"_blank">https://=
team-review.git.corp.google.com/c/golang/go-private/+/1976593</a><br>
&gt;&gt; +Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@goog=
le.com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley=
@google.com" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" =
target=3D"_blank">dneil@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-by: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@goog=
le.com" target=3D"_blank">dmitshur@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c=
/golang/go-private/+/2014620" rel=3D"noreferrer" target=3D"_blank">https://=
team-review.git.corp.google.com/c/golang/go-private/+/2014620</a><br>
&gt;&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+=
/526098" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesourc=
e.com/c/go/+/526098</a><br>
&gt;&gt; +Run-TryBot: Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com"=
 target=3D"_blank">cherryyz@google.com</a>&gt;<br>
&gt;&gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.or=
g" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport from [<a href=3D"https://github.com/gol=
ang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/golang/go/commit/023b542edf38e2a1f87fc=
efb9f75ff2f99401b4c</a>]<br>
&gt;&gt; +CVE: CVE-2023-39318<br>
&gt;&gt; +Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvist=
a.com" target=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++-<b=
r>
&gt;&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 =
+-<br>
&gt;&gt; + src/html/template/escape_test.go=C2=A0 | 10 ++++<br>
&gt;&gt; + src/html/template/state_string.go |=C2=A0 4 +-<br>
&gt;&gt; + src/html/template/transition.go=C2=A0 =C2=A0| 80 +++++++++++++++=
+++++-----------<br>
&gt;&gt; + 5 files changed, 72 insertions(+), 33 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/html/template/context.go b/src/html/template/con=
text.go<br>
&gt;&gt; +index 0b65313..4eb7891 100644<br>
&gt;&gt; +--- a/src/html/template/context.go<br>
&gt;&gt; ++++ b/src/html/template/context.go<br>
&gt;&gt; +@@ -124,6 +124,10 @@ const (<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSBlockCmt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateJSLineCmt occurs inside a Java=
Script // line comment.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSLineCmt<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // stateJSHTMLOpenCmt occurs inside a JavaS=
cript &lt;!-- HTML-like comment.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLOpenCmt<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // stateJSHTMLCloseCmt occurs inside a Java=
Script --&gt; HTML-like comment.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLCloseCmt<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateCSS occurs inside a &lt;style&=
gt; element or style attribute.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateCSS<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateCSSDqStr occurs inside a CSS d=
ouble quoted string.<br>
&gt;&gt; +@@ -149,7 +153,7 @@ const (<br>
&gt;&gt; + // authors &amp; maintainers, not for end-users or machines.<br>
&gt;&gt; + func isComment(s state) bool {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch s {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 case stateHTMLCmt, stateJSBlockCmt, stateJS=
LineCmt, stateCSSBlockCmt, stateCSSLineCmt:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case stateHTMLCmt, stateJSBlockCmt, stateJS=
LineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCS=
SLineCmt:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tru=
e<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return false<br>
&gt;&gt; +diff --git a/src/html/template/escape.go b/src/html/template/esca=
pe.go<br>
&gt;&gt; +index 435f912..ad2ec69 100644<br>
&gt;&gt; +--- a/src/html/template/escape.go<br>
&gt;&gt; ++++ b/src/html/template/escape.go<br>
&gt;&gt; +@@ -698,9 +698,12 @@ func (e *escaper) escapeText(c context, n *p=
arse.TextNode) context {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if c.state=
 !=3D c1.state &amp;&amp; isComment(c1.state) &amp;&amp; c1.delim =3D=3D de=
limNone {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0// Preserve the portion between written and the comment=
 start.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0cs :=3D i1 - 2<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if c1.state =3D=3D stateHTMLCmt {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if c1.state =3D=3D stateHTMLCmt || c1.state =3D=3D stateJSHTM=
LOpenCmt {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// &quot;&lt;!--&quot; inst=
ead of &quot;/*&quot; or &quot;//&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs -=3D 2<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 } else if c1.state =3D=3D stateJSHTMLCloseCmt {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;--&gt;&quot; instead of =
&quot;/*&quot; or &quot;//&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs -=3D 1<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0b.Write(s[written:cs])<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0written =3D i1<br>
&gt;&gt; +diff --git a/src/html/template/escape_test.go b/src/html/template=
/escape_test.go<br>
&gt;&gt; +index f550691..5f41e52 100644<br>
&gt;&gt; +--- a/src/html/template/escape_test.go<br>
&gt;&gt; ++++ b/src/html/template/escape_test.go<br>
&gt;&gt; +@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;script&gt;var a/*b*///c\nd&lt;/script&gt;&quo=
t;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;script&gt;var a \nd&lt;/script&gt;&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;JS HTML-like comments&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;script&gt;before &lt;!-- beep\nbetween\nbefore--&gt=
;boop\n&lt;/script&gt;&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;script&gt;before \nbetween\nbefore\n&lt;/script&gt;=
&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;JS hashbang comment&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;script&gt;#! beep\n&lt;/script&gt;&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;script&gt;\n&lt;/script&gt;&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;CSS comments&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;style&gt;p// paragraph\n&quot; +<br>
&gt;&gt; +diff --git a/src/html/template/state_string.go b/src/html/templat=
e/state_string.go<br>
&gt;&gt; +index 05104be..b5cfe70 100644<br>
&gt;&gt; +--- a/src/html/template/state_string.go<br>
&gt;&gt; ++++ b/src/html/template/state_string.go<br>
&gt;&gt; +@@ -4,9 +4,9 @@ package template<br>
&gt;&gt; +<br>
&gt;&gt; + import &quot;strconv&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +-const _state_name =3D &quot;stateTextstateTagstateAttrNamestateA=
fterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcset=
stateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtst=
ateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateC=
SSBlockCmtstateCSSLineCmtstateError&quot;<br>
&gt;&gt; ++const _state_name =3D &quot;stateTextstateTagstateAttrNamestateA=
fterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcset=
stateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstat=
eJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCS=
SSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmts=
tateErrorstateDead&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 27=
1, 286, 296}<br>
&gt;&gt; ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2, 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 28=
0, 293, 304, 320, 335, 345, 354}<br>
&gt;&gt; +<br>
&gt;&gt; + func (i state) String() string {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if i &gt;=3D state(len(_state_index)-1=
) {<br>
&gt;&gt; +diff --git a/src/html/template/transition.go b/src/html/template/=
transition.go<br>
&gt;&gt; +index 92eb351..12aa4c4 100644<br>
&gt;&gt; +--- a/src/html/template/transition.go<br>
&gt;&gt; ++++ b/src/html/template/transition.go<br>
&gt;&gt; +@@ -14,32 +14,34 @@ import (<br>
&gt;&gt; + // the updated context and the number of bytes consumed from the=
 front of the<br>
&gt;&gt; + // input.<br>
&gt;&gt; + var transitionFunc =3D [...]func(context, []byte) (context, int)=
{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateText:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tText=
,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateTag:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tTag,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateAttrName:=C2=A0 =C2=A0 tAttrName,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateAfterName:=C2=A0 =C2=A0tAfterName,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateBeforeValue: tBeforeValue,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateHTMLCmt:=C2=A0 =C2=A0 =C2=A0tHTMLCmt,<=
br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateRCDATA:=C2=A0 =C2=A0 =C2=A0 tSpecialTa=
gEnd,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateAttr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tAttr=
,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tURL,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateSrcset:=C2=A0 =C2=A0 =C2=A0 tURL,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tJS,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJSDqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimit=
ed,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJSSqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimit=
ed,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJSBqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimit=
ed,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJSRegexp:=C2=A0 =C2=A0 tJSDelimited,<b=
r>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJSBlockCmt:=C2=A0 tBlockCmt,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateJSLineCmt:=C2=A0 =C2=A0tLineCmt,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tCSS,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSDqStr:=C2=A0 =C2=A0 tCSSStr,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSSqStr:=C2=A0 =C2=A0 tCSSStr,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSDqURL:=C2=A0 =C2=A0 tCSSStr,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSSqURL:=C2=A0 =C2=A0 tCSSStr,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSURL:=C2=A0 =C2=A0 =C2=A0 tCSSStr,<b=
r>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSBlockCmt: tBlockCmt,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateCSSLineCmt:=C2=A0 tLineCmt,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 stateError:=C2=A0 =C2=A0 =C2=A0 =C2=A0tErro=
r,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateText:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tText,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateTag:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tTag,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateAttrName:=C2=A0 =C2=A0 =C2=A0 =C2=A0tA=
ttrName,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateAfterName:=C2=A0 =C2=A0 =C2=A0 tAfterN=
ame,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateBeforeValue:=C2=A0 =C2=A0 tBeforeValue=
,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateHTMLCmt:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tH=
TMLCmt,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateRCDATA:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tSpecialTagEnd,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateAttr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tAttr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tURL,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateSrcset:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tURL,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tJS,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSDqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tJ=
SDelimited,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSSqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tJ=
SDelimited,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSBqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tJ=
SDelimited,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSRegexp:=C2=A0 =C2=A0 =C2=A0 =C2=A0tJ=
SDelimited,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSBlockCmt:=C2=A0 =C2=A0 =C2=A0tBlockC=
mt,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSLineCmt:=C2=A0 =C2=A0 =C2=A0 tLineCm=
t,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLOpenCmt:=C2=A0 tLineCmt,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLCloseCmt: tLineCmt,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tCSS,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSDqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0tC=
SSStr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSSqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0tC=
SSStr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSDqURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0tC=
SSStr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSSqURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0tC=
SSStr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tCSSStr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSBlockCmt:=C2=A0 =C2=A0 tBlockCmt,<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateCSSLineCmt:=C2=A0 =C2=A0 =C2=A0tLineCm=
t,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateError:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tError,<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + var commentStart =3D []byte(&quot;&lt;!--&quot;)<br>
&gt;&gt; +@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int)=
 {<br>
&gt;&gt; +<br>
&gt;&gt; + // tJS is the context transition function for the JS state.<br>
&gt;&gt; + func tJS(c context, s []byte) (context, int) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 i :=3D bytes.IndexAny(s, &quot;\&quot;`&#39=
;/&quot;)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 i :=3D bytes.IndexAny(s, &quot;\&quot;`&#39=
;/&lt;-#&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if i =3D=3D -1 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Entire =
input is non string, comment, regexp tokens.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.jsCtx =
=3D nextJSCtx(s, c.jsCtx)<br>
&gt;&gt; +@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int)=
 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err:=C2=A0 =C2=A0errorf(Err=
SlashAmbig, nil, 0, &quot;&#39;/&#39; could start a division or regexp: %.3=
2q&quot;, s[i:]),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}, len(s)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // ECMAScript supports HTML style comments =
for legacy reasons, see Appendix<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // B.1.1 &quot;HTML-like Comments&quot;. Th=
e handling of these comments is somewhat<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // confusing. Multi-line comments are not s=
upported, i.e. anything on lines<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // between the opening and closing tokens i=
s not considered a comment, but<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // anything following the opening or closin=
g token, on the same line, is<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // ignored. As such we simply treat any lin=
e prefixed with &quot;&lt;!--&quot; or &quot;--&gt;&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // as if it were actually prefixed with &qu=
ot;//&quot; and move on.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case &#39;&lt;&#39;:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i+3 &lt; len=
(s) &amp;&amp; bytes.Equal(commentStart, s[i:i+4]) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c.state, i =3D stateJSHTMLOpenCmt, i+3<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case &#39;-&#39;:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i+2 &lt; len=
(s) &amp;&amp; bytes.Equal(commentEnd, s[i:i+3]) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c.state, i =3D stateJSHTMLCloseCmt, i+2<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // ECMAScript also supports &quot;hashbang&=
quot; comment lines, see Section 12.5.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case &#39;#&#39;:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i+1 &lt; len=
(s) &amp;&amp; s[i+1] =3D=3D &#39;!&#39; {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 c.state, i =3D stateJSLineCmt, i+1<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic(&quo=
t;unreachable&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (contex=
t, int) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return c, i + 2<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +-// tLineCmt is the context transition function for //comment sta=
tes.<br>
&gt;&gt; ++// tLineCmt is the context transition function for //comment sta=
tes, and the JS HTML-like comment state.<br>
&gt;&gt; + func tLineCmt(c context, s []byte) (context, int) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var lineTerminators string<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var endState state<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch c.state {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 case stateJSLineCmt:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case stateJSLineCmt, stateJSHTMLOpenCmt, st=
ateJSHTMLCloseCmt:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineTermin=
ators, endState =3D &quot;\n\r\u2028\u2029&quot;, stateJS<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateCSSLineCmt:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineTermin=
ators, endState =3D &quot;\n\f\r&quot;, stateCSS<br>
&gt;&gt; +--<br>
&gt;&gt; +2.24.4<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch=
 b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..69106e3e05<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch<br>
&gt;&gt; @@ -0,0 +1,230 @@<br>
&gt;&gt; +From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com=
" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt;&gt; +Date: Thu, 3 Aug 2023 12:28:28 -0700<br>
&gt;&gt; +Subject: [PATCH] [release-branch.go1.20] html/template: properly =
handle<br>
&gt;&gt; + special tags within the script context<br>
&gt;&gt; +<br>
&gt;&gt; +The HTML specification has incredibly complex rules for how to ha=
ndle<br>
&gt;&gt; +&quot;&lt;!--&quot;, &quot;&lt;script&quot;, and &quot;&lt;/scrip=
t&quot; when they appear within literals in<br>
&gt;&gt; +the script context. Rather than attempting to apply these restric=
tions<br>
&gt;&gt; +(which require a significantly more complex state machine) we app=
ly<br>
&gt;&gt; +the workaround suggested in section 4.12.1.3 of the HTML specific=
ation [1].<br>
&gt;&gt; +<br>
&gt;&gt; +More precisely, when &quot;&lt;!--&quot;, &quot;&lt;script&quot;,=
 and &quot;&lt;/script&quot; appear within<br>
&gt;&gt; +literals (strings and regular expressions, ignoring comments sinc=
e we<br>
&gt;&gt; +already elide their content) we replace the &quot;&lt;&quot; with=
 &quot;\x3C&quot;. This avoids<br>
&gt;&gt; +the unintuitive behavior that using these tags within literals ca=
n cause,<br>
&gt;&gt; +by simply preventing the rendered content from triggering it. Thi=
s may<br>
&gt;&gt; +break some correct usages of these tags, but on balance is more l=
ikely<br>
&gt;&gt; +to prevent XSS attacks where users are unknowingly either closing=
 or not<br>
&gt;&gt; +closing the script blocks where they think they are.<br>
&gt;&gt; +<br>
&gt;&gt; +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for<b=
r>
&gt;&gt; +reporting this issue.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #62197<br>
&gt;&gt; +Fixes #62397<br>
&gt;&gt; +Fixes CVE-2023-39319<br>
&gt;&gt; +<br>
&gt;&gt; +[1] <a href=3D"https://html.spec.whatwg.org/#restrictions-for-con=
tents-of-script-elements" rel=3D"noreferrer" target=3D"_blank">https://html=
.spec.whatwg.org/#restrictions-for-contents-of-script-elements</a><br>
&gt;&gt; +<br>
&gt;&gt; +Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc<br>
&gt;&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c=
/golang/go-private/+/1976594" rel=3D"noreferrer" target=3D"_blank">https://=
team-review.git.corp.google.com/c/golang/go-private/+/1976594</a><br>
&gt;&gt; +Reviewed-by: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@goog=
le.com" target=3D"_blank">dmitshur@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley=
@google.com" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" =
target=3D"_blank">dneil@google.com</a>&gt;<br>
&gt;&gt; +Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@goog=
le.com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt;&gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c=
/golang/go-private/+/2014621" rel=3D"noreferrer" target=3D"_blank">https://=
team-review.git.corp.google.com/c/golang/go-private/+/2014621</a><br>
&gt;&gt; +TryBot-Result: Security TryBots &lt;<a href=3D"mailto:security-tr=
ybots@go-security-trybots.iam.gserviceaccount.com" target=3D"_blank">securi=
ty-trybots@go-security-trybots.iam.gserviceaccount.com</a>&gt;<br>
&gt;&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+=
/526099" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesourc=
e.com/c/go/+/526099</a><br>
&gt;&gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.or=
g" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt;&gt; +Run-TryBot: Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com"=
 target=3D"_blank">cherryyz@google.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport from [<a href=3D"https://github.com/gol=
ang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab2f5" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/golang/go/commit/2070531d2f53df88e312e=
dace6c8dfc9686ab2f5</a>]<br>
&gt;&gt; +CVE: CVE-2023-39319<br>
&gt;&gt; +Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvist=
a.com" target=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/html/template/context.go=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++<=
br>
&gt;&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 | 26 +++++++++++=
+++++++<br>
&gt;&gt; + src/html/template/escape_test.go | 47 ++++++++++++++++++++++++++=
+++++-<br>
&gt;&gt; + src/html/template/transition.go=C2=A0 | 15 ++++++++++<br>
&gt;&gt; + 4 files changed, 101 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/html/template/context.go b/src/html/template/con=
text.go<br>
&gt;&gt; +index 4eb7891..feb6517 100644<br>
&gt;&gt; +--- a/src/html/template/context.go<br>
&gt;&gt; ++++ b/src/html/template/context.go<br>
&gt;&gt; +@@ -168,6 +168,20 @@ func isInTag(s state) bool {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return false<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; ++// isInScriptLiteral returns true if s is one of the literal sta=
tes within a<br>
&gt;&gt; ++// &lt;script&gt; tag, and as such occurances of &quot;&lt;!--&q=
uot;, &quot;&lt;script&quot;, and &quot;&lt;/script&quot;<br>
&gt;&gt; ++// need to be treated specially.<br>
&gt;&gt; ++func isInScriptLiteral(s state) bool {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // Ignore the comment states (stateJSBlockC=
mt, stateJSLineCmt,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // stateJSHTMLOpenCmt, stateJSHTMLCloseCmt)=
 because their content is already<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // omitted from the output.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 switch s {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case stateJSDqStr, stateJSSqStr, stateJSBqS=
tr, stateJSRegexp:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return false<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; + // delim is the delimiter that will end the current HTML attribu=
te.<br>
&gt;&gt; + type delim uint8<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/html/template/escape.go b/src/html/template/esca=
pe.go<br>
&gt;&gt; +index ad2ec69..de8cf6f 100644<br>
&gt;&gt; +--- a/src/html/template/escape.go<br>
&gt;&gt; ++++ b/src/html/template/escape.go<br>
&gt;&gt; +@@ -10,6 +10,7 @@ import (<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;html&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;internal/godebug&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;regexp&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;text/template&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;text/template/parse&quot;<br>
&gt;&gt; + )<br>
&gt;&gt; +@@ -650,6 +651,26 @@ var delimEnds =3D [...]string{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0delimSpaceOrTagEnd: &quot; \t\n\f\r&gt=
;&quot;,<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; ++var (<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // Per WHATWG HTML specification, section 4=
.12.1.3, there are extremely<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // complicated rules for how to handle the =
set of opening tags &lt;!--,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // &lt;script, and &lt;/script when they ap=
pear in JS literals (i.e. strings,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // regexs, and comments). The specification=
 suggests a simple solution,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // rather than implementing the arcane ABNF=
, which involves simply escaping<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // the opening bracket with \x3C. We use th=
e below regex for this, since it<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // makes doing the case-insensitive find-re=
place much simpler.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 specialScriptTagRE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D regexp.MustCompile(&quot;(?i)&lt;(script|/script|!--)&quot;)=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 specialScriptTagReplacement =3D []byte(&quo=
t;\\x3C$1&quot;)<br>
&gt;&gt; ++)<br>
&gt;&gt; ++<br>
&gt;&gt; ++func containsSpecialScriptTag(s []byte) bool {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return specialScriptTagRE.Match(s)<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; ++func escapeSpecialScriptTags(s []byte) []byte {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return specialScriptTagRE.ReplaceAll(s, spe=
cialScriptTagReplacement)<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; + var doctypeBytes =3D []byte(&quot;&lt;!DOCTYPE&quot;)<br>
&gt;&gt; +<br>
&gt;&gt; + // escapeText escapes a text template node.<br>
&gt;&gt; +@@ -708,6 +729,11 @@ func (e *escaper) escapeText(c context, n *p=
arse.TextNode) context {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0b.Write(s[written:cs])<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0written =3D i1<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isInScriptLi=
teral(c.state) &amp;&amp; containsSpecialScriptTag(s[i:i1]) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 b.Write(s[written:i])<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 b.Write(escapeSpecialScriptTags(s[i:i1]))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 written =3D i1<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i =3D=
=3D i1 &amp;&amp; c.state =3D=3D c1.state {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0panic(fmt.Sprintf(&quot;infinite loop from %v to %v on =
%q..%q&quot;, c, c1, s[:i], s[i:]))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +diff --git a/src/html/template/escape_test.go b/src/html/template=
/escape_test.go<br>
&gt;&gt; +index 5f41e52..0cacb20 100644<br>
&gt;&gt; +--- a/src/html/template/escape_test.go<br>
&gt;&gt; ++++ b/src/html/template/escape_test.go<br>
&gt;&gt; +@@ -513,6 +513,21 @@ func TestEscape(t *testing.T) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;script&gt;#! beep\n&lt;/script&gt;&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;script&gt;\n&lt;/script&gt;&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Special tags in &lt;script&gt; string literals&quot;,<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;var a =3D &quot;asd &lt; 123 &lt;!-- 456 &lt; =
fgh &lt;script jkl &lt; 789 &lt;/script&quot;&lt;/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;var a =3D &quot;asd &lt; 123 \x3C!-- 456 &lt; =
fgh \x3Cscript jkl &lt; 789 \x3C/script&quot;&lt;/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Special tags in &lt;script&gt; string literals (mixed c=
ase)&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;var a =3D &quot;&lt;!-- &lt;ScripT &lt;/ScripT=
&quot;&lt;/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;var a =3D &quot;\x3C!-- \x3CScripT \x3C/ScripT=
&quot;&lt;/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Special tags in &lt;script&gt; regex literals (mixed ca=
se)&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;var a =3D /&lt;!-- &lt;ScripT &lt;/ScripT/&lt;=
/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;var a =3D /\x3C!-- \x3CScripT \x3C/ScripT/&lt;=
/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;CSS comments&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;style&gt;p// paragraph\n&quot; +<br>
&gt;&gt; +@@ -1501,8 +1516,38 @@ func TestEscapeText(t *testing.T) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0context{state: stateJS, element: elementScript},<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 // &lt;script and &lt;/script tags are escaped, so &lt;/scrip=
t&gt; should not<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 // cause us to exit the JS state.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;script&gt;document.write(&quot;&lt;script&gt;alert=
(1)&lt;/script&gt;&quot;);`,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateText},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJS, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJSDqStr, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt=
;/script&gt;`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJSDqStr, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt=
;!--`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJSDqStr, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt=
;/Script&gt;&quot;);`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJS, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;document.write(&quot;&lt;!--&quot;);`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJS, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;let a =3D /&lt;/script`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJSRegexp, element: elementScript},<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;script&gt;let a =3D /&lt;/script/`,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJS, element: elementScript, jsCtx: jsCtxD=
ivOp},<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;script type=3D&quot;text/template&quot;&gt;`,<br>
&gt;&gt; +diff --git a/src/html/template/transition.go b/src/html/template/=
transition.go<br>
&gt;&gt; +index 12aa4c4..3d2a37c 100644<br>
&gt;&gt; +--- a/src/html/template/transition.go<br>
&gt;&gt; ++++ b/src/html/template/transition.go<br>
&gt;&gt; +@@ -214,6 +214,11 @@ var (<br>
&gt;&gt; + // element states.<br>
&gt;&gt; + func tSpecialTagEnd(c context, s []byte) (context, int) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if c.element !=3D elementNone {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // script end t=
ags (&quot;&lt;/script&quot;) within script literals are ignored, so that<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // we can prope=
rly escape them.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c.element =
=3D=3D elementScript &amp;&amp; (isInScriptLiteral(c.state) || isComment(c.=
state)) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return c, len(s)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i :=3D =
indexTagEnd(s, specialTagEndMarkers[c.element]); i !=3D -1 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return context{}, i<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +@@ -353,6 +358,16 @@ func tJSDelimited(c context, s []byte) (cont=
ext, int) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0inCharset =3D true<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;=
]&#39;:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0inCharset =3D false<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;/&#39=
;:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 // If &quot;&lt;/script&quot; appears in a regex literal, the=
 &#39;/&#39; should not<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 // close the regex literal, and it will later be escaped to<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 // &quot;\x3C/script&quot; in escapeText.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if i &gt; 0 &amp;&amp; i+7 &lt;=3D len(s) &amp;&amp; bytes.Co=
mpare(bytes.ToLower(s[i-1:i+7]), []byte(&quot;&lt;/script&quot;)) =3D=3D 0 =
{<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 } else if !inCharset {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.state, c.jsCtx =3D stateJS, jsC=
txDivOp<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return c, i + 1<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0// end delimiter<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if !inCharset {<br>
&gt;&gt; +--<br>
&gt;&gt; +2.24.4<br>
&gt;&gt; +<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#188215): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/188215" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/188215</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1015=
89537/7032091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/101589537/7032091</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarni@mvista.=
com" target=3D"_blank">skulkarni@mvista.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000004b769c060681bd08--

