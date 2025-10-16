Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAEDCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:33:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.308.1760628813752444082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 08:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D5n/5lth;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F40214E410FA;
	Thu, 16 Oct 2025 15:33:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9D276062C;
	Thu, 16 Oct 2025 15:33:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A82B4102F22F7;
	Thu, 16 Oct 2025 17:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760628811; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DNAWkysAXJH6RU+ZVJLZXlbXe3t4EAp5ZGNRDjAvCng=;
	b=D5n/5lthgo8jYa7/eeCPZh8t/+BUg/efSpQcw/sw8P3+F6zhidmJvpVt0U6fbwYsbKYl+y
	XXYUIb/Sy3AojfQv0DHAvX520wGFLBXmUpFT4GycKvK7bAU8eTxjuwoPmAwFRGtK00ww7+
	n7RabNIc424Dnxj3mhS9B8GFC9KBQ0CEGIjIWifO9vNaCTFUH4gl/55AQLay+mkyaBzCew
	XAoC4DqvNqMzDB2QEcE5LxI2Z8XyitvV4IKPbG1+RNceBhp3LqAuSuxAi9Dupo/EJk6WY4
	yySpVg5n+lNtpULPqggy2J/EtMUbwwq/fHNqXrqcRu7me0iuwfp6Z9X0FJ70PA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 17:33:29 +0200
Message-Id: <DDJUTP2CCU14.4145O4MUDT1X@bootlin.com>
Subject: Re: [OE-core][PATCH v2] opkg: upgrade 0.7.0 -> 0.9.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ecordonnier@snap.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251016111628.3050999-1-ecordonnier@snap.com>
In-Reply-To: <20251016111628.3050999-1-ecordonnier@snap.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 15:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224973

On Thu Oct 16, 2025 at 1:16 PM CEST, Etienne Cordonnier via lists.openembed=
ded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> See release notes at
> - http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-note=
s
> - http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-note=
s
>
> [0.9.0] - 2025-06-27
>
> Semiannual opkg release.
> Bumping the minor version as a result of the project build tooling changi=
ng from autotools to cmake.
>
> - Added a Dockerfile container definition (`:docker/`) for a valid develo=
per build environment for opkg.
>   - It's recommended that project contributors use this container to buil=
d and test their changes.
> - The AutoTools-based build framework has [been replaced](https://git.yoc=
toproject.org/opkg/commit/?id=3D3f6040e321634471ec442fb0e80f140f1437e90b) w=
ith a more modern, CMake framework.
>   - Refer to the `docs/CONTRIBUTING.md` documentation for updated build i=
nstructions.
>
> [0.8.0] - 2025-01-10
>
> The minor version bump in this release is due to the changes to cURL erro=
r output line format.
>
> - [Changed](https://git.yoctoproject.org/opkg/commit/?id=3Dab033778682564=
27279b36c4b2a298edae4260b8) the error output for the curl download backend,=
 to now report the HTTP error code for failed requests.
>   - e.g. `error: log_curl_download_error: Failed to download headers of h=
ttps://foo.bar/all/Packages.gz: The requested URL returned error: 401`
> - Enabling debug-verbosity, while using the cURL backend, [will now](http=
s://git.yoctoproject.org/opkg/commit/?id=3Dce6fede3db931bb0da70d1334cdc4101=
d0aec702) print cURL's verbose error log to stderr when there is a download=
 failure.
>   - The verbose output may contain confidential information about your cU=
RL transactions. So this is your reminder that debug-verbosity should not b=
e enabled in production systems or sensitive security environments.
> - The commandline configuration file option (`-f`) [can now](https://git.=
yoctoproject.org/opkg/commit/?id=3D36d08b93d2859992b624a4ba2f412cfa5c766050=
) be specified multiple times, and each configuration file will be loaded a=
nd their settings merged.
> - [Fixed](https://git.yoctoproject.org/opkg/commit/?id=3Dc87188d7535684fd=
db8cf80993c147b215602b63) a bug in control field parsing where custom field=
s whose keys are similar to other fields could be confused by the parser.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---

Hi Etienne,

Thanks for the new version. However we now have another issue:

ERROR: core-image-sato-1.0-r0 do_rootfs: Unable to install packages. Comman=
d '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/qemuarm64=
-poky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/opkg --volati=
le-cache -f /srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/=
qemuarm64-poky-linux/core-image-sato/1.0/opkg.conf -t /srv/pokybuild/yocto-=
worker/qemuarm64-alt/build/build/tmp/work/qemuarm64-poky-linux/core-image-s=
ato/1.0/temp/ipktemp/ -o /srv/pokybuild/yocto-worker/qemuarm64-alt/build/bu=
ild/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0/rootfs  --force-posti=
nstall --prefer-arch-to-version   install locale-base-c locale-base-en-gb l=
ocale-base-en-us' returned 255:
error: pkg_extract_data_file_names_to_stream: Failed to extract data.tar.* =
from package '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/wor=
k/qemuarm64-poky-linux/core-image-sato/1.0/rootfs//var/cache/opkg/volatile.=
121547/938adf05ba43d7b754c8c03468af836d_glibc-binary-localedata-c_2.42+git-=
r0_cortexa57.ipk'.
error: pkg_get_installed_files: Error extracting file list from /srv/pokybu=
ild/yocto-worker/qemuarm64-alt/build/build/tmp/work/qemuarm64-poky-linux/co=
re-image-sato/1.0/rootfs//var/cache/opkg/volatile.121547/938adf05ba43d7b754=
c8c03468af836d_glibc-binary-localedata-c_2.42+git-r0_cortexa57.ipk.
Installing glibc-binary-localedata-c (2.42+git) on root
Downloading file:/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/=
work/qemuarm64-poky-linux/core-image-sato/1.0/oe-rootfs-repo/cortexa57/glib=
c-binary-localedata-c_2.42+git-r0_cortexa57.ipk.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2584
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2576
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2629
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/2594
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2582
https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/2600

Can you have a look at what is the issue here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


