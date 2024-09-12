Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE2AEED635
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 18:05:54 +0000 (UTC)
Subject: host libs in the SDK link to the host libs
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: CH (147.161.250.172)
X-Originating-Platform: Windows Chrome 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 11:05:49 -0700
Message-ID: <k0qy.1726164349812717885.rTZk@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="C7Gb5iCGOCHw8FerwMMb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 18:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204461

--C7Gb5iCGOCHw8FerwMMb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

one thing regarding the libs in the SDK is bugging me and I would like to u=
nderstand it. In short, I cloned the poky repository, checked out the scart=
hgap branch and built the SDK with "bitbake -c populate_sdk core-image-west=
on-sdk". After installing the SDK, I checked what the ldd command is return=
ing:

```bash
# executed from the installed SDK
ldd sysroots/x86_64-pokysdk-linux/lib/libanl.so.1
sysroots/x86_64-pokysdk-linux/lib/libanl.so.1: /lib/x86_64-linux-gnu/libc.s=
o.6: version `GLIBC_2.36' not found (required by sysroots/x86_64-pokysdk-li=
nux/lib/libanl.so.1)
sysroots/x86_64-pokysdk-linux/lib/libanl.so.1: /lib/x86_64-linux-gnu/libc.s=
o.6: version `GLIBC_ABI_DT_RELR' not found (required by sysroots/x86_64-pok=
ysdk-linux/lib/libanl.so.1)
linux-vdso.so.1 (0x00007ffdc31a2000)
libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fade7545000)
/lib64/ld-linux-x86-64.so.2 (0x00007fade7753000)
```

Could someone tell me why is libanl.so.1 linking against the libc.so.6 host=
 library and not the one from the SDK - sysroots/x86_64-pokysdk-linux/lib/l=
ibc.so.6? Is it because I used the host ldd?

I am also getting the same error (that the versions do not match), when try=
ing to execute binaries built with the above SDK by using qemu-x86_64.

Cheers,
Aleksandar

--C7Gb5iCGOCHw8FerwMMb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>one thing regarding the libs in the SDK is bugging me and I would like=
 to understand it. In short, <span style=3D"background-color: var(--light-m=
ode-body-color);">I cloned the poky repository, checked out the scarthgap b=
ranch and built the SDK with "bitbake -c populate_sdk core-image-weston-sdk=
". After installing the SDK, I checked what the ldd command is returning:</=
span></div>
<div>&nbsp;</div>
<div><span style=3D"background-color: var(--light-mode-body-color);">```bas=
h</span></div>
<div><span style=3D"background-color: var(--light-mode-body-color);"># exec=
uted from the installed SDK</span></div>
<div><span style=3D"background-color: var(--light-mode-body-color);">ldd sy=
sroots/x86_64-pokysdk-linux/lib/libanl.so.1<br />sysroots/x86_64-pokysdk-li=
nux/lib/libanl.so.1: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.36' =
not found (required by sysroots/x86_64-pokysdk-linux/lib/libanl.so.1)<br />=
sysroots/x86_64-pokysdk-linux/lib/libanl.so.1: /lib/x86_64-linux-gnu/libc.s=
o.6: version `GLIBC_ABI_DT_RELR' not found (required by sysroots/x86_64-pok=
ysdk-linux/lib/libanl.so.1)<br />&nbsp; &nbsp; &nbsp; &nbsp; linux-vdso.so.=
1 (0x00007ffdc31a2000)<br />&nbsp; &nbsp; &nbsp; &nbsp; libc.so.6 =3D&gt; /=
lib/x86_64-linux-gnu/libc.so.6 (0x00007fade7545000)<br />&nbsp; &nbsp; &nbs=
p; &nbsp; /lib64/ld-linux-x86-64.so.2 (0x00007fade7753000)</span></div>
<div><span style=3D"background-color: var(--light-mode-body-color);"><span =
style=3D"background-color: var(--light-mode-body-color);">```</span></span>=
</div>
<div>&nbsp;</div>
<div><span style=3D"background-color: var(--light-mode-body-color);">Could =
someone tell me why is <span style=3D"background-color: var(--light-mode-bo=
dy-color);">libanl.so.1 linking against the libc.so.6 host library and not =
the one from the SDK - sysroots/x86_64-pokysdk-linux/lib/libc.so.6? Is it b=
ecause I used the host ldd? </span></span></div>
<div>&nbsp;</div>
<div><span style=3D"background-color: var(--light-mode-body-color);"><span =
style=3D"background-color: var(--light-mode-body-color);">I am also getting=
 the same error (that the versions do not match), when trying to execute bi=
naries built with the above SDK by using qemu-x86_64.</span></span></div>
<div>&nbsp;</div>
<div><span style=3D"background-color: var(--light-mode-body-color);"><span =
style=3D"background-color: var(--light-mode-body-color);">Cheers,</span></s=
pan></div>
<div><span style=3D"background-color: var(--light-mode-body-color);"><span =
style=3D"background-color: var(--light-mode-body-color);">Aleksandar</span>=
</span></div>

--C7Gb5iCGOCHw8FerwMMb--

