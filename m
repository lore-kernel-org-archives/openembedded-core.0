Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23751C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 16:17:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.9520.1668097048072851988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 08:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jzjeJBtA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 35A21FF802;
	Thu, 10 Nov 2022 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668097045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rlNqgmQV7oajecphY7/dtpp392mrdAJKe5adyzUCqE=;
	b=jzjeJBtAVj763prBMB62iIshDMGiAK8c35wclCOdAtoiLNA9WXn63j5RjqiqWlWoXzr68t
	Q6KNLFM90JxaA6mKCzIIrvxYynB+tzJ0ILDRGYAE0L3KLQywEivcs8Vhmukf0/iAmgfwwX
	j4xWXJrWWTT5G/cfCjWqNEnaZ1YrtWHBN7ojy0UeySHv7ZBocn3btOQWpGgLb862/5duHs
	T6rHcTw0uXMwC7kW14zzUZsmbnO7SoLPsnd5qoZghZjivNTz11b2EUZevPgGBKKtTzSGgO
	eEs1VOo0kpdbEBEfdTj59/Nc5sjvR1xJe1phIv4Q1U7PQdfNBOGzPa6wx0iyhA==
Date: Thu, 10 Nov 2022 17:17:24 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] systemd: add group render to udev package
Message-ID: <Y20kFKDvCiET6XBE@mail.local>
References: <20221108175154.280624-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221108175154.280624-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 16:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173081

Hello,

This causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1839/ste=
ps/12/logs/stdio

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/reproducib=
le/build/meta/recipes-bsp/usbutils/usbutils_014.bb, /home/pokybuild/yocto-w=
orker/reproducible/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaa=
pi_1.20.4.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-=
graphics/wayland/libinput_1.21.0.bb, /home/pokybuild/yocto-worker/reproduci=
ble/build/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb, /home/=
pokybuild/yocto-worker/reproducible/build/meta/recipes-extended/mdadm/mdadm=
_4.2.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-suppo=
rt/libusb/libusb1_1.0.26.bb, /home/pokybuild/yocto-worker/reproducible/buil=
d/meta/recipes-gnome/libgudev/libgudev_237.bb, /home/pokybuild/yocto-worker=
/reproducible/build/meta/recipes-connectivity/ofono/ofono_2.0.bb, /home/pok=
ybuild/yocto-worker/reproducible/build/meta/recipes-graphics/igt-gpu-tools/=
igt-gpu-tools_git.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/=
recipes-multimedia/alsa/alsa-utils_1.2.8.bb, /home/pokybuild/yocto-worker/r=
eproducible/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb, /h=
ome/pokybuild/yocto-worker/reproducible/build/meta/recipes-graphics/waffle/=
waffle_1.7.0.bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recip=
es-bsp/pciutils/pciutils_3.8.0.bb, /home/pokybuild/yocto-worker/reproducibl=
e/build/meta/recipes-graphics/wayland/weston_11.0.0.bb, /home/pokybuild/yoc=
to-worker/reproducible/build/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.=
bb, /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-connectivi=
ty/bluez5/bluez5_5.65.bb, /home/pokybuild/yocto-worker/reproducible/build/m=
eta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb DEPENDS on or othe=
rwise requires it)
systemd PROVIDES udev but was skipped: systemd - udev: system groupname ren=
der does not have a static ID defined. Add render to one of these files: /h=
ome/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/files/=
static-group
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (=
in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'usbuti=
ls', 'udev']



On 08/11/2022 18:51:54+0100, Peter Marko wrote:
> From NEWS for v236:
> * The "uaccess" udev tag has been dropped from /dev/kvm and
>   /dev/dri/renderD*.  These devices now have the 0666 permissions by
>   default (but this may be changed at build-time). /dev/dri/renderD*
>   will now be owned by the "render" group along with /dev/kfd.
>=20
> Without the group systemd-udevd startup logs:
>   /lib/udev/rules.d/50-udev-default.rules:39 Unknown group 'render', igno=
ring
>   /lib/udev/rules.d/50-udev-default.rules:40 Unknown group 'render', igno=
ring
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/systemd/systemd_251.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-co=
re/systemd/systemd_251.4.bb
> index 1b771a7b86..5fb0e86982 100644
> --- a/meta/recipes-core/systemd/systemd_251.4.bb
> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
> @@ -395,11 +395,13 @@ SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'binfmt', '${PN}-binfm
>  SYSTEMD_SERVICE:${PN}-binfmt =3D "systemd-binfmt.service"
> =20
>  USERADD_PACKAGES =3D "${PN} ${PN}-extra-utils \
> +                    udev \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', =
'${PN}-journal-gatewayd', '', d)} \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', =
'${PN}-journal-remote', '', d)} \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'journal-uploa=
d', '${PN}-journal-upload', '', d)} \
>  "
>  GROUPADD_PARAM:${PN} =3D "-r systemd-journal;"
> +GROUPADD_PARAM:udev =3D "-r render"
>  GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit=
_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'coredum=
p', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'network=
d', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
> --=20
> 2.30.2
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172987): https://lists.openembedded.org/g/openembedde=
d-core/message/172987
> Mute This Topic: https://lists.openembedded.org/mt/94895791/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

