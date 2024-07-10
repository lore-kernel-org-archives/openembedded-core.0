Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650A1C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 10:20:10 +0000 (UTC)
Subject: Re: [PATCH] bluez5: upgrade 5.72 -> 5.77
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: iPhone Safari 17.5
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 10 Jul 2024 03:20:04 -0700
References: <65c634e7dc5119e37c68fc7ea2b966e5b9d63e1d.camel@linuxfoundation.org>
In-Reply-To: <65c634e7dc5119e37c68fc7ea2b966e5b9d63e1d.camel@linuxfoundation.org>
Message-ID: <12578.1720606804488187301@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ot8U2lxNcBYzlAEZLlIx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 10:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201730

--Ot8U2lxNcBYzlAEZLlIx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> Thanks for the patch. I didn't see any fix for the permissions issue in
here? We need to fix that before we run this on the test infrastructure
again as it caused a lot of problems last time :(

> We should be able to tweak things in a do_install:append function?

You=E2=80=99re right, it=E2=80=99s not included yet. I want to run a runtim=
e test first as I=E2=80=99m not sure if the systemd service will complain: =
https://github.com/bluez/bluez/blob/4ca662fcea1604e937bde1bddd5de2c50bcb6e0=
0/src/bluetooth.service.in#L25

It uses ConfigurationDirectoryMode=3D0555

I=E2=80=99ll look into it over the next few days. If I can get this to buil=
d/install on Scarthgap then I can run some extensive bluetooth runtime test=
ing.

--Ot8U2lxNcBYzlAEZLlIx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>&gt; <span style=3D"caret-color: #dee2e6; color: #000000; font-family: s=
ystem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sa=
ns', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sy=
mbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spaci=
ng: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-text-size-a=
djust: 100%; -webkit-text-stroke-width: 0px; text-decoration: none; float: =
none; display: inline !important;">Thanks for the patch. I didn't see any f=
ix for the permissions issue in</span><br style=3D"box-sizing: border-box; =
overflow-wrap: break-word !important; caret-color: #dee2e6; color: #dee2e6;=
 font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans',=
 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji=
', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: auto; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-tap-highlight-=
color: rgba(0, 0, 0, 0); -webkit-text-size-adjust: 100%; -webkit-text-strok=
e-width: 0px; text-decoration: none;" /><span style=3D"caret-color: #dee2e6=
; color: #000000; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Ne=
ue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji'=
, 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: pre-wrap; word-spacing: 0px; -webkit-tap-highlight-color: rgba(=
0, 0, 0, 0); -webkit-text-size-adjust: 100%; -webkit-text-stroke-width: 0px=
; text-decoration: none; float: none; display: inline !important;">here? We=
 need to fix that before we run this on the test infrastructure</span><br s=
tyle=3D"box-sizing: border-box; overflow-wrap: break-word !important; caret=
-color: #dee2e6; color: #dee2e6; font-family: system-ui, 'Segoe UI', Roboto=
, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'App=
le Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; f=
ont-size: 16px; font-style: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent=
: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-text-size-=
adjust: 100%; -webkit-text-stroke-width: 0px; text-decoration: none;" /><sp=
an style=3D"caret-color: #dee2e6; color: #000000; font-family: system-ui, '=
Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial,=
 sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Not=
o Color Emoji'; font-size: 16px; font-style: normal; font-variant-caps: nor=
mal; font-weight: 400; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -w=
ebkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-text-size-adjust: 100%=
; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displ=
ay: inline !important;">again as it caused a lot of problems last time :(</=
span><br style=3D"box-sizing: border-box; overflow-wrap: break-word !import=
ant; caret-color: #dee2e6; color: #dee2e6; font-family: system-ui, 'Segoe U=
I', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-s=
erif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color=
 Emoji'; font-size: 16px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto;=
 word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-=
text-size-adjust: 100%; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" /><br style=3D"box-sizing: border-box; overflow-wrap: break-word !impo=
rtant; caret-color: #dee2e6; color: #dee2e6; font-family: system-ui, 'Segoe=
 UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans=
-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Col=
or Emoji'; font-size: 16px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: aut=
o; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webki=
t-text-size-adjust: 100%; -webkit-text-stroke-width: 0px; text-decoration: =
none;" /><span style=3D"caret-color: #dee2e6; color: #000000; font-family: =
system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation S=
ans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI S=
ymbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-text-size-=
adjust: 100%; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;">&gt; We should be able to tweak things =
in a do_install:append function?<br /><br />You&rsquo;re right, it&rsquo;s =
not included yet. I want to run a runtime test first as I&rsquo;m not sure =
if the systemd service will complain: <a href=3D"https://github.com/bluez/b=
luez/blob/4ca662fcea1604e937bde1bddd5de2c50bcb6e00/src/bluetooth.service.in=
#L25" target=3D"_blank" rel=3D"noopener">https://github.com/bluez/bluez/blo=
b/4ca662fcea1604e937bde1bddd5de2c50bcb6e00/src/bluetooth.service.in#L25</a>=
<br /><br />It uses ConfigurationDirectoryMode=3D0555<br /><br />I&rsquo;ll=
 look into it over the next few days. If I can get this to build/install on=
 Scarthgap then I can run some extensive bluetooth runtime testing. </span>=
<span style=3D"caret-color: #dee2e6; color: #000000; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;=
 -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-text-size-adjust: 1=
00%; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;"></span></p>

--Ot8U2lxNcBYzlAEZLlIx--

