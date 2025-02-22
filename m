Return-Path: <unitexe70@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C18EC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 23:05:46 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.56724.1740265539789355111
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Feb 2025 15:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wt3MJ5bp;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: unitexe70@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so7513871a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 15:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740265539; x=1740870339; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tf+P7+Wp7YlpQrhho20TINTPfAj8bDSjV39WfKh6aVw=;
        b=Wt3MJ5bpvQ9RGXXEhElDXV/eTKjT1l9saa5KegnApOu30FgLcFP8bxxHR1TWSAR5KS
         qyB7Ff86BpUGy3U0G8Yp6h2ata5XQ2f3danGXfNZ++ul/1/d2De70JSK8oN+Hw0/RW8/
         cYrJQo+MobsTuNeqDJi5uRfKtewoJ4Lxit1FlTEKU1q+KgJF7lm9FFuOkFI5rafiYKO+
         9HxugagD/wbqkQFb0aRcFaiEPYM2aTJ4ycA/3x12pYy0n35fx8SgGKlwk2rvBzALUTOA
         JEwLUlGztzdiPkjr7qToAL1Y/Yq0Iaxcyl696isQcQiZ2OzT5IZDUzQYhRcwtpBfU8KI
         UEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740265539; x=1740870339;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tf+P7+Wp7YlpQrhho20TINTPfAj8bDSjV39WfKh6aVw=;
        b=Rpy12qzvSIwHTSbo3a+zbJqXMAFEpJTabogj+UaKKRF2eIb4e/+vMpLtYIeLNONpot
         xID//FYz4ShqT/51/YFyyeDI4O9/FaQT0ifGVwuoAwRVVj565LPmeBVPm3LDEnal4cEg
         Iu1Z7SJAT7uueVmjnGu1S3Sm5q/tUdO4ApH448anWsRTVci8rcgcKdFtGG4NQnA3yPAF
         WcT/KEM1VuqFys+LR6/ftAX/3KDHc+z/NBeBltJBzLMhXT1Hg6gPZVxfG1HUWZNd/67E
         3Q8Zfs/4I8L9DuUmsbQ6tK8bHwsTE/lCcmVOEsfhU1b1I4tUCKn3pXjN3UGRC3AjT+mE
         bBMw==
X-Gm-Message-State: AOJu0YyCXfiw0DlBQgDVCYVG7gh60W6z7/X6mV5SUZjYMCCy8T3i806r
	LKauNOSAicRSeYtj/C9UXqrN9A16xqDuJe3/Lj1hiXbp47z09ZkJve0xs+3c1PaT/3zHKe7O4b3
	H0+qtf2gEy8lFFJHu5OfmNzVyardE1Q0hyo8=
X-Gm-Gg: ASbGncvwULxgipWOmIvfSNX5F/CHdA2HeFKO/XndgW06TP+wYfirhwYD9vSk2+H9Bkp
	An0VN4+BDfPnPNjTf9ImNOVG0qo1AP7v0XVxMA2bgN0evsaXNxDr5MkN9y7G/gWNoDIvK+qIN/f
	ykBWEGrC5j1tpTZ1jRMns06y3j1o0kRqvgendvPX5h
X-Google-Smtp-Source: AGHT+IFzHt1L7s2fIeYIqU3Sujqe641FdNyF3m1ItyI4ZY+iJGO83ZB8mP7IasbGlE2bfeiXgwk1i4a6whDU8u25wQo=
X-Received: by 2002:a17:90b:3b8a:b0:2ee:823e:39c4 with SMTP id
 98e67ed59e1d1-2fce7ae9547mr13906180a91.7.1740265538618; Sat, 22 Feb 2025
 15:05:38 -0800 (PST)
MIME-Version: 1.0
From: unit exe <unitexe70@gmail.com>
Date: Sat, 22 Feb 2025 17:05:27 -0600
X-Gm-Features: AWEUYZneaRI1v-_gNqgPRWXtsApkc0OtK6vcqCAPrSCAjrjIpc_2ZF9p5b5ScwE
Message-ID: <CAGqXGjRc_f+zs4aK_k9_tnJ55-UgedCLbuME08naD2u1DJqDVQ@mail.gmail.com>
Subject: Broken python3-grpcio on main branch
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003e8ec4062ec32590"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 23:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211821

--0000000000003e8ec4062ec32590
Content-Type: text/plain; charset="UTF-8"

Hello,

I am building with the main branch of meta-openembedded
commit 29897344f7c9846e00856f46c4b3b47117a69499 and trying to import the
grpc python module. This results in this error:

root@radxa-zero-3e:~# python3
Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import grpc
Traceback (most recent call last):
  File "<python-input-0>", line 1, in <module>
    import grpc
  File "/usr/lib/python3.13/site-packages/grpc/__init__.py", line 22, in
<module>
    from grpc import _compression
  File "/usr/lib/python3.13/site-packages/grpc/_compression.py", line 20,
in <module>
    from grpc._cython import cygrpc
ImportError: /usr/lib/python3.13/site-packages/grpc/_cython/
cygrpc.cpython-313-aarch64-linux-gnu.so: undefined symbol:
_ZN4absl12lts_2024072212log_internal17kUnsignedCharNullE

I see this error on rpi5 too. If I build with the styhead branch (uses
grpcio 1.66 instead of 1.70) I get no such error.

Any suggestions on how to fix this or debug the issue further?

--0000000000003e8ec4062ec32590
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I am building with th=
e main branch of meta-openembedded commit=C2=A029897344f7c9846e00856f46c4b3=
b47117a69499 and trying to import the grpc python module. This results in t=
his error:</div><div><br></div><div>root@radxa-zero-3e:~# python3<br>Python=
 3.13.2 (main, Feb =C2=A04 2025, 14:51:09) [GCC 14.2.0] on linux<br>Type &q=
uot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;license=
&quot; for more information.<br>&gt;&gt;&gt; import grpc<br>Traceback (most=
 recent call last):<br>=C2=A0 File &quot;&lt;python-input-0&gt;&quot;, line=
 1, in &lt;module&gt;<br>=C2=A0 =C2=A0 import grpc<br>=C2=A0 File &quot;/us=
r/lib/python3.13/site-packages/grpc/__init__.py&quot;, line 22, in &lt;modu=
le&gt;<br>=C2=A0 =C2=A0 from grpc import _compression<br>=C2=A0 File &quot;=
/usr/lib/python3.13/site-packages/grpc/_compression.py&quot;, line 20, in &=
lt;module&gt;<br>=C2=A0 =C2=A0 from grpc._cython import cygrpc<br>ImportErr=
or: /usr/lib/python3.13/site-packages/grpc/_cython/<a href=3D"http://cygrpc=
.cpython-313-aarch64-linux-gnu.so">cygrpc.cpython-313-aarch64-linux-gnu.so<=
/a>: undefined symbol: _ZN4absl12lts_2024072212log_internal17kUnsignedCharN=
ullE<br></div><div><br></div><div>I see this error on rpi5 too. If I build =
with the styhead branch (uses grpcio 1.66 instead of 1.70) I get no such er=
ror.</div><div><br></div><div>Any suggestions on how to fix this or debug t=
he issue further?</div></div>

--0000000000003e8ec4062ec32590--

