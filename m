Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26838.1794832747186175442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 04:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Epd05DcL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 02DE61A1696;
	Mon, 16 Nov 2026 12:39:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAF1A6023F;
	Mon, 16 Nov 2026 12:39:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D9C511BC00A4;
	Mon, 16 Nov 2026 13:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794832740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m4hjXV+aGzehrQqr5tl9mg59Qn0SgRHO9Fgj+X9WmMw=;
	b=Epd05DcLD3ocs1Y7B8rk2DtxI2nYMy21ZsUUGt8Wa7Q3V31j9oNR5bGCMZtxFCohfoLOsj
	x41Sx7ma/3wWnwruizGsT3/trHBi55hObX15H7EbAa9eB3UhGBxtBmVBiqzvIx874i6xPF
	WL6IG7m7YUfw61mXH15dAgWxHRsnvXBtWQHnoudx8wCwAdyNDMtLeGu1cXYNHL/5ox3drd
	oH/10/Mm7H1gvP1IJJd8peXfCtjM0ewcMBNykY+NXQdyok8HZhCHlUPzzw+Udhh16T3s9n
	KP7JmR7UFF1isB9dblw0v/OUNABdwAVyJkWKmx82oT06N90AqMJe10oesYaOEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 13:38:55 +0100
Message-Id: <DMWN3RX2K68K.O96T3TFNS2DC@bootlin.com>
To: <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>,
 <patchtest@automation.yoctoproject.org>
Subject: Re: [OE-core] [PATCH v2] rpm: 6.0.2 -> 6.1.0
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <010101a1d852b11e-c16751df-e6a5-416d-91dd-1f30cdbab297-000000@us-west-2.amazonses.com> <20261116033732.3106610-1-sumanth.gavini@windriver.com>
In-Reply-To: <20261116033732.3106610-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 12:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250341

On Mon Nov 16, 2026 at 4:37 AM CET, Sumanth Gavini via openembedded-core wr=
ote:
> * Switch SRC_URI to the rpm-6.1.x branch.
> * COPYING checksum changed, upstream added an SPDX clarification.
>   The license is unchanged.
> * rpm-setup-autosign moved from ${libdir}/rpm to ${bindir}, add it to
>   rpm-build. rpmuncompress moved too and stays in the rpm package.
> * Refresh 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch=
,
>   it applied with fuzz 2 after upstream added the WITH_WEBSITE option.
>   The other patches apply cleanly.
>
> License-Update: COPYING now has an SPDX clarification note, license uncha=
nged
>
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---

Hi Sumanth,

Thanks for the update, but it looks like we sometimes have build
failures:

ERROR: rpm-native-1_6.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/qemuarm-tc/build/build-st-2526906/tmp/work/x86_64-linux/rpm-native/=
6.1.0/temp/run.do_compile.2871087' failed with exit code 2
NOTE: recipe mesa-tools-native-2_26.2.4-r0: task do_create_spdx: Succeeded
NOTE: CPU pressure (>20000.0us) is limiting task startup
NOTE: No pressure is limiting task startup
NOTE: Running task 1924 of 1996 (virtual:native:/srv/pokybuild/yocto-worker=
/qemuarm-tc/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.=
bb:do_create_spdx)
NOTE: recipe python3-pygments-native-2.21.0-r0: task do_create_spdx: Starte=
d
NOTE: recipe mesa-native-2_26.2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-native-2.21.0-r0: task do_create_spdx: Succee=
ded
NOTE: recipe mesa-native-2_26.2.4-r0: task do_create_spdx: Succeeded
NOTE: CPU pressure (>20000.0us) is limiting task startup
NOTE: recipe glibc-2.44+git-r0: task do_configure: Succeeded
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemuarm-tc=
/build/build-st-2526906/tmp/work/x86_64-linux/rpm-native/6.1.0/temp/log.do_=
compile.2871087
Log data follows:
...
| /srv/pokybuild/yocto-worker/qemuarm-tc/build/build-st-2526906/tmp/work/x8=
6_64-linux/rpm-native/6.1.0/sources/rpm-6.1.0/lib/headerfmt.cc:7:10: fatal =
error: format: No such file or directory
|     7 | #include <format>
|       |          ^~~~~~~~
| compilation terminated.
| make[2]: *** [lib/CMakeFiles/librpm.dir/build.make:154: lib/CMakeFiles/li=
brpm.dir/headerfmt.cc.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemuarm-tc/build/=
build-st-2526906/tmp/work/x86_64-linux/rpm-native/6.1.0/build'
| make[1]: *** [CMakeFiles/Makefile2:700: lib/CMakeFiles/librpm.dir/all] Er=
ror 2
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/qemuarm-tc/build/=
build-st-2526906/tmp/work/x86_64-linux/rpm-native/6.1.0/build'
| make: *** [Makefile:136: all] Error 2
|
| WARNING: exit code 2 from a shell command.
NOTE: recipe rpm-native-1_6.1.0-r0: task do_compile: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/5000
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/5121
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5369

All these build were on debian 12 workers, so there might be some issues
with that host distribution. I'm launching a genericx86-64 build on a
debian 12 worker, to see if it reproduces easily.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5047

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

