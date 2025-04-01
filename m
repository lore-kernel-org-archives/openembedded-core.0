Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD79EC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 10:58:01 +0000 (UTC)
Received: from tim.rpsys.net (tim.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web10.16033.1743505073765978038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 03:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
Authentication-Results: tim.rpsys.net; dmarc=none (p=none dis=none) header.from=rpsys.net
Received: from [192.168.1.8] (tim.rpsys.net [217.169.23.61] (may be forged))
	(authenticated bits=0)
	by tim.rpsys.net (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTPSA id 531Avh7A358282
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 11:57:44 +0100
Message-ID: <9bb20616338ddfa915a7e2457858198fa4bdf6fc.camel@rpsys.net>
Subject: Re: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
From: Richard Purdie <rpurdie@rpsys.net>
To: mathieu.dubois-briand@bootlin.com, leimaohui@fujitsu.com,
        Jose Quaresma
	 <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
        openembedded-core@lists.openembedded.org
Date: Tue, 01 Apr 2025 11:57:38 +0100
In-Reply-To: <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
	 <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
	 <D8UCSOK7M0KD.2FXD6KPWVXD95@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at tim
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 10:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214015

On Mon, 2025-03-31 at 11:45 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Mon Mar 31, 2025 at 11:40 AM CEST, Mathieu Dubois-Briand wrote:
> > On Mon Mar 31, 2025 at 8:48 AM CEST, leimaohui via
> > lists.openembedded.org wrote:
> > > Disable new meson option dots_viewer
> > >=20
> > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > ---
> >=20
> > Hi Lei,
> >=20
> > Thanks for your patch.
> >=20
> > It looks like we get some new ptest issues on gstreamer when
> > building on
> > the autobuilder:
> >=20
> > Failed ptests:
> > {'gstreamer1.0': ['gstreamer/elements_queue.test']}
> >=20
> > More details about the ptests failures can be seen here:
> >=20
> > https://valkyrie.yocto.io/pub/non-release/20250331-52/testresults/qemux=
86-64-ptest/core-image-ptest-gstreamer1.0/
> >=20
> > Can you have a look at these failures please?
>=20
> It also looks like we get a building error, I'm not sure why it only
> happens on some platforms:
>=20
> ERROR: gstreamer1.0-1.26.0-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/armv5e-
> poky-linux-gnueabi/gstreamer1.0/1.26.0/temp/run.do_compile.99896'
> failed with exit code 1
> ...
> > /srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/armv5e-poky-=
linux-gnueabi/gstreamer1.0/1.26.0/recipe-sysroot-native/usr/bin/arm-poky-li=
nux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi=
/14.2.0/ld: gst/libgstreamer-1.0.so.0.2600.0.p/gstbuffer.c.o: in function `=
gst_atomic_int64_inc':
> > /usr/src/debug/gstreamer1.0/1.26.0/gst/gstbuffer.c:180:(.text+0x38c
> > 8): undefined reference to `__atomic_fetch_add_8'
> > collect2: error: ld returned 1 exit status
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/1216
>=20

This also passed in my testing so I'm a bit worried about this. We'll
likely now have valid sstate, just to complicate this.

Cheers,

Richard

