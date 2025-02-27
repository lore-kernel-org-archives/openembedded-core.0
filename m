Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD44C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:15:19 +0000 (UTC)
Subject: Re: [PATCH] sanity: check variable GO_IMPORT
To: openembedded-core@lists.openembedded.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Mac Safari 18.3
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 05:15:16 -0800
References: <30396.1740564040195102040@lists.openembedded.org>
In-Reply-To: <30396.1740564040195102040@lists.openembedded.org>
Message-ID: <31891.1740662116747258381@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="evKFrGrR199YFzHnevYU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212001

--evKFrGrR199YFzHnevYU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Richard

I have added the code as you suggested in go.bbclass and then i created met=
a-mylayer and try to build there " go-helloworld_0.1.bb". It builds fine.

When i commented GO_IMPORT in the recipe the error i am getting is:

ERROR: ExpansionError during parsing /home/cg/CG/Programming/Yocto/poky/met=
a-mylayer/recipes-go/go-helloworld/go-helloworld.bb=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--
bb.data_smart.ExpansionError: Failure expanding variable GO_SRCURI_DESTSUFF=
IX, expression was ${@os.path.join(os.path.basename(d.getVar('S')), 'src', =
d.getVar('GO_IMPORT')) + '/'} which triggered exception TypeError: join() a=
rgument must be str, bytes, or os.PathLike object, not 'NoneType'
The variable dependency chain for the failure is: GO_SRCURI_DESTSUFFIX -> S=
RC_URI

This is caused from this line in the recipe: SRC_URI =3D " git://go.googles=
ource.com/example;branch=3Dmaster;protocol=3Dhttps;destsuffix=3D${GO_SRCURI=
_DESTSUFFIX} ( git://go.googlesource.com/example;branch=3Dmaster;protocol=
=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D ) "

So it looks that expanding GO_SRCURI_DESTSUFFIX variable is executed before=
 anonymous python function and the error "GO_IMPORT is not set" will not be=
 generated.

If you don't have anything to comment , I will try to dive deeper and see h=
ow I can adapt it...

Br
Christos

--evKFrGrR199YFzHnevYU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi Richard</div>
<div>&nbsp;</div>
<div>I have added the code as you suggested in go.bbclass <span style=3D"ca=
ret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif;">and then i created meta-mylayer and try to build the=
re "</span><span style=3D"caret-color: #000000; color: #000000; font-family=
: 'Helvetica Neue', Helvetica, Arial, sans-serif;">go-helloworld_0.1.bb". <=
span>It builds fine.</span></span>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false"><span>When i =
commented GO_IMPORT in the recipe the error i am getting is:</span></div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">
<div style=3D"font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; widows: au=
to; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e; caret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Hel=
vetica, Arial, sans-serif;">
<div style=3D"font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; widows: au=
to; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e; caret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Hel=
vetica, Arial, sans-serif;">ERROR: ExpansionError during parsing /home/cg/C=
G/Programming/Yocto/poky/meta-mylayer/recipes-go/go-helloworld/go-helloworl=
d.bb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| ETA:&nbsp; --:--:--</=
div>
<div style=3D"font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; widows: au=
to; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e; caret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Hel=
vetica, Arial, sans-serif;">bb.data_smart.ExpansionError: Failure expanding=
 variable GO_SRCURI_DESTSUFFIX, expression was ${@os.path.join(os.path.base=
name(d.getVar('S')), 'src', d.getVar('GO_IMPORT')) + '/'} which triggered e=
xception TypeError: join() argument must be str, bytes, or os.PathLike obje=
ct, not 'NoneType'</div>
<div style=3D"font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; widows: au=
to; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e; caret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Hel=
vetica, Arial, sans-serif;">The variable dependency chain for the failure i=
s: GO_SRCURI_DESTSUFFIX -&gt; SRC_URI</div>
<div style=3D"font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; widows: au=
to; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e; caret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Hel=
vetica, Arial, sans-serif;">&nbsp;</div>
<div style=3D"font-size: 16px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; widows: au=
to; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e; caret-color: #000000; color: #000000; font-family: 'Helvetica Neue', Hel=
vetica, Arial, sans-serif;">
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">This is cause=
d from this line in the recipe:&nbsp;
<pre style=3D"line-height: 16.6667px; padding: 0px; margin-top: 0px; margin=
-bottom: 0px; color: #000000; font-size: 13.3333px;"><span class=3D"ydp2b64=
d5c9nv" style=3D"color: #336699;">SRC_URI</span> <span class=3D"ydp2b64d5c9=
o">=3D</span> <span class=3D"ydp2b64d5c9s2" style=3D"color: #dd2200; backgr=
ound-color: #fff0f0;">"<a href=3D"git://go.googlesource.com/example;branch=
=3Dmaster;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D">git://=
go.googlesource.com/example;branch=3Dmaster;protocol=3Dhttps;destsuffix=3D$=
{GO_SRCURI_DESTSUFFIX}</a>"</span></pre>
</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">So it looks t=
hat expanding GO_SRCURI_DESTSUFFIX variable is executed before anonymous py=
thon function and the error "GO_IMPORT is not set" will not be generated.</=
div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">If you don't =
have anything to comment , I will try to dive deeper and see how I can adap=
t it...</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">Br</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">Christos</div=
>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
<div dir=3D"ltr" style=3D"font-size: 16px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none; caret-color: #000000; color: #000000; font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif;" data-setdir=3D"false">&nbsp;</div>
</div>
</div>
</div>
</div>

--evKFrGrR199YFzHnevYU--

