Return-Path: <unitexe70@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B177BC282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 05:36:26 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.9498.1740720983563448717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 21:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehpmrrmC;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: unitexe70@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2235c5818a3so31241545ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 21:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740720983; x=1741325783; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y2JDgNwOs0tKMAPzy4VN2qcAR1m02JDudGWhm9i/uzE=;
        b=ehpmrrmCBe/qL+hSFhaiO0Xx7gyy1JmJsp8joDGWi1dNFABBEx6N1PQHYNN6nvJl9p
         102eWXT+2XJe3EBX4f5lCAyYr1tynAhxGwFaaW/oVWiYPcJ8iW+IopQnZbc9fGcT3Yx6
         Rdgum5GGvztmvw8x36DsLcmR5VEtmpuiDtszK5uitfXs00V6v1zQlvxg9CV5WiCeAcLP
         TqvQZO4DopM+PI810yNfUQZ+ssre7ZIFl+ZcJVfxDk1pvScxSDQy7KRRt2Lp02kq02I3
         I1bfoadre0WCw+8AWvpzIDpWaYciRuoYAQcTHPz7NNWyGkgiLYtDZf419pjEWhEGENx/
         XdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740720983; x=1741325783;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2JDgNwOs0tKMAPzy4VN2qcAR1m02JDudGWhm9i/uzE=;
        b=EWOlTQZWw2XuZof9B4/0uDMZyVylGZsgDBhJPrNfs/qDIGyj5xAnIOlmL7LyShSJUR
         xJ9Q48RQ4APJUjT5c97iZi8Qb29ecCnPajd8QoF2LfHOt4oM6WvytwwUx+kjmaPyh2mw
         3cuPDl0JDcHGJwgixgQVnfH0oxgm/sc9GIONWTYzV2tHmo7jArHmwJ856TsY1m3kJI29
         6NCTLqC3FdxBHPHcE6lVHKMx+aUA9M5WSGKJKUY86RtFvY2sPFTHDlXfAscXM4lklrPO
         sKY/5ISKE4GFhGbYsOFl7dO7QFxY9M7erdtn3TF8M+b6dAZzaS7T4OlKr5DaKBZkGAjX
         wgsA==
X-Gm-Message-State: AOJu0YwndHUCnG4j+67Je+V9kIZ0lB3QRKz197nfniDMTh3zT+daLteH
	k9Wl7CE/EzkW83Za45hZNN1wRRLdfR35sHjOacAw71tT0RnYw72/Wg6Y7V+yw5OsdujfEkpxicQ
	Z8TWFTWau41GgjdDuRmw9kLVVIUsmtFMZgfw=
X-Gm-Gg: ASbGncu1Hr2oml53UiONaeDGJexoAERyP9Hbawir0u7UFQt1JyLg2vf8e2f6SlfH8t2
	Y7d74qHzYHxvl+Ck7o8paMMxngt82qKKpSsM6RsR0DLmWs6+o0591hNrcyy7oPNFFDQipnXV9vl
	vrMIOUYw9Ke3sxqqIg5hBXCPd5cJzNJEoeVDlnGv/H
X-Google-Smtp-Source: AGHT+IGBqfZIj6mIw1LUR6Bzi2K/5FtJsbtHFaumfiZwMjSqSSs77Xr2m+kR4f4w2uDTdVcNg4e+NfIiJS1Zz1IYPP0=
X-Received: by 2002:a17:903:1c9:b0:215:7421:262 with SMTP id
 d9443c01a7336-22368fbe712mr34371995ad.12.1740720982332; Thu, 27 Feb 2025
 21:36:22 -0800 (PST)
MIME-Version: 1.0
From: unit exe <unitexe70@gmail.com>
Date: Thu, 27 Feb 2025 23:36:10 -0600
X-Gm-Features: AQ5f1JrlCHzwkkvSZgXw0DugTlREhzFTABTi7OdYrVdUu2zg5lXkbwtosYwpyoE
Message-ID: <CAGqXGjQPi6+Bq1eSFLJ2fusuNv0QQLv9o1ityXLGu5873r875A@mail.gmail.com>
Subject: [OE-core][PATCH] python3-protobuf: upgrade 4.25.3 -> 5.29.3
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ce3002062f2d2fba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 05:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212048

--000000000000ce3002062f2d2fba
Content-Type: text/plain; charset="UTF-8"

Upgrade to the latest release.

* Update PKG-INFO md5 checksum
* Update SRC_URI sha256 checksum

Running a python gRPC server using the latest 1.70 python3 grpc related
recipes in OE master is broken due to import change in protobuf generated
code that I am told was introduced in protobuf v27.

With python3-protobuf_4.25.3 one will run into issues when they run their
gRPC server, for example:

root@radxa-zero-3e:~# python3 /usr/bin/instrument_server.py
Traceback (most recent call last):
  File "/usr/bin/instrument_server.py", line 4, in <module>
    import instrument_pb2
  File "/usr/bin/instrument_pb2.py", line 9, in <module>
    from google.protobuf import runtime_version as _runtime_version
ImportError: cannot import name 'runtime_version' from 'google.protobuf'
(/usr/lib/python3.13/site-packages/google/protobuf/__init__.py)

