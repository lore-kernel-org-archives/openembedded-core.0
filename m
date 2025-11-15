Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF703CEB2CD
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 11:03:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6616.1763204624047415007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 03:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K6AZ2boE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DFF324E416C9;
	Sat, 15 Nov 2025 11:03:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6087606F6;
	Sat, 15 Nov 2025 11:03:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59D87102F213A;
	Sat, 15 Nov 2025 12:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763204621; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QdTrWP9YdQi8X4EyXf6VyG6V5VvkWzxDifp/Ckvf11U=;
	b=K6AZ2boEc4RaEneXRgdjrHn+vW6qzt8yDOmmVHSr5nkj3B+Hy65+oAjDygC4TXPMXqn6Pb
	UN6JkZxdzSWBzITaJzgd4qAPpAzz8jq4EbF4jmek7cOEZob7NYBpb4q6d8mf1wT2ms3r6j
	jq/JrjVpmEviLmwugjmTHlMLtWO6zxDRJgA8fvYNzqTG3AMMfUKh/6CHYRsNl3Eb120hgA
	2W/jYtTWqXTc5UJO4hQ7eGTf1bKpWd4cl8ChSS1ODP2c+9p/kPPgn8k9vXPJL768QQ5xFr
	qFq3cuLE7eX3UdVKqzohHV7ezdvr1FMMXp2LapYFRHVk6IZ1B5dC9z5NP+oVZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 12:03:39 +0100
Message-Id: <DE97VG0TFXK6.1CK6LOE4O97BF@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] nfs-utils: clean up sbin installation
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251114124218.3595920-1-ross.burton@arm.com>
In-Reply-To: <20251114124218.3595920-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 11:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226303

On Fri Nov 14, 2025 at 1:42 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> There's no need to sed the Makefiles as there's an option to simply
> respect sbindir.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I suspect this patch or the next one breaks nfs-utils installation, but
why?

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Could not invoke dnf. Comm=
and '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/generic=
x86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sysroot-native/usr/bin=
/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/genericx86-=
64/build/build/tmp/work/genericx86_64-poky-linux/core-image-full-cmdline/1.=
0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worker=
/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-ful=
l-cmdline/1.0/rootfs/etc/yum.repos.d --installroot=3D/srv/pokybuild/yocto-w=
orker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-imag=
e-full-cmdline/1.0/rootfs --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker/g=
enericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-full-=
cmdline/1.0/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/gener=
icx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-full-cmdl=
ine/1.0/oe-rootfs-repo --nogpgcheck install dnf packagegroup-core-boot pack=
agegroup-core-full-cmdline packagegroup-core-ssh-openssh psplash rpm run-po=
stinsts locale-base-c locale-base-en-us locale-base-en-gb' returned 1:
...
Error:
 Problem: package packagegroup-core-full-cmdline-sys-services-1.0-r0.noarch=
 from oe-repo requires nfs-utils, but none of the providers can be installe=
d
  - package packagegroup-core-full-cmdline-1.0-r0.noarch from oe-repo requi=
res packagegroup-core-full-cmdline-sys-services, but none of the providers =
can be installed
  - package nfs-utils-2.8.4-r0.core2_64 from oe-repo requires nfs-utils-cli=
ent, but none of the providers can be installed
  - conflicting requests
  - nothing provides nfs-utils-mount needed by nfs-utils-client-2.8.4-r0.co=
re2_64 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2733
(and most of the builds in https://autobuilder.yoctoproject.org/valkyrie/#/=
builders/29/builds/2725)

Can you have a look?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


