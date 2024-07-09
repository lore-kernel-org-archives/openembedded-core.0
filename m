Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDC2C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:29 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.9757.1720520360189039847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 03:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G35Jojhj;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so2511776a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720520359; x=1721125159; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t3pcQW2jbsSJv1mNwN7hy1hvrhJxUxju0Y//mydFkNY=;
        b=G35Jojhj0DB9JzYkUnuG9Y1bN8ssWDB28UBk3+KQOlUsERdHE/LKuEKBv6h0h/jvcJ
         PVS69GB+1idBUks1ZXbl8b+qoLpaR8+wfQc/WoJ2B3QEjl6Z/jYw6vnp+kiJF9w1Hg1N
         tbDdIAJk5sOI358gs/zAzO/j0Ejb/e6q0w4RJf7HAuW/uOJKAiDvzYWO2zYnCUhgD5oF
         87iEMRXrOdF2bkc07sH0WJYDOumcT3IfiFxHu6wsGf6uhAzg9bKucc749O0/HaRjd2q3
         M4hWn4k2M9N1GspeRE8UyRSYSakj3ZaDON5fVoY1PP1z19sOhYfraqFWKLmhTe99X/ew
         1Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720520359; x=1721125159;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3pcQW2jbsSJv1mNwN7hy1hvrhJxUxju0Y//mydFkNY=;
        b=YKDxp56Jkfku2Z9oy9QNHS4TNdmQ360nn0aLzGEBqR/Udoz36My8r5BF/xiexc6Vq2
         ZrtT+mA9xs1N9w+Tp8OLxiveomVsxsSCGvblVwByRa+Moi8zInNU5F70Is/pwFYsGeOA
         qEl9KNinq7Vprepz/5AkhZDr4c5XqQtiMmDbylKDcbN1IcbHCe0+topz+UoIB8yU7htH
         vu0lj6Yagw+Y+9SPuyhNRceXupsJGx2UaTUe7YJLRIquDeUZgGw1AuzI2187yazZIBjr
         rjyFN6TGsxJt9AjHE1MoR5MIk55XAdAGPpB0SkJcQ42LEo7hn4/jEmUD3uas21bIHMhL
         dNoA==
X-Forwarded-Encrypted: i=1; AJvYcCV0H87EWUxRVe/8pFMR5uLEdXMRO8G7Z2CiOXuzDbK3WUj7o2RHaJDN7dt+tIJI3K7V6sdWDrmRgxkFIAndPfjwQkI8CEpihOlrE/RZCe0NmyTl6GwEc6bR
X-Gm-Message-State: AOJu0Yy8r/lmHKQ/OLFcW8ywcKQxjiHu6AujtVTI3fxJU36uuUBosyR0
	I6eZHcK71VRhfnq7yUc3uxIFKsUB7yQi9jt/mcXOS10Iw79pY712HsZnrawOFVFT4UdIOsPOXc+
	gBRyXWeyBjxpxjZU2bjJarv94uPg=
X-Google-Smtp-Source: AGHT+IE+kUIsg9DjpedEp7+wjSlPp3YKmCjH3b75E15CiQ42XBBqqMngtfV26Bec19Eh2lBazXhHIPFv69fXMOajP8I=
X-Received: by 2002:a05:6a20:7f99:b0:1c2:8919:b935 with SMTP id
 adf61e73a8af0-1c29824f1e7mr2511291637.34.1720520359295; Tue, 09 Jul 2024
 03:19:19 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 9 Jul 2024 12:19:07 +0200
Message-ID: <CAApg2=Stragde-5Xk_P2VGNFK0dHxSU628svfvG_-Du1g7uLKg@mail.gmail.com>
Subject: CVE check standalone results for 08/07/2024: world build on OE-core
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000d84171061ccddcd5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 10:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201652

--000000000000d84171061ccddcd5
Content-Type: text/plain; charset="UTF-8"

Hello all,
Here are the results of the CVE-check standalone on the CVE database as of
yesterday's evening. Yesterday the NVD website had real issues, so I
couldn't download the database, will re-try.

This is the first set I'm sending for a world build on OE-core.

Issues for package openssl-native (version 3.3.1):

       Unpatched: CVE-2024-5535
       Count: 1

Issues for package perl-native (version 5.38.2):

       Unpatched: CVE-2023-47039
       Count: 1

Analysis: false positive in the database (wrong version)

Issues for package linux-yocto (version 6.6.35):

       Unpatched: CVE-2021-4440 CVE-2021-46922 CVE-2021-47179
