Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175BBC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 14:48:23 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.23162.1713538100612615355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 07:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LBzdS+cv;
 spf=pass (domain: mvista.com, ip: 209.85.208.175, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso27820421fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1713538098; x=1714142898; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D7T4CSTFgv1KysaqHqT7UsiZiqFiRLRjEolqQB3ECMo=;
        b=LBzdS+cvTCDdRQJ5C0V5NP4A3uNsYtjbOGPNWP8qTxHxyGT6CO4IYxocAJ7a+MxnC6
         V/+0TU62BxIdsjThLBM7ojvXXZQ9emi/yTpeIz/RDoauzw3ciYq6hwQVtECrSslPU2zg
         86YI1UFkAx+/scB8R8tSnhQOlTYVPTCpYGhVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538098; x=1714142898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7T4CSTFgv1KysaqHqT7UsiZiqFiRLRjEolqQB3ECMo=;
        b=LTcu1nGF3rkqlPdhpNjVjt4pLVf8tTFWJqqoUoPdEFE/x2ZrJNC9zp+I3Ic82VEwPm
         H04TAxR945rHGNvvg/vS8PLMN6wWyLLIqNPTAGkpg0H3VZUIG5cHYcNPvlR9VKfSqhKF
         tJ1Z0mU5xlJyWTUEp9wiBT+gmp6shq56yrtUhhyRlXC+wtTypeqD3iZ21f/TNXYyJv1j
         zUjXqwaU0Z8DJT0zofAWNrNYP2M96zQz76AqO5lr18M3V2M3d9C67vnxdJdXLqUxQCjP
         ZxLFafKhwq7BBhgEGMvXw0wN0zc7kMNuhMxLVL4sBzeVxEZD/vZ78so3prRxiuT5Mzoa
         r35w==
X-Gm-Message-State: AOJu0Yypu3i5Dhqfyfn4b7TWwjAwoNNu8yT44d0dm6y+89lY9EoZ1mLj
	2Cdaf2BbJy8b4W1xJuwAq34Y1MBwNcTSle7mw2wNcyGDFoCw7sf0cpTPxd9jxZ83wFpEu0vhX/K
	AxAWT0s/Y6RrVGt70+tAq0/XHecPq8vajOZvKLg==
X-Google-Smtp-Source: AGHT+IFKnbU2qOYM96mGk9+t4JTrQm5OaZzHXWBahWeXiMSrJa2weMSJX0yVmSeOFibsYyjaU9Zn0o96x2/eX51NrZQ=
X-Received: by 2002:a2e:9bc7:0:b0:2dc:d32d:81e2 with SMTP id
 w7-20020a2e9bc7000000b002dcd32d81e2mr1823941ljj.27.1713538098326; Fri, 19 Apr
 2024 07:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240419132224.2631349-1-soumya.sambu@windriver.com>
In-Reply-To: <20240419132224.2631349-1-soumya.sambu@windriver.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 19 Apr 2024 20:18:06 +0530
Message-ID: <CANQUz1-=gmyYaQscOamYYw-K1MaXYAJbg6OEH9QCp5wwzxTALg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2023-45288
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a9064f0616742df5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 14:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198554

--000000000000a9064f0616742df5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Soumya,

I've already sent patch for the Kirkstone branch.

https://lists.openembedded.org/g/openembedded-core/message/198495

Thanks & Regards,
Vijay


On Fri, Apr 19, 2024 at 6:52=E2=80=AFPM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> An attacker may cause an HTTP/2 endpoint to read arbitrary amounts of
> header data by sending an excessive number of CONTINUATION frames.
> Maintaining HPACK state requires parsing and processing all HEADERS
> and CONTINUATION frames on a connection. When a request's headers
> exceed MaxHeaderBytes, no memory is allocated to store the excess
> headers, but they are still parsed. This permits an attacker to cause
> an HTTP/2 endpoint to read arbitrary amounts of header data, all
> associated with a request which is going to be rejected. These headers
> can include Huffman-encoded data which is significantly more expensive
> for the receiver to decode than for an attacker to send. The fix sets
> a limit on the amount of excess header frames we will process before
> closing a connection.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-45288
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |  3 +-
>  .../go/go-1.22/CVE-2023-45288.patch           | 96 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc
> b/meta/recipes-devtools/go/go-1.17.13.inc
> index 768961de2c..b5566db1fe 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -1,6 +1,6 @@
>  require go-common.inc
>
> -FILESEXTRAPATHS:prepend :=3D
> "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:${FILE_DIRNAME}/go-1.19:=
${FILE_DIRNAME}/go-1.18:"
> +FILESEXTRAPATHS:prepend :=3D
> "${FILE_DIRNAME}/go-1.22:${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:=
${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707"
>
> @@ -55,6 +55,7 @@ SRC_URI +=3D "\
>      file://CVE-2023-45290.patch \
>      file://CVE-2024-24784.patch \
>      file://CVE-2024-24785.patch \
> +    file://CVE-2023-45288.patch \
>  "
>  SRC_URI[main.sha256sum] =3D
> "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch
> b/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch
> new file mode 100644
> index 0000000000..ad84fb84d9
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch
> @@ -0,0 +1,96 @@
> +From e55d7cf8435ba4e58d4a5694e63b391821d4ee9b Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Thu, 28 Mar 2024 16:57:51 -0700
> +Subject: [PATCH] [release-branch.go1.22] net/http: update bundled
> + golang.org/x/net/http2
> +
> +Disable cmd/internal/moddeps test, since this update includes PRIVATE
> +track fixes.
> +
> +Fixes CVE-2023-45288
> +For #65051
> +Fixes #66298
> +
> +Change-Id: I5bbf774ebe7651e4bb7e55139d3794bd2b8e8fa8
> +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/2197227
> +Reviewed-by
> <https://team-review.git.corp.google.com/c/golang/go-private/+/2197227+Re=
viewed-by>:
> Tatiana Bradley <tatianabradley@google.com>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/576076
> +Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
> +TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +
> +CVE: CVE-2023-45288
> +
> +Upstream-Status: Backport [
> https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4e=
e9b
> ]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + src/cmd/internal/moddeps/moddeps_test.go |  1 +
> + src/net/http/h2_bundle.go                | 31 ++++++++++++++++++++++++
> + 2 files changed, 32 insertions(+)
> +
> +diff --git a/src/cmd/internal/moddeps/moddeps_test.go
> b/src/cmd/internal/moddeps/moddeps_test.go
> +index d48d43f..ee6d455 100644
> +--- a/src/cmd/internal/moddeps/moddeps_test.go
> ++++ b/src/cmd/internal/moddeps/moddeps_test.go
> +@@ -36,6 +36,7 @@ import (
> + func TestAllDependencies(t *testing.T) {
> +       t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from
> vendored modules")
> +       t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from
> vendored modules")
> ++      t.Skip("TODO(#65051): 1.22.2 contains unreleased changes from
> vendored modules")
> +
> +       goBin :=3D testenv.GoToolPath(t)
> +
> +diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
> +index 9d6abd8..10ff193 100644
> +--- a/src/net/http/h2_bundle.go
> ++++ b/src/net/http/h2_bundle.go
> +@@ -2842,6 +2842,7 @@ func (fr *http2Framer) readMetaFrame(hf
> *http2HeadersFrame) (*http2MetaHeadersFr
> +               if size > remainSize {
> +                       hdec.SetEmitEnabled(false)
> +                       mh.Truncated =3D true
> ++                      remainSize =3D 0
> +                       return
> +               }
> +               remainSize -=3D size
> +@@ -2854,6 +2855,36 @@ func (fr *http2Framer) readMetaFrame(hf
> *http2HeadersFrame) (*http2MetaHeadersFr
> +       var hc http2headersOrContinuation =3D hf
> +       for {
> +               frag :=3D hc.HeaderBlockFragment()
> ++
> ++              // Avoid parsing large amounts of headers that we will
> then discard.
> ++              // If the sender exceeds the max header list size by too
> much,
> ++              // skip parsing the fragment and close the connection.
> ++              //
> ++              // "Too much" is either any CONTINUATION frame after we'v=
e
> already
> ++              // exceeded the max header list size (in which case
> remainSize is 0),
> ++              // or a frame whose encoded size is more than twice the
> remaining
> ++              // header list bytes we're willing to accept.
> ++              if int64(len(frag)) > int64(2*remainSize) {
> ++                      if http2VerboseLogs {
> ++                              log.Printf("http2: header list too large"=
)
> ++                      }
> ++                      // It would be nice to send a RST_STREAM before
> sending the GOAWAY,
> ++                      // but the struture of the server's frame writer
> makes this difficult.
> ++                      return nil,
> http2ConnectionError(http2ErrCodeProtocol)
> ++              }
> ++
> ++              // Also close the connection after any CONTINUATION frame
> following an
> ++              // invalid header, since we stop tracking the size of the
> headers after
> ++              // an invalid one.
> ++              if invalid !=3D nil {
> ++                      if http2VerboseLogs {
> ++                              log.Printf("http2: invalid header: %v",
> invalid)
> ++                      }
> ++                      // It would be nice to send a RST_STREAM before
> sending the GOAWAY,
> ++                      // but the struture of the server's frame writer
> makes this difficult.
> ++                      return nil,
> http2ConnectionError(http2ErrCodeProtocol)
> ++              }
> ++
> +               if _, err :=3D hdec.Write(frag); err !=3D nil {
> +                       return nil,
> http2ConnectionError(http2ErrCodeCompression)
> +               }
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198549):
> https://lists.openembedded.org/g/openembedded-core/message/198549
> Mute This Topic: https://lists.openembedded.org/mt/105617671/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a9064f0616742df5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Soumya,</div><div><br></div><div>I&#39;ve already =
sent patch for the Kirkstone branch.<br><br><a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/198495">https://lists.openembedded.o=
rg/g/openembedded-core/message/198495</a><br><br></div><div>Thanks &amp; Re=
gards,<br></div><div>Vijay<br></div><div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 19, 2024 at =
6:52=E2=80=AFPM Soumya via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;soumya.sambu=3D<a href=3D"mailto:windriver.com@lis=
ts.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Soumya Sambu=
 &lt;<a href=3D"mailto:soumya.sambu@windriver.com" target=3D"_blank">soumya=
.sambu@windriver.com</a>&gt;<br>
<br>
An attacker may cause an HTTP/2 endpoint to read arbitrary amounts of<br>
header data by sending an excessive number of CONTINUATION frames.<br>
Maintaining HPACK state requires parsing and processing all HEADERS<br>
and CONTINUATION frames on a connection. When a request&#39;s headers<br>
exceed MaxHeaderBytes, no memory is allocated to store the excess<br>
headers, but they are still parsed. This permits an attacker to cause<br>
an HTTP/2 endpoint to read arbitrary amounts of header data, all<br>
associated with a request which is going to be rejected. These headers<br>
can include Huffman-encoded data which is significantly more expensive<br>
for the receiver to decode than for an attacker to send. The fix sets<br>
a limit on the amount of excess header frames we will process before<br>
closing a connection.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-45288" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-45288</a><b=
r>
<br>
Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.co=
m" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.17.13.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 +-<br>
=C2=A0.../go/go-1.22/CVE-2023-45288.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 96 +++++++++++++++++++<br>
=C2=A02 files changed, 98 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.22/CVE-2023-45288.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtool=
s/go/go-1.17.13.inc<br>
index 768961de2c..b5566db1fe 100644<br>
--- a/meta/recipes-devtools/go/go-1.17.13.inc<br>
+++ b/meta/recipes-devtools/go/go-1.17.13.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0require go-common.inc<br>
<br>
-FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}=
/go-1.20:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:&quot;<br>
+FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-1.22:${FILE_DIRNAME}=
/go-1.21:${FILE_DIRNAME}/go-1.20:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go=
-1.18:&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7=
b4e0dd74707&quot;<br>
<br>
@@ -55,6 +55,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-45290.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2024-24784.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2024-24785.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-45288.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;a1a48b23afb206f95e7bbaa9b898d965f90=
826f6f1d1fc0c1d784ada0cd300fd&quot;<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch b/meta/r=
ecipes-devtools/go/go-1.22/CVE-2023-45288.patch<br>
new file mode 100644<br>
index 0000000000..ad84fb84d9<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.22/CVE-2023-45288.patch<br>
@@ -0,0 +1,96 @@<br>
+From e55d7cf8435ba4e58d4a5694e63b391821d4ee9b Mon Sep 17 00:00:00 2001<br>
+From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_blank=
">dneil@google.com</a>&gt;<br>
+Date: Thu, 28 Mar 2024 16:57:51 -0700<br>
+Subject: [PATCH] [release-branch.go1.22] net/http: update bundled<br>
+ <a href=3D"http://golang.org/x/net/http2" rel=3D"noreferrer" target=3D"_b=
lank">golang.org/x/net/http2</a><br>
+<br>
+Disable cmd/internal/moddeps test, since this update includes PRIVATE<br>
+track fixes.<br>
+<br>
+Fixes CVE-2023-45288<br>
+For #65051<br>
+Fixes #66298<br>
+<br>
+Change-Id: I5bbf774ebe7651e4bb7e55139d3794bd2b8e8fa8<br>
+Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/c/golang/g=
o-private/+/2197227+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https=
://team-review.git.corp.google.com/c/golang/go-private/+/2197227<br>
+Reviewed-by</a>: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@goog=
le.com" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
+Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"=
_blank">dneil@google.com</a>&gt;<br>
+Reviewed-by: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/576076" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/576076</a><br>
+Auto-Submit: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
+TryBot-Bypass: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com"=
 target=3D"_blank">dmitshur@google.com</a>&gt;<br>
+Reviewed-by: Than McIntosh &lt;<a href=3D"mailto:thanm@google.com" target=
=3D"_blank">thanm@google.com</a>&gt;<br>
+<br>
+CVE: CVE-2023-45288<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
e55d7cf8435ba4e58d4a5694e63b391821d4ee9b" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d=
4ee9b</a>]<br>
+<br>
+Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.c=
om" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
+---<br>
+ src/cmd/internal/moddeps/moddeps_test.go |=C2=A0 1 +<br>
+ src/net/http/h2_bundle.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 31 ++++++++++++++++++++++++<br>
+ 2 files changed, 32 insertions(+)<br>
+<br>
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/m=
oddeps/moddeps_test.go<br>
+index d48d43f..ee6d455 100644<br>
+--- a/src/cmd/internal/moddeps/moddeps_test.go<br>
++++ b/src/cmd/internal/moddeps/moddeps_test.go<br>
+@@ -36,6 +36,7 @@ import (<br>
+ func TestAllDependencies(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t.Skip(&quot;TODO(#57009): 1.19.4 contains unre=
leased changes from vendored modules&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t.Skip(&quot;TODO(#53977): 1.18.5 contains unre=
leased changes from vendored modules&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 t.Skip(&quot;TODO(#65051): 1.22.2 contains unrelease=
d changes from vendored modules&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goBin :=3D testenv.GoToolPath(t)<br>
+<br>
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go<br>
+index 9d6abd8..10ff193 100644<br>
+--- a/src/net/http/h2_bundle.go<br>
++++ b/src/net/http/h2_bundle.go<br>
+@@ -2842,6 +2842,7 @@ func (fr *http2Framer) readMetaFrame(hf *http2Header=
sFrame) (*http2MetaHeadersFr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if size &gt; remain=
Size {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0hdec.SetEmitEnabled(false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mh.Truncated =3D true<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 remainSize =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remainSize -=3D siz=
e<br>
+@@ -2854,6 +2855,36 @@ func (fr *http2Framer) readMetaFrame(hf *http2Heade=
rsFrame) (*http2MetaHeadersFr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var hc http2headersOrContinuation =3D hf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frag :=3D hc.Header=
BlockFragment()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Avoid parsing large a=
mounts of headers that we will then discard.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // If the sender exceeds=
 the max header list size by too much,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // skip parsing the frag=
ment and close the connection.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;Too much&quot; =
is either any CONTINUATION frame after we&#39;ve already<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // exceeded the max head=
er list size (in which case remainSize is 0),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // or a frame whose enco=
ded size is more than twice the remaining<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // header list bytes we&=
#39;re willing to accept.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if int64(len(frag)) &gt;=
 int64(2*remainSize) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if http2VerboseLogs {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.Printf(&quot;http2: header list too lar=
ge&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // It would be nice to send a RST_STREAM before sending the GOAWAY,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // but the struture of the server&#39;s frame writer makes this difficu=
lt.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil, http2ConnectionError(http2ErrCodeProtocol)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Also close the connec=
tion after any CONTINUATION frame following an<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // invalid header, since=
 we stop tracking the size of the headers after<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // an invalid one.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if invalid !=3D nil {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if http2VerboseLogs {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.Printf(&quot;http2: invalid header: %v&=
quot;, invalid)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // It would be nice to send a RST_STREAM before sending the GOAWAY,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // but the struture of the server&#39;s frame writer makes this difficu=
lt.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return nil, http2ConnectionError(http2ErrCodeProtocol)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if _, err :=3D hdec=
.Write(frag); err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return nil, http2ConnectionError(http2ErrCodeCompression)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+--<br>
+2.40.0<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198549): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198549" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198549</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105617671/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105617671/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a9064f0616742df5--

