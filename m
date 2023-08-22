Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB495EE49A3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 04:00:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.1087.1692676819251521280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 21:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e8pceN5Q;
 spf=pass (domain: mvista.com, ip: 209.85.167.54, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe8c3b5ca0so6192831e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 21:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692676817; x=1693281617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C2cFYOZixDebCe2f92TJv5z3rYEHTqA4fUbZYrevuTA=;
        b=e8pceN5Q/UgYOCat+AZvFgak4oi8J8GR4IvMsLWWV9Bq6CNc2JMf7s24txDmDuMigH
         6iOR1EEeC2PhLFUOS9JZ19yegmKF46NLihhsWZ2xBchBXd4o7D5rwgWeWSgs9L9Tj2kC
         30lC6jSaXmAxac2azYImNrqnFCfXLL5yYoaf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692676817; x=1693281617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2cFYOZixDebCe2f92TJv5z3rYEHTqA4fUbZYrevuTA=;
        b=R6HysOWXKRiZv89eeZgMgdt8QqNpTg3lmKLcAZyMoQkYNhVXP7MkhNNYjHJW5/hXUS
         cJAf446GjftT+l8dua9zjkADVEO4pmjm4LRJyA73cGFkonX/GtwOiSWvYLKARTy+IPyK
         dRjcs6Lm8RHmPwm9+2G3F45A8z7Rw4EXYuujEUrVKqvGgr48ZwVqe1cyStTD0BPPMi1b
         VWQTu1KY8HW/PD6SWBnQ1ZA5DNHe741CNz3U7hdQsK9KgMOgtBU8cqcQVtzLKUPdQ+Ec
         Ewn8TTAfGJO5eQPTuWzufsg+KGNBEeqDicyW6Tapr9577UqGYoX2frbtBOfx7VrUZ9jb
         TXQA==
X-Gm-Message-State: AOJu0Yz5U+hmkVh0ai2kvJqAnqs+GiE52LOpyWRhYZW1G7R3SgCm1egZ
	IK9Gef+WOcgdOy0q9OYQUiE3s4vParwtvhUovv852T5FNnYUmdLeYu4=
X-Google-Smtp-Source: AGHT+IGUEx9SDG/FYUN0k5zJLgBOBE5tdQt5yChC2+gP5U8o92Q0guUgxeuTpQRKp7WC9Tyh4aG13gpZI13EgahSgiQ=
X-Received: by 2002:a05:6512:104e:b0:4ff:990a:5d2e with SMTP id
 c14-20020a056512104e00b004ff990a5d2emr6464977lfb.20.1692676816629; Mon, 21
 Aug 2023 21:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230726043733.1979925-1-vkumbhar@mvista.com> <86ec0a3c-e9bb-89e6-dd68-e8eb4b18bb16@windriver.com>
In-Reply-To: <86ec0a3c-e9bb-89e6-dd68-e8eb4b18bb16@windriver.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Tue, 22 Aug 2023 09:30:05 +0530
Message-ID: <CAPun1rHvwqB8mtOUQrK=eRJ_wQey3Y7xhe1+9zPqhvzuX=reMA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go: fix CVE-2023-29406 net/http
 insufficient sanitization of Host header
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000600cd006037b087f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 04:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186493

--000000000000600cd006037b087f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, If that's the case, I'll revert this patch.

Thanks,
Vivek

On Tue, Aug 22, 2023 at 9:08=E2=80=AFAM Robert Yang <liezhi.yang@windriver.=
com>
wrote:

> Hello,
>
> This patch caused docker failed to run on kirkstone branch:
>
> $ docker run --rm -it ubuntu /bin/bash
> Unable to find image 'ubuntu:latest' locally
> latest: Pulling from library/ubuntu
> 3153aa388d02: Pull complete
> Digest:
> sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508
> Status: Downloaded newer image for ubuntu:latest
> http: invalid Host header
>
> Maybe we need consider revert it atm since CVE-2023-29406 is a medium bug=
.
>
> // Robert
>
> On 7/26/23 12:37, vkumbhar wrote:
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >   meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
> >   .../go/go-1.18/CVE-2023-29406.patch           | 210 +++++++++++++++++=
+
> >   2 files changed, 211 insertions(+)
> >   create mode 100644
> meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
> >
> > diff --git a/meta/recipes-devtools/go/go-1.17.13.inc
> b/meta/recipes-devtools/go/go-1.17.13.inc
> > index 73921852fc..36904a92fb 100644
> > --- a/meta/recipes-devtools/go/go-1.17.13.inc
> > +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> > @@ -36,6 +36,7 @@ SRC_URI +=3D "\
> >       file://CVE-2023-29405.patch \
> >       file://CVE-2023-29402.patch \
> >       file://CVE-2023-29400.patch \
> > +    file://CVE-2023-29406.patch \
> >   "
> >   SRC_URI[main.sha256sum] =3D
> "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
> >
> > diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
> b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
> > new file mode 100644
> > index 0000000000..a326cda5c4
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
> > @@ -0,0 +1,210 @@
> > +From 5fa6923b1ea891400153d04ddf1545e23b40041b Mon Sep 17 00:00:00 2001
> > +From: Damien Neil <dneil@google.com>
> > +Date: Wed, 28 Jun 2023 13:20:08 -0700
> > +Subject: [PATCH] [release-branch.go1.19] net/http: validate Host heade=
r
> before
> > + sending
> > +
> > +Verify that the Host header we send is valid.
> > +Avoids surprising behavior such as a Host of "go.dev\r\nX-Evil:oops"
> > +adding an X-Evil header to HTTP/1 requests.
> > +
> > +Add a test, skip the test for HTTP/2. HTTP/2 is not vulnerable to
> > +header injection in the way HTTP/1 is, but x/net/http2 doesn't validat=
e
> > +the header and will go into a retry loop when the server rejects it.
> > +CL 506995 adds the necessary validation to x/net/http2.
> > +
> > +Updates #60374
> > +Fixes #61075
> > +For CVE-2023-29406
> > +
> > +Change-Id: I05cb6866a9bead043101954dfded199258c6dd04
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/506996
> > +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> > +TryBot-Result: Gopher Robot <gobot@golang.org>
> > +Run-TryBot: Damien Neil <dneil@google.com>
> > +(cherry picked from commit 499458f7ca04087958987a33c2703c3ef03e27e2)
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/507358
> > +Run-TryBot: Tatiana Bradley <tatianabradley@google.com>
> > +Reviewed-by: Roland Shoemaker <roland@golang.org>
> > +
> > +Upstream-Status: Backport [
> https://github.com/golang/go/commit/5fa6923b1ea891400153d04ddf1545e23b400=
41b
> ]
> > +CVE: CVE-2023-29406
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + src/net/http/http_test.go      | 29 ----------------------
> > + src/net/http/request.go        | 45 ++++++++-------------------------=
-
> > + src/net/http/request_test.go   | 11 ++-------
> > + src/net/http/transport_test.go | 18 ++++++++++++++
> > + 4 files changed, 30 insertions(+), 73 deletions(-)
> > +
> > +diff --git a/src/net/http/http_test.go b/src/net/http/http_test.go
> > +index 0d92fe5..f03272a 100644
> > +--- a/src/net/http/http_test.go
> > ++++ b/src/net/http/http_test.go
> > +@@ -48,35 +48,6 @@ func TestForeachHeaderElement(t *testing.T) {
> > +     }
> > + }
> > +
> > +-func TestCleanHost(t *testing.T) {
> > +-    tests :=3D []struct {
> > +-            in, want string
> > +-    }{
> > +-            {"www.google.com", "www.google.com"},
> > +-            {"www.google.com foo", "www.google.com"},
> > +-            {"www.google.com/foo", "www.google.com"},
> > +-            {" first character is a space", ""},
> > +-            {"[1::6]:8080", "[1::6]:8080"},
> > +-
> > +-            // Punycode:
> > +-            {"=D0=B3=D0=BE=D1=84=D0=B5=D1=80.=D1=80=D1=84/foo", "xn--=
c1ae0ajs.xn--p1ai"},
> > +-            {"b=C3=BCcher.de <http://xn--bcher-kva.de>", "xn--bcher-k=
va.de
> "},
> > +-            {"b=C3=BCcher.de:8080 <http://xn--bcher-kva.de:8080>", "
> xn--bcher-kva.de:8080"},
> > +-            // Verify we convert to lowercase before punycode:
> > +-            {"B=C3=9CCHER.de", "xn--bcher-kva.de"},
> > +-            {"B=C3=9CCHER.de:8080", "xn--bcher-kva.de:8080"},
> > +-            // Verify we normalize to NFC before punycode:
> > +-            {"goph=C3=A9r.nfc", "xn--gophr-esa.nfc"},            // N=
FC
> input; no work needed
> > +-            {"goph\u0065\u0301r.nfd", "xn--gophr-esa.nfd"}, // NFD
> input
> > +-    }
> > +-    for _, tt :=3D range tests {
> > +-            got :=3D cleanHost(tt.in)
> > +-            if tt.want !=3D got {
> > +-                    t.Errorf("cleanHost(%q) =3D %q, want %q", tt.in,
> got, tt.want)
> > +-            }
> > +-    }
> > +-}
> > +-
> > + // Test that cmd/go doesn't link in the HTTP server.
> > + //
> > + // This catches accidental dependencies between the HTTP transport an=
d
> > +diff --git a/src/net/http/request.go b/src/net/http/request.go
> > +index 09cb0c7..2f4e740 100644
> > +--- a/src/net/http/request.go
> > ++++ b/src/net/http/request.go
> > +@@ -17,7 +17,6 @@ import (
> > +     "io"
> > +     "mime"
> > +     "mime/multipart"
> > +-    "net"
> > +     "net/http/httptrace"
> > +     "net/http/internal/ascii"
> > +     "net/textproto"
> > +@@ -27,6 +26,7 @@ import (
> > +     "strings"
> > +     "sync"
> > +
> > ++    "golang.org/x/net/http/httpguts"
> > +     "golang.org/x/net/idna"
> > + )
> > +
> > +@@ -568,12 +568,19 @@ func (r *Request) write(w io.Writer, usingProxy
> bool, extraHeaders Header, waitF
> > +     // is not given, use the host from the request URL.
> > +     //
> > +     // Clean the host, in case it arrives with unexpected stuff in it=
.
> > +-    host :=3D cleanHost(r.Host)
> > ++    host :=3D r.Host
> > +     if host =3D=3D "" {
> > +             if r.URL =3D=3D nil {
> > +                     return errMissingHost
> > +             }
> > +-            host =3D cleanHost(r.URL.Host)
> > ++            host =3D r.URL.Host
> > ++    }
> > ++    host, err =3D httpguts.PunycodeHostPort(host)
> > ++    if err !=3D nil {
> > ++            return err
> > ++    }
> > ++    if !httpguts.ValidHostHeader(host) {
> > ++            return errors.New("http: invalid Host header")
> > +     }
> > +
> > +     // According to RFC 6874, an HTTP client, proxy, or other
> > +@@ -730,38 +737,6 @@ func idnaASCII(v string) (string, error) {
> > +     return idna.Lookup.ToASCII(v)
> > + }
> > +
> > +-// cleanHost cleans up the host sent in request's Host header.
> > +-//
> > +-// It both strips anything after '/' or ' ', and puts the value
> > +-// into Punycode form, if necessary.
> > +-//
> > +-// Ideally we'd clean the Host header according to the spec:
> > +-//   https://tools.ietf.org/html/rfc7230#section-5.4 (Host =3D uri-ho=
st
> [ ":" port ]")
> > +-//   https://tools.ietf.org/html/rfc7230#section-2.7 (uri-host ->
> rfc3986's host)
> > +-//   https://tools.ietf.org/html/rfc3986#section-3.2.2 (definition of
> host)
> > +-// But practically, what we are trying to avoid is the situation in
> > +-// issue 11206, where a malformed Host header used in the proxy conte=
xt
> > +-// would create a bad request. So it is enough to just truncate at th=
e
> > +-// first offending character.
> > +-func cleanHost(in string) string {
> > +-    if i :=3D strings.IndexAny(in, " /"); i !=3D -1 {
> > +-            in =3D in[:i]
> > +-    }
> > +-    host, port, err :=3D net.SplitHostPort(in)
> > +-    if err !=3D nil { // input was just a host
> > +-            a, err :=3D idnaASCII(in)
> > +-            if err !=3D nil {
> > +-                    return in // garbage in, garbage out
> > +-            }
> > +-            return a
> > +-    }
> > +-    a, err :=3D idnaASCII(host)
> > +-    if err !=3D nil {
> > +-            return in // garbage in, garbage out
> > +-    }
> > +-    return net.JoinHostPort(a, port)
> > +-}
> > +-
> > + // removeZone removes IPv6 zone identifier from host.
> > + // E.g., "[fe80::1%en0]:8080" to "[fe80::1]:8080"
> > + func removeZone(host string) string {
> > +diff --git a/src/net/http/request_test.go b/src/net/http/request_test.=
go
> > +index fac12b7..368e87a 100644
> > +--- a/src/net/http/request_test.go
> > ++++ b/src/net/http/request_test.go
> > +@@ -776,15 +776,8 @@ func TestRequestBadHost(t *testing.T) {
> > +     }
> > +     req.Host =3D "foo.com with spaces"
> > +     req.URL.Host =3D "foo.com with spaces"
> > +-    req.Write(logWrites{t, &got})
> > +-    want :=3D []string{
> > +-            "GET /after HTTP/1.1\r\n",
> > +-            "Host: foo.com\r\n",
> > +-            "User-Agent: " + DefaultUserAgent + "\r\n",
> > +-            "\r\n",
> > +-    }
> > +-    if !reflect.DeepEqual(got, want) {
> > +-            t.Errorf("Writes =3D %q\n  Want =3D %q", got, want)
> > ++    if err :=3D req.Write(logWrites{t, &got}); err =3D=3D nil {
> > ++            t.Errorf("Writing request with invalid Host: succeded,
> want error")
> > +     }
> > + }
> > +
> > +diff --git a/src/net/http/transport_test.go
> b/src/net/http/transport_test.go
> > +index eeaa492..58f12af 100644
> > +--- a/src/net/http/transport_test.go
> > ++++ b/src/net/http/transport_test.go
> > +@@ -6512,3 +6512,21 @@ func TestCancelRequestWhenSharingConnection(t
> *testing.T) {
> > +     close(r2c)
> > +     wg.Wait()
> > + }
> > ++
> > ++func TestRequestSanitization(t *testing.T) {
> > ++    setParallel(t)
> > ++    defer afterTest(t)
> > ++
> > ++    ts :=3D newClientServerTest(t, h1Mode, HandlerFunc(func(rw
> ResponseWriter, req *Request) {
> > ++            if h, ok :=3D req.Header["X-Evil"]; ok {
> > ++                    t.Errorf("request has X-Evil header: %q", h)
> > ++            }
> > ++    })).ts
> > ++    defer ts.Close()
> > ++    req, _ :=3D NewRequest("GET", ts.URL, nil)
> > ++    req.Host =3D "go.dev\r\nX-Evil:evil"
> > ++    resp, _ :=3D ts.Client().Do(req)
> > ++    if resp !=3D nil {
> > ++            resp.Body.Close()
> > ++    }
> > ++}
> > +--
> > +2.25.1
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184856):
> https://lists.openembedded.org/g/openembedded-core/message/184856
> > Mute This Topic: https://lists.openembedded.org/mt/100365153/7304958
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> liezhi.yang@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000600cd006037b087f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, If that&#39;s the case, I&#39;ll revert this patch.<=
div><div><br></div><div>Thanks,</div></div><div>Vivek</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 22, =
2023 at 9:08=E2=80=AFAM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windr=
iver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
This patch caused docker failed to run on kirkstone branch:<br>
<br>
$ docker run --rm -it ubuntu /bin/bash<br>
Unable to find image &#39;ubuntu:latest&#39; locally<br>
latest: Pulling from library/ubuntu<br>
3153aa388d02: Pull complete<br>
Digest: sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7=
f508<br>
Status: Downloaded newer image for ubuntu:latest<br>
http: invalid Host header<br>
<br>
Maybe we need consider revert it atm since CVE-2023-29406 is a medium bug.<=
br>
<br>
// Robert<br>
<br>
On 7/26/23 12:37, vkumbhar wrote:<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/go/go-1.17.13.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0.../go/go-1.18/CVE-2023-29406.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 210 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 211 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-20=
23-29406.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-de=
vtools/go/go-1.17.13.inc<br>
&gt; index 73921852fc..36904a92fb 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.17.13.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17.13.inc<br>
&gt; @@ -36,6 +36,7 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-29405.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-29402.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-29400.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-29406.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI[main.sha256sum] =3D &quot;a1a48b23afb206f95e7bbaa9=
b898d965f90826f6f1d1fc0c1d784ada0cd300fd&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch b/m=
eta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a326cda5c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch<br>
&gt; @@ -0,0 +1,210 @@<br>
&gt; +From 5fa6923b1ea891400153d04ddf1545e23b40041b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_=
blank">dneil@google.com</a>&gt;<br>
&gt; +Date: Wed, 28 Jun 2023 13:20:08 -0700<br>
&gt; +Subject: [PATCH] [release-branch.go1.19] net/http: validate Host head=
er before<br>
&gt; + sending<br>
&gt; +<br>
&gt; +Verify that the Host header we send is valid.<br>
&gt; +Avoids surprising behavior such as a Host of &quot;<a href=3D"http://=
go.dev" rel=3D"noreferrer" target=3D"_blank">go.dev</a>\r\nX-Evil:oops&quot=
;<br>
&gt; +adding an X-Evil header to HTTP/1 requests.<br>
&gt; +<br>
&gt; +Add a test, skip the test for HTTP/2. HTTP/2 is not vulnerable to<br>
&gt; +header injection in the way HTTP/1 is, but x/net/http2 doesn&#39;t va=
lidate<br>
&gt; +the header and will go into a retry loop when the server rejects it.<=
br>
&gt; +CL 506995 adds the necessary validation to x/net/http2.<br>
&gt; +<br>
&gt; +Updates #60374<br>
&gt; +Fixes #61075<br>
&gt; +For CVE-2023-29406<br>
&gt; +<br>
&gt; +Change-Id: I05cb6866a9bead043101954dfded199258c6dd04<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/506=
996" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/506996</a><br>
&gt; +Reviewed-by: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@goo=
gle.com" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
&gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" t=
arget=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" targe=
t=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; +(cherry picked from commit 499458f7ca04087958987a33c2703c3ef03e27e2)<=
br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/507=
358" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/507358</a><br>
&gt; +Run-TryBot: Tatiana Bradley &lt;<a href=3D"mailto:tatianabradley@goog=
le.com" target=3D"_blank">tatianabradley@google.com</a>&gt;<br>
&gt; +Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:roland@golang.org=
" target=3D"_blank">roland@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/5fa6923b1ea891400153d04ddf1545e23b40041b" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/5fa6923b1ea891400153d04ddf1545=
e23b40041b</a>]<br>
&gt; +CVE: CVE-2023-29406<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/net/http/http_test.go=C2=A0 =C2=A0 =C2=A0 | 29 -----------------=
-----<br>
&gt; + src/net/http/request.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 45 ++++++++----=
----------------------<br>
&gt; + src/net/http/request_test.go=C2=A0 =C2=A0| 11 ++-------<br>
&gt; + src/net/http/transport_test.go | 18 ++++++++++++++<br>
&gt; + 4 files changed, 30 insertions(+), 73 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/net/http/http_test.go b/src/net/http/http_test.go<br=
>
&gt; +index 0d92fe5..f03272a 100644<br>
&gt; +--- a/src/net/http/http_test.go<br>
&gt; ++++ b/src/net/http/http_test.go<br>
&gt; +@@ -48,35 +48,6 @@ func TestForeachHeaderElement(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +-func TestCleanHost(t *testing.T) {<br>
&gt; +-=C2=A0 =C2=A0 tests :=3D []struct {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in, want string<br>
&gt; +-=C2=A0 =C2=A0 }{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D"_bl=
ank">www.google.com</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a> foo&=
quot;, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;<a href=3D"http://w=
ww.google.com/foo" rel=3D"noreferrer" target=3D"_blank">www.google.com/foo<=
/a>&quot;, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" targe=
t=3D"_blank">www.google.com</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot; first character is=
 a space&quot;, &quot;&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;[1::6]:8080&quot;, =
&quot;[1::6]:8080&quot;},<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Punycode:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;=D0=B3=D0=BE=D1=84=
=D0=B5=D1=80.=D1=80=D1=84/foo&quot;, &quot;xn--c1ae0ajs.xn--p1ai&quot;},<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;<a href=3D"http://x=
n--bcher-kva.de" rel=3D"noreferrer" target=3D"_blank">b=C3=BCcher.de</a>&qu=
ot;, &quot;<a href=3D"http://xn--bcher-kva.de" rel=3D"noreferrer" target=3D=
"_blank">xn--bcher-kva.de</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;<a href=3D"http://x=
n--bcher-kva.de:8080" rel=3D"noreferrer" target=3D"_blank">b=C3=BCcher.de:8=
080</a>&quot;, &quot;<a href=3D"http://xn--bcher-kva.de:8080" rel=3D"norefe=
rrer" target=3D"_blank">xn--bcher-kva.de:8080</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Verify we convert to lo=
wercase before punycode:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;B=C3=9CCHER.de&quot=
;, &quot;<a href=3D"http://xn--bcher-kva.de" rel=3D"noreferrer" target=3D"_=
blank">xn--bcher-kva.de</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;B=C3=9CCHER.de:8080=
&quot;, &quot;<a href=3D"http://xn--bcher-kva.de:8080" rel=3D"noreferrer" t=
arget=3D"_blank">xn--bcher-kva.de:8080</a>&quot;},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Verify we normalize to =
NFC before punycode:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;goph=C3=A9r.nfc&quo=
t;, &quot;xn--gophr-esa.nfc&quot;},=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // NFC input; no work needed<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;goph\u0065\u0301r.n=
fd&quot;, &quot;xn--gophr-esa.nfd&quot;}, // NFD input<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 for _, tt :=3D range tests {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 got :=3D cleanHost(<a href=
=3D"http://tt.in" rel=3D"noreferrer" target=3D"_blank">tt.in</a>)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tt.want !=3D got {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 t.Errorf(&quot;cleanHost(%q) =3D %q, want %q&quot;, <a href=3D"http://t=
t.in" rel=3D"noreferrer" target=3D"_blank">tt.in</a>, got, tt.want)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + // Test that cmd/go doesn&#39;t link in the HTTP server.<br>
&gt; + //<br>
&gt; + // This catches accidental dependencies between the HTTP transport a=
nd<br>
&gt; +diff --git a/src/net/http/request.go b/src/net/http/request.go<br>
&gt; +index 09cb0c7..2f4e740 100644<br>
&gt; +--- a/src/net/http/request.go<br>
&gt; ++++ b/src/net/http/request.go<br>
&gt; +@@ -17,7 +17,6 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;mime&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;mime/multipart&quot;<br>
&gt; +-=C2=A0 =C2=A0 &quot;net&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;net/http/httptrace&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;net/http/internal/ascii&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;net/textproto&quot;<br>
&gt; +@@ -27,6 +26,7 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sync&quot;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 &quot;<a href=3D"http://golang.org/x/net/http/httpguts=
" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net/http/httpguts</a>&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://golang.org/x/net/idna" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/net/idna</a>&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; +@@ -568,12 +568,19 @@ func (r *Request) write(w io.Writer, usingProxy=
 bool, extraHeaders Header, waitF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// is not given, use the host from the request UR=
L.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0//<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Clean the host, in case it arrives with unexpe=
cted stuff in it.<br>
&gt; +-=C2=A0 =C2=A0 host :=3D cleanHost(r.Host)<br>
&gt; ++=C2=A0 =C2=A0 host :=3D r.Host<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if host =3D=3D &quot;&quot; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if r.URL =3D=3D nil {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return errMissingHost<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host =3D cleanHost(r.URL.H=
ost)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host =3D r.URL.Host<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 host, err =3D httpguts.PunycodeHostPort(host)<br>
&gt; ++=C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 if !httpguts.ValidHostHeader(host) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errors.New(&quot;ht=
tp: invalid Host header&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// According to RFC 6874, an HTTP client, proxy, =
or other<br>
&gt; +@@ -730,38 +737,6 @@ func idnaASCII(v string) (string, error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return idna.Lookup.ToASCII(v)<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// cleanHost cleans up the host sent in request&#39;s Host header.<b=
r>
&gt; +-//<br>
&gt; +-// It both strips anything after &#39;/&#39; or &#39; &#39;, and put=
s the value<br>
&gt; +-// into Punycode form, if necessary.<br>
&gt; +-//<br>
&gt; +-// Ideally we&#39;d clean the Host header according to the spec:<br>
&gt; +-//=C2=A0 =C2=A0<a href=3D"https://tools.ietf.org/html/rfc7230#sectio=
n-5.4" rel=3D"noreferrer" target=3D"_blank">https://tools.ietf.org/html/rfc=
7230#section-5.4</a> (Host =3D uri-host [ &quot;:&quot; port ]&quot;)<br>
&gt; +-//=C2=A0 =C2=A0<a href=3D"https://tools.ietf.org/html/rfc7230#sectio=
n-2.7" rel=3D"noreferrer" target=3D"_blank">https://tools.ietf.org/html/rfc=
7230#section-2.7</a> (uri-host -&gt; rfc3986&#39;s host)<br>
&gt; +-//=C2=A0 =C2=A0<a href=3D"https://tools.ietf.org/html/rfc3986#sectio=
n-3.2.2" rel=3D"noreferrer" target=3D"_blank">https://tools.ietf.org/html/r=
fc3986#section-3.2.2</a> (definition of host)<br>
&gt; +-// But practically, what we are trying to avoid is the situation in<=
br>
&gt; +-// issue 11206, where a malformed Host header used in the proxy cont=
ext<br>
&gt; +-// would create a bad request. So it is enough to just truncate at t=
he<br>
&gt; +-// first offending character.<br>
&gt; +-func cleanHost(in string) string {<br>
&gt; +-=C2=A0 =C2=A0 if i :=3D strings.IndexAny(in, &quot; /&quot;); i !=3D=
 -1 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in =3D in[:i]<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 host, port, err :=3D net.SplitHostPort(in)<br>
&gt; +-=C2=A0 =C2=A0 if err !=3D nil { // input was just a host<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a, err :=3D idnaASCII(in)<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return in // garbage in, garbage out<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return a<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 a, err :=3D idnaASCII(host)<br>
&gt; +-=C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return in // garbage in, g=
arbage out<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 return net.JoinHostPort(a, port)<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + // removeZone removes IPv6 zone identifier from host.<br>
&gt; + // E.g., &quot;[fe80::1%en0]:8080&quot; to &quot;[fe80::1]:8080&quot=
;<br>
&gt; + func removeZone(host string) string {<br>
&gt; +diff --git a/src/net/http/request_test.go b/src/net/http/request_test=
.go<br>
&gt; +index fac12b7..368e87a 100644<br>
&gt; +--- a/src/net/http/request_test.go<br>
&gt; ++++ b/src/net/http/request_test.go<br>
&gt; +@@ -776,15 +776,8 @@ func TestRequestBadHost(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0req.Host =3D &quot;<a href=3D"http://foo.com" rel=
=3D"noreferrer" target=3D"_blank">foo.com</a> with spaces&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0req.URL.Host =3D &quot;<a href=3D"http://foo.com"=
 rel=3D"noreferrer" target=3D"_blank">foo.com</a> with spaces&quot;<br>
&gt; +-=C2=A0 =C2=A0 req.Write(logWrites{t, &amp;got})<br>
&gt; +-=C2=A0 =C2=A0 want :=3D []string{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET /after HTTP/1.1\=
r\n&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Host: <a href=3D"htt=
p://foo.com" rel=3D"noreferrer" target=3D"_blank">foo.com</a>\r\n&quot;,<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;User-Agent: &quot; +=
 DefaultUserAgent + &quot;\r\n&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\r\n&quot;,<br>
&gt; +-=C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 if !reflect.DeepEqual(got, want) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Writes =3D =
%q\n=C2=A0 Want =3D %q&quot;, got, want)<br>
&gt; ++=C2=A0 =C2=A0 if err :=3D req.Write(logWrites{t, &amp;got}); err =3D=
=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Writing req=
uest with invalid Host: succeded, want error&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +diff --git a/src/net/http/transport_test.go b/src/net/http/transport_=
test.go<br>
&gt; +index eeaa492..58f12af 100644<br>
&gt; +--- a/src/net/http/transport_test.go<br>
&gt; ++++ b/src/net/http/transport_test.go<br>
&gt; +@@ -6512,3 +6512,21 @@ func TestCancelRequestWhenSharingConnection(t =
*testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0close(r2c)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wg.Wait()<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++func TestRequestSanitization(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 setParallel(t)<br>
&gt; ++=C2=A0 =C2=A0 defer afterTest(t)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 ts :=3D newClientServerTest(t, h1Mode, HandlerFunc(fun=
c(rw ResponseWriter, req *Request) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if h, ok :=3D req.Header[&=
quot;X-Evil&quot;]; ok {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 t.Errorf(&quot;request has X-Evil header: %q&quot;, h)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 })).ts<br>
&gt; ++=C2=A0 =C2=A0 defer ts.Close()<br>
&gt; ++=C2=A0 =C2=A0 req, _ :=3D NewRequest(&quot;GET&quot;, ts.URL, nil)<b=
r>
&gt; ++=C2=A0 =C2=A0 req.Host =3D &quot;<a href=3D"http://go.dev" rel=3D"no=
referrer" target=3D"_blank">go.dev</a>\r\nX-Evil:evil&quot;<br>
&gt; ++=C2=A0 =C2=A0 resp, _ :=3D ts.Client().Do(req)<br>
&gt; ++=C2=A0 =C2=A0 if resp !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resp.Body.Close()<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184856): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184856" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/184856</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10036515=
3/7304958" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100365153/7304958</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:liezhi.yang@eng.windr=
iver.com" target=3D"_blank">liezhi.yang@eng.windriver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--000000000000600cd006037b087f--

