Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DFCC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:33:21 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.39649.1707910397118134582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ze/wcxca;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: liu.ming50@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so3613482a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707910396; x=1708515196; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6TNlruHXHJbRis5T5sFWYWJFMznMbBtjh4CRONBQmI=;
        b=Ze/wcxcaFHflb9V4zJ0/tuiy3A29p4MPn4pEl1zBeTQO3f9MB1sq+hjugjubatugfT
         DOE4LLb07b+T/7Sd60g55+qVGktmThFe7mxstjYO++iBsP+FlDU1MVWTgBaeHVRPompo
         iQC/xMd0z9A4/xVhHbbwmeSbOVsSlOG1k7Yfr/fNptX+aAgspeQLI8VhUeMFv2ivdpaw
         NtEINyFsowSdl3M6sTTKS0gmeITVHI3AbaLnQGEvSEwPU745JqOcuiPvGof2VNTKEJGK
         ZG4rNYK8t9dPshvUzBTBYk0uu8gpsk6dTLOYNS65uSZotzRRIk91qYdX0WDtqFLzHstC
         3LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910396; x=1708515196;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6TNlruHXHJbRis5T5sFWYWJFMznMbBtjh4CRONBQmI=;
        b=k0HTKeO7sQPFGAi/G0crGckVRlqtzaxPQ1LmFSdsV9E/Nq59B37uO8YkI+9k3vaTmR
         94vdPqM3e3a8ndvjRhsPL9NccPGWxNBY5pNsHl/wH/pyDpMFix3ZzFL6y/SVMyHNpibm
         2s1JQVJrVClHagVH8krfnlHHge5Qs6UkL52pD19VzUtTMUdaTgIaqzcIN0OK/aoURMkg
         VQP9J6sF+JIbczWaLPTx0m+jy1o1EBjy7jObTVUvopzpbSZuWODkNguBmUJ7NNPuz5/l
         OQVkEsMfBLNlsi6A49g4wjPbBzE4HYwn1wqoVxJdcZEjE1xw3Cr8En+TO/rLYGXPWUBF
         N5DQ==
X-Gm-Message-State: AOJu0YxVSOGT30O/pQEY8XIYByyTGhlPLl99YEBGsyaDbJi/SHay2ura
	+pb3RpzSrHHfVNd3ZXtxDpcJkiNdOSQZedp0geUdJBOIMF05pWh2W6pZgJ44hbDVMusrGcZLiyn
	X2lniQ5iREw8iFK04COKY8S6Tv/PjaAO0
X-Google-Smtp-Source: AGHT+IGtobBOcGWEsGNlt+AWgNxjFCkbxKSv1Qsr6cMDiVMLgQAFhL1rgSUc6lexsDEU8TyE3HKqE1k4KBg+20S1KPc=
X-Received: by 2002:a05:6a20:a9d:b0:19e:a574:9b10 with SMTP id
 b29-20020a056a200a9d00b0019ea5749b10mr1777971pzf.33.1707910395695; Wed, 14
 Feb 2024 03:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20240212121511.721914-1-liu.ming50@gmail.com>
In-Reply-To: <20240212121511.721914-1-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 14 Feb 2024 12:33:03 +0100
Message-ID: <CALatG=5sg8V22ruX5r7DtW1u6zHgaG5Qz9panphd6zmMky6LPA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH] go: add a complementary fix for CVE-2023-29406
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007197b1061155e0d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195469

--0000000000007197b1061155e0d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Dear maintainers:

Could anybody help review this patch? it is a blocker for running docker in
dunfell/kirkstone.

the best,
thank you

