Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B91C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:42:32 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.105417.1680622948661156175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 08:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IXXcazP2;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: badganchipv@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54606036bb3so456035237b3.6
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680622948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7oKAQZnPwdIPML7GB8bFKmymly7JdUvDQeRBoPxdIgo=;
        b=IXXcazP29gX4phenrbVkg7yuGvVBJcsJdwmzg3jwgJUdMechUWHp0zsv2197r8GuOD
         ffqFhIwoGpGWAQ2foJJpE0MxN90papaOz0ajcJlnkLqynRta4aKz80WHHeu3y7amiRRT
         XR4KC9hC38I4Z5LCc/XUsL5blIO/8stncS0mZBWu4+SyY3cwlcCvoDXdMY3XdLrPY2Ke
         2NvFxs62T7he4ZTUZYf/dMcPGoJWS/uN4V/Oxr+O84f935GcpcqdRyTm/D5yWO7w+vGK
         CjnIO9KpBsBNG7ae7pgqML+2V9gM1I+qfWkdH8oUh9gjNHz188Ba42J2EKGbJ6m6OI/T
         aOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oKAQZnPwdIPML7GB8bFKmymly7JdUvDQeRBoPxdIgo=;
        b=wEzrm/Ut0ueVzknM/kueH/zoYSQ+cnjXyhj2WwatAqTBAnbJJsQsQcyWgnhPADhJH6
         Ot2MKl62ypDVeYYHVh9hubF0Mp46fuwyXgZLaV8ZnOfvKWcZl1yYJlpackcu9GVXVYna
         hHMNrAW4YVzOQs/4BP/wO6rcYa7eyTY20pULYR/euqIWJCeUZIHDwXWS+o1vr2uB9j3m
         yWJ812Icw6BtbWhPMZtXh0UKlF4zrl4rxWvu2adRzZhK9a4LrzZjMtKoru4nlkIIHCkQ
         RoOHK1yBelvfpfE/ygA5QMu1JTq7Bfg6z/Zk292UfAMevbOoO+WiD+4mng2HaaraoKAZ
         /HeQ==
X-Gm-Message-State: AAQBX9dNrIG5zCsprN1UIcEQdmp5E541HfL5Dvke1tpUpbHijZdfl3rW
	ZyjySsPh0tGOg3UiaUmetKxdvFpc+uIo+9gZE2NDvV0d
X-Google-Smtp-Source: AKy350Zt5t4CpwGEaY44jMC942FvCEfys+8beQfQfzEy4/md+CYpBrs7dRliwDoIHzaNfsZXkmnwI3Q26k7Is/J78gY=
X-Received: by 2002:a81:8b52:0:b0:544:b9b2:5c32 with SMTP id
 e18-20020a818b52000000b00544b9b25c32mr1626800ywk.7.1680622946895; Tue, 04 Apr
 2023 08:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230404133718.50343-1-badganchipv@gmail.com> <CAOSpxdaQkNHiZyjdEaEUK4LUwDoq7R80Np2po-44_keE8BmNfQ@mail.gmail.com>
In-Reply-To: <CAOSpxdaQkNHiZyjdEaEUK4LUwDoq7R80Np2po-44_keE8BmNfQ@mail.gmail.com>
From: Pawan Badganchi <badganchipv@gmail.com>
Date: Tue, 4 Apr 2023 21:12:15 +0530
Message-ID: <CACVpDM=5V-_ob8MvU6QdCtT+F24h5BEp4G2ENS2nnivNgZh6FA@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] curl: Add fix for CVE-2023-23916
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: multipart/alternative; boundary="000000000000c04b7205f8848574"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179701

--000000000000c04b7205f8848574
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Noted, Thanks.

On Tue, 4 Apr, 2023, 8:53 pm Steve Sakoman, <steve@sakoman.com> wrote:

