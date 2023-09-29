Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60362E71D43
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 14:47:59 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.19338.1695998875815346437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 07:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AWoQIBlm;
 spf=pass (domain: mvista.com, ip: 209.85.167.51, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50435ad51bbso20286971e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695998874; x=1696603674; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/KJBu213ahc8mxiRnQiMTDiisZATZYR9Ng+0Vwb4CZU=;
        b=AWoQIBlmyMF6UvXri23TFjw05Nh3YklMR/XObYCEhSlsf6lGRjCcYJx+UnKaADNylW
         MXBqglOnHQLFvsjPfMLtQSTSg0yADMdjmPt4segfnHTPwDEVXNGyK3EWJxO3relqkNq9
         Xj98uV3590CbLZhus1l7X90edh5KXT84012sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998874; x=1696603674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KJBu213ahc8mxiRnQiMTDiisZATZYR9Ng+0Vwb4CZU=;
        b=lP04QSym9fQsmmUMeYFkVkaCV192X/10AdO1S+FIJUBQsrWbI5PU4KGlrcOYLmnb0i
         Olh2nBtd8VZFVr8qo4khZcMv8xV03fpVi4ttstEcDKreJ3garo8tkPSLtDodTAjhI8q5
         42PnVaZyLl49I4xN83onZfnXoQgQpxpx1r+LJRPSwquT06Qp9DcAsFBgx93tH0UgxOZ7
         GN8poIcU6b2Ylv+mavuQ6cXl4zN2Xn9tkzpxDLe4SrHYkP90QKyTvxnuh8+vghuFOepL
         BhOS2JwgW38QCvmVxHLdBD/7NXKFGG1b7ocaUL5kIyjlWKxWQIpyNpXb2uR607wCR2Gt
         ocqw==
X-Gm-Message-State: AOJu0Yype2a+7MJNkIQ0evhKrbiDZZywgKy3YDL9txcUFa6/1l5JQbEd
	vlm8n0+a7mWSuI/bPlUFkIK3rTPpSCj5i6TfU5vsYQ==
X-Google-Smtp-Source: AGHT+IHs3tpsmpR5YOEfzcmiSEy0ERS6yFIMyiL21BV8kwkfu/c4/NbNd5d3zibQBl7wdyo+ePPhD7RhdHl9leNXP7s=
X-Received: by 2002:a05:6512:b8e:b0:503:5e1:9b6e with SMTP id
 b14-20020a0565120b8e00b0050305e19b6emr4794640lfv.10.1695998873074; Fri, 29
 Sep 2023 07:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230926040754.6166-1-sdoshi@mvista.com>
In-Reply-To: <20230926040754.6166-1-sdoshi@mvista.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Fri, 29 Sep 2023 20:17:41 +0530
Message-ID: <CAKzga+zhofsNbpJkqg0beJNdNUfzMK4GKUdf_Ft0y-6zvsEFCQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Fix CVE-2023-39318 and CVE-2023-39319
To: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Cc: sdoshi@mvista.com
Content-Type: multipart/alternative; boundary="0000000000005e970906068082c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 14:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188407

--0000000000005e970906068082c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Is there any update on this?

Thanks,
Shubham Kulkarni

On Tue, Sep 26, 2023 at 9:38=E2=80=AFAM Siddharth via lists.openembedded.or=
g
<sdoshi=3Dmvista.com@lists.openembedded.org> wrote:

> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Upstream-Status: Backport from [
> https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401=
b4c
> ]
> CVE: CVE-2023-39318
> Upstream-Status: Backport from [
> https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab=
2f5
> ]
> CVE: CVE-2023-39319
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |   2 +
>  .../go/go-1.14/CVE-2023-39318.patch           | 238 ++++++++++++++++++
>  .../go/go-1.14/CVE-2023-39319.patch           | 230 +++++++++++++++++
>  3 files changed, 470 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> index 20377e095b..9fc5eb130f 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -70,6 +70,8 @@ SRC_URI +=3D "\
>      file://CVE-2023-29400.patch \
>      file://CVE-2023-29406.patch \
>      file://CVE-2023-29409.patch \
> +    file://CVE-2023-39318.patch \
> +    file://CVE-2023-39319.patch \
>  "
>
>  SRC_URI_append_libc-musl =3D "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> new file mode 100644
> index 0000000000..20e70c0485
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> @@ -0,0 +1,238 @@
> +From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Thu, 3 Aug 2023 12:24:13 -0700
> +Subject: [PATCH] [release-branch.go1.20] html/template: support HTML-lik=
e
> + comments in script contexts
> +
> +Per Appendix B.1.1 of the ECMAScript specification, support HTML-like
> +comments in script contexts. Also per section 12.5, support hashbang
> +comments. This brings our parsing in-line with how browsers treat these
> +comment types.
> +
> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
> +reporting this issue.
> +
> +Fixes #62196
> +Fixes #62395
> +Fixes CVE-2023-39318
> +
> +Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1976593
> +Run-TryBot
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1976593+Ru=
n-TryBot>:
> Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/2014620
> +Reviewed-on
> <https://team-review.git.corp.google.com/c/golang/go-private/+/2014620+Re=
viewed-on>:
> https://go-review.googlesource.com/c/go/+/526098
> +Run-TryBot: Cherry Mui <cherryyz@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +Upstream-Status: Backport from [
> https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401=
b4c
> ]
> +CVE: CVE-2023-39318
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + src/html/template/context.go      |  6 ++-
> + src/html/template/escape.go       |  5 +-
> + src/html/template/escape_test.go  | 10 ++++
> + src/html/template/state_string.go |  4 +-
> + src/html/template/transition.go   | 80 ++++++++++++++++++++-----------
> + 5 files changed, 72 insertions(+), 33 deletions(-)
> +
> +diff --git a/src/html/template/context.go b/src/html/template/context.go
> +index 0b65313..4eb7891 100644
> +--- a/src/html/template/context.go
> ++++ b/src/html/template/context.go
> +@@ -124,6 +124,10 @@ const (
> +       stateJSBlockCmt
> +       // stateJSLineCmt occurs inside a JavaScript // line comment.
> +       stateJSLineCmt
> ++      // stateJSHTMLOpenCmt occurs inside a JavaScript <!-- HTML-like
> comment.
> ++      stateJSHTMLOpenCmt
> ++      // stateJSHTMLCloseCmt occurs inside a JavaScript --> HTML-like
> comment.
> ++      stateJSHTMLCloseCmt
> +       // stateCSS occurs inside a <style> element or style attribute.
> +       stateCSS
> +       // stateCSSDqStr occurs inside a CSS double quoted string.
> +@@ -149,7 +153,7 @@ const (
> + // authors & maintainers, not for end-users or machines.
> + func isComment(s state) bool {
> +       switch s {
> +-      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt,
> stateCSSBlockCmt, stateCSSLineCmt:
> ++      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt,
> stateJSHTMLOpenCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCSSLineCm=
t:
> +               return true
> +       }
> +       return false
> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> +index 435f912..ad2ec69 100644
> +--- a/src/html/template/escape.go
> ++++ b/src/html/template/escape.go
> +@@ -698,9 +698,12 @@ func (e *escaper) escapeText(c context, n
> *parse.TextNode) context {
> +               if c.state !=3D c1.state && isComment(c1.state) && c1.del=
im
> =3D=3D delimNone {
> +                       // Preserve the portion between written and the
> comment start.
> +                       cs :=3D i1 - 2
> +-                      if c1.state =3D=3D stateHTMLCmt {
> ++                      if c1.state =3D=3D stateHTMLCmt || c1.state =3D=
=3D
> stateJSHTMLOpenCmt {
> +                               // "<!--" instead of "/*" or "//"
> +                               cs -=3D 2
> ++                      } else if c1.state =3D=3D stateJSHTMLCloseCmt {
> ++                              // "-->" instead of "/*" or "//"
> ++                              cs -=3D 1
> +                       }
> +                       b.Write(s[written:cs])
> +                       written =3D i1
> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> +index f550691..5f41e52 100644
> +--- a/src/html/template/escape_test.go
> ++++ b/src/html/template/escape_test.go
> +@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {
> +                       "<script>var a/*b*///c\nd</script>",
> +                       "<script>var a \nd</script>",
> +               },
> ++              {
> ++                      "JS HTML-like comments",
> ++                      "<script>before <!--
> beep\nbetween\nbefore-->boop\n</script>",
> ++                      "<script>before \nbetween\nbefore\n</script>",
> ++              },
> ++              {
> ++                      "JS hashbang comment",
> ++                      "<script>#! beep\n</script>",
> ++                      "<script>\n</script>",
> ++              },
> +               {
> +                       "CSS comments",
> +                       "<style>p// paragraph\n" +
> +diff --git a/src/html/template/state_string.go
> b/src/html/template/state_string.go
> +index 05104be..b5cfe70 100644
> +--- a/src/html/template/state_string.go
> ++++ b/src/html/template/state_string.go
> +@@ -4,9 +4,9 @@ package template
> +
> + import "strconv"
> +
> +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> ++const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSH=
TMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstat=
eCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
> +
> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100,
> 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286=
,
> 296}
> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100,
> 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293=
,
> 304, 320, 335, 345, 354}
> +
> + func (i state) String() string {
> +       if i >=3D state(len(_state_index)-1) {
> +diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> +index 92eb351..12aa4c4 100644
> +--- a/src/html/template/transition.go
> ++++ b/src/html/template/transition.go
> +@@ -14,32 +14,34 @@ import (
> + // the updated context and the number of bytes consumed from the front
> of the
> + // input.
> + var transitionFunc =3D [...]func(context, []byte) (context, int){
> +-      stateText:        tText,
> +-      stateTag:         tTag,
> +-      stateAttrName:    tAttrName,
> +-      stateAfterName:   tAfterName,
> +-      stateBeforeValue: tBeforeValue,
> +-      stateHTMLCmt:     tHTMLCmt,
> +-      stateRCDATA:      tSpecialTagEnd,
> +-      stateAttr:        tAttr,
> +-      stateURL:         tURL,
> +-      stateSrcset:      tURL,
> +-      stateJS:          tJS,
> +-      stateJSDqStr:     tJSDelimited,
> +-      stateJSSqStr:     tJSDelimited,
> +-      stateJSBqStr:     tJSDelimited,
> +-      stateJSRegexp:    tJSDelimited,
> +-      stateJSBlockCmt:  tBlockCmt,
> +-      stateJSLineCmt:   tLineCmt,
> +-      stateCSS:         tCSS,
> +-      stateCSSDqStr:    tCSSStr,
> +-      stateCSSSqStr:    tCSSStr,
> +-      stateCSSDqURL:    tCSSStr,
> +-      stateCSSSqURL:    tCSSStr,
> +-      stateCSSURL:      tCSSStr,
> +-      stateCSSBlockCmt: tBlockCmt,
> +-      stateCSSLineCmt:  tLineCmt,
> +-      stateError:       tError,
> ++      stateText:           tText,
> ++      stateTag:            tTag,
> ++      stateAttrName:       tAttrName,
> ++      stateAfterName:      tAfterName,
> ++      stateBeforeValue:    tBeforeValue,
> ++      stateHTMLCmt:        tHTMLCmt,
> ++      stateRCDATA:         tSpecialTagEnd,
> ++      stateAttr:           tAttr,
> ++      stateURL:            tURL,
> ++      stateSrcset:         tURL,
> ++      stateJS:             tJS,
> ++      stateJSDqStr:        tJSDelimited,
> ++      stateJSSqStr:        tJSDelimited,
> ++      stateJSBqStr:        tJSDelimited,
> ++      stateJSRegexp:       tJSDelimited,
> ++      stateJSBlockCmt:     tBlockCmt,
> ++      stateJSLineCmt:      tLineCmt,
> ++      stateJSHTMLOpenCmt:  tLineCmt,
> ++      stateJSHTMLCloseCmt: tLineCmt,
> ++      stateCSS:            tCSS,
> ++      stateCSSDqStr:       tCSSStr,
> ++      stateCSSSqStr:       tCSSStr,
> ++      stateCSSDqURL:       tCSSStr,
> ++      stateCSSSqURL:       tCSSStr,
> ++      stateCSSURL:         tCSSStr,
> ++      stateCSSBlockCmt:    tBlockCmt,
> ++      stateCSSLineCmt:     tLineCmt,
> ++      stateError:          tError,
> + }
> +
> + var commentStart =3D []byte("<!--")
> +@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int) {
> +
> + // tJS is the context transition function for the JS state.
> + func tJS(c context, s []byte) (context, int) {
> +-      i :=3D bytes.IndexAny(s, "\"`'/")
> ++      i :=3D bytes.IndexAny(s, "\"`'/<-#")
> +       if i =3D=3D -1 {
> +               // Entire input is non string, comment, regexp tokens.
> +               c.jsCtx =3D nextJSCtx(s, c.jsCtx)
> +@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int) {
> +                               err:   errorf(ErrSlashAmbig, nil, 0, "'/'
> could start a division or regexp: %.32q", s[i:]),
> +                       }, len(s)
> +               }
> ++      // ECMAScript supports HTML style comments for legacy reasons, se=
e
> Appendix
> ++      // B.1.1 "HTML-like Comments". The handling of these comments is
> somewhat
> ++      // confusing. Multi-line comments are not supported, i.e. anythin=
g
> on lines
> ++      // between the opening and closing tokens is not considered a
> comment, but
> ++      // anything following the opening or closing token, on the same
> line, is
> ++      // ignored. As such we simply treat any line prefixed with "<!--"
> or "-->"
> ++      // as if it were actually prefixed with "//" and move on.
> ++      case '<':
> ++              if i+3 < len(s) && bytes.Equal(commentStart, s[i:i+4]) {
> ++                      c.state, i =3D stateJSHTMLOpenCmt, i+3
> ++              }
> ++      case '-':
> ++              if i+2 < len(s) && bytes.Equal(commentEnd, s[i:i+3]) {
> ++                      c.state, i =3D stateJSHTMLCloseCmt, i+2
> ++              }
> ++      // ECMAScript also supports "hashbang" comment lines, see Section
> 12.5.
> ++      case '#':
> ++              if i+1 < len(s) && s[i+1] =3D=3D '!' {
> ++                      c.state, i =3D stateJSLineCmt, i+1
> ++              }
> +       default:
> +               panic("unreachable")
> +       }
> +@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (context, int)=
 {
> +       return c, i + 2
> + }
> +
> +-// tLineCmt is the context transition function for //comment states.
> ++// tLineCmt is the context transition function for //comment states, an=
d
> the JS HTML-like comment state.
> + func tLineCmt(c context, s []byte) (context, int) {
> +       var lineTerminators string
> +       var endState state
> +       switch c.state {
> +-      case stateJSLineCmt:
> ++      case stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt:
> +               lineTerminators, endState =3D "\n\r\u2028\u2029", stateJS
> +       case stateCSSLineCmt:
> +               lineTerminators, endState =3D "\n\f\r", stateCSS
> +--
> +2.24.4
> +
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> new file mode 100644
> index 0000000000..69106e3e05
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
> @@ -0,0 +1,230 @@
> +From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Thu, 3 Aug 2023 12:28:28 -0700
> +Subject: [PATCH] [release-branch.go1.20] html/template: properly handle
> + special tags within the script context
> +
> +The HTML specification has incredibly complex rules for how to handle
> +"<!--", "<script", and "</script" when they appear within literals in
> +the script context. Rather than attempting to apply these restrictions
> +(which require a significantly more complex state machine) we apply
> +the workaround suggested in section 4.12.1.3 of the HTML specification
> [1].
> +
> +More precisely, when "<!--", "<script", and "</script" appear within
> +literals (strings and regular expressions, ignoring comments since we
> +already elide their content) we replace the "<" with "\x3C". This avoids
> +the unintuitive behavior that using these tags within literals can cause=
,
> +by simply preventing the rendered content from triggering it. This may
> +break some correct usages of these tags, but on balance is more likely
> +to prevent XSS attacks where users are unknowingly either closing or not
> +closing the script blocks where they think they are.
> +
> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
> +reporting this issue.
> +
> +Fixes #62197
> +Fixes #62397
> +Fixes CVE-2023-39319
> +
> +[1]
> https://html.spec.whatwg.org/#restrictions-for-contents-of-script-element=
s
> +
> +Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1976594
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/1976594+Re=
viewed-by>:
> Dmitri Shuralyov <dmitshur@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/2014621
> +TryBot-Result
> <https://team-review.git.corp.google.com/c/golang/go-private/+/2014621+Tr=
yBot-Result>:
> Security TryBots <
> security-trybots@go-security-trybots.iam.gserviceaccount.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/526099
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Cherry Mui <cherryyz@google.com>
> +
> +Upstream-Status: Backport from [
> https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab=
2f5
> ]
> +CVE: CVE-2023-39319
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + src/html/template/context.go     | 14 ++++++++++
> + src/html/template/escape.go      | 26 ++++++++++++++++++
> + src/html/template/escape_test.go | 47 +++++++++++++++++++++++++++++++-
> + src/html/template/transition.go  | 15 ++++++++++
> + 4 files changed, 101 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/html/template/context.go b/src/html/template/context.go
> +index 4eb7891..feb6517 100644
> +--- a/src/html/template/context.go
> ++++ b/src/html/template/context.go
> +@@ -168,6 +168,20 @@ func isInTag(s state) bool {
> +       return false
> + }
> +
> ++// isInScriptLiteral returns true if s is one of the literal states
> within a
> ++// <script> tag, and as such occurances of "<!--", "<script", and
> "</script"
> ++// need to be treated specially.
> ++func isInScriptLiteral(s state) bool {
> ++      // Ignore the comment states (stateJSBlockCmt, stateJSLineCmt,
> ++      // stateJSHTMLOpenCmt, stateJSHTMLCloseCmt) because their content
> is already
> ++      // omitted from the output.
> ++      switch s {
> ++      case stateJSDqStr, stateJSSqStr, stateJSBqStr, stateJSRegexp:
> ++              return true
> ++      }
> ++      return false
> ++}
> ++
> + // delim is the delimiter that will end the current HTML attribute.
> + type delim uint8
> +
> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> +index ad2ec69..de8cf6f 100644
> +--- a/src/html/template/escape.go
> ++++ b/src/html/template/escape.go
> +@@ -10,6 +10,7 @@ import (
> +       "html"
> +       "internal/godebug"
> +       "io"
> ++      "regexp"
> +       "text/template"
> +       "text/template/parse"
> + )
> +@@ -650,6 +651,26 @@ var delimEnds =3D [...]string{
> +       delimSpaceOrTagEnd: " \t\n\f\r>",
> + }
> +
> ++var (
> ++      // Per WHATWG HTML specification, section 4.12.1.3, there are
> extremely
> ++      // complicated rules for how to handle the set of opening tags
> <!--,
> ++      // <script, and </script when they appear in JS literals (i.e.
> strings,
> ++      // regexs, and comments). The specification suggests a simple
> solution,
> ++      // rather than implementing the arcane ABNF, which involves simpl=
y
> escaping
> ++      // the opening bracket with \x3C. We use the below regex for this=
,
> since it
> ++      // makes doing the case-insensitive find-replace much simpler.
> ++      specialScriptTagRE          =3D
> regexp.MustCompile("(?i)<(script|/script|!--)")
> ++      specialScriptTagReplacement =3D []byte("\\x3C$1")
> ++)
> ++
> ++func containsSpecialScriptTag(s []byte) bool {
> ++      return specialScriptTagRE.Match(s)
> ++}
> ++
> ++func escapeSpecialScriptTags(s []byte) []byte {
> ++      return specialScriptTagRE.ReplaceAll(s,
> specialScriptTagReplacement)
> ++}
> ++
> + var doctypeBytes =3D []byte("<!DOCTYPE")
> +
> + // escapeText escapes a text template node.
> +@@ -708,6 +729,11 @@ func (e *escaper) escapeText(c context, n
> *parse.TextNode) context {
> +                       b.Write(s[written:cs])
> +                       written =3D i1
> +               }
> ++              if isInScriptLiteral(c.state) &&
> containsSpecialScriptTag(s[i:i1]) {
> ++                      b.Write(s[written:i])
> ++                      b.Write(escapeSpecialScriptTags(s[i:i1]))
> ++                      written =3D i1
> ++              }
> +               if i =3D=3D i1 && c.state =3D=3D c1.state {
> +                       panic(fmt.Sprintf("infinite loop from %v to %v on
> %q..%q", c, c1, s[:i], s[i:]))
> +               }
> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> +index 5f41e52..0cacb20 100644
> +--- a/src/html/template/escape_test.go
> ++++ b/src/html/template/escape_test.go
> +@@ -513,6 +513,21 @@ func TestEscape(t *testing.T) {
> +                       "<script>#! beep\n</script>",
> +                       "<script>\n</script>",
> +               },
> ++              {
> ++                      "Special tags in <script> string literals",
> ++                      `<script>var a =3D "asd < 123 <!-- 456 < fgh <scr=
ipt
> jkl < 789 </script"</script>`,
> ++                      `<script>var a =3D "asd < 123 \x3C!-- 456 < fgh
> \x3Cscript jkl < 789 \x3C/script"</script>`,
> ++              },
> ++              {
> ++                      "Special tags in <script> string literals (mixed
> case)",
> ++                      `<script>var a =3D "<!-- <ScripT </ScripT"</scrip=
t>`,
> ++                      `<script>var a =3D "\x3C!-- \x3CScripT
> \x3C/ScripT"</script>`,
> ++              },
> ++              {
> ++                      "Special tags in <script> regex literals (mixed
> case)",
> ++                      `<script>var a =3D /<!-- <ScripT </ScripT/</scrip=
t>`,
> ++                      `<script>var a =3D /\x3C!-- \x3CScripT
> \x3C/ScripT/</script>`,
> ++              },
> +               {
> +                       "CSS comments",
> +                       "<style>p// paragraph\n" +
> +@@ -1501,8 +1516,38 @@ func TestEscapeText(t *testing.T) {
> +                       context{state: stateJS, element: elementScript},
> +               },
> +               {
> ++                      // <script and </script tags are escaped, so
> </script> should not
> ++                      // cause us to exit the JS state.
> +
>  `<script>document.write("<script>alert(1)</script>");`,
> +-                      context{state: stateText},
> ++                      context{state: stateJS, element: elementScript},
> ++              },
> ++              {
> ++                      `<script>document.write("<script>`,
> ++                      context{state: stateJSDqStr, element:
> elementScript},
> ++              },
> ++              {
> ++
> `<script>document.write("<script>alert(1)</script>`,
> ++                      context{state: stateJSDqStr, element:
> elementScript},
> ++              },
> ++              {
> ++                      `<script>document.write("<script>alert(1)<!--`,
> ++                      context{state: stateJSDqStr, element:
> elementScript},
> ++              },
> ++              {
> ++
> `<script>document.write("<script>alert(1)</Script>");`,
> ++                      context{state: stateJS, element: elementScript},
> ++              },
> ++              {
> ++                      `<script>document.write("<!--");`,
> ++                      context{state: stateJS, element: elementScript},
> ++              },
> ++              {
> ++                      `<script>let a =3D /</script`,
> ++                      context{state: stateJSRegexp, element:
> elementScript},
> ++              },
> ++              {
> ++                      `<script>let a =3D /</script/`,
> ++                      context{state: stateJS, element: elementScript,
> jsCtx: jsCtxDivOp},
> +               },
> +               {
> +                       `<script type=3D"text/template">`,
> +diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> +index 12aa4c4..3d2a37c 100644
> +--- a/src/html/template/transition.go
> ++++ b/src/html/template/transition.go
> +@@ -214,6 +214,11 @@ var (
> + // element states.
> + func tSpecialTagEnd(c context, s []byte) (context, int) {
> +       if c.element !=3D elementNone {
> ++              // script end tags ("</script") within script literals ar=
e
> ignored, so that
> ++              // we can properly escape them.
> ++              if c.element =3D=3D elementScript &&
> (isInScriptLiteral(c.state) || isComment(c.state)) {
> ++                      return c, len(s)
> ++              }
> +               if i :=3D indexTagEnd(s, specialTagEndMarkers[c.element])=
; i
> !=3D -1 {
> +                       return context{}, i
> +               }
> +@@ -353,6 +358,16 @@ func tJSDelimited(c context, s []byte) (context,
> int) {
> +                       inCharset =3D true
> +               case ']':
> +                       inCharset =3D false
> ++              case '/':
> ++                      // If "</script" appears in a regex literal, the
> '/' should not
> ++                      // close the regex literal, and it will later be
> escaped to
> ++                      // "\x3C/script" in escapeText.
> ++                      if i > 0 && i+7 <=3D len(s) &&
> bytes.Compare(bytes.ToLower(s[i-1:i+7]), []byte("</script")) =3D=3D 0 {
> ++                              i++
> ++                      } else if !inCharset {
> ++                              c.state, c.jsCtx =3D stateJS, jsCtxDivOp
> ++                              return c, i + 1
> ++                      }
> +               default:
> +                       // end delimiter
> +                       if !inCharset {
> +--
> +2.24.4
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188215):
> https://lists.openembedded.org/g/openembedded-core/message/188215
> Mute This Topic: https://lists.openembedded.org/mt/101589537/7032091
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skulkarni@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005e970906068082c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Steve,<div><br></div><div>Is there any update on t=
his?<br></div><div><br></div><div>Thanks,</div><div>Shubham Kulkarni</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Sep 26, 2023 at 9:38=E2=80=AFAM Siddharth via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;sdoshi=3D<a href=3D"mail=
to:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" target=3D"_blank=
">sdoshi@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from [<a href=3D"https://github.com/golang/go/com=
mit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2=
f99401b4c</a>]<br>
CVE: CVE-2023-39318<br>
Upstream-Status: Backport from [<a href=3D"https://github.com/golang/go/com=
mit/2070531d2f53df88e312edace6c8dfc9686ab2f5" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc=
9686ab2f5</a>]<br>
CVE: CVE-2023-39319<br>
Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../go/go-1.14/CVE-2023-39318.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 238 ++++++++++++++++++<br>
=C2=A0.../go/go-1.14/CVE-2023-39319.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 230 +++++++++++++++++<br>
=C2=A03 files changed, 470 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39318.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39319.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/g=
o/go-1.14.inc<br>
index 20377e095b..9fc5eb130f 100644<br>
--- a/meta/recipes-devtools/go/go-1.14.inc<br>
+++ b/meta/recipes-devtools/go/go-1.14.inc<br>
@@ -70,6 +70,8 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29400.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29406.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29409.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-39318.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-39319.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-glibc-dyna=
mic-linker-with-musl.patch&quot;<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
new file mode 100644<br>
index 0000000000..20e70c0485<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
@@ -0,0 +1,238 @@<br>
+From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00 2001<br>
+From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com" target=
=3D"_blank">bracewell@google.com</a>&gt;<br>
+Date: Thu, 3 Aug 2023 12:24:13 -0700<br>
+Subject: [PATCH] [release-branch.go1.20] html/template: support HTML-like<=
br>
+ comments in script contexts<br>
+<br>
+Per Appendix B.1.1 of the ECMAScript specification, support HTML-like<br>
+comments in script contexts. Also per section 12.5, support hashbang<br>
+comments. This brings our parsing in-line with how browsers treat these<br=
>
+comment types.<br>
+<br>
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for<br>
+reporting this issue.<br>
+<br>
+Fixes #62196<br>
+Fixes #62395<br>
+Fixes CVE-2023-39318<br>
+<br>
+Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1976593+Run-TryBot" rel=3D"noreferrer" target=3D"_blank">https:=
//team-review.git.corp.google.com/c/golang/go-private/+/1976593<br>
+Run-TryBot</a>: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.co=
m" target=3D"_blank">bracewell@google.com</a>&gt;<br>
+Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@google.c=
om" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
+Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D=
"_blank">dneil@google.com</a>&gt;<br>
+Reviewed-by: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/2014620+Reviewed-on" rel=3D"noreferrer" target=3D"_blank">https=
://team-review.git.corp.google.com/c/golang/go-private/+/2014620<br>
+Reviewed-on</a>: <a href=3D"https://go-review.googlesource.com/c/go/+/5260=
98" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com=
/c/go/+/526098</a><br>
+Run-TryBot: Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com" target=
=3D"_blank">cherryyz@google.com</a>&gt;<br>
+TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport from [<a href=3D"https://github.com/golang/go/co=
mmit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff=
2f99401b4c</a>]<br>
+CVE: CVE-2023-39318<br>
+Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" ta=
rget=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
+---<br>
+ src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++-<br>
+ src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +-<br>
+ src/html/template/escape_test.go=C2=A0 | 10 ++++<br>
+ src/html/template/state_string.go |=C2=A0 4 +-<br>
+ src/html/template/transition.go=C2=A0 =C2=A0| 80 ++++++++++++++++++++----=
-------<br>
+ 5 files changed, 72 insertions(+), 33 deletions(-)<br>
+<br>
+diff --git a/src/html/template/context.go b/src/html/template/context.go<b=
r>
+index 0b65313..4eb7891 100644<br>
+--- a/src/html/template/context.go<br>
++++ b/src/html/template/context.go<br>
+@@ -124,6 +124,10 @@ const (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSBlockCmt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateJSLineCmt occurs inside a JavaScript //=
 line comment.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSLineCmt<br>
++=C2=A0 =C2=A0 =C2=A0 // stateJSHTMLOpenCmt occurs inside a JavaScript &lt=
;!-- HTML-like comment.<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLOpenCmt<br>
++=C2=A0 =C2=A0 =C2=A0 // stateJSHTMLCloseCmt occurs inside a JavaScript --=
&gt; HTML-like comment.<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLCloseCmt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateCSS occurs inside a &lt;style&gt; eleme=
nt or style attribute.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stateCSS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateCSSDqStr occurs inside a CSS double quo=
ted string.<br>
+@@ -149,7 +153,7 @@ const (<br>
+ // authors &amp; maintainers, not for end-users or machines.<br>
+ func isComment(s state) bool {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch s {<br>
+-=C2=A0 =C2=A0 =C2=A0 case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, =
stateCSSBlockCmt, stateCSSLineCmt:<br>
++=C2=A0 =C2=A0 =C2=A0 case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, =
stateJSHTMLOpenCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCSSLineCmt:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false<br>
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go<br>
+index 435f912..ad2ec69 100644<br>
+--- a/src/html/template/escape.go<br>
++++ b/src/html/template/escape.go<br>
+@@ -698,9 +698,12 @@ func (e *escaper) escapeText(c context, n *parse.Text=
Node) context {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if c.state !=3D c1.=
state &amp;&amp; isComment(c1.state) &amp;&amp; c1.delim =3D=3D delimNone {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// Preserve the portion between written and the comment start.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cs :=3D i1 - 2<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if c1.state =3D=3D stateHTMLCmt {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if c1.state =3D=3D stateHTMLCmt || c1.state =3D=3D stateJSHTMLOpenCmt {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// &quot;&lt;!--&quot; instead of &qu=
ot;/*&quot; or &quot;//&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs -=3D 2<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if c1.state =3D=3D stateJSHTMLCloseCmt {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;--&gt;&quot; instead of &quot;/*&q=
uot; or &quot;//&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs -=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0b.Write(s[written:cs])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0written =3D i1<br>
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_t=
est.go<br>
+index f550691..5f41e52 100644<br>
+--- a/src/html/template/escape_test.go<br>
++++ b/src/html/template/escape_test.go<br>
+@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&lt;script&gt;var a/*b*///c\nd&lt;/script&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&lt;script&gt;var a \nd&lt;/script&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;JS HTML-like comments&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;&lt;script&gt;before &lt;!-- beep\nbetween\nbefore--&gt;boop\n&lt=
;/script&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;&lt;script&gt;before \nbetween\nbefore\n&lt;/script&gt;&quot;,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;JS hashbang comment&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;&lt;script&gt;#! beep\n&lt;/script&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;&lt;script&gt;\n&lt;/script&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;CSS comments&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&lt;style&gt;p// paragraph\n&quot; +<br>
+diff --git a/src/html/template/state_string.go b/src/html/template/state_s=
tring.go<br>
+index 05104be..b5cfe70 100644<br>
+--- a/src/html/template/state_string.go<br>
++++ b/src/html/template/state_string.go<br>
+@@ -4,9 +4,9 @@ package template<br>
+ <br>
+ import &quot;strconv&quot;<br>
+ <br>
+-const _state_name =3D &quot;stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSsta=
teCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCm=
tstateCSSLineCmtstateError&quot;<br>
++const _state_name =3D &quot;stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCm=
tstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrsta=
teCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError=
stateDead&quot;<br>
+ <br>
+-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 1=
11, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286, 2=
96}<br>
++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 1=
11, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293, 3=
04, 320, 335, 345, 354}<br>
+ <br>
+ func (i state) String() string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if i &gt;=3D state(len(_state_index)-1) {<br>
+diff --git a/src/html/template/transition.go b/src/html/template/transitio=
n.go<br>
+index 92eb351..12aa4c4 100644<br>
+--- a/src/html/template/transition.go<br>
++++ b/src/html/template/transition.go<br>
+@@ -14,32 +14,34 @@ import (<br>
+ // the updated context and the number of bytes consumed from the front of=
 the<br>
+ // input.<br>
+ var transitionFunc =3D [...]func(context, []byte) (context, int){<br>
+-=C2=A0 =C2=A0 =C2=A0 stateText:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tText,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateTag:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tTag,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateAttrName:=C2=A0 =C2=A0 tAttrName,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateAfterName:=C2=A0 =C2=A0tAfterName,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateBeforeValue: tBeforeValue,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateHTMLCmt:=C2=A0 =C2=A0 =C2=A0tHTMLCmt,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateRCDATA:=C2=A0 =C2=A0 =C2=A0 tSpecialTagEnd,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateAttr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tAttr,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tURL,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateSrcset:=C2=A0 =C2=A0 =C2=A0 tURL,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tJS,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJSDqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimited,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJSSqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimited,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJSBqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimited,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJSRegexp:=C2=A0 =C2=A0 tJSDelimited,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJSBlockCmt:=C2=A0 tBlockCmt,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateJSLineCmt:=C2=A0 =C2=A0tLineCmt,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tCSS,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSDqStr:=C2=A0 =C2=A0 tCSSStr,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSSqStr:=C2=A0 =C2=A0 tCSSStr,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSDqURL:=C2=A0 =C2=A0 tCSSStr,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSSqURL:=C2=A0 =C2=A0 tCSSStr,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSURL:=C2=A0 =C2=A0 =C2=A0 tCSSStr,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSBlockCmt: tBlockCmt,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateCSSLineCmt:=C2=A0 tLineCmt,<br>
+-=C2=A0 =C2=A0 =C2=A0 stateError:=C2=A0 =C2=A0 =C2=A0 =C2=A0tError,<br>
++=C2=A0 =C2=A0 =C2=A0 stateText:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
Text,<br>
++=C2=A0 =C2=A0 =C2=A0 stateTag:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
Tag,<br>
++=C2=A0 =C2=A0 =C2=A0 stateAttrName:=C2=A0 =C2=A0 =C2=A0 =C2=A0tAttrName,<=
br>
++=C2=A0 =C2=A0 =C2=A0 stateAfterName:=C2=A0 =C2=A0 =C2=A0 tAfterName,<br>
++=C2=A0 =C2=A0 =C2=A0 stateBeforeValue:=C2=A0 =C2=A0 tBeforeValue,<br>
++=C2=A0 =C2=A0 =C2=A0 stateHTMLCmt:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tHTMLCmt,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 stateRCDATA:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tSpeci=
alTagEnd,<br>
++=C2=A0 =C2=A0 =C2=A0 stateAttr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
Attr,<br>
++=C2=A0 =C2=A0 =C2=A0 stateURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
URL,<br>
++=C2=A0 =C2=A0 =C2=A0 stateSrcset:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tURL,<=
br>
++=C2=A0 =C2=A0 =C2=A0 stateJS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tJS,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSDqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tJSDelimite=
d,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSSqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tJSDelimite=
d,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSBqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0 tJSDelimite=
d,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSRegexp:=C2=A0 =C2=A0 =C2=A0 =C2=A0tJSDelimite=
d,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSBlockCmt:=C2=A0 =C2=A0 =C2=A0tBlockCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSLineCmt:=C2=A0 =C2=A0 =C2=A0 tLineCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLOpenCmt:=C2=A0 tLineCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 stateJSHTMLCloseCmt: tLineCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 stateCSS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
CSS,<br>
++=C2=A0 =C2=A0 =C2=A0 stateCSSDqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0tCSSStr,<br=
>
++=C2=A0 =C2=A0 =C2=A0 stateCSSSqStr:=C2=A0 =C2=A0 =C2=A0 =C2=A0tCSSStr,<br=
>
++=C2=A0 =C2=A0 =C2=A0 stateCSSDqURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0tCSSStr,<br=
>
++=C2=A0 =C2=A0 =C2=A0 stateCSSSqURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0tCSSStr,<br=
>
++=C2=A0 =C2=A0 =C2=A0 stateCSSURL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tCSSSt=
r,<br>
++=C2=A0 =C2=A0 =C2=A0 stateCSSBlockCmt:=C2=A0 =C2=A0 tBlockCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 stateCSSLineCmt:=C2=A0 =C2=A0 =C2=A0tLineCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 stateError:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tError=
,<br>
+ }<br>
+ <br>
+ var commentStart =3D []byte(&quot;&lt;!--&quot;)<br>
+@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int) {<br>
+ <br>
+ // tJS is the context transition function for the JS state.<br>
+ func tJS(c context, s []byte) (context, int) {<br>
+-=C2=A0 =C2=A0 =C2=A0 i :=3D bytes.IndexAny(s, &quot;\&quot;`&#39;/&quot;)=
<br>
++=C2=A0 =C2=A0 =C2=A0 i :=3D bytes.IndexAny(s, &quot;\&quot;`&#39;/&lt;-#&=
quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if i =3D=3D -1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Entire input is =
non string, comment, regexp tokens.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.jsCtx =3D nextJSC=
tx(s, c.jsCtx)<br>
+@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err:=C2=A0 =C2=A0errorf(ErrSlashAmbig=
, nil, 0, &quot;&#39;/&#39; could start a division or regexp: %.32q&quot;, =
s[i:]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}, len(s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 // ECMAScript supports HTML style comments for legac=
y reasons, see Appendix<br>
++=C2=A0 =C2=A0 =C2=A0 // B.1.1 &quot;HTML-like Comments&quot;. The handlin=
g of these comments is somewhat<br>
++=C2=A0 =C2=A0 =C2=A0 // confusing. Multi-line comments are not supported,=
 i.e. anything on lines<br>
++=C2=A0 =C2=A0 =C2=A0 // between the opening and closing tokens is not con=
sidered a comment, but<br>
++=C2=A0 =C2=A0 =C2=A0 // anything following the opening or closing token, =
on the same line, is<br>
++=C2=A0 =C2=A0 =C2=A0 // ignored. As such we simply treat any line prefixe=
d with &quot;&lt;!--&quot; or &quot;--&gt;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 // as if it were actually prefixed with &quot;//&quo=
t; and move on.<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;&lt;&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i+3 &lt; len(s) &amp;=
&amp; bytes.Equal(commentStart, s[i:i+4]) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c.state, i =3D stateJSHTMLOpenCmt, i+3<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;-&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i+2 &lt; len(s) &amp;=
&amp; bytes.Equal(commentEnd, s[i:i+3]) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c.state, i =3D stateJSHTMLCloseCmt, i+2<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 // ECMAScript also supports &quot;hashbang&quot; com=
ment lines, see Section 12.5.<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;#&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i+1 &lt; len(s) &amp;=
&amp; s[i+1] =3D=3D &#39;!&#39; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 c.state, i =3D stateJSLineCmt, i+1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic(&quot;unreach=
able&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (context, int) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return c, i + 2<br>
+ }<br>
+ <br>
+-// tLineCmt is the context transition function for //comment states.<br>
++// tLineCmt is the context transition function for //comment states, and =
the JS HTML-like comment state.<br>
+ func tLineCmt(c context, s []byte) (context, int) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var lineTerminators string<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var endState state<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch c.state {<br>
+-=C2=A0 =C2=A0 =C2=A0 case stateJSLineCmt:<br>
++=C2=A0 =C2=A0 =C2=A0 case stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTML=
CloseCmt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineTerminators, en=
dState =3D &quot;\n\r\u2028\u2029&quot;, stateJS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateCSSLineCmt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lineTerminators, en=
dState =3D &quot;\n\f\r&quot;, stateCSS<br>
+-- <br>
+2.24.4<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2023-39319.patch<br>
new file mode 100644<br>
index 0000000000..69106e3e05<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch<br>
@@ -0,0 +1,230 @@<br>
+From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 2001<br>
+From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com" target=
=3D"_blank">bracewell@google.com</a>&gt;<br>
+Date: Thu, 3 Aug 2023 12:28:28 -0700<br>
+Subject: [PATCH] [release-branch.go1.20] html/template: properly handle<br=
>
+ special tags within the script context<br>
+<br>
+The HTML specification has incredibly complex rules for how to handle<br>
+&quot;&lt;!--&quot;, &quot;&lt;script&quot;, and &quot;&lt;/script&quot; w=
hen they appear within literals in<br>
+the script context. Rather than attempting to apply these restrictions<br>
+(which require a significantly more complex state machine) we apply<br>
+the workaround suggested in section 4.12.1.3 of the HTML specification [1]=
.<br>
+<br>
+More precisely, when &quot;&lt;!--&quot;, &quot;&lt;script&quot;, and &quo=
t;&lt;/script&quot; appear within<br>
+literals (strings and regular expressions, ignoring comments since we<br>
+already elide their content) we replace the &quot;&lt;&quot; with &quot;\x=
3C&quot;. This avoids<br>
+the unintuitive behavior that using these tags within literals can cause,<=
br>
+by simply preventing the rendered content from triggering it. This may<br>
+break some correct usages of these tags, but on balance is more likely<br>
+to prevent XSS attacks where users are unknowingly either closing or not<b=
r>
+closing the script blocks where they think they are.<br>
+<br>
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for<br>
+reporting this issue.<br>
+<br>
+Fixes #62197<br>
+Fixes #62397<br>
+Fixes CVE-2023-39319<br>
+<br>
+[1] <a href=3D"https://html.spec.whatwg.org/#restrictions-for-contents-of-=
script-elements" rel=3D"noreferrer" target=3D"_blank">https://html.spec.wha=
twg.org/#restrictions-for-contents-of-script-elements</a><br>
+<br>
+Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/1976594+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https=
://team-review.git.corp.google.com/c/golang/go-private/+/1976594<br>
+Reviewed-by</a>: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.co=
m" target=3D"_blank">dmitshur@google.com</a>&gt;<br>
+Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@google.c=
om" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
+Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D=
"_blank">dneil@google.com</a>&gt;<br>
+Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.com" t=
arget=3D"_blank">bracewell@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/2014621+TryBot-Result" rel=3D"noreferrer" target=3D"_blank">htt=
ps://team-review.git.corp.google.com/c/golang/go-private/+/2014621<br>
+TryBot-Result</a>: Security TryBots &lt;<a href=3D"mailto:security-trybots=
@go-security-trybots.iam.gserviceaccount.com" target=3D"_blank">security-tr=
ybots@go-security-trybots.iam.gserviceaccount.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/526099" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/526099</a><br>
+TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
+Run-TryBot: Cherry Mui &lt;<a href=3D"mailto:cherryyz@google.com" target=
=3D"_blank">cherryyz@google.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport from [<a href=3D"https://github.com/golang/go/co=
mmit/2070531d2f53df88e312edace6c8dfc9686ab2f5" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8df=
c9686ab2f5</a>]<br>
+CVE: CVE-2023-39319<br>
+Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" ta=
rget=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
+---<br>
+ src/html/template/context.go=C2=A0 =C2=A0 =C2=A0| 14 ++++++++++<br>
+ src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++++<b=
r>
+ src/html/template/escape_test.go | 47 +++++++++++++++++++++++++++++++-<br=
>
+ src/html/template/transition.go=C2=A0 | 15 ++++++++++<br>
+ 4 files changed, 101 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/html/template/context.go b/src/html/template/context.go<b=
r>
+index 4eb7891..feb6517 100644<br>
+--- a/src/html/template/context.go<br>
++++ b/src/html/template/context.go<br>
+@@ -168,6 +168,20 @@ func isInTag(s state) bool {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false<br>
+ }<br>
+ <br>
++// isInScriptLiteral returns true if s is one of the literal states withi=
n a<br>
++// &lt;script&gt; tag, and as such occurances of &quot;&lt;!--&quot;, &qu=
ot;&lt;script&quot;, and &quot;&lt;/script&quot;<br>
++// need to be treated specially.<br>
++func isInScriptLiteral(s state) bool {<br>
++=C2=A0 =C2=A0 =C2=A0 // Ignore the comment states (stateJSBlockCmt, state=
JSLineCmt,<br>
++=C2=A0 =C2=A0 =C2=A0 // stateJSHTMLOpenCmt, stateJSHTMLCloseCmt) because =
their content is already<br>
++=C2=A0 =C2=A0 =C2=A0 // omitted from the output.<br>
++=C2=A0 =C2=A0 =C2=A0 switch s {<br>
++=C2=A0 =C2=A0 =C2=A0 case stateJSDqStr, stateJSSqStr, stateJSBqStr, state=
JSRegexp:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return false<br>
++}<br>
++<br>
+ // delim is the delimiter that will end the current HTML attribute.<br>
+ type delim uint8<br>
+ <br>
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go<br>
+index ad2ec69..de8cf6f 100644<br>
+--- a/src/html/template/escape.go<br>
++++ b/src/html/template/escape.go<br>
+@@ -10,6 +10,7 @@ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;html&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;internal/godebug&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;regexp&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;text/template&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;text/template/parse&quot;<br>
+ )<br>
+@@ -650,6 +651,26 @@ var delimEnds =3D [...]string{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0delimSpaceOrTagEnd: &quot; \t\n\f\r&gt;&quot;,<=
br>
+ }<br>
+ <br>
++var (<br>
++=C2=A0 =C2=A0 =C2=A0 // Per WHATWG HTML specification, section 4.12.1.3, =
there are extremely<br>
++=C2=A0 =C2=A0 =C2=A0 // complicated rules for how to handle the set of op=
ening tags &lt;!--,<br>
++=C2=A0 =C2=A0 =C2=A0 // &lt;script, and &lt;/script when they appear in J=
S literals (i.e. strings,<br>
++=C2=A0 =C2=A0 =C2=A0 // regexs, and comments). The specification suggests=
 a simple solution,<br>
++=C2=A0 =C2=A0 =C2=A0 // rather than implementing the arcane ABNF, which i=
nvolves simply escaping<br>
++=C2=A0 =C2=A0 =C2=A0 // the opening bracket with \x3C. We use the below r=
egex for this, since it<br>
++=C2=A0 =C2=A0 =C2=A0 // makes doing the case-insensitive find-replace muc=
h simpler.<br>
++=C2=A0 =C2=A0 =C2=A0 specialScriptTagRE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D regexp.MustCompile(&quot;(?i)&lt;(script|/script|!--)&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 specialScriptTagReplacement =3D []byte(&quot;\\x3C$1=
&quot;)<br>
++)<br>
++<br>
++func containsSpecialScriptTag(s []byte) bool {<br>
++=C2=A0 =C2=A0 =C2=A0 return specialScriptTagRE.Match(s)<br>
++}<br>
++<br>
++func escapeSpecialScriptTags(s []byte) []byte {<br>
++=C2=A0 =C2=A0 =C2=A0 return specialScriptTagRE.ReplaceAll(s, specialScrip=
tTagReplacement)<br>
++}<br>
++<br>
+ var doctypeBytes =3D []byte(&quot;&lt;!DOCTYPE&quot;)<br>
+ <br>
+ // escapeText escapes a text template node.<br>
+@@ -708,6 +729,11 @@ func (e *escaper) escapeText(c context, n *parse.Text=
Node) context {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0b.Write(s[written:cs])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0written =3D i1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isInScriptLiteral(c.s=
tate) &amp;&amp; containsSpecialScriptTag(s[i:i1]) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 b.Write(s[written:i])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 b.Write(escapeSpecialScriptTags(s[i:i1]))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 written =3D i1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i =3D=3D i1 &amp=
;&amp; c.state =3D=3D c1.state {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0panic(fmt.Sprintf(&quot;infinite loop from %v to %v on %q..%q&quo=
t;, c, c1, s[:i], s[i:]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_t=
est.go<br>
+index 5f41e52..0cacb20 100644<br>
+--- a/src/html/template/escape_test.go<br>
++++ b/src/html/template/escape_test.go<br>
+@@ -513,6 +513,21 @@ func TestEscape(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&lt;script&gt;#! beep\n&lt;/script&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&lt;script&gt;\n&lt;/script&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Special tags in &lt;script&gt; string literals&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;var a =3D &quot;asd &lt; 123 &lt;!-- 456 &lt; fgh &lt;sc=
ript jkl &lt; 789 &lt;/script&quot;&lt;/script&gt;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;var a =3D &quot;asd &lt; 123 \x3C!-- 456 &lt; fgh \x3Csc=
ript jkl &lt; 789 \x3C/script&quot;&lt;/script&gt;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Special tags in &lt;script&gt; string literals (mixed case)&quot;=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;var a =3D &quot;&lt;!-- &lt;ScripT &lt;/ScripT&quot;&lt;=
/script&gt;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;var a =3D &quot;\x3C!-- \x3CScripT \x3C/ScripT&quot;&lt;=
/script&gt;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Special tags in &lt;script&gt; regex literals (mixed case)&quot;,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;var a =3D /&lt;!-- &lt;ScripT &lt;/ScripT/&lt;/script&gt=
;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;var a =3D /\x3C!-- \x3CScripT \x3C/ScripT/&lt;/script&gt=
;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;CSS comments&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&lt;style&gt;p// paragraph\n&quot; +<br>
+@@ -1501,8 +1516,38 @@ func TestEscapeText(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0context{state: stateJS, element: elementScript},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // &lt;script and &lt;/script tags are escaped, so &lt;/script&gt; shou=
ld not<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // cause us to exit the JS state.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0`&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt;/sc=
ript&gt;&quot;);`,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateText},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJS, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJSDqStr, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt;/script&g=
t;`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJSDqStr, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt;!--`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJSDqStr, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;document.write(&quot;&lt;script&gt;alert(1)&lt;/Script&g=
t;&quot;);`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJS, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;document.write(&quot;&lt;!--&quot;);`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJS, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;let a =3D /&lt;/script`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJSRegexp, element: elementScript},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 `&lt;script&gt;let a =3D /&lt;/script/`,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 context{state: stateJS, element: elementScript, jsCtx: jsCtxDivOp},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0`&lt;script type=3D&quot;text/template&quot;&gt;`,<br>
+diff --git a/src/html/template/transition.go b/src/html/template/transitio=
n.go<br>
+index 12aa4c4..3d2a37c 100644<br>
+--- a/src/html/template/transition.go<br>
++++ b/src/html/template/transition.go<br>
+@@ -214,6 +214,11 @@ var (<br>
+ // element states.<br>
+ func tSpecialTagEnd(c context, s []byte) (context, int) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if c.element !=3D elementNone {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // script end tags (&quo=
t;&lt;/script&quot;) within script literals are ignored, so that<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // we can properly escap=
e them.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c.element =3D=3D elem=
entScript &amp;&amp; (isInScriptLiteral(c.state) || isComment(c.state)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return c, len(s)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if i :=3D indexTagE=
nd(s, specialTagEndMarkers[c.element]); i !=3D -1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return context{}, i<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -353,6 +358,16 @@ func tJSDelimited(c context, s []byte) (context, int)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0inCharset =3D true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;]&#39;:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0inCharset =3D false<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case &#39;/&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // If &quot;&lt;/script&quot; appears in a regex literal, the &#39;/&#3=
9; should not<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // close the regex literal, and it will later be escaped to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // &quot;\x3C/script&quot; in escapeText.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if i &gt; 0 &amp;&amp; i+7 &lt;=3D len(s) &amp;&amp; bytes.Compare(byte=
s.ToLower(s[i-1:i+7]), []byte(&quot;&lt;/script&quot;)) =3D=3D 0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else if !inCharset {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.state, c.jsCtx =3D stateJS, jsCtxDivOp<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return c, i + 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// end delimiter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if !inCharset {<br>
+-- <br>
+2.24.4<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188215): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188215" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188215</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101589537/703=
2091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101589537/7032091</a><br>
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

--0000000000005e970906068082c5--