Signed-off-by: unit exe <unitexe70@gmail.com>
---
 ...{python3-protobuf_4.25.3.bb => python3-protobuf_5.29.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.3.bb =>
python3-protobuf_5.29.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
b/meta-python/recipes-devtools/python/python3-protobuf_5.29.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_5.29.3.bb
index e1dd8e17c7..c146e1eb1e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_5.29.3.bb
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 #
https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = " \
-
 file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d
\
+
 file://PKG-INFO;beginline=8;endline=8;md5=be628fb2c2ba7982037799701e5913bf
\

 file://utf8_range/utf8_range.h;beginline=1;endline=2;md5=f05b3ef36cc354d7134597075a1af64f
\
 "

 inherit pypi setuptools3
-SRC_URI[sha256sum] =
"25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a5492cc5c"
+SRC_URI[sha256sum] =
"5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620"

 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf
protobuf-python"

-- 
2.43.0

--000000000000ce3002062f2d2fba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Upgrade to the latest release.<br><br>* Update PKG-INFO md=
5 checksum<br>* Update SRC_URI sha256 checksum<br><br>Running a python gRPC=
 server using the latest 1.70 python3 grpc related recipes in OE master is =
broken due to import change in protobuf generated code that I am told was i=
ntroduced in protobuf v27.<br><br>With python3-protobuf_4.25.3 one will run=
 into issues when they run their gRPC server, for example:<br><br>root@radx=
a-zero-3e:~# python3 /usr/bin/instrument_server.py<br>Traceback (most recen=
t call last):<br>=C2=A0 File &quot;/usr/bin/instrument_server.py&quot;, lin=
e 4, in &lt;module&gt;<br>=C2=A0 =C2=A0 import instrument_pb2<br>=C2=A0 Fil=
e &quot;/usr/bin/instrument_pb2.py&quot;, line 9, in &lt;module&gt;<br>=C2=
=A0 =C2=A0 from google.protobuf import runtime_version as _runtime_version<=
br>ImportError: cannot import name &#39;runtime_version&#39; from &#39;goog=
le.protobuf&#39; (/usr/lib/python3.13/site-packages/google/protobuf/__init_=
_.py)<br><br>Signed-off-by: unit exe &lt;<a href=3D"mailto:unitexe70@gmail.=
com">unitexe70@gmail.com</a>&gt;<br>---<br>=C2=A0...{<a href=3D"http://pyth=
on3-protobuf_4.25.3.bb">python3-protobuf_4.25.3.bb</a> =3D&gt; <a href=3D"h=
ttp://python3-protobuf_5.29.3.bb">python3-protobuf_5.29.3.bb</a>} | 4 ++--<=
br>=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>=C2=A0rename me=
ta-python/recipes-devtools/python/{<a href=3D"http://python3-protobuf_4.25.=
3.bb">python3-protobuf_4.25.3.bb</a> =3D&gt; <a href=3D"http://python3-prot=
obuf_5.29.3.bb">python3-protobuf_5.29.3.bb</a>} (90%)<br><br>diff --git a/m=
eta-python/recipes-devtools/python/<a href=3D"http://python3-protobuf_4.25.=
3.bb">python3-protobuf_4.25.3.bb</a> b/meta-python/recipes-devtools/python/=
<a href=3D"http://python3-protobuf_5.29.3.bb">python3-protobuf_5.29.3.bb</a=
><br>similarity index 90%<br>rename from meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-protobuf_4.25.3.bb">python3-protobuf_4.25.3.bb<=
/a><br>rename to meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-protobuf_5.29.3.bb">python3-protobuf_5.29.3.bb</a><br>index e1dd8e17c7.=
.c146e1eb1e 100644<br>--- a/meta-python/recipes-devtools/python/<a href=3D"=
http://python3-protobuf_4.25.3.bb">python3-protobuf_4.25.3.bb</a><br>+++ b/=
meta-python/recipes-devtools/python/<a href=3D"http://python3-protobuf_5.29=
.3.bb">python3-protobuf_5.29.3.bb</a><br>@@ -5,12 +5,12 @@ SECTION =3D &quo=
t;devel/python&quot;<br>=C2=A0# <a href=3D"https://github.com/protocolbuffe=
rs/protobuf/blob/main/third_party/utf8_range/LICENSE">https://github.com/pr=
otocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE</a><br>=C2=
=A0LICENSE =3D &quot;BSD-3-Clause &amp; MIT&quot;<br>=C2=A0LIC_FILES_CHKSUM=
 =3D &quot; \<br>- =C2=A0 =C2=A0file://PKG-INFO;beginline=3D8;endline=3D8;m=
d5=3D53dbfa56f61b90215a9f8f0d527c043d \<br>+ =C2=A0 =C2=A0file://PKG-INFO;b=
eginline=3D8;endline=3D8;md5=3Dbe628fb2c2ba7982037799701e5913bf \<br>=C2=A0=
 =C2=A0 =C2=A0file://utf8_range/utf8_range.h;beginline=3D1;endline=3D2;md5=
=3Df05b3ef36cc354d7134597075a1af64f \<br>=C2=A0&quot;<br>=C2=A0<br>=C2=A0in=
herit pypi setuptools3<br>-SRC_URI[sha256sum] =3D &quot;25b5d0b42fd000320bd=
7830b349e3b696435f3b329810427a6bcce6a5492cc5c&quot;<br>+SRC_URI[sha256sum] =
=3D &quot;5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620&=
quot;<br>=C2=A0<br>=C2=A0CVE_PRODUCT +=3D &quot;google:protobuf protobuf:pr=
otobuf google-protobuf protobuf-python&quot;<br>=C2=A0<br>-- <br>2.43.0<br>=
<br></div>

--000000000000ce3002062f2d2fba--

