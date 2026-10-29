Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6223.1793257126439256459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 23:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AASK5ois;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F10954E41383
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:58:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC30760360;
	Thu, 29 Oct 2026 06:58:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19F551032909B;
	Thu, 29 Oct 2026 07:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793257122; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G+48A3b00g9ee8dd2yTpJneChPPe1/lYJG4LiaNfMhE=;
	b=AASK5oislTJFgaa+IxtHNgRX4LNzne8otwkhK9Aad+VEyIolft8e4kP7XVpqX2ONE3hBWH
	DYm07QdA5vE3/+tjxW09woGVXQrB0VJ+yl0XfIBWMDIZw8yN1NUNMXZ3CWnId6CG0qnWdx
	3vrXA0BHpMrGeEbiN+9/dWDOl/3PvKsm9zT1HGrQInCjwEvoQhETgdxNPxYoTrYrRtyrrH
	/QwRAK+YjeTMruSOnjg86giVVu7wRSsQyEWcO1sFIPkO61EP/tBkWPuSr0wRsMY/34CuSe
	qB7PSrxFzZQzOdzzOqL9o2MJZFZpirmScJ0OR428kWt4eFr8X/PERwCaHSfz7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 07:58:40 +0100
Message-Id: <DMH4LGBSARCA.2LBSBNRPKWYP9@bootlin.com>
Subject: Re: [OE-core] [PATCH 5/8] python3-flit-core: upgrade 3.12.0 ->
 4.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
 <20261028070350.13243-6-jaipaul.cheernam@est.tech>
In-Reply-To: <20261028070350.13243-6-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248905

On Wed Oct 28, 2026 at 8:03 AM CET, Jaipaul Cheernam wrote:
> ReleaseNotes: https://flit.pypa.io/en/stable/history.html#version-4-2
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade, but this one is breaking a few other packages
because of hard dependencies:

ERROR: python3-typing-extensions-native-4.16.0-r0 do_compile: Execution of =
'/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/x86_64-linux/p=
ython3-typing-extensions-native/4.16.0/temp/run.do_compile.1141355' failed =
with exit code 1
...
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86/build/build/tmp/work/x86_64-linux/python3-typing-extensions-native/=
4.16.0/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3D3.11
| 		wanted: <4,>=3D3.11
| 		found: 4.2.0
...
ERROR: python3-pip-native-26.2.2-r0 do_compile: Execution of '/srv/pokybuil=
d/yocto-worker/genericx86/build/build/tmp/work/x86_64-linux/python3-pip-nat=
ive/26.2.2/temp/run.do_compile.1171463' failed with exit code 1
...
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86/build/build/tmp/work/x86_64-linux/python3-pip-native/26.2.2/recipe-=
sysroot-native/usr/bin/nativepython3):
| 	flit-core<4,>=3D3.11
| 		wanted: <4,>=3D3.11
| 		found: 4.2.0
...
ERROR: python3-docutils-native-0.23-r0 do_compile: Execution of '/srv/pokyb=
uild/yocto-worker/genericx86/build/build/tmp/work/x86_64-linux/python3-docu=
tils-native/0.23/temp/run.do_compile.1274037' failed with exit code 1
...
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86/build/build/tmp/work/x86_64-linux/python3-docutils-native/0.23/reci=
pe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3D3.11
| 		wanted: <4,>=3D3.11
| 		found: 4.2.0
...
ERROR: python3-jinja2-native-3.1.6-r0 do_compile: Execution of '/srv/pokybu=
ild/yocto-worker/genericx86/build/build/tmp/work/x86_64-linux/python3-jinja=
2-native/3.1.6/temp/run.do_compile.1656081' failed with exit code 1
...
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86/build/build/tmp/work/x86_64-linux/python3-jinja2-native/3.1.6/recip=
e-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4
| 		wanted: <4
| 		found: 4.2.0
...
ERROR: python3-unittest-automake-output-0.4-r0 do_compile: Execution of '/s=
rv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/core2-32-poky-lin=
ux/python3-unittest-automake-output/0.4/temp/run.do_compile.3365430' failed=
 with exit code 1
...
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/gen=
ericx86/build/build/tmp/work/core2-32-poky-linux/python3-unittest-automake-=
output/0.4/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3D3.2
| 		wanted: <4,>=3D3.2
| 		found: 4.2.0
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4905

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

