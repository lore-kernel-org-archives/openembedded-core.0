Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D17BD2F00B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 12:27:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9569.1769516833403468759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 04:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XCNSBLr9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 832CA1A2A7E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 12:27:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50B51606F5;
	Tue, 27 Jan 2026 12:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FED9119A8686;
	Tue, 27 Jan 2026 13:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769516830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DDBux9gwA2NDD9IWZMNaOXo3Gar2DG9z7+tTe9Di5Hs=;
	b=XCNSBLr9zfk7HUAP3rGqUwJS1uJq2sCvsOxc3HLjl7grl1xhLrYO//TKYJ8Qa7NhnDdnS3
	WLiWNLRKO9f0IRS0X7gmP+Xx76b0eCzeV3WZ87aTAsYXZeWglHoMwC814oR/tY0G88O7aS
	cW7N9MJIi6sIUrYqLLZYgU8jHenQMtPDpJCAt0lxHSIktvHVg6fXk0f+DD8fGyFYTPSR7p
	IL8lHdYXkkDpahq+XvyxhZUpI6KVNp5ruEAChbks9vmngnpm0sx5zq011cZpkhf7367u93
	zPT2jEuOsxfTzeRoA6Sn2wDFGfEmLJ55H4IP2igzA12XtsZ/fZyzcZjl5DCm9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 13:27:04 +0100
Message-Id: <DFZDD2VAMRIY.3LGF8BHLVYMLG@bootlin.com>
Cc: <alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
 <mark.hatle@kernel.crashing.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] rpm: 4.20.1 -> 6.0.1
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1769148163.git.liezhi.yang@windriver.com>
 <212239fdc34e812c1e827917d5db83fecac2a3f3.1769148163.git.liezhi.yang@windriver.com>
In-Reply-To: <212239fdc34e812c1e827917d5db83fecac2a3f3.1769148163.git.liezhi.yang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 12:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230041

On Fri Jan 23, 2026 at 7:13 AM CET, Robert Yang via lists.openembedded.org =
wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> * Add a tag to SRC_URI so that there will be errors when only change the
>   filename during upgrade it, as suggested by Alexander.
>
> * Rebase the following patch:
>   - 0001-Add-a-color-setting-for-mips64_n32-binaries.patch
>   - 0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
>   - 0001-Do-not-read-config-files-from-HOME.patch
>   - 0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
>   - 0001-When-cross-installing-execute-package-scriptlets-wit.patch
>   - 0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
>   - 0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
>   - 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
>   - 0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
>   - 0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
>
> * Remove backported patch 0001-CMakeLists.txt-Fix-checking-for-CFLAGS.pat=
ch
>
> * Add the following 2 patches:
>   - 0001-tools-elfdeps.cc-Remove-format-module.patch
>     There is no format until gcc 13.1, so remove the format module to mak=
e it
>     work on hosts such as Ubuntu 22.04.
>
>   - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
>     Fixed:
>     GPG check FAILED
>
> * Add scdoc-native to DEPENDS to fix do_configure error for both native a=
nd
>   target:
>   Could not find SCDOC using the following names: scdoc
>
>   Note, both target and native need scdoc-native, it is used for generati=
ng the
>   manual, the man pages in *man/* are scdoc sources
>
> * Add /etc/rpm to nativesdk-rpm to fix:
>   ERROR: nativesdk-rpm-1_6.0.1-r0 do_package: QA Issue: nativesdk-rpm:
>   Files/directories were installed but not shipped in any package:
>   /etc
>   /etc/rpm
>
> * Test info:
>   PACKAGE_CLASSES =3D "package_rpm"
>   $ bitbake core-image-sato world
>   $ bitbake core-image-sato -cpopulate_sdk
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---

Hi Robert,

Thanks for your patch.

Some tests are failing after this upgrade, you can see them with
"bitbake core-image-full-cmdline:do_testimage":

AssertionError: 1 !=3D 0 : dnf --repofrompath=3Doe-testimage-repo-qemux86_6=
4,http://192.168.7.1:41395/qemux86_64 --repofrompath=3Doe-testimage-repo-no=
arch,http://192.168.7.1:41395/noarch --repofrompath=3Doe-testimage-repo-x86=
_64_x32,http://192.168.7.1:41395/x86_64_x32 --nogpgcheck install --installr=
oot=3D/home/root/chroot/test -v -y --rpmverbosity=3Ddebug busybox
...
%post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
error: failed to exec scriptlet interpreter /bin/sh: No such file or direct=
ory
%post(busybox-1.37.0-r0.x86_64_x32): waitpid(624) rc 624 status 7f00
warning: %post(busybox-1.37.0-r0.x86_64_x32) scriptlet failed, exit status =
127

Error in POSTIN scriptlet in rpm package busybox
  Installing       : libc6-2.42+git0+453e6b8dba-r1.x86_64_x32              =
 3/4

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3059
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3107
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3127
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3100

Can you have a look at these tests?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


