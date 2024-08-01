Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F253C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 07:49:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.62977.1722498539656852672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 00:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UdTcDqBx;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7104f93a20eso1349982b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 00:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722498538; x=1723103338; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EPJOOt282vJAWNfbxuR8zE815OZ2FOpjAl9OIXrUEgo=;
        b=UdTcDqBx/Pqh1X6TiKzBm6sE91eTJwSQaKu5iLkUl7aWqAstFbDCrbgBfn4Z2OrVaT
         aZXR5HrngEOjlsLwi9vKiiyhPULUhgCRVkSXae4GmP1dy8qBIbaSCkYPkc14jpCG+u5u
         yK1yzP12XT8NuMPUfvSZj8dqF3PnZWu5cTRJwcL7Fb0XyUcr6P+LQZ3dUJhL8nlvsIkN
         QhVVPLAdpW0JGBffCnQ5QqZwH/9Iomk8Oxqz6I2M8uNpet+A8xpDNlGiPV8g7pinISDQ
         5hAp36zzO90uotjn6hUeDTqmRxNvNLwrEQAxeALeP5BcQ2mubE0MrzNUAGM8aqX3EH+1
         st6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722498538; x=1723103338;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPJOOt282vJAWNfbxuR8zE815OZ2FOpjAl9OIXrUEgo=;
        b=n/XFTxewrs10qdj0rpdpTMpVXfemoTWf97/+DChw6pgxNiM8wwSNtCi5Dpma1HsMon
         /xDNMa+5D7Ld1WMoLF+rSZrzJQQfINfbVNjJvOKk/bLD5mULi3xFUXnHxy1C9PwjmQXj
         sVmHjv4oU4XXOqtmvH0loNGPZASVi/ut+46cfi5vEZf7YH1yP49aa0aPWmpoGiDjtDif
         joBtFC9v0q3QOhTt6+M3uLQYOSVL3YhithDqcAP73bCVRaj4iJly8HmPdlfhymFOPRST
         Eha9+ZpWKKbNqiPyXUIAtSMl3q3rRBvEPgEqCbDZcZfa+4NEm0lJJx49Plz9/Kaz4a+1
         ui4g==
X-Gm-Message-State: AOJu0YwMul1tqHAQINGPqmJttPq0a/5YkWNZsLzQsdS0Dw666mVQ0Xtn
	eEzlcKk/Qa8wDdOcQt1NGWFOBcWRD7qkLw9cvtu9rsrnvSKW/LA4ldUNSPYcGLYiG3wPWaYH8l2
	CDhCdhiYJXdtsVmf3ct2cs66cv0cykaY6
X-Google-Smtp-Source: AGHT+IFjZ15E8+wUMBZuMne9+oRCvmZ34+2d/NGi1ONiTn6qxE8cQ/i89/rAS0N4bDIdrc1l8VFzqy2UEJBi41pqKXw=
X-Received: by 2002:a05:6a00:6f23:b0:705:a13b:e740 with SMTP id
 d2e1a72fcca58-7105d7bc4cdmr1727408b3a.19.1722498538494; Thu, 01 Aug 2024
 00:48:58 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 1 Aug 2024 09:48:47 +0200
Message-ID: <CAApg2=QM7Xeo0U8sKBVLj3wk854JHvzk06e4PwkVhDJKbcNz+w@mail.gmail.com>
Subject: CVE check using the CVE database: master branch on July 31, 2024
To: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000836706061e9a719a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 07:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202726

--000000000000836706061e9a719a
Content-Type: text/plain; charset="UTF-8"

Hello all,
Here are the results, annotated.

Issues for package openssl-native (version 3.3.1):

       Unpatched: CVE-2024-5535
       Count: 1

Will be fixed by 3.3.2

Issues for package perl-native (version 5.38.2):

       Unpatched: CVE-2023-47039
       Count: 1

Windows, and before 3.52.1. CVE database has an issue: marked as default
status affected (will be fixed in overrides)

Issues for package bind (version 9.18.27):

       Unpatched: CVE-2024-0760 CVE-2024-1737 CVE-2024-1975 CVE-2024-4076
       Count: 4

New vulnerabilities, patch pending on the ML (update to 9.18.28)

Issues for package linux-yocto (version 6.6.35):

       Unpatched: CVE-2024-1086 CVE-2024-40993
       Count: 2

Kernel update needed

Issues for package orc-native (version 0.4.38):

       Unpatched: CVE-2024-40897
       Count: 1

Update needed to 0.4.39

Issues for package tiff (version 4.6.0):

       Unpatched: CVE-2023-3618
       Count: 1

False positive, CVE entry issue, will be fixed in overrides.

Issues for package graphene (version 1.10.8):

       Unpatched: CVE-2024-1984
       Count: 1

