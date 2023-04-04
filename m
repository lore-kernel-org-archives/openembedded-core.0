Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041CBC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 09:58:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.97375.1680602298077612210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 02:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=EnxUxu0P;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id l12so32135878wrm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680602296; x=1683194296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfljTgvo13/zNrCpn0pHjIDoTAnro/jnK6JCsPuTcs0=;
        b=EnxUxu0P2ZNVPjohsCqzhDF8UbM8QzBohHbnIcfzckXSrRZlDNsJjiME64hkRDZKYS
         lgGPn5z46PijAcZacMS96/XIdGIfwRtRyoErTGF/jdpvdP8MR+RCvsC++dKyJ8MpRX7B
         dGqyALBmtsvrX6aZZ0XNk/gZsSqDQXtyMIUBXj+BGPfv/A5hb6ZIeTVztIlrJO2+ZGxR
         dIF+y/cl9bWGz7inH+tRE/sAaIzDH3WI2uKEE+r9cN8+Mz+sA1rX/dvnT8DW+E5P3UVe
         hmypv7KTeEEViIpV0TkWKKEJQO1OXsfN8Uh68U7CsWMoHiVKdYv7qgsnC1nirgWozBm9
         3/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680602296; x=1683194296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfljTgvo13/zNrCpn0pHjIDoTAnro/jnK6JCsPuTcs0=;
        b=BuHh0ZLs1QJKJgfjvI8IzMF9wUkzTMSbNAoTL4oYCOJtQJUzWfESTZx/Lxqho1cFl7
         Eq0e5l2HPwH0Ozt95HfX2OBaRR5AobmFZ77GB7EL6lgAU7GgWbyBjOxMzlaIsA9oTMiA
         iLn3PCKyXIVOIlGCVSrbiGsdMJp5+RHaN18oMLRdvDBjflRo8OKlC/yXCvOPYCsFbGgj
         9B0IA0+/62hE8LzSeiFMiOS89t4sBdFpzeP7np+5euMZsoMe0Q9ckKkOXm+dqZUo4TiG
         vpQjXzCr8g6eKFYcu1eWogymWYyBGT5iqJW3J+TjbGvtLG/D9gTsHW3irzIJMR2ltTaW
         3mNQ==
X-Gm-Message-State: AAQBX9c5SgW1e6M91PTQCSlgUXe3cawi67C8nfHQQiOnt7BxXglynuVv
	PSdVHPsgLDjgNNiTVXP092yITTKYXxLlPGrnu0M=
X-Google-Smtp-Source: AKy350Z3834v/YycxjjAzvbRHOScad4hbWzZNM1qEF9Jy7DSl5e4mzn7elXpcQK93iKwGHc8aImXYnx3pSGSWAcN7GU=
X-Received: by 2002:a5d:6e92:0:b0:2e2:1f55:7ce9 with SMTP id
 k18-20020a5d6e92000000b002e21f557ce9mr367327wrz.1.1680602296437; Tue, 04 Apr
 2023 02:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230404083113.25604-1-badganchipv@gmail.com>
In-Reply-To: <20230404083113.25604-1-badganchipv@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Apr 2023 11:57:59 +0200
Message-ID: <CA+chaQe_21ixnj=Uq_CuMYLJCjNinjCcMcjQhm8_Ot43g37rcw@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] curl: Add fix for CVE-2023-23916
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: multipart/alternative; boundary="000000000000e34f3205f87fb68d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 09:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179679

--000000000000e34f3205f87fb68d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 10:31=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.=
com>
wrote:

> Add below patch to fix CVE-2023-23916
>
> CVE-2023-23916.patch
>
> Link: https://curl.se/docs/CVE-2023-23916.html
>
> Signed-off-by: pawan <badganchipv@gmail.com>
> ---
>  .../curl/curl/CVE-2023-23916.patch            | 221 ++++++++++++++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
>  2 files changed, 222 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> new file mode 100644
> index 0000000000..fb1a791399
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> @@ -0,0 +1,221 @@
> +Backport of:
> +
>

