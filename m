Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28376.1793858901449454063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 22:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=icpDrYtX;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0F267C69150;
	Thu,  5 Nov 2026 06:08:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5D1A5FF43;
	Thu,  5 Nov 2026 06:08:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5340910328E67;
	Thu,  5 Nov 2026 07:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793858898; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uzxUrClrLcsGYPelhTWBDubgeB1tNZEHn4EBs8KJu+M=;
	b=icpDrYtXBcj5Ckwzd/kQZ6eSWFC1gbZpBX7N6CARMgwwFmkAKMFuhJaONdMK2rS0xVoYvv
	V5ji3qH8riYW4a1hLSpLAhw1lZMBFEAMnyb79O5oSGLF/ajnvBXPm/0nfMaYQcrBaQEDLH
	POWQIfWWxpGvhccbF+5o6SF8OgdfyCgkNGyLPz5ZGONVM8MSDnTU8BhwaGfGnLbYJWDbwV
	oaIVN2115BxIlkJzS1RrJMypIBFNyltxwJ25EbchQjHBMXIoDUOzFi9IW6BwFp+IlG7B3E
	G6nqbe4oi1dEZWyQG7OtEOy6NxYkZohiVEvunD6Hno3IqWt+vutvvr7TRmdXzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 07:08:16 +0100
Message-Id: <DMN1WOF5JJRS.39L1YDSXCL7V1@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 1/2] python3-setuptools: Upgrade 84.0.0 ->
 84.2.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261104152808.47533-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261104152808.47533-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 06:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249444

On Wed Nov 4, 2026 at 4:28 PM CET, Jaipaul Cheernam wrote:
> ChangeLog: https://setuptools.pypa.io/en/stable/history.html#v84-2-1
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for this upgrade.

I suspect this one in now breaking some other package:

ERROR: lib32-systemtap-5.6-r0 do_install: Execution of '/srv/pokybuild/yoct=
o-worker/qemux86-world-alt/build/build/tmp/work/x86-pokymllib32-linux/lib32=
-systemtap/5.6/temp/run.do_install.1847183' failed with exit code 1
...
 ERROR: helpersdt-0.1.0-cp315-cp315-linux_i686.whl is not a supported wheel=
 on this platform.
| make[3]: *** [Makefile:631: install-exec-local] Error 1
| make[3]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world-alt=
/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/build/pytho=
n'
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world-alt=
/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/build/pytho=
n'
| make[2]: *** [Makefile:499: install-am] Error 2
| make[1]: *** [Makefile:2290: install-recursive] Error 1
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world-alt=
/build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/build'
| make: *** [Makefile:2689: install] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/wo=
rk/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183:22=
7 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/bui=
ld/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1=
847183, line 227
| 	#2: die, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/w=
ork/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183, =
line 211
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/buil=
d/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.18=
47183, line 206
| 	#4: autotools_do_install, /srv/pokybuild/yocto-worker/qemux86-world-alt/=
build/build/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_=
install.1847183, line 189
| 	#5: do_install, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/buil=
d/tmp/work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.18=
47183, line 166
| 	#6: main, /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/=
work/x86-pokymllib32-linux/lib32-systemtap/5.6/temp/run.do_install.1847183,=
 line 240
NOTE: recipe lib32-systemtap-5.6-r0: task do_install: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4802
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4945

Can you have a loot at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

