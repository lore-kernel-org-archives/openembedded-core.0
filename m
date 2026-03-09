Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F658EF36F4
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:16:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8730.1773040561059735164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zGHtq8jh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80408C4286F;
	Mon,  9 Mar 2026 07:16:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EBED5FFB8;
	Mon,  9 Mar 2026 07:15:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D13310369A9B;
	Mon,  9 Mar 2026 08:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773040558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RZMsdYBO+ymVy/3dEMjDhzHDKX5ZgBcvNghm2ttUXjw=;
	b=zGHtq8jhgjIiuuqr9y/I5d5rXv9T1y3xmRzaclddImjqUE8/y/0Bbz8SYZD8FnVWEfObtC
	duLXccqAMV5izC5klB9YmuHMOoME14YEDXE2atsfh57IjNMInb+/2Nue/u5nJSHt4XvwE3
	JDGyTJlhmnA8/DmWgiFEqjYU/tkefCXv5Vc4bJjkVxL1PdH3yopVf/yWthvrtAR1AgRR+J
	1nRQIR1p3KMmEbtw8MsCg62S681CLHT2Wb8eBwbL9eTxmrpj/yQbgM+24qMUCrj3TngUma
	UrDMS1mC3jnrKb9p7sajvW0rt0E3iqhsevLo9kYtFZ0WAhK6rb/G2gWRh39E5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 08:15:55 +0100
Message-Id: <DGY2F6IHB5J8.19O12JA60I1SB@bootlin.com>
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
Cc: <alex.kanavin@gmail.com>, "Ross Burton" <ross.burton@arm.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com> <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org> <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com> <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com> <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com> <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com> <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com>
In-Reply-To: <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232683

On Mon Mar 9, 2026 at 8:04 AM CET, Mathieu Dubois-Briand wrote:
> Hi Robert,
>
> I ran a build, not with your gettext patch, but with the one from the
> glibc upgrade by Hemanth. We still had similar errors.
>
> Any opinion?
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3378
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3330
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3302
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3307
>
> Thanks,
> Mathieu

I also note a lot of selftest failures, that are probably related. Like
this one:

2026-03-08 19:02:19,088 - oe-selftest - INFO - debuginfod.Debuginfod.test_d=
ebuginfod_qemu (subunit.RemotedTestCase)
2026-03-08 19:02:19,088 - oe-selftest - INFO -  ... FAIL
...
[Sun Mar  8 18:59:18 2026] (1950649/1950690): cannot open archive from pipe=
 /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp=
-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/xz-lo=
cale-pt-5.8.2-r0.cortexa57.rpm
[Sun Mar  8 18:59:18 2026] (1950649/1950690): libarchive error: cannot open=
 archive from pipe: Unrecognized archive format
[Sun Mar  8 18:59:18 2026] (1950649/1950690): exceptions encountered during=
 archive scan
[Sun Mar  8 18:59:18 2026] (1950649/1950695): cannot open archive from pipe=
 /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp=
-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/bash-=
locale-sr-5.3-r0.cortexa57.rpm
[Sun Mar  8 18:59:18 2026] (1950649/1950690): cannot open archive from pipe=
 /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp=
-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/bash-=
locale-hr-5.3-r0.cortexa57.rpm
[Sun Mar  8 18:59:18 2026] (1950649/1950691): cannot open archive from pipe=
 /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp=
-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/xz-lo=
cale-nl-5.8.2-r0.cortexa57.rpm
[Sun Mar  8 18:59:18 2026] (1950649/1950691): libarchive error: cannot open=
 archive from pipe: Unrecognized archive format
[Sun Mar  8 18:59:18 2026] (1950649/1950691): exceptions encountered during=
 archive scan
[Sun Mar  8 18:59:18 2026] (1950649/1950688): cannot open archive from pipe=
 /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp=
-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/bash-=
locale-pt-br-5.3-r0.cortexa57.rpm
[Sun Mar  8 18:59:18 2026] (1950649/1950688): libarchive error: cannot open=
 archive from pipe: Unrecognized archive format
[Sun Mar  8 18:59:18 2026] (1950649/1950690): libarchive error: cannot open=
 archive from pipe: Unrecognized archive format
[Sun Mar  8 18:59:18 2026] (1950649/1950690): exceptions encountered during=
 archive scan
[Sun Mar  8 18:59:18 2026] (1950649/1950694): cannot open archive from pipe=
 /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp=
-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/liblz=
ma5-5.8.2-r0.cortexa57.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3254
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3362
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3482

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


