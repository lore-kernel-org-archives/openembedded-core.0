Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C22EC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17119.1785852265450371794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TouSsKRz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C3861A138B
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 14:04:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAE3F6029E;
	Tue,  4 Aug 2026 14:04:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBD2511C32D26;
	Tue,  4 Aug 2026 16:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852262; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FW0tAauZppLl9m+Zey8PK1D0J+hx7c/kmj/gLdoj7Es=;
	b=TouSsKRzrxQdbIVJcETfaC7BYItelPAVv9IJC/MBxVVa1AV9Vy9mLWGIduLo1UiMwnz9Gh
	MVvaTMs0V9jfah162lRhKYsnoK+dmfqqVd46lHkmCk1aOZdrdMUCXpDbpNCBAm33z5EdH1
	3ac4sEbqgf4guz8W3uykLX3SkT82AJuSU4Ii1GLcmHHnZ24hE4QEbJSXpsvUVGGqWVwTXH
	Eu129n5DA0JorTU/ZMl7fW+Tp1gZ+QRqPn1G5stIs0pjCobSbASpIoAGa8zZkgn36FoZbz
	lktr2OVDvcxNxdHm1FYyksDD6NnmVtxIkEGtkuLYznLIywhf+g8yeFMbYHMpOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 16:04:20 +0200
Message-Id: <DKG7SIJCKHS2.32EJGR9IZRUOP@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/8] libdisplay-info: upgrade 0.3.0 -> 0.4.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804040509.1454-1-wangmy@fujitsu.com>
 <20260804040509.1454-2-wangmy@fujitsu.com>
In-Reply-To: <20260804040509.1454-2-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242763

On Tue Aug 4, 2026 at 6:05 AM CEST, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{libdisplay-info_0.3.0.bb =3D> libdisplay-info_0.4.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.3.0.bb =
=3D> libdisplay-info_0.4.0.bb} (92%)
>
> diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.b=
b b/meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
> similarity index 92%
> rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
> rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
> index 380c12b867..d993bf1061 100644
> --- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
> +++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.4.0.bb
> @@ -9,6 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4426409957080=
ee0352128354cea2de"
>  DEPENDS =3D "hwdata-native"
> =20
>  SRC_URI =3D "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;b=
ranch=3Dmain;protocol=3Dhttps;tag=3D${PV}"
> -SRCREV =3D "47a5590e9c4eb35d67651b8c05a55f1a48259329"
> +SRCREV =3D "c67a3e9bedb05ab61c7443704a1a107e76254595"
> =20
>  inherit meson pkgconfig lib_package

Hi Wang,

Thanks for your patch.

It looks like this is breaking the weston build:

ERROR: weston-15.0.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/weston/=
15.0.1/temp/run.do_configure.1796706' failed with exit code 1
...
| Dependency libdisplay-info for host machine found: NO. Found 0.4.0 but ne=
ed: '< 0.4.0' ; matched: '>=3D 0.2.0'
| Run-time dependency libdisplay-info found: NO  (tried pkg-config and cmak=
e)
| Looking for a fallback subproject for the dependency libdisplay-info
| ERROR: Subproject display-info is buildable: NO
|
| ../sources/weston-15.0.1/meson.build:179:22: ERROR: Automatic wrap-based =
subproject downloading is disabled
|
| A full log can be found at /srv/pokybuild/yocto-worker/musl-qemux86-64/bu=
ild/build/tmp/work/x86-64-v3-poky-linux-musl/weston/15.0.1/build/meson-logs=
/meson-log.txt
|
| Last 10 lines of meson-log.txt:
| -ldisplay-info
| -----------
| Dependency libdisplay-info for host machine found: NO. Found 0.4.0 but ne=
ed: '< 0.4.0' ; matched: '>=3D 0.2.0'
| CMake binary for host machine is cached as not found
| CMake binary for machine host machine not found. Giving up.
| Run-time dependency libdisplay-info found: NO  (tried pkg-config and cmak=
e)
| Looking for a fallback subproject for the dependency libdisplay-info
| ERROR: Subproject display-info is buildable: NO
|
| ../sources/weston-15.0.1/meson.build:179:22: ERROR: Automatic wrap-based =
subproject downloading is disabled
|
| ERROR: meson setup failed
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4365
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4329
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4329
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4336

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


