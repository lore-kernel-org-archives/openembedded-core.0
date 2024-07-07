Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588CFC38150
	for <webhook@archiver.kernel.org>; Sun,  7 Jul 2024 12:55:51 +0000 (UTC)
Subject: Re: [PATCH] bluez5: upgrade 5.72 -> 5.76
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 07 Jul 2024 05:55:46 -0700
References: <bdc48d97eea594eff799a370fc66fb28f283de52.camel@linuxfoundation.org>
In-Reply-To: <bdc48d97eea594eff799a370fc66fb28f283de52.camel@linuxfoundation.org>
Message-ID: <20061.1720356946240260660@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wXiHuAgBxGpxUyI714PP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 12:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201623

--wXiHuAgBxGpxUyI714PP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 7, 2024 at 10:00 AM, Richard Purdie wrote:

>=20
> Thanks for the patch, unfortunately this ran into issues in our CI. One
> interesting one is this:
>=20
> https://valkyrie.yoctoproject.org/#/builders/40/builds/65
> https://valkyrie.yoctoproject.org/#/builders/36/builds/64/steps/17/logs/s=
tdio
>=20
>=20
> which isn't very clear what is going on until you look at the files:
>=20
> (buildbot-venv) [pokybuild@rocky9-vk-1 ~]$ ls
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/qe=
muarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk/sysroots/cortexa15=
t2hf-neon-oe-linux-gnueabi/etc/bluetooth/
> -la
> total 32
> dr-xr-xr-x. 2 pokybuild pokybuild 4096 Jul 7 11:11 .
> drwxr-xr-x. 3 pokybuild pokybuild 4096 Jul 7 11:26 ..
> -rw-r--r--. 1 pokybuild pokybuild 928 Jul 7 11:11 input.conf
> -rw-r--r--. 1 pokybuild pokybuild 12597 Jul 7 11:11 main.conf
> -rw-r--r--. 1 pokybuild pokybuild 120 Jul 7 11:11 network.conf
>=20
> The missing write bit on the directory is stopping the files from being
> deleted.

I wonder if this resolves the issue, looks exactly like something we need: =
https://docs.python.org/3/library/shutil.html#rmtree-example

( https://docs.python.org/3/library/shutil.html#rmtree-example ) There's a =
comment in the Bitbake code saying rmtree is too slow, but that's from 12 y=
ears ago. Perhaps it is fast enough today with Python 3.12.

I don't think the solution is to request BlueZ to change how it installs it=
's files/directory.

--wXiHuAgBxGpxUyI714PP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 7, 2024 at 10:00 AM, Richard Purdie wrote:<br />
<blockquote>Thanks for the patch, unfortunately this ran into issues in our=
 CI. One<br />interesting one is this:<br /><br /><a href=3D"https://valkyr=
ie.yoctoproject.org/#/builders/40/builds/65" target=3D"_blank" rel=3D"noope=
ner">https://valkyrie.yoctoproject.org/#/builders/40/builds/65</a><br /><a =
href=3D"https://valkyrie.yoctoproject.org/#/builders/36/builds/64/steps/17/=
logs/stdio" target=3D"_blank" rel=3D"noopener">https://valkyrie.yoctoprojec=
t.org/#/builders/36/builds/64/steps/17/logs/stdio</a><br /><br />which isn'=
t very clear what is going on until you look at the files:<br /><br />(buil=
dbot-venv) [pokybuild@rocky9-vk-1 ~]$ ls /home/pokybuild/yocto-worker/qemua=
rm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-image-sa=
to/1.0/testimage-sdk/sysroots/cortexa15t2hf-neon-oe-linux-gnueabi/etc/bluet=
ooth/ -la<br />total 32<br />dr-xr-xr-x. 2 pokybuild pokybuild 4096 Jul 7 1=
1:11 .<br />drwxr-xr-x. 3 pokybuild pokybuild 4096 Jul 7 11:26 ..<br />-rw-=
r--r--. 1 pokybuild pokybuild 928 Jul 7 11:11 input.conf<br />-rw-r--r--. 1=
 pokybuild pokybuild 12597 Jul 7 11:11 main.conf<br />-rw-r--r--. 1 pokybui=
ld pokybuild 120 Jul 7 11:11 network.conf<br /><br />The missing write bit =
on the directory is stopping the files from being<br />deleted.</blockquote=
>
I wonder if this resolves the issue, looks exactly like something we need: =
<a href=3D"https://docs.python.org/3/library/shutil.html#rmtree-example" ta=
rget=3D"_blank" rel=3D"noopener">https://docs.python.org/3/library/shutil.h=
tml#rmtree-example<br /><br /></a>There's a comment in the Bitbake code say=
ing rmtree is too slow, but that's from 12 years ago. Perhaps it is fast en=
ough today with Python 3.12.<br /><br />I don't think the solution is to re=
quest BlueZ to change how it installs it's files/directory.

--wXiHuAgBxGpxUyI714PP--

