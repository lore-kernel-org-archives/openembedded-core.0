Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E513C25B79
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:32:25 +0000 (UTC)
Subject: Re: [PATCH] glibc: stable 2.39 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.250.57)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 17 May 2024 09:32:20 -0700
References: <20240517161700.3933511-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240517161700.3933511-1-sundeep.kokkonda@windriver.com>
Message-ID: <17778.1715963540561602226@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qt9b0NiXHdI1V7eEQwuo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199521

--qt9b0NiXHdI1V7eEQwuo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the results:

Before glibc update:
-------------------------------------------------
Recipe =C2=A0 =C2=A0 =C2=A0 | Passed =C2=A0 =C2=A0 | Failed =C2=A0 | Skippe=
d =C2=A0|
-------------------------------------------------
glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5041 =C2=A0 =C2=A0 =C2=A0 | 123 =C2=A0 =
=C2=A0 =C2=A0| 156 =C2=A0 =C2=A0 =C2=A0|
glibc-user =C2=A0 | 4854 =C2=A0 =C2=A0 =C2=A0 | 239 =C2=A0 =C2=A0 =C2=A0| 2=
27 =C2=A0 =C2=A0 =C2=A0|
-------------------------------------------------

After glibc update:
-------------------------------------------------
Recipe =C2=A0 =C2=A0 =C2=A0 | Passed =C2=A0 =C2=A0 | Failed =C2=A0 | Skippe=
d =C2=A0|
-------------------------------------------------
glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5043 =C2=A0 =C2=A0 =C2=A0 | 123 =C2=A0 =
=C2=A0 =C2=A0| 156 =C2=A0 =C2=A0 =C2=A0|
glibc-user =C2=A0 | 4863 =C2=A0 =C2=A0 =C2=A0 | 232 =C2=A0 =C2=A0 =C2=A0| 2=
27 =C2=A0 =C2=A0 =C2=A0|
-------------------------------------------------

ptest shows below tests as failed after glibc update:
tst-robustpi7, tst-tsearch, tst-dynarray-fail-mem, tst-loading, mtrace-tst-=
loading

--qt9b0NiXHdI1V7eEQwuo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the results:<br /><br /><span styl=
e=3D"text-decoration: underline;">Before glibc update:</span><br />--------=
-----------------------------------------<br />Recipe &nbsp; &nbsp; &nbsp; =
| Passed &nbsp; &nbsp; | Failed &nbsp; | Skipped &nbsp;|<br />-------------=
------------------------------------<br />glibc &nbsp; &nbsp; &nbsp; &nbsp;=
| 5041 &nbsp; &nbsp; &nbsp; | 123 &nbsp; &nbsp; &nbsp;| 156 &nbsp; &nbsp; &=
nbsp;|<br />glibc-user &nbsp; | 4854 &nbsp; &nbsp; &nbsp; | 239 &nbsp; &nbs=
p; &nbsp;| 227 &nbsp; &nbsp; &nbsp;|<br />---------------------------------=
----------------<br /><br /><span style=3D"text-decoration: underline;">Aft=
er glibc update:</span><br />----------------------------------------------=
---<br />Recipe &nbsp; &nbsp; &nbsp; | Passed &nbsp; &nbsp; | Failed &nbsp;=
 | Skipped &nbsp;|<br />-------------------------------------------------<b=
r />glibc &nbsp; &nbsp; &nbsp; &nbsp;| 5043 &nbsp; &nbsp; &nbsp; | 123 &nbs=
p; &nbsp; &nbsp;| 156 &nbsp; &nbsp; &nbsp;|<br />glibc-user &nbsp; | 4863 &=
nbsp; &nbsp; &nbsp; | 232 &nbsp; &nbsp; &nbsp;| 227 &nbsp; &nbsp; &nbsp;|<b=
r />-------------------------------------------------<br /><br /><span styl=
e=3D"text-decoration: underline;">ptest shows below tests as failed after g=
libc update:</span><br />tst-robustpi7, tst-tsearch, tst-dynarray-fail-mem,=
 tst-loading, mtrace-tst-loading

--qt9b0NiXHdI1V7eEQwuo--