CVE-2021-47239 CVE-2021-47312 CVE-2021-47370 CVE-2021-47436 CVE-2021-47449
CVE-2021-47555 CVE-2021-47595 CVE-2022-48641 CVE-2022-48643 CVE-2022-48649
CVE-2022-48663 CVE-2022
-48671 CVE-2022-48752 CVE-2022-48764 CVE-2023-52525 CVE-2023-52577
CVE-2023-52745 CVE-2024-26626 CVE-2024-26710 CVE-2024-26750 CVE-2024-26780
CVE-2024-26781 CVE-2024-26792 CVE-2024-26794 CVE-2024-26800 CVE-2024-26997
CVE-2024-27023 CVE-
2024-27055 CVE-2024-27411 CVE-2024-35815 CVE-2024-35824 CVE-2024-35957
CVE-2024-35962 CVE-2024-35983 CVE-2024-35996 CVE-2024-36002 CVE-2024-36887
CVE-2024-36962
       Count: 41

Issues for package tiff (version 4.6.0):

       Unpatched: CVE-2023-3618
       Count: 1

Analysis: false positive in the database (wrong version)

Issues for package graphene (version 1.10.8):

       Unpatched: CVE-2024-1984
       Count: 1

Analysis: the issue is in Wordpress theme graphene. Will submit a CPE change

Issues for package binutils-testsuite (version 2.42):

       Unpatched: CVE-2023-25585 CVE-2023-25586 CVE-2023-25588
       Count: 3

Analysis: false positive in the database (wrong version)

Issues for package qemu-system-native (version 9.0.1):

       Unpatched: CVE-2023-1386 CVE-2023-3180 CVE-2023-3354
       Count: 3

Analysis: false positive in the database (wrong version)

Global issue count: 51

--000000000000d84171061ccddcd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)">Hello all,</span></span=
></div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)">Here are the results of the CVE-c=
heck standalone on the CVE database as of yesterday&#39;s evening. Yesterda=
y the NVD website had real issues, so I couldn&#39;t download the database,=
 will re-try.</span></span></div><div><span style=3D"font-family:monospace"=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></s=
pan></span></div><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)">This is the first set I=
&#39;m sending for a world build on OE-core.<br></span></span></div><div><s=
pan style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backgro=
und-color:rgb(255,255,255)"><br></span></span></div><div><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">Issues for package openssl-native (version 3.3.1):
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-5535 =C2=
=A0<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
<br>
<br>Issues for package perl-native (version 5.38.2):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-47039 =
=C2=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>Analysis: false positive in the database (wrong versi=
on)<br></div><div><span style=3D"font-family:monospace"></span></div><span =
style=3D"font-family:monospace">
<br>Issues for package linux-yocto (version 6.6.35):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2021-4440 CVE=
-2021-46922 CVE-2021-47179 CVE-2021-47239 CVE-2021-47312 CVE-2021-47370 CVE=
-2021-47436 CVE-2021-47449 CVE-2021-47555 CVE-2021-47595 CVE-2022-48641 CVE=
-2022-48643 CVE-2022-48649 CVE-2022-48663 CVE-2022<br>-48671 CVE-2022-48752=
 CVE-2022-48764 CVE-2023-52525 CVE-2023-52577 CVE-2023-52745 CVE-2024-26626=
 CVE-2024-26710 CVE-2024-26750 CVE-2024-26780 CVE-2024-26781 CVE-2024-26792=
 CVE-2024-26794 CVE-2024-26800 CVE-2024-26997 CVE-2024-27023 CVE-<br>2024-2=
7055 CVE-2024-27411 CVE-2024-35815 CVE-2024-35824 CVE-2024-35957 CVE-2024-3=
5962 CVE-2024-35983 CVE-2024-35996 CVE-2024-36002 CVE-2024-36887 CVE-2024-3=
6962 =C2=A0<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 41
<br>
<br>Issues for package tiff (version 4.6.0):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-3618 =C2=
=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>Analysis: false positive in the database (wrong versi=
on)<br></div><div><span style=3D"font-family:monospace"></span></div><span =
style=3D"font-family:monospace">
<br>Issues for package graphene (version 1.10.8):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2024-1984 =C2=
=A0<br></span><div><span style=3D"font-family:monospace"> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 1
</span></div><br><div>Analysis: the issue is in Wordpress theme graphene. W=
ill submit a CPE change<br></div><div><span style=3D"font-family:monospace"=
></span></div><span style=3D"font-family:monospace">
<br>Issues for package binutils-testsuite (version 2.42):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-25585 CV=
E-2023-25586 CVE-2023-25588 =C2=A0<br></span><div><span style=3D"font-famil=
y:monospace"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 3
</span></div><br><div>Analysis: false positive in the database (wrong versi=
on)<span style=3D"font-family:monospace"></span></div><span style=3D"font-f=
amily:monospace">
<br>Issues for package qemu-system-native (version 9.0.1):
<br>
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Unpatched: CVE-2023-1386 CVE=
-2023-3180 CVE-2023-3354 =C2=A0<br></span><div><span style=3D"font-family:m=
onospace"> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Count: 3
</span></div><br><div>Analysis: false positive in the database (wrong versi=
on)<span style=3D"font-family:monospace"></span></div><span style=3D"font-f=
amily:monospace">
<br>Global issue count: 51<br>
<br><br></span></div>

--000000000000d84171061ccddcd5--

