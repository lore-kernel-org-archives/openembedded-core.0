Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371A1C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 16:01:17 +0000 (UTC)
Subject: Re: [PATCH] initramfs-framework: remove hard dependency with busybox
To: openembedded-core@lists.openembedded.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Mac Safari 18.3
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 09:01:13 -0700
References: <19c7cc6289d7aab486e74ac50bdbf17a22e86363.camel@gmail.com>
In-Reply-To: <19c7cc6289d7aab486e74ac50bdbf17a22e86363.camel@gmail.com>
Message-ID: <8404.1743264073178142467@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="aDaDKfjCDSA0nqeJcInY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 16:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213885

--aDaDKfjCDSA0nqeJcInY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi Adrian

thank you for the comment. I had a look in commits log and it looks that '-=
c' was there since the beginning in 2008/09/10 in script 'init-live.sh' and=
 then moved in 'finish.sh' in 2011/12/08.
I reproduced the issue by using qemu and I described how I did it in detail=
 in bug # 15716.
After I applied the change I tested both busybox and packagegroup-core-base=
-utils. The boot was successful in both cases.
Also '-c' is an option in busybox: https://www.busybox.net/downloads/BusyBo=
x.html

I will wait for more comments and then I will extend the commit message and=
 send a v2.

Br
Christos

--aDaDKfjCDSA0nqeJcInY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi Adrian</div>
<div>&nbsp;</div>
<div>thank you for the comment. I had a look in commits log and it looks th=
at '-c' was there since the beginning in 2008/09/10 in script 'init-live.sh=
' and then moved in 'finish.sh' in 2011/12/08.</div>
<div>I reproduced the issue by using qemu and I described how I did it in d=
etail in bug #<span style=3D"caret-color: #333333; color: #333333; font-fam=
ily: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberat=
ion Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe=
 UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: au=
to; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 background-color: #ffffff; text-decoration: none; display: inline !importa=
nt; float: none;">15716.</span></div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">After I applied the change I tested both busybox and packagegr=
oup-core-base-utils. The boot was successful in both cases.</span></span></=
div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">Also '-c' is an option in busybox: <a href=3D"https://www.busy=
box.net/downloads/BusyBox.html">https://www.busybox.net/downloads/BusyBox.h=
tml</a></span></span></div>
<div>&nbsp;</div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">I will wait for more comments and then I will extend the commi=
t message and send a v2.</span></span></div>
<div>&nbsp;</div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">Br</span></span></div>
<div><span style=3D"caret-color: #333333; color: #333333; font-family: syst=
em-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans'=
, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbo=
l', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap=
; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgrou=
nd-color: #ffffff; text-decoration: none; display: inline !important; float=
: none;"><span style=3D"caret-color: #333333; color: #333333; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: #ffffff; text-decoration: none; display: inline !important; f=
loat: none;">Christos</span></span></div>
<div>&nbsp;</div>

--aDaDKfjCDSA0nqeJcInY--

