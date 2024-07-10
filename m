Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C536C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 17:47:49 +0000 (UTC)
Subject: Re: [PATCH] bluez5: upgrade 5.72 -> 5.77
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 10 Jul 2024 10:47:45 -0700
References: <12578.1720606804488187301@lists.openembedded.org>
In-Reply-To: <12578.1720606804488187301@lists.openembedded.org>
Message-ID: <28985.1720633665101112847@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9toltcNSLfv51Rns7SfX"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 17:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201737

--9toltcNSLfv51Rns7SfX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Minor status update

I can confirm building with libc and musl doesn't fail anymore (with no add=
itional patches applied). I used TCLIBC =3D "musl" in local.conf to build B=
lueZ with musl.

Furthermore, I noticed that the permission bits to /etc/bluetooth directory=
 are set to 555 ONLY when systemd packageconfig is not enabled. This gives =
me the idea in do_install we simply check if systemd is in PACKAGECONFIG an=
d if not, we modify the bits to 655.

Anyone against this idea?

For reference: https://github.com/bluez/bluez/blob/7a45038dc1e505afbaa49f8d=
d64fd41dab627f23/Makefile.am#L429

--9toltcNSLfv51Rns7SfX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-dec=
oration-thickness: initial; text-decoration-style: initial; text-decoration=
-color: initial; float: none; display: inline !important;">Minor status upd=
ate</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-=
serif; font-size: small; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orph=
ans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: =
2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; =
background-color: #ffffff; text-decoration-thickness: initial; text-decorat=
ion-style: initial; text-decoration-color: initial;" /><br style=3D"color: =
#222222; font-family: Arial, Helvetica, sans-serif; font-size: small; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: normal; background-color: #ffffff; tex=
t-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial;" /><span style=3D"color: #222222; font-family: Arial,=
 Helvetica, sans-serif; font-size: small; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfor=
m: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whit=
e-space: normal; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial; float: none; display: inline !imp=
ortant;">I can confirm building with libc and musl doesn't fail anymore (wi=
th no additional patches applied). I used TCLIBC =3D "musl" in local.conf t=
o build BlueZ with musl.</span><br style=3D"color: #222222; font-family: Ar=
ial, Helvetica, sans-serif; font-size: small; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
white-space: normal; background-color: #ffffff; text-decoration-thickness: =
initial; text-decoration-style: initial; text-decoration-color: initial;" /=
><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;" /><span style=3D"color: #222222=
; font-family: Arial, Helvetica, sans-serif; font-size: small; font-style: =
normal; font-variant-ligatures: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inden=
t: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; white-space: normal; text-decoration-thickness: initial; t=
ext-decoration-style: initial; text-decoration-color: initial; float: none;=
 display: inline !important;">Furthermore, I noticed that the permission bi=
ts to /etc/bluetooth directory are set to 555 ONLY when systemd packageconf=
ig is not enabled. This gives me the idea in do_install we simply check if =
systemd is in PACKAGECONFIG and if not, we modify the bits to 655.</span><b=
r style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-=
size: small; font-style: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text=
-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-c=
olor: #ffffff; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial;" /><br style=3D"color: #222222; fon=
t-family: Arial, Helvetica, sans-serif; font-size: small; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: normal; background-color: #ffffff; text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial;" /><span style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small; font-style: normal; font-variant-ligatures: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wid=
ows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nor=
mal; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial; float: none; display: inline !important;">Any=
one against this idea?<br /><br />For reference: https://github.com/bluez/b=
luez/blob/7a45038dc1e505afbaa49f8dd64fd41dab627f23/Makefile.am#L429<br /></=
span><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-ser=
if; font-size: small; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial; display: inline !important=
; float: none;"><br /><img src=3D"data:image/png;base64,iVBORw0KGgoAAAANSUh=
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
2Zptrtb0vGW8bxm8e7+MsrpFak+/N2ZGvrba+8H7tLgJxjbXVtduaDb5yHKsN1SOPHqnabkrdwx=
DuD0VxeOVo1fBu8ouWfn1CX6dQ39jM4hkW4euCfo35e6LJvY/5+XK0tL6+vj05jtrY2KheT5w8V=
Vw4f6467ur0mbNTrzELGm71NSZVr5u7m+wOow+cfvcxVddaaMeyyTxL6qF+karF+Huy80P34scL=
f83QvDp67zq3zZqxmq7pj5XuLLT54et3I0JzNfxZvi90rrTfX0uE1lVNanVrSl3OdVxqTeHrMbq=
uZ9eLXSt1PyF19xi7pvTbawmt+zVFqOavJVL1WK3rmrZfNL1enb6vp/3SZ49V3boxseuJ1Jqzvp=
6/lpyH6lpT9jy2nrJ14ddRobkxsXn2voQ99/ch/DX9fBG7lvBrpq7t52K22CEuNQnB2oYaeOtIg=
PIhytMxNpRp+PLz7bmvKe2XZtechdh9KlvTe7Fj7bGl/dLaPIO9HzvP32fTmtIxfZIfutL8D+ou=
9Ie4X1PP/bGKzRNd1xR2bmrNJmSOrqHHei5Sa/n+ptdUura9nhxrv68JW/e0z9di44W/npWqhfp=
U3TOIUC11vZS+rmdrcm7Zcz+vDTsvdS9W1+u1WdPei7D1plLjdX0dY8fV3UuMn9eGjm8zr8l1dE=
zoGfR+MV/ZB+ImIVfq2mR8yJjDskiFrFAwa0LmaeuLXbPNul3miNQ8W/P1vkOrkGvE1m3yAzhkF=
j905Ye5tt3W9fnsM+hz2K+xHrdZX8bKWqE5oeup1DVic4Sd1+Y+U0LXUalaV3XP3rdpvtbS3/br=
bNf068b6p2HX9OumrhObI+wzt33+mK7vg635emi80PdOyGtfz5BS93zzuAe8GzvEJd391bAbC70=
xYw/DKRLApIVCX4qGN219sWs2XbfrvdTNs7VQvW9yjTbvwW6RH+a2jdEsnkF/oQv9wtz1el3nda=
HXkPv3z5CqzcK8ryf0mtosuQe9nzZia+p6vn9adk27rp7Hvp52jrQmdD2hz9MHex9+zVhNz2PPN=
yR6n5i/7AOx3f3VUNsm3C5yGLamCXzzDnGp63W9l6EE0Vgo3q0f9KFrju2H+TzuV66hv0D3+Qve=
bnyt9TlCUrVZmOf1Yl/rpu9t1/cqNa9rLSb29ex67131/Vwq9f0i687z+ykl9X2E2eEv1Tk+4Pr=
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" /><br /></span>

--9toltcNSLfv51Rns7SfX--