<liu.ming50@gmail.com> =E6=96=BC 2024=E5=B9=B42=E6=9C=8812=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:15=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Ming Liu <liu.ming50@gmail.com>
>
> The original CVE-2023-29406.patch is not complete, causing docker
> failures at runtime, backport a complementary fix from golang upstream.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |   3 +-
>  ...023-29406.patch =3D> CVE-2023-29406-1.patch} |   0
>  .../go/go-1.14/CVE-2023-29406-2.patch         | 114 ++++++++++++++++++
>  3 files changed, 116 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/go/go-1.14/{CVE-2023-29406.patch =3D>
> CVE-2023-29406-1.patch} (100%)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.pat=
ch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> index 42a9ac8435..4fbf9d7590 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -71,7 +71,8 @@ SRC_URI +=3D "\
>      file://CVE-2023-29402.patch \
>      file://CVE-2023-29404.patch \
>      file://CVE-2023-29400.patch \
> -    file://CVE-2023-29406.patch \
> +    file://CVE-2023-29406-1.patch \
> +    file://CVE-2023-29406-2.patch \
>      file://CVE-2023-29409.patch \
>      file://CVE-2022-41725-pre1.patch \
>      file://CVE-2022-41725-pre2.patch \
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-1.patch
> similarity index 100%
> rename from meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch
> rename to meta/recipes-devtools/go/go-1.14/CVE-2023-29406-1.patch
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch
> new file mode 100644
> index 0000000000..637f46a537
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch
> @@ -0,0 +1,114 @@
> +From c08a5fa413a34111c9a37fd9e545de27ab0978b1 Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Wed, 19 Jul 2023 10:30:46 -0700
> +Subject: [PATCH] [release-branch.go1.19] net/http: permit requests with
> + invalid Host headers
> +
> +Historically, the Transport has silently truncated invalid
> +Host headers at the first '/' or ' ' character. CL 506996 changed
> +this behavior to reject invalid Host headers entirely.
> +Unfortunately, Docker appears to rely on the previous behavior.
> +
> +When sending a HTTP/1 request with an invalid Host, send an empty
> +Host header. This is safer than truncation: If you care about the
> +Host, then you should get the one you set; if you don't care,
> +then an empty Host should be fine.
> +
> +Continue to fully validate Host headers sent to a proxy,
> +since proxies generally can't productively forward requests
> +without a Host.
> +
> +For #60374
> +Fixes #61431
> +Fixes #61825
> +
> +Change-Id: If170c7dd860aa20eb58fe32990fc93af832742b6
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/511155
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Reviewed-by: Roland Shoemaker <roland@golang.org>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +(cherry picked from commit b9153f6ef338baee5fe02a867c8fbc83a8b29dd1)
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/518855
> +Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
> +Run-TryBot: Roland Shoemaker <roland@golang.org>
> +Reviewed-by: Russ Cox <rsc@golang.org>
> +
> +Upstream-Status: Backport [
> https://github.com/golang/go/commit/c08a5fa413a34111c9a37fd9e545de27ab097=
8b1
> ]
> +CVE: CVE-2023-29406
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + src/net/http/request.go      | 23 ++++++++++++++++++++++-
> + src/net/http/request_test.go | 17 ++++++++++++-----
> + 2 files changed, 34 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/net/http/request.go b/src/net/http/request.go
> +index 3100037386..91cb8a66b9 100644
> +--- a/src/net/http/request.go
> ++++ b/src/net/http/request.go
> +@@ -582,8 +582,29 @@ func (r *Request) write(w io.Writer, usingProxy
> bool, extraHeaders Header, waitF
> +       if err !=3D nil {
> +               return err
> +       }
> ++      // Validate that the Host header is a valid header in general,
> ++      // but don't validate the host itself. This is sufficient to avoi=
d
> ++      // header or request smuggling via the Host field.
> ++      // The server can (and will, if it's a net/http server) reject
> ++      // the request if it doesn't consider the host valid.
> +       if !httpguts.ValidHostHeader(host) {
> +-              return errors.New("http: invalid Host header")
> ++              // Historically, we would truncate the Host header after
> '/' or ' '.
> ++              // Some users have relied on this truncation to convert a
> network
> ++              // address such as Unix domain socket path into a valid,
> ignored
> ++              // Host header (see https://go.dev/issue/61431).
> ++              //
> ++              // We don't preserve the truncation, because sending an
> altered
> ++              // header field opens a smuggling vector. Instead, zero
> out the
> ++              // Host header entirely if it isn't valid. (An empty Host
> is valid;
> ++              // see RFC 9112 Section 3.2.)
> ++              //
> ++              // Return an error if we're sending to a proxy, since the
> proxy
> ++              // probably can't do anything useful with an empty Host
> header.
> ++              if !usingProxy {
> ++                      host =3D ""
> ++              } else {
> ++                      return errors.New("http: invalid Host header")
> ++              }
> +       }
> +
> +       // According to RFC 6874, an HTTP client, proxy, or other
> +diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
> +index fddc85d6a9..dd1e2dc2a1 100644
> +--- a/src/net/http/request_test.go
> ++++ b/src/net/http/request_test.go
> +@@ -770,16 +770,23 @@ func TestRequestWriteBufferedWriter(t *testing.T) =
{
> +       }
> + }
> +
> +-func TestRequestBadHost(t *testing.T) {
> ++func TestRequestBadHostHeader(t *testing.T) {
> +       got :=3D []string{}
> +       req, err :=3D NewRequest("GET", "http://foo/after", nil)
> +       if err !=3D nil {
> +               t.Fatal(err)
> +       }
> +-      req.Host =3D "foo.com with spaces"
> +-      req.URL.Host =3D "foo.com with spaces"
> +-      if err :=3D req.Write(logWrites{t, &got}); err =3D=3D nil {
> +-              t.Errorf("Writing request with invalid Host: succeded,
> want error")
> ++      req.Host =3D "foo.com\nnewline"
> ++      req.URL.Host =3D "foo.com\nnewline"
> ++      req.Write(logWrites{t, &got})
> ++      want :=3D []string{
> ++              "GET /after HTTP/1.1\r\n",
> ++              "Host: \r\n",
> ++              "User-Agent: " + DefaultUserAgent + "\r\n",
> ++              "\r\n",
> ++      }
> ++      if !reflect.DeepEqual(got, want) {
> ++              t.Errorf("Writes =3D %q\n  Want =3D %q", got, want)
> +       }
> + }
> +
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>

--0000000000007197b1061155e0d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Dear maintainers:<div><br></div><div>Could anybody hel=
p review this patch? it is a blocker for running docker in dunfell/kirkston=
e.</div><div><br></div><div>the best,</div><div>thank you</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=
=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; =E6=96=BC 202=
4=E5=B9=B42=E6=9C=8812=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:15=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" targ=
et=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
The original CVE-2023-29406.patch is not complete, causing docker<br>
failures at runtime, backport a complementary fix from golang upstream.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0...023-29406.patch =3D&gt; CVE-2023-29406-1.patch} |=C2=A0 =C2=A00<br=
>
=C2=A0.../go/go-1.14/CVE-2023-29406-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 114 ++++++++++++++++++<br>
=C2=A03 files changed, 116 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/go/go-1.14/{CVE-2023-29406.patch =3D&gt;=
 CVE-2023-29406-1.patch} (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.=
patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/g=
o/go-1.14.inc<br>
index 42a9ac8435..4fbf9d7590 100644<br>
--- a/meta/recipes-devtools/go/go-1.14.inc<br>
+++ b/meta/recipes-devtools/go/go-1.14.inc<br>
@@ -71,7 +71,8 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29402.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29404.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29400.patch \<br>
-=C2=A0 =C2=A0 file://CVE-2023-29406.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-29406-1.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-29406-2.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-29409.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-41725-pre1.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-41725-pre2.patch \<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2023-29406-1.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch<br>
rename to meta/recipes-devtools/go/go-1.14/CVE-2023-29406-1.patch<br>
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch<br>
new file mode 100644<br>
index 0000000000..637f46a537<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch<br>
@@ -0,0 +1,114 @@<br>
+From c08a5fa413a34111c9a37fd9e545de27ab0978b1 Mon Sep 17 00:00:00 2001<br>
+From: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"_blank=
">dneil@google.com</a>&gt;<br>
+Date: Wed, 19 Jul 2023 10:30:46 -0700<br>
+Subject: [PATCH] [release-branch.go1.19] net/http: permit requests with<br=
>
+ invalid Host headers<br>
+<br>
+Historically, the Transport has silently truncated invalid<br>
+Host headers at the first &#39;/&#39; or &#39; &#39; character. CL 506996 =
changed<br>
+this behavior to reject invalid Host headers entirely.<br>
+Unfortunately, Docker appears to rely on the previous behavior.<br>
+<br>
+When sending a HTTP/1 request with an invalid Host, send an empty<br>
+Host header. This is safer than truncation: If you care about the<br>
+Host, then you should get the one you set; if you don&#39;t care,<br>
+then an empty Host should be fine.<br>
+<br>
+Continue to fully validate Host headers sent to a proxy,<br>
+since proxies generally can&#39;t productively forward requests<br>
+without a Host.<br>
+<br>
+For #60374<br>
+Fixes #61431<br>
+Fixes #61825<br>
+<br>
+Change-Id: If170c7dd860aa20eb58fe32990fc93af832742b6<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/511155" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/511155</a><br>
+TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
+Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:roland@golang.org" tar=
get=3D"_blank">roland@golang.org</a>&gt;<br>
+Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" target=3D"=
_blank">dneil@google.com</a>&gt;<br>
+(cherry picked from commit b9153f6ef338baee5fe02a867c8fbc83a8b29dd1)<br>
+Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/518855" =
rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.com/c/g=
o/+/518855</a><br>
+Auto-Submit: Dmitri Shuralyov &lt;<a href=3D"mailto:dmitshur@google.com" t=
arget=3D"_blank">dmitshur@google.com</a>&gt;<br>
+Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:roland@golang.org" targ=
et=3D"_blank">roland@golang.org</a>&gt;<br>
+Reviewed-by: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"_bla=
nk">rsc@golang.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/commit/=
c08a5fa413a34111c9a37fd9e545de27ab0978b1" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/golang/go/commit/c08a5fa413a34111c9a37fd9e545de27ab0=
978b1</a>]<br>
+CVE: CVE-2023-29406<br>
+Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
+---<br>
+ src/net/http/request.go=C2=A0 =C2=A0 =C2=A0 | 23 ++++++++++++++++++++++-<=
br>
+ src/net/http/request_test.go | 17 ++++++++++++-----<br>
+ 2 files changed, 34 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/src/net/http/request.go b/src/net/http/request.go<br>
+index 3100037386..91cb8a66b9 100644<br>
+--- a/src/net/http/request.go<br>
++++ b/src/net/http/request.go<br>
+@@ -582,8 +582,29 @@ func (r *Request) write(w io.Writer, usingProxy bool,=
 extraHeaders Header, waitF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 // Validate that the Host header is a valid header i=
n general,<br>
++=C2=A0 =C2=A0 =C2=A0 // but don&#39;t validate the host itself. This is s=
ufficient to avoid<br>
++=C2=A0 =C2=A0 =C2=A0 // header or request smuggling via the Host field.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 // The server can (and will, if it&#39;s a net/http =
server) reject<br>
++=C2=A0 =C2=A0 =C2=A0 // the request if it doesn&#39;t consider the host v=
alid.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if !httpguts.ValidHostHeader(host) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errors.New(&quot;=
http: invalid Host header&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Historically, we woul=
d truncate the Host header after &#39;/&#39; or &#39; &#39;.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Some users have relie=
d on this truncation to convert a network<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // address such as Unix =
domain socket path into a valid, ignored<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Host header (see <a h=
ref=3D"https://go.dev/issue/61431" rel=3D"noreferrer" target=3D"_blank">htt=
ps://go.dev/issue/61431</a>).<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // We don&#39;t preserve=
 the truncation, because sending an altered<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // header field opens a =
smuggling vector. Instead, zero out the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Host header entirely =
if it isn&#39;t valid. (An empty Host is valid;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // see RFC 9112 Section =
3.2.)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Return an error if we=
&#39;re sending to a proxy, since the proxy<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // probably can&#39;t do=
 anything useful with an empty Host header.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !usingProxy {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 host =3D &quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return errors.New(&quot;http: invalid Host header&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// According to RFC 6874, an HTTP client, proxy=
, or other<br>
+diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go<b=
r>
+index fddc85d6a9..dd1e2dc2a1 100644<br>
+--- a/src/net/http/request_test.go<br>
++++ b/src/net/http/request_test.go<br>
+@@ -770,16 +770,23 @@ func TestRequestWriteBufferedWriter(t *testing.T) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-func TestRequestBadHost(t *testing.T) {<br>
++func TestRequestBadHostHeader(t *testing.T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0got :=3D []string{}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0req, err :=3D NewRequest(&quot;GET&quot;, &quot=
;<a href=3D"http://foo/after" rel=3D"noreferrer" target=3D"_blank">http://f=
oo/after</a>&quot;, nil)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatal(err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 req.Host =3D &quot;<a href=3D"http://foo.com" rel=3D=
"noreferrer" target=3D"_blank">foo.com</a> with spaces&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 req.URL.Host =3D &quot;<a href=3D"http://foo.com" re=
l=3D"noreferrer" target=3D"_blank">foo.com</a> with spaces&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 if err :=3D req.Write(logWrites{t, &amp;got}); err =
=3D=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Writing r=
equest with invalid Host: succeded, want error&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 req.Host =3D &quot;<a href=3D"http://foo.com" rel=3D=
"noreferrer" target=3D"_blank">foo.com</a>\nnewline&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 req.URL.Host =3D &quot;<a href=3D"http://foo.com" re=
l=3D"noreferrer" target=3D"_blank">foo.com</a>\nnewline&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 req.Write(logWrites{t, &amp;got})<br>
++=C2=A0 =C2=A0 =C2=A0 want :=3D []string{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET /after HTTP/1.=
1\r\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Host: \r\n&quot;,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;User-Agent: &quot;=
 + DefaultUserAgent + &quot;\r\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\r\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if !reflect.DeepEqual(got, want) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Writes =
=3D %q\n=C2=A0 Want =3D %q&quot;, got, want)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000007197b1061155e0d3--

