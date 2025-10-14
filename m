Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70A8CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 05:14:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.8168.1760418892963161383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 22:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1sDUBD4W;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B8D8C08CF1
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:14:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB141606EC;
	Tue, 14 Oct 2025 05:14:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7190A102F2281;
	Tue, 14 Oct 2025 07:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760418890; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CWg3S7vfdEg1klLsYO37JVbT4r6wtHdBd6A5S0m6z0M=;
	b=1sDUBD4WDF2PngZ1aBAWvLoJcPVlwjuOT6VCG9YL+M5l0T1lUF77yN/Ghc461fXTuNsZgT
	4CO5hyi2G+V8oBntRDNI9ri6PckKNCf9+lSH/VDOBugJYx+yYwL+GNaPGOcAmppQj71Fzi
	k1AuTpyRn+TtzW6QiqGfQST13vPPq+LFGEU3NapuxQ9Hn+ekTRolf/4f+0qXMqu4fK1qYf
	eWXyt5Jo4K7VdeJvcV6HBauQl5BsdSn/60xsxM1S6gGVORPu8+hhZKFcCX6yDB9zBy26fr
	PreDDilgWagakeqT3+1wZJXrpQBFG+iwyRhPPMkR7KHOiosZ/zpganQvxQf2Wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 07:14:46 +0200
Message-Id: <DDHSEW0SIVAB.1KZ3VKLOD1UJE@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] glibc: inherit update-rc.d
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251013124515.2362058-1-ross.burton@arm.com>
In-Reply-To: <20251013124515.2362058-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224804

On Mon Oct 13, 2025 at 2:45 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> The nscd package has an init script, so we should be inheriting the
> update-rc.d class like we inherit the the systemd class.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I'm afraid, but this is creating circular dependencies.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-co=
re/glibc/glibc_2.42.bb:do_collect_spdx_deps (dependent Tasks ['patch_2.8.bb=
:do_populate_sysroot', 'libtool-native_2.5.4.bb:do_create_spdx', 'bison_3.8=
.2.bb:do_create_spdx', 'initscripts_1.0.bb:do_create_spdx', 'automake_1.18.=
1.bb:do_create_spdx', 'linux-libc-headers_6.16.bb:do_create_spdx', 'gcc-cro=
ss_15.2.bb:do_create_spdx', 'gperf_3.3.bb:do_create_spdx', 'binutils-cross_=
2.45.bb:do_create_spdx', 'glibc_2.42.bb:do_unpack', 'libgcc-initial_15.2.bb=
:do_create_spdx', 'update-rc.d_0.8.bb:do_create_spdx', 'texinfo-dummy-nativ=
e.bb:do_create_spdx', 'quilt-native_0.69.bb:do_populate_sysroot', 'autoconf=
_2.72.bb:do_create_spdx'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-co=
re/glibc/glibc_2.42.bb:do_create_spdx (dependent Tasks ['patch_2.8.bb:do_po=
pulate_sysroot', 'glibc_2.42.bb:do_populate_sysroot', 'glibc_2.42.bb:do_col=
lect_spdx_deps', 'glibc_2.42.bb:do_deploy_source_date_epoch', 'quilt-native=
_0.69.bb:do_populate_sysroot', 'glibc_2.42.bb:do_package', 'glibc_2.42.bb:d=
o_packagedata'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-co=
re/update-rc.d/update-rc.d_0.8.bb:do_collect_spdx_deps (dependent Tasks ['p=
atch_2.8.bb:do_populate_sysroot', 'update-rc.d_0.8.bb:do_unpack', 'gcc-cros=
s_15.2.bb:do_create_spdx', 'glibc_2.42.bb:do_create_spdx', 'gcc-runtime_15.=
2.bb:do_create_spdx', 'quilt-native_0.69.bb:do_populate_sysroot'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-co=
re/update-rc.d/update-rc.d_0.8.bb:do_create_spdx (dependent Tasks ['patch_2=
.8.bb:do_populate_sysroot', 'update-rc.d_0.8.bb:do_package', 'update-rc.d_0=
.8.bb:do_deploy_source_date_epoch', 'update-rc.d_0.8.bb:do_populate_sysroot=
', 'update-rc.d_0.8.bb:do_packagedata', 'update-rc.d_0.8.bb:do_collect_spdx=
_deps', 'quilt-native_0.69.bb:do_populate_sysroot'])

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2532
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2446
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2574

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