False positive, different package is affected, will be fixed.

Issues for package libarchive-native (version 3.7.4):

       Unpatched: CVE-2024-37407
       Count: 1

ADP entry issue, will be fixed in overrides.

Issues for package binutils-testsuite (version 2.42):

       Unpatched: CVE-2023-25585 CVE-2023-25586 CVE-2023-25588
       Count: 3

CVE entry issues, marked affected by default, will be fixed in overrides

Issues for package qemu-system-native (version 9.0.1):

       Unpatched: CVE-2023-1386 CVE-2023-3180 CVE-2023-3354
       Count: 3

CVE entry issues, marked affected by default, will be fixed in overrides

Issues for package curl-native (version 8.8.0):

       Unpatched: CVE-2024-6197 CVE-2024-6874 CVE-2024-7264
       Count: 3


Upgrade needed to 8.9.0

Global issue count: 21

--000000000000836706061e9a719a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)">Hello all,</span></span=
></div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)">Here are the results, annotated.<=
br></span></span></div><div><span style=3D"font-family:monospace"><span sty=
le=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span=
></div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)">Issues for package openssl-native=
 (version 3.3.1):
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-5535 =C2=
=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>Will be fixed by 3.3.2</div><div><span style=3D"font-=
family:monospace"></span></div><span style=3D"font-family:monospace">
<br>Issues for package perl-native (version 5.38.2):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-47039 =
=C2=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>Windows, and before 3.52.1. CVE database has an issue=
: marked as default status affected (will be fixed in overrides)<br></div><=
div><span style=3D"font-family:monospace"></span></div><span style=3D"font-=
family:monospace">
<br>Issues for package bind (version 9.18.27):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-0760 CVE=
-2024-1737 CVE-2024-1975 CVE-2024-4076 =C2=A0<br></span><div><span style=3D=
"font-family:monospace"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 4
</span></div><br><div>New vulnerabilities, patch pending on the ML (update =
to 9.18.28)<br></div><div><span style=3D"font-family:monospace"></span></di=
v><span style=3D"font-family:monospace">
<br>Issues for package linux-yocto (version 6.6.35):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-1086 CVE=
-2024-40993 =C2=A0<br></span><div><span style=3D"font-family:monospace"> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 2
</span></div><br><div>Kernel update needed<br></div><div><span style=3D"fon=
t-family:monospace"></span></div><span style=3D"font-family:monospace">
<br>Issues for package orc-native (version 0.4.38):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-40897 =
=C2=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>Update needed to <span style=3D"font-family:monospace=
"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">0.4.39=
</span><br></span></div><div><span style=3D"font-family:monospace"></span><=
/div><span style=3D"font-family:monospace">
<br>Issues for package tiff (version 4.6.0):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-3618 =C2=
=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>False positive, CVE entry issue, will be fixed in ove=
rrides.<br></div><div><span style=3D"font-family:monospace"></span></div><s=
pan style=3D"font-family:monospace">
<br>Issues for package graphene (version 1.10.8):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-1984 =C2=
=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>False positive, different package is affected, will b=
e fixed.<br></div><div><span style=3D"font-family:monospace"></span></div><=
span style=3D"font-family:monospace">
<br>Issues for package libarchive-native (version 3.7.4):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-37407 =
=C2=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>ADP entry issue, will be fixed in overrides.<br></div=
><div><span style=3D"font-family:monospace"></span></div><span style=3D"fon=
t-family:monospace">
<br>Issues for package binutils-testsuite (version 2.42):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-25585 CV=
E-2023-25586 CVE-2023-25588 =C2=A0<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0Count: 3
<br></span><div><br></div><div>CVE entry issues, marked affected by default=
, will be fixed in overrides<br></div><div><br></div><span style=3D"font-fa=
mily:monospace">Issues for package qemu-system-native (version 9.0.1):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-1386 CVE=
-2023-3180 CVE-2023-3354 =C2=A0<br></span><div><span style=3D"font-family:m=
onospace"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 3
</span></div><br><div>CVE entry issues, marked affected by default, will be=
 fixed in overrides<span style=3D"font-family:monospace"></span></div><span=
 style=3D"font-family:monospace">
<br>Issues for package curl-native (version 8.8.0):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-6197 CVE=
-2024-6874 CVE-2024-7264 =C2=A0<br></span><div><span style=3D"font-family:m=
onospace"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 3
</span></div><br><div><br></div><div>Upgrade needed to 8.9.0<br></div><div>=
<span style=3D"font-family:monospace"></span></div><span style=3D"font-fami=
ly:monospace">
<br>Global issue count: 21<br>
<br><br></span></div>

--000000000000836706061e9a719a--

