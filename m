Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9E3C67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 09:44:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11976.1712396684183570403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 02:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MsjlYnVJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64208C0004;
	Sat,  6 Apr 2024 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712396681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6/J1C+qxrB9WWhuoQSB/oO+5xuB48Wc1DcOL+yVDFo=;
	b=MsjlYnVJDBx0N3HYcbzBukPBRewW5XCY6ZcJeZRJAvMRF+k0yDgfhpOCfhNQNy4ZXVy9KH
	M2Xm5VQe6tBjr+fYG+Y84IiJgUAulMA0iTyblLBx+YR2p3Fbwm2TTdXk8DFsay6SJX5zb/
	D+XqM4cUjYOJt5C/RLuxNBkA6vbX0yqrwkuhKIlyw9U7HgYB3TMQ5TB35fpyGqcKI70zZK
	OKpbBzsfhM6PuUZuuIltustkZT6iFKlb7xerdKZZesYhSPtRtxQVQuWiTx0723lWmQlG5s
	9qkj9XYTUk/r1RvwVVzIxYfkGB4Vv1yY07fu/622IgeKgahC2DTevfz8j98BTA==
Date: Sat, 6 Apr 2024 11:44:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH] shadow: install manpages
Message-ID: <2024040609444110e9aa84@mail.local>
References: <20240404221823.3671396-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404221823.3671396-1-danismostlikely@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 09:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197991

Hello,

This causes the following warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8766/steps/12/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8739/steps/17/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/8787/steps/11/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/8787/steps/14/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8849/steps/25/logs/warnings

WARNING: nativesdk-shadow-4.14.2-r0 do_package: shadow: alternative target (/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chfn.1 or /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chfn.1.shadow) does not exist, skipping...
WARNING: nativesdk-shadow-4.14.2-r0 do_package: shadow: alternative target (/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chsh.1 or /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chsh.1.shadow) does not exist, skipping...
WARNING: nativesdk-shadow-4.14.2-r0 do_package: shadow: NOT adding alternative provide /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chfn.1: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chfn.1.shadow does not exist
WARNING: nativesdk-shadow-4.14.2-r0 do_package: shadow: NOT adding alternative provide /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chsh.1: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chsh.1.shadow does not exist
WARNING: nativesdk-shadow-4.14.2-r0 do_package: shadow: alt_link == alt_target: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chfn.1 == /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chfn.1
WARNING: nativesdk-shadow-4.14.2-r0 do_package: shadow: alt_link == alt_target: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chsh.1 == /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/share/man/man1/chsh.1

On 04/04/2024 16:18:23-0600, Dan McGregor wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
> 
> Install the manpages for shadow, and also make the conflicting manpages
> alternatives in util-linux.
> 
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.39.3.bb | 3 +++
>  meta/recipes-extended/shadow/shadow.inc           | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
> index 83b3f4e05b3..a3f9badbd97 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
> @@ -282,8 +282,11 @@ blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1
>  mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
>  "
>  ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
> +ALTERNATIVE:${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'chfn-chsh', 'chfn.1 chsh.1', '', d)}"
>  
>  ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
> +ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
> +ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
>  ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
>  ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
>  ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 40e6ab0b30e..0029d848bf1 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -168,6 +168,10 @@ do_install:append:class-native() {
>  SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
>  INSANE_SKIP:${PN}:class-native = "already-stripped"
>  
> +do_install:append:class-target() {
> +	oe_runmake -C ${B}/man DESTDIR="${D}" sbindir="${base_sbindir}" usbindir="${sbindir}" install-man
> +}
> +
>  PACKAGES =+ "${PN}-base"
>  FILES:${PN}-base = "\
>      ${base_bindir}/login.shadow \
> @@ -193,6 +197,10 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
>  ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
>  ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
>  
> +ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1"
> +ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
> +ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
> +
>  ALTERNATIVE:${PN}-base = "newgrp groups login su"
>  ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
>  ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197974): https://lists.openembedded.org/g/openembedded-core/message/197974
> Mute This Topic: https://lists.openembedded.org/mt/105338723/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