> This seems to fix the fuzz issue, I'll add the patch to my queue for
> autobuilder testing.
>
> For future patches there is no need for [meta] in the subject line.
> Just something like "[OE-core][kirkstone][PATCH] curl: Add fix for
> CVE-2023-23916" is perfect.
>
> Also when you are sending multiple versions of the patch use something
> like: "[OE-core][kirkstone][PATCH v2] curl: Add fix for
> CVE-2023-23916" and include a comment after the line with three dashes
> describing the changes in this version.  See below for example.
>
> Steve
>
> On Tue, Apr 4, 2023 at 3:37=E2=80=AFAM Pawan Badganchi <badganchipv@gmail=
.com>
> wrote:
> >
> > Add below patch to fix CVE-2023-23916
> >
> > CVE-2023-23916.patch
> >
> > Link: https://curl.se/docs/CVE-2023-23916.html
> >
> > Signed-off-by: pawan <badganchipv@gmail.com>
> > ---
> V2: fix fuzz errors
>
> >  .../curl/curl/CVE-2023-23916.patch            | 219 ++++++++++++++++++
> >  meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
> >  2 files changed, 220 insertions(+)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> > new file mode 100644
> > index 0000000000..a57d275902
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
> > @@ -0,0 +1,219 @@
> > +From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001
> > +From: Patrick Monnerat <patrick@monnerat.net>
> > +Date: Mon, 13 Feb 2023 08:33:09 +0100
> > +Subject: [PATCH] content_encoding: do not reset stage counter for each
> header
> > +
> > +Test 418 verifies
> > +
> > +Closes #10492
> > +
> > +CVE: CVE-2023-23916
> > +Upstream-Status: Backport [
> https://github.com/curl/curl/commit/119fb187192a9ea13dc.patch]
> > +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> > +---
> > + lib/content_encoding.c  |   7 +-
> > + lib/urldata.h           |   1 +
> > + tests/data/Makefile.inc |   2 +-
> > + tests/data/test387      |   2 +-
> > + tests/data/test418      | 152 +++++++++++++++++++++++++++++++++++++++=
+
> > + 5 files changed, 158 insertions(+), 6 deletions(-)
> > + create mode 100644 tests/data/test418
> > +
> > +--- a/lib/content_encoding.c
> > ++++ b/lib/content_encoding.c
> > +@@ -1037,7 +1037,6 @@ CURLcode Curl_build_unencoding_stack(str
> > +                                      const char *enclist, int
> maybechunked)
> > + {
> > +   struct SingleRequest *k =3D &data->req;
> > +-  int counter =3D 0;
> > +
> > +   do {
> > +     const char *name;
> > +@@ -1072,9 +1071,9 @@ CURLcode Curl_build_unencoding_stack(str
> > +       if(!encoding)
> > +         encoding =3D &error_encoding;  /* Defer error at stack use. *=
/
> > +
> > +-      if(++counter >=3D MAX_ENCODE_STACK) {
> > +-        failf(data, "Reject response due to %u content encodings",
> > +-              counter);
> > ++      if(k->writer_stack_depth++ >=3D MAX_ENCODE_STACK) {
> > ++        failf(data, "Reject response due to more than %u content
> encodings",
> > ++              MAX_ENCODE_STACK);
> > +         return CURLE_BAD_CONTENT_ENCODING;
> > +       }
> > +       /* Stack the unencoding stage. */
> > +--- a/lib/urldata.h
> > ++++ b/lib/urldata.h
> > +@@ -682,6 +682,7 @@ struct SingleRequest {
> > +   struct dohdata *doh; /* DoH specific data for this request */
> > + #endif
> > +   unsigned char setcookies;
> > ++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
> > +   BIT(header);        /* incoming data has HTTP header */
> > +   BIT(content_range); /* set TRUE if Content-Range: was found */
> > +   BIT(upload_done);   /* set to TRUE when doing chunked
> transfer-encoding
> > +--- a/tests/data/Makefile.inc
> > ++++ b/tests/data/Makefile.inc
> > +@@ -69,6 +69,7 @@
> > + \
> > + test400 test401 test402 test403 test404 test405 test406 test407
> test408 \
> > + test409 test410 \
> > ++test418 \
> > + \
> > + test430 test431 test432 test433 test434 test435 test436 \
> > + \
> > +--- /dev/null
> > ++++ b/tests/data/test418
> > +@@ -0,0 +1,152 @@
> > ++<testcase>
> > ++<info>
> > ++<keywords>
> > ++HTTP
> > ++gzip
> > ++</keywords>
> > ++</info>
> > ++
> > ++#
> > ++# Server-side
> > ++<reply>
> > ++<data nocheck=3D"yes">
> > ++HTTP/1.1 200 OK
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++Transfer-Encoding: gzip
> > ++
> > ++-foo-
> > ++</data>
> > ++</reply>
> > ++
> > ++#
> > ++# Client-side
> > ++<client>
> > ++<server>
> > ++http
> > ++</server>
> > ++ <name>
> > ++Response with multiple Transfer-Encoding headers
> > ++ </name>
> > ++ <command>
> > ++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS
> > ++</command>
> > ++</client>
> > ++
> > ++#
> > ++# Verify data after the test has been "shot"
> > ++<verify>
> > ++<protocol crlf=3D"yes">
> > ++GET /%TESTNUMBER HTTP/1.1
> > ++Host: %HOSTIP:%HTTPPORT
> > ++User-Agent: curl/%VERSION
> > ++Accept: */*
> > ++
> > ++</protocol>
> > ++
> > ++# CURLE_BAD_CONTENT_ENCODING is 61
> > ++<errorcode>
> > ++61
> > ++</errorcode>
> > ++<stderr mode=3D"text">
> > ++curl: (61) Reject response due to more than 5 content encodings
> > ++</stderr>
> > ++</verify>
> > ++</testcase>
> > diff --git a/meta/recipes-support/curl/curl_7.82.0.bb
> b/meta/recipes-support/curl/curl_7.82.0.bb
> > index b583060889..945745cdde 100644
> > --- a/meta/recipes-support/curl/curl_7.82.0.bb
> > +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> > @@ -39,6 +39,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
> >             file://CVE-2023-23914_5-3.patch \
> >             file://CVE-2023-23914_5-4.patch \
> >             file://CVE-2023-23914_5-5.patch \
> > +           file://CVE-2023-23916.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
> >
> > --
> > 2.38.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179689):
> https://lists.openembedded.org/g/openembedded-core/message/179689
> > Mute This Topic: https://lists.openembedded.org/mt/98055877/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000c04b7205f8848574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Noted, Thanks.</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, 4 Apr, 2023, 8:53 pm Steve Sakoman,=
 &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">This seems to fix the fuzz issue, I=
&#39;ll add the patch to my queue for<br>
autobuilder testing.<br>
<br>
For future patches there is no need for [meta] in the subject line.<br>
Just something like &quot;[OE-core][kirkstone][PATCH] curl: Add fix for<br>
CVE-2023-23916&quot; is perfect.<br>
<br>
Also when you are sending multiple versions of the patch use something<br>
like: &quot;[OE-core][kirkstone][PATCH v2] curl: Add fix for<br>
CVE-2023-23916&quot; and include a comment after the line with three dashes=
<br>
describing the changes in this version.=C2=A0 See below for example.<br>
<br>
Steve<br>
<br>
On Tue, Apr 4, 2023 at 3:37=E2=80=AFAM Pawan Badganchi &lt;<a href=3D"mailt=
o:badganchipv@gmail.com" target=3D"_blank" rel=3D"noreferrer">badganchipv@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add below patch to fix CVE-2023-23916<br>
&gt;<br>
&gt; CVE-2023-23916.patch<br>
&gt;<br>
&gt; Link: <a href=3D"https://curl.se/docs/CVE-2023-23916.html" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://curl.se/docs/CVE-2023-23916.ht=
ml</a><br>
&gt;<br>
&gt; Signed-off-by: pawan &lt;<a href=3D"mailto:badganchipv@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">badganchipv@gmail.com</a>&gt;<br>
&gt; ---<br>
V2: fix fuzz errors<br>
<br>
&gt;=C2=A0 .../curl/curl/CVE-2023-23916.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 219 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 220 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/met=
a/recipes-support/curl/curl/CVE-2023-23916.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a57d275902<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch<br>
&gt; @@ -0,0 +1,219 @@<br>
&gt; +From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Patrick Monnerat &lt;<a href=3D"mailto:patrick@monnerat.net" ta=
rget=3D"_blank" rel=3D"noreferrer">patrick@monnerat.net</a>&gt;<br>
&gt; +Date: Mon, 13 Feb 2023 08:33:09 +0100<br>
&gt; +Subject: [PATCH] content_encoding: do not reset stage counter for eac=
h header<br>
&gt; +<br>
&gt; +Test 418 verifies<br>
&gt; +<br>
&gt; +Closes #10492<br>
&gt; +<br>
&gt; +CVE: CVE-2023-23916<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/119fb187192a9ea13dc.patch" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/curl/curl/commit/119fb187192a9ea13dc.patch</a>]<br>
&gt; +Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:Pawan.Badganchi@=
kpit.com" target=3D"_blank" rel=3D"noreferrer">Pawan.Badganchi@kpit.com</a>=
&gt;<br>
&gt; +---<br>
&gt; + lib/content_encoding.c=C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt; + lib/urldata.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
&gt; + tests/data/Makefile.inc |=C2=A0 =C2=A02 +-<br>
&gt; + tests/data/test387=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; + tests/data/test418=C2=A0 =C2=A0 =C2=A0 | 152 +++++++++++++++++++++++=
+++++++++++++++++<br>
&gt; + 5 files changed, 158 insertions(+), 6 deletions(-)<br>
&gt; + create mode 100644 tests/data/test418<br>
&gt; +<br>
&gt; +--- a/lib/content_encoding.c<br>
&gt; ++++ b/lib/content_encoding.c<br>
&gt; +@@ -1037,7 +1037,6 @@ CURLcode Curl_build_unencoding_stack(str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char =
*enclist, int maybechunked)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0struct SingleRequest *k =3D &amp;data-&gt;req;<br>
&gt; +-=C2=A0 int counter =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +@@ -1072,9 +1071,9 @@ CURLcode Curl_build_unencoding_stack(str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(!encoding)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0encoding =3D &amp;error_encoding;=
=C2=A0 /* Defer error at stack use. */<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if(++counter &gt;=3D MAX_ENCODE_STACK) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 failf(data, &quot;Reject response due to=
 %u content encodings&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if(k-&gt;writer_stack_depth++ &gt;=3D MAX_ENCOD=
E_STACK) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 failf(data, &quot;Reject response due to=
 more than %u content encodings&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAX_ENCODE_STACK);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CURLE_BAD_CONTENT_ENCODING;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Stack the unencoding stage. */<br>
&gt; +--- a/lib/urldata.h<br>
&gt; ++++ b/lib/urldata.h<br>
&gt; +@@ -682,6 +682,7 @@ struct SingleRequest {<br>
&gt; +=C2=A0 =C2=A0struct dohdata *doh; /* DoH specific data for this reque=
st */<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0unsigned char setcookies;<br>
&gt; ++=C2=A0 unsigned char writer_stack_depth; /* Unencoding stack depth. =
*/<br>
&gt; +=C2=A0 =C2=A0BIT(header);=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* incoming data=
 has HTTP header */<br>
&gt; +=C2=A0 =C2=A0BIT(content_range); /* set TRUE if Content-Range: was fo=
und */<br>
&gt; +=C2=A0 =C2=A0BIT(upload_done);=C2=A0 =C2=A0/* set to TRUE when doing =
chunked transfer-encoding<br>
&gt; +--- a/tests/data/Makefile.inc<br>
&gt; ++++ b/tests/data/Makefile.inc<br>
&gt; +@@ -69,6 +69,7 @@<br>
&gt; + \<br>
&gt; + test400 test401 test402 test403 test404 test405 test406 test407 test=
408 \<br>
&gt; + test409 test410 \<br>
&gt; ++test418 \<br>
&gt; + \<br>
&gt; + test430 test431 test432 test433 test434 test435 test436 \<br>
&gt; + \<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/data/test418<br>
&gt; +@@ -0,0 +1,152 @@<br>
&gt; ++&lt;testcase&gt;<br>
&gt; ++&lt;info&gt;<br>
&gt; ++&lt;keywords&gt;<br>
&gt; ++HTTP<br>
&gt; ++gzip<br>
&gt; ++&lt;/keywords&gt;<br>
&gt; ++&lt;/info&gt;<br>
&gt; ++<br>
&gt; ++#<br>
&gt; ++# Server-side<br>
&gt; ++&lt;reply&gt;<br>
&gt; ++&lt;data nocheck=3D&quot;yes&quot;&gt;<br>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++Transfer-Encoding: gzip<br>
&gt; ++<br>
&gt; ++-foo-<br>
&gt; ++&lt;/data&gt;<br>
&gt; ++&lt;/reply&gt;<br>
&gt; ++<br>
&gt; ++#<br>
&gt; ++# Client-side<br>
&gt; ++&lt;client&gt;<br>
&gt; ++&lt;server&gt;<br>
&gt; ++http<br>
&gt; ++&lt;/server&gt;<br>
&gt; ++ &lt;name&gt;<br>
&gt; ++Response with multiple Transfer-Encoding headers<br>
&gt; ++ &lt;/name&gt;<br>
&gt; ++ &lt;command&gt;<br>
&gt; ++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS<br>
&gt; ++&lt;/command&gt;<br>
&gt; ++&lt;/client&gt;<br>
&gt; ++<br>
&gt; ++#<br>
&gt; ++# Verify data after the test has been &quot;shot&quot;<br>
&gt; ++&lt;verify&gt;<br>
&gt; ++&lt;protocol crlf=3D&quot;yes&quot;&gt;<br>
&gt; ++GET /%TESTNUMBER HTTP/1.1<br>
&gt; ++Host: %HOSTIP:%HTTPPORT<br>
&gt; ++User-Agent: curl/%VERSION<br>
&gt; ++Accept: */*<br>
&gt; ++<br>
&gt; ++&lt;/protocol&gt;<br>
&gt; ++<br>
&gt; ++# CURLE_BAD_CONTENT_ENCODING is 61<br>
&gt; ++&lt;errorcode&gt;<br>
&gt; ++61<br>
&gt; ++&lt;/errorcode&gt;<br>
&gt; ++&lt;stderr mode=3D&quot;text&quot;&gt;<br>
&gt; ++curl: (61) Reject response due to more than 5 content encodings<br>
&gt; ++&lt;/stderr&gt;<br>
&gt; ++&lt;/verify&gt;<br>
&gt; ++&lt;/testcase&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a> b/met=
a/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"noreferrer =
noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; index b583060889..945745cdde 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; @@ -39,6 +39,7 @@ SRC_URI =3D &quot;<a href=3D"https://curl.se/downloa=
d/$%7BBP%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/curl.se/download/${BP}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23914_5=
-3.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23914_5=
-4.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23914_5=
-5.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-23916.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;0aaa12d7bd04b0966254f2703ce80dd5c38=
dbbd76af0297d3d690cdce58a583c&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179689): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179689" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1796=
89</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98055877=
/3620601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/98055877/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sako=
man.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000c04b7205f8848574--

