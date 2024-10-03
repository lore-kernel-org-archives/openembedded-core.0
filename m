Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FF9CF857D
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 11:22:13 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: IN (152.58.232.159)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Oct 2024 04:22:10 -0700
References: <CAOSpxdYM8XVLTVWg6jkZrGPmPG1MVfQMH17aASKgHOK+6zLGgQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYM8XVLTVWg6jkZrGPmPG1MVfQMH17aASKgHOK+6zLGgQ@mail.gmail.com>
Message-ID: <7336.1727954530167946178@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7xMCHDojRxiYBvTsCuKp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 11:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205206

--7xMCHDojRxiYBvTsCuKp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem & Steve,

Thanks for checking out the results and your comments.

>>Is this regression? and is it a persistent failure?

We analyzed the issue further by debugging it manually and observed that th=
e testcase " nptl/tst-thread-affinity-sched.c" passed as expected. Hence, w=
e ran the testsuite again after the update and found that the issue was not=
 reproduced anymore.
Please find the following results after the update which has 2 less failure=
s than the results before update.
*After Update*
PASS - 4781
FAIL - 145
XPASS - 6
XFAIL - 16
UNSUPPORTED - 237

*Before update:*
PASS - 4770
FAIL - 148
XPASS - 6
XFAIL - 16
UNSUPPORTED - 237

*Diff:*
PASS - +11
FAIL - -3
XPASS - 0
XFAIL - 0
UNSUPPORTED - 0

--7xMCHDojRxiYBvTsCuKp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: #ffffff; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;">Hi Khem &amp; Steve,<br /><br />Thanks for checking out the =
results and your comments.<br /><br />&gt;&gt;Is this regression? and is it=
 a persistent failure?</span><br /><br />We analyzed the issue further by d=
ebugging it manually and observed that the testcase "<span style=3D"color: =
#333333; font-family: system-ui, Roboto, Arial, sans-serif; font-size: 16px=
; font-style: normal; font-variant-ligatures: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: sta=
rt; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; white-space: normal; background-color: #ffff=
ff; text-decoration-thickness: initial; text-decoration-style: initial; tex=
t-decoration-color: initial; display: inline !important; float: none;">nptl=
/tst-thread-affinity-sched.c"</span> passed as expected. Hence, we ran the =
testsuite again after the update and found that the issue was not reproduce=
d anymore. <br />Please find the following results after the update which h=
as 2 less failures than the results before update.<br /><strong>After Updat=
e</strong><br />PASS - 4781<br />FAIL - 145<br />XPASS - 6<br />XFAIL - 16<=
br />UNSUPPORTED - 237<br /><br /><strong><span style=3D"color: #333333; fo=
nt-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'L=
iberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', =
'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal;=
 font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing:=
 normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: pre-wrap; background-color: #ffffff; text-decoration-thickness: initia=
l; text-decoration-style: initial; text-decoration-color: initial; float: n=
one; display: inline !important;">Before update:</span></strong><br style=
=3D"box-sizing: border-box; overflow-wrap: break-word !important; color: #3=
33333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto =
Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI=
 Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-ind=
ent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-d=
ecoration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial;" /><span style=3D"color: #333333; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">PASS - 4770</span><br style=3D"box-sizing: =
border-box; overflow-wrap: break-word !important; color: #333333; font-fami=
ly: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberati=
on Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe =
UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: pre-wrap; background-color: #ffffff; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l;" /><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial; display: inline !important=
; float: none;">FAIL - 148</span><br style=3D"box-sizing: border-box; overf=
low-wrap: break-word !important; color: #333333; font-family: system-ui, 'S=
egoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, =
sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto=
 Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
idows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: p=
re-wrap; background-color: #ffffff; text-decoration-thickness: initial; tex=
t-decoration-style: initial; text-decoration-color: initial;" /><span style=
=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica =
Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoj=
i', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16p=
x; font-style: normal; font-variant-ligatures: normal; font-variant-caps: n=
ormal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #f=
fffff; text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial; display: inline !important; float: none;">X=
PASS - 6</span><br style=3D"box-sizing: border-box; overflow-wrap: break-wo=
rd !important; color: #333333; font-family: system-ui, 'Segoe UI', Roboto, =
'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple=
 Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; fon=
t-size: 16px; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;" /><span style=3D"color: #333333=
; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans'=
, 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoj=
i', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-decora=
tion-thickness: initial; text-decoration-style: initial; text-decoration-co=
lor: initial; display: inline !important; float: none;">XFAIL - 16</span><b=
r style=3D"box-sizing: border-box; overflow-wrap: break-word !important; co=
lor: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue',=
 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'S=
egoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; t=
ext-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial;" /><span style=3D"color: #333333; font-family: sy=
stem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation San=
s', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sym=
bol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whi=
te-space: pre-wrap; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial; dis=
play: inline !important; float: none;">UNSUPPORTED - 237<br /><br /></span>=
<strong>Diff:</strong><br />PASS - +11</div>
<div>FAIL - -3</div>
<div>XPASS - 0</div>
<div>XFAIL - 0</div>
<div>UNSUPPORTED - 0</div>

--7xMCHDojRxiYBvTsCuKp--

