Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB68CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:02:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.29849.1759741329495081633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ua639OzF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A182B4E40EF4
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Oct 2025 09:02:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76843606B7;
	Mon,  6 Oct 2025 09:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D5F6102F1D50;
	Mon,  6 Oct 2025 11:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759741326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=yfXnV7TT8v0z82wJXhtLWWS8tXfUmro1mxbq1VGqPy8=;
	b=ua639OzF+yRMGTd20XFOI97YNX0LxL9gDNNAjSWtJ45FU7Fi2vwEnCh8WIMudun1XlihbC
	5Nk47VWxmYY5/RkNGNF+Jk0+jeZrKD7B8aK+Jz3m6FhD2iDivmIBkUhhyIx7ahvnwzHCIO
	tEzQD3H2J4EROO7xP0Zjdo4gmn2aQwGN14uugrUkKyp9xbXK1/ef1IpspbCiPA0FuWrQc+
	jDvERF76KpX3inuBd986HBbdj/Q7+iJavbF2UaZsbugzHSUADmHZVhs0th8HSEkikjF1vX
	GiHninATmkPrzffNFczGLaE0hUs/l2b3JEtNgQpuDuDCodahP5Nbkh+mfu29eQ==
Content-Type: multipart/mixed;
 boundary=f65e48465e143fd2dc944fbbe8d0a1df67819b444708f3cc2361cda5275d
Mime-Version: 1.0
Date: Mon, 06 Oct 2025 11:01:59 +0200
Message-Id: <DDB48HY9ROCL.LSTRL7ZMUFM1@bootlin.com>
Cc: <denis@denix.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anna-Lena Marx" <anna-lena.marx@inovex.de>, <alex.kanavin@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <20251002211744.3418535-1-anna-lena.marx@inovex.de>
 <DDAME0P70H0A.3G3G7DPYEVKK3@bootlin.com>
In-Reply-To: <DDAME0P70H0A.3G3G7DPYEVKK3@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224469

--f65e48465e143fd2dc944fbbe8d0a1df67819b444708f3cc2361cda5275d
Content-Type: multipart/alternative;
 boundary=4a5edcc43ef238f5f2615977370a838cba7047dcacfb8ea8440a7f4746d2

--4a5edcc43ef238f5f2615977370a838cba7047dcacfb8ea8440a7f4746d2
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Sun Oct 5, 2025 at 9:02 PM CEST, Mathieu Dubois-Briand wrote:
> On Thu Oct 2, 2025 at 11:17 PM CEST, Anna-Lena Marx wrote:
>> With the upgrade to 3.50.4, some configure options changed
>> as the project switched from `autotools` to `autosetup`.
>> The PACKAGECONFIG "dyn_ext" is not longer available.
>> Besides, the default CONFIGUREOPTS "target", "exec_prefix"
>> and "oldincludedir" became invalid.
>>
>> Changelog: https://sqlite.org/releaselog/3_50_4.html
>>
>> Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
>> ---
>
> Hi Anna-Lena,
>
> Thanks for the new version.
>
> I can't explain why, but it looks like this is breaking the
> imagefeatures.ImageFeatures.test_mandb test:
>
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['k=
ernel-6.16.9-yocto-standard'] have failed. If the intention is to defer the=
m to first boot,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> ...
> 2025-10-05 14:14:59,584 - oe-selftest - INFO - imagefeatures.ImageFeature=
s.test_mandb (subunit.RemotedTestCase)
> 2025-10-05 14:14:59,586 - oe-selftest - INFO -  ... FAIL
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2478
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2391
>
> I was not able to reproduce this locally, I will try to extract logs
> from the autobuilder in the coming days to provide a bit more context.
>

Here is some log from the autobuilder, not sure it helps much:

  Installing       : kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff7   1=
7/56
  Running scriptlet: kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff7   1=
7/56
%post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qem=
ux86_64): scriptlet start
%post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qem=
ux86_64): execv(/bin/sh) pid 1421854
+ set -e
+ [ ! -e /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/bu=
ild/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs/l=
ib/modules/6.16.9-yocto-standard ]
+ [ -n /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/buil=
d/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs ]
+ depmodwrapper -a -b /srv/pokybuild/yocto-worker/oe-selftest-debian-mathie=
u-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal=
/1.0/rootfs 6.16.9-yocto-standard kernel
Segmentation fault
%post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490a8-r0.qem=
ux86_64): waitpid(1421854) rc 1421854 status 8b00
warning: %post(kernel-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9db490=
a8-r0.qemux86_64) scriptlet failed, exit status 139

Error in POSTIN scriptlet in rpm package kernel-6.16.9-yocto-standard
  Installing       : kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+   1=
8/56
  Running scriptlet: kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+   1=
8/56
%post(kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9=
db490a8-r0.qemux86_64): scriptlet start
%post(kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9=
db490a8-r0.qemux86_64): execv(/bin/sh) pid 1421928
+ set -e
+ set +e
+ [ -n /srv/pokybuild/yocto-worker/oe-selftest-debian-mathieu-20251004/buil=
d/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs ]
+ ln -sf bzImage-6.16.9-yocto-standard /srv/pokybuild/yocto-worker/oe-selft=
est-debian-mathieu-20251004/build/build-st/tmp/work/qemux86_64-poky-linux/c=
ore-image-minimal/1.0/rootfs/boot/bzImage
+ set -e
%post(kernel-image-bzimage-6.16.9-yocto-standard-6.16.9+git0+1ac1d0ff73_3f9=
db490a8-r0.qemux86_64): waitpid(1421928) rc 1421928 status 0

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--4a5edcc43ef238f5f2615977370a838cba7047dcacfb8ea8440a7f4746d2--

--f65e48465e143fd2dc944fbbe8d0a1df67819b444708f3cc2361cda5275d
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_rootfs.1385270.bz2
Content-Type: application/x-bzip2; name=log.do_rootfs.1385270.bz2

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
sg+X00VQxVO7wIO54eU/T/8XckU4UJCldiJW
--f65e48465e143fd2dc944fbbe8d0a1df67819b444708f3cc2361cda5275d--