This is quite clear from Upstream-Status and this line just breaks applying
this .patch with "git am", so I would prefer leave just Upstream-Status and
drop 2 lines above.

+From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001
> +From: Patrick Monnerat <patrick@monnerat.net>
> +Date: Mon, 13 Feb 2023 08:33:09 +0100
> +Subject: [PATCH] content_encoding: do not reset stage counter for each
> header
> +
> +Test 418 verifies
> +
> +Closes #10492
> +
> +CVE: CVE-2023-23916
> +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/119fb187192a9ea13dc.patch]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +---
> + lib/content_encoding.c  |   7 +-
> + lib/urldata.h           |   1 +
> + tests/data/Makefile.inc |   2 +-
> + tests/data/test387      |   2 +-
> + tests/data/test418      | 152 ++++++++++++++++++++++++++++++++++++++++
> + 5 files changed, 158 insertions(+), 6 deletions(-)
> + create mode 100644 tests/data/test418
> +
> +--- a/lib/content_encoding.c
> ++++ b/lib/content_encoding.c
> +@@ -1037,7 +1037,6 @@ CURLcode Curl_build_unencoding_stack(str
> +                                      const char *enclist, int
> maybechunked)
> + {
> +   struct SingleRequest *k =3D &data->req;
> +-  int counter =3D 0;
> +
> +   do {
> +     const char *name;
> +@@ -1072,9 +1071,9 @@ CURLcode Curl_build_unencoding_stack(str
> +       if(!encoding)
> +         encoding =3D &error_encoding;  /* Defer error at stack use. */
> +
> +-      if(++counter >=3D MAX_ENCODE_STACK) {
> +-        failf(data, "Reject response due to %u content encodings",
> +-              counter);
> ++      if(k->writer_stack_depth++ >=3D MAX_ENCODE_STACK) {
> ++        failf(data, "Reject response due to more than %u content
> encodings",
> ++              MAX_ENCODE_STACK);
> +         return CURLE_BAD_CONTENT_ENCODING;
> +       }
> +       /* Stack the unencoding stage. */
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -682,6 +682,7 @@ struct SingleRequest {
> +   struct dohdata *doh; /* DoH specific data for this request */
> + #endif
> +   unsigned char setcookies;
> ++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
> +   BIT(header);        /* incoming data has HTTP header */
> +   BIT(content_range); /* set TRUE if Content-Range: was found */
> +   BIT(upload_done);   /* set to TRUE when doing chunked transfer-encodi=
ng
> +--- a/tests/data/Makefile.inc
> ++++ b/tests/data/Makefile.inc
> +@@ -69,6 +69,7 @@
> + \
> + test400 test401 test402 test403 test404 test405 test406 test407 test408=
 \
> + test409 test410 \
> ++test418 \
> + \
> + test430 test431 test432 test433 test434 test435 test436 \
> + \
> +--- /dev/null
> ++++ b/tests/data/test418
> +@@ -0,0 +1,152 @@
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++gzip
> ++</keywords>
> ++</info>
> ++
> ++#
> ++# Server-side
> ++<reply>
> ++<data nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++Transfer-Encoding: gzip
> ++
> ++-foo-
> ++</data>
> ++</reply>
> ++
> ++#
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++ <name>
> ++Response with multiple Transfer-Encoding headers
> ++ </name>
> ++ <command>
> ++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS
> ++</command>
> ++</client>
> ++
> ++#
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"yes">
> ++GET /%TESTNUMBER HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++User-Agent: curl/%VERSION
> ++Accept: */*
> ++
> ++</protocol>
> ++
> ++# CURLE_BAD_CONTENT_ENCODING is 61
> ++<errorcode>
> ++61
> ++</errorcode>
> ++<stderr mode=3D"text">
> ++curl: (61) Reject response due to more than 5 content encodings
> ++</stderr>
> ++</verify>
> ++</testcase>
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb
> b/meta/recipes-support/curl/curl_7.82.0.bb
> index b583060889..945745cdde 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -39,6 +39,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
>             file://CVE-2023-23914_5-3.patch \
>             file://CVE-2023-23914_5-4.patch \
>             file://CVE-2023-23914_5-5.patch \
> +           file://CVE-2023-23916.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
>
> --
> 2.38.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179676):
> https://lists.openembedded.org/g/openembedded-core/message/179676
> Mute This Topic: https://lists.openembedded.org/mt/98055877/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e34f3205f87fb68d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Apr 4, 2023 at 10:31=E2=80=AFAM P=
awan Badganchi &lt;<a href=3D"mailto:badganchipv@gmail.com">badganchipv@gma=
il.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Add below patch to fix CVE-2023-23916<br>
<br>
CVE-2023-23916.patch<br>
<br>
Link: <a href=3D"https://curl.se/docs/CVE-2023-23916.html" rel=3D"noreferre=
r" target=3D"_blank">https://curl.se/docs/CVE-2023-23916.html</a><br>
<br>
Signed-off-by: pawan &lt;<a href=3D"mailto:badganchipv@gmail.com" target=3D=
"_blank">badganchipv@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../curl/curl/CVE-2023-23916.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 221 ++++++++++++++++++<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 222 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patc=
h<br>
<br>
diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/rec=
ipes-support/curl/curl/CVE-2023-23916.patch<br>
new file mode 100644<br>
index 0000000000..fb1a791399<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch<br>
@@ -0,0 +1,221 @@<br>
+Backport of:<br>
+<br></blockquote><div><br></div><div>This is quite clear from Upstream-Sta=
tus and this line just breaks applying this .patch with &quot;git am&quot;,=
 so I would prefer leave just Upstream-Status and drop 2 lines above.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001<br>
+From: Patrick Monnerat &lt;<a href=3D"mailto:patrick@monnerat.net" target=
=3D"_blank">patrick@monnerat.net</a>&gt;<br>
+Date: Mon, 13 Feb 2023 08:33:09 +0100<br>
+Subject: [PATCH] content_encoding: do not reset stage counter for each hea=
der<br>
+<br>
+Test 418 verifies<br>
+<br>
+Closes #10492<br>
+<br>
+CVE: CVE-2023-23916<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/commit/=
119fb187192a9ea13dc.patch" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/curl/curl/commit/119fb187192a9ea13dc.patch</a>]<br>
+Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:Pawan.Badganchi@kpit.=
com" target=3D"_blank">Pawan.Badganchi@kpit.com</a>&gt;<br>
+---<br>
+ lib/content_encoding.c=C2=A0 |=C2=A0 =C2=A07 +-<br>
+ lib/urldata.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
+ tests/data/Makefile.inc |=C2=A0 =C2=A02 +-<br>
+ tests/data/test387=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
+ tests/data/test418=C2=A0 =C2=A0 =C2=A0 | 152 ++++++++++++++++++++++++++++=
++++++++++++<br>
+ 5 files changed, 158 insertions(+), 6 deletions(-)<br>
+ create mode 100644 tests/data/test418<br>
+<br>
+--- a/lib/content_encoding.c<br>
++++ b/lib/content_encoding.c<br>
+@@ -1037,7 +1037,6 @@ CURLcode Curl_build_unencoding_stack(str<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *enc=
list, int maybechunked)<br>
+ {<br>
+=C2=A0 =C2=A0struct SingleRequest *k =3D &amp;data-&gt;req;<br>
+-=C2=A0 int counter =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0do {<br>
+=C2=A0 =C2=A0 =C2=A0const char *name;<br>
+@@ -1072,9 +1071,9 @@ CURLcode Curl_build_unencoding_stack(str<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(!encoding)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding =3D &amp;error_encoding;=C2=A0 =
/* Defer error at stack use. */<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if(++counter &gt;=3D MAX_ENCODE_STACK) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 failf(data, &quot;Reject response due to %u c=
ontent encodings&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter);<br>
++=C2=A0 =C2=A0 =C2=A0 if(k-&gt;writer_stack_depth++ &gt;=3D MAX_ENCODE_STA=
CK) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 failf(data, &quot;Reject response due to more=
 than %u content encodings&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX_ENCODE_STACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CURLE_BAD_CONTENT_ENCODING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Stack the unencoding stage. */<br>
+--- a/lib/urldata.h<br>
++++ b/lib/urldata.h<br>
+@@ -682,6 +682,7 @@ struct SingleRequest {<br>
+=C2=A0 =C2=A0struct dohdata *doh; /* DoH specific data for this request */=
<br>
+ #endif<br>
+=C2=A0 =C2=A0unsigned char setcookies;<br>
++=C2=A0 unsigned char writer_stack_depth; /* Unencoding stack depth. */<br=
>
+=C2=A0 =C2=A0BIT(header);=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* incoming data has =
HTTP header */<br>
+=C2=A0 =C2=A0BIT(content_range); /* set TRUE if Content-Range: was found *=
/<br>
+=C2=A0 =C2=A0BIT(upload_done);=C2=A0 =C2=A0/* set to TRUE when doing chunk=
ed transfer-encoding<br>
+--- a/tests/data/Makefile.inc<br>
++++ b/tests/data/Makefile.inc<br>
+@@ -69,6 +69,7 @@<br>
+ \<br>
+ test400 test401 test402 test403 test404 test405 test406 test407 test408 \=
<br>
+ test409 test410 \<br>
++test418 \<br>
+ \<br>
+ test430 test431 test432 test433 test434 test435 test436 \<br>
+ \<br>
+--- /dev/null<br>
++++ b/tests/data/test418<br>
+@@ -0,0 +1,152 @@<br>
++&lt;testcase&gt;<br>
++&lt;info&gt;<br>
++&lt;keywords&gt;<br>
++HTTP<br>
++gzip<br>
++&lt;/keywords&gt;<br>
++&lt;/info&gt;<br>
++<br>
++#<br>
++# Server-side<br>
++&lt;reply&gt;<br>
++&lt;data nocheck=3D&quot;yes&quot;&gt;<br>
++HTTP/1.1 200 OK<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++Transfer-Encoding: gzip<br>
++<br>
++-foo-<br>
++&lt;/data&gt;<br>
++&lt;/reply&gt;<br>
++<br>
++#<br>
++# Client-side<br>
++&lt;client&gt;<br>
++&lt;server&gt;<br>
++http<br>
++&lt;/server&gt;<br>
++ &lt;name&gt;<br>
++Response with multiple Transfer-Encoding headers<br>
++ &lt;/name&gt;<br>
++ &lt;command&gt;<br>
++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS<br>
++&lt;/command&gt;<br>
++&lt;/client&gt;<br>
++<br>
++#<br>
++# Verify data after the test has been &quot;shot&quot;<br>
++&lt;verify&gt;<br>
++&lt;protocol crlf=3D&quot;yes&quot;&gt;<br>
++GET /%TESTNUMBER HTTP/1.1<br>
++Host: %HOSTIP:%HTTPPORT<br>
++User-Agent: curl/%VERSION<br>
++Accept: */*<br>
++<br>
++&lt;/protocol&gt;<br>
++<br>
++# CURLE_BAD_CONTENT_ENCODING is 61<br>
++&lt;errorcode&gt;<br>
++61<br>
++&lt;/errorcode&gt;<br>
++&lt;stderr mode=3D&quot;text&quot;&gt;<br>
++curl: (61) Reject response due to more than 5 content encodings<br>
++&lt;/stderr&gt;<br>
++&lt;/verify&gt;<br>
++&lt;/testcase&gt;<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" re=
l=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a> b/meta/recipes-suppor=
t/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">curl_7.82.0.bb</a><br>
index b583060889..945745cdde 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.82.0.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"no=
referrer" target=3D"_blank">curl_7.82.0.bb</a><br>
@@ -39,6 +39,7 @@ SRC_URI =3D &quot;<a href=3D"https://curl.se/download/$%7=
BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://curl.se/downloa=
d/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-23914_5-3.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-23914_5-4.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-23914_5-5.patch \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23916.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;0aaa12d7bd04b0966254f2703ce80dd5c38dbbd7=
6af0297d3d690cdce58a583c&quot;<br>
<br>
-- <br>
2.38.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179676): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179676" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/179676</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98055877/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98055877/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e34f3205f87fb68d--

