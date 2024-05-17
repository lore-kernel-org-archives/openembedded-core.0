Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CE1C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:33:35 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] glibc: stable 2.39 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.250.57)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 17 May 2024 09:33:33 -0700
References: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com>
Message-ID: <20714.1715963613869990683@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="29J2x2mhlTtD1nLbz6KE"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199522

--29J2x2mhlTtD1nLbz6KE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the results:

Before glibc update:
-------------------------------------------------
Recipe =C2=A0 =C2=A0 =C2=A0 | Passed =C2=A0 =C2=A0 | Failed =C2=A0 | Skippe=
d =C2=A0|
-------------------------------------------------
glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5037 =C2=A0 =C2=A0 =C2=A0 | 123 =C2=A0 =
=C2=A0 =C2=A0| 156 =C2=A0 =C2=A0 =C2=A0|
glibc-user =C2=A0 | 4858 =C2=A0 =C2=A0 =C2=A0 | 231 =C2=A0 =C2=A0 =C2=A0| 2=
27 =C2=A0 =C2=A0 =C2=A0|
-------------------------------------------------

After glibc update:
-------------------------------------------------
Recipe =C2=A0 =C2=A0 =C2=A0 | Passed =C2=A0 =C2=A0 | Failed =C2=A0 | Skippe=
d =C2=A0|
-------------------------------------------------
glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5043 =C2=A0 =C2=A0 =C2=A0 | 123 =C2=A0 =
=C2=A0 =C2=A0| 156 =C2=A0 =C2=A0 =C2=A0|
glibc-user =C2=A0 | 4866 =C2=A0 =C2=A0 =C2=A0 | 229 =C2=A0 =C2=A0 =C2=A0| 2=
27 =C2=A0 =C2=A0 =C2=A0|
-------------------------------------------------

ptest shows below tests as failed after glibc update:
tst-malloc-fork-deadlock-malloc-check, tst-robustpi7, tst-thread-affinity-p=
thread2

--29J2x2mhlTtD1nLbz6KE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, =
'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple=
 Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; fon=
t-size: 16px; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-=
color: #ffffff; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial; display: inline !important; float:=
 none;">Regression testing is done and below are the results:<br /><br /><s=
pan style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'H=
elvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple C=
olor Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-=
size: 16px; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-co=
lor: #ffffff; text-decoration: underline; display: inline !important; float=
: none;">Before glibc update:</span><br />---------------------------------=
----------------<br />Recipe &nbsp; &nbsp; &nbsp; | Passed &nbsp; &nbsp; | =
Failed &nbsp; | Skipped &nbsp;|<br />--------------------------------------=
-----------<br />glibc &nbsp; &nbsp; &nbsp; &nbsp;| 5037 &nbsp; &nbsp; &nbs=
p; | 123 &nbsp; &nbsp; &nbsp;| 156 &nbsp; &nbsp; &nbsp;|<br />glibc-user &n=
bsp; | 4858 &nbsp; &nbsp; &nbsp; | 231 &nbsp; &nbsp; &nbsp;| 227 &nbsp; &nb=
sp; &nbsp;|<br />-------------------------------------------------<br /><br=
 /><span style=3D"text-decoration: underline;">After glibc update:</span><b=
r />-------------------------------------------------<br />Recipe &nbsp; &n=
bsp; &nbsp; | Passed &nbsp; &nbsp; | Failed &nbsp; | Skipped &nbsp;|<br />-=
------------------------------------------------<br />glibc &nbsp; &nbsp; &=
nbsp; &nbsp;| 5043 &nbsp; &nbsp; &nbsp; | 123 &nbsp; &nbsp; &nbsp;| 156 &nb=
sp; &nbsp; &nbsp;|<br />glibc-user &nbsp; | 4866 &nbsp; &nbsp; &nbsp; | 229=
 &nbsp; &nbsp; &nbsp;| 227 &nbsp; &nbsp; &nbsp;|<br />---------------------=
----------------------------<br /><br /><span style=3D"text-decoration: und=
erline;">ptest shows below tests as failed after glibc update:</span><br />=
tst-malloc-fork-deadlock-malloc-check, tst-robustpi7, tst-thread-affinity-p=
thread2<br /></span>

--29J2x2mhlTtD1nLbz6KE--

