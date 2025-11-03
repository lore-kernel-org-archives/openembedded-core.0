Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E49CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 19:26:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132.1762197970132697301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 11:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hA4iL4G+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EEAC1A1857
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 19:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 020A960628;
	Mon,  3 Nov 2025 19:26:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45C1010B5019F;
	Mon,  3 Nov 2025 20:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762197967; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yZaaeyAhvVQIPYAPDZUodUuNIXS08ZrqgGDwi4IwuTU=;
	b=hA4iL4G+NplX9Nzehne5LdyQoNtVPCu4RGZRAno4SyXk6nZvz0ZXeIqTmZhal4vcoz3SZI
	NeKD222UMEDbVm+2PFBbpupEomVyjQORjUKzz4FNzlX7hVgBZcIpsT7NBM3OiFCOI5uSI2
	exI1WgWJJ2h79hTPSc/T/LcJ0vZQsYdsyv2jWyTnkzcybDUqaGBVOkFz1IPOGEV+jm2bsn
	ODazJCJH2ne2OISYMni/tnl4LWNPLHd2VZMC6wQLUYP0GUd2/qJDMwenTli4GEw11QdiTJ
	DW+/8HuHiupXNWGS51WqolWRVr+WiQLqwdBPqG1jlXcCb4b8OTC6X11OFadU8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 20:26:04 +0100
Message-Id: <DDZB1KU7GL22.2C3I05QJUAJ1A@bootlin.com>
Subject: Re: [OE-core] [PATCH 10/18] at-spi2-core: Upgrade 2.56.4 -> 2.58.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joerg.sommer@navimatix.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de> <d99e920567d7842cd941f68bb5a4e26910a735f0.1762154252.git.joerg.sommer@navimatix.de>
In-Reply-To: <d99e920567d7842cd941f68bb5a4e26910a735f0.1762154252.git.joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 19:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225692

On Mon Nov 3, 2025 at 8:27 AM CET, J=C3=B6rg Sommer via lists.openembedded.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Add python override files added with 2.57.0
>
> /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
> /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-=
313.pyc
>
> see https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/7c8a9365d5009b43=
afe6d16bebefc14a8df410a7
>
> Changelog:
>
> What's new in at-spi2-core 2.58.1:
> * at-spi-bus-launcher: Fix a possible crash when registering.
> * python: Avoid traceback when hashing a disposed object
> * Fix build failure on MacOS.
> * Fix transfer rule for atk_table_cell_get_table and atk_table_get_summar=
y.
>
> What's new in at-spi2-core 2.58.0:
> * libatspi: Increase ATSPI_ROLE_COUNT after switch role was added
> * Add ATSPI_CHECK_VERSION macro.
> * Properly fix key notifications under X11 when multiple keyboard layouts
>   are in use.
>
> What's new in at-spi2-core 2.57.2:
> * Don't install at-spi-dbus-bus.service if systemd is not enabled.
> * Some collection fixes and documentation improvements.
> * Fix reporting the wrong keysym on X11 setups where multiple keyboard
>   layouts are in use.
> * Fix possible memory leak in atspi_accessible_get_description.
>
> What's new in at-spi2-core 2.57.1:
> * Fix several crashes introduced by the code to handle the accessibility
>   bus going away.
> * Add atspi_device_clear_key_grabs.
> * Fix key grabs when num lock or caps lock are on under Wayland.
>     atk-bridge: Don't crash when requesting a plug if not activated
> * Have python overrides check DBus object paths when testing for equality=
.
> * Add sanity checks for child indices received via DBus.
>
> What's new in at-spi2-core 2.57.0:
> * device-a11y-manager: Fix crash on dispose
> * device-a11y-manager: Check properly for the DBus backend presence
> * Fix the build with glib < 2.76.
> * a11y-manager-device: Fix unmap_keysym_modifier.
> * DeviceEventController: update mouse coordinates before sending button e=
vents
> * atspi-device-legacy: Don't crash when XkbGetMap fails
> * Return localized role name for ATSPI_ROLE_EDITBAR
>     atk-adaptor: Reconnect when the bus launcher reappears.
> * Don't keep references to uncached objects in the application's hash tab=
le.
> * Add some Python overrides.
>     AtspiDeviceX11: Suppress window events following key grabs when neede=
d.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---

Hi J=C3=B6rg,

Thanks for the patch.

It looks like some new files should be shipped:

ERROR: at-spi2-core-2.58.1-r0 do_package: QA Issue: at-spi2-core: Files/dir=
ectories were installed but not shipped in any package:
  /usr/lib/python3.13
  /usr/lib/python3.13/site-packages
  /usr/lib/python3.13/site-packages/gi
  /usr/lib/python3.13/site-packages/gi/overrides
  /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-=
313.pyc

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2667

Can you have a look at this?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


