Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA00F34C63
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 15:42:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.275232.1776094965684973724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 08:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qp8ZAsGG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55098C5B1AA
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 15:43:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B055F5FFB9;
	Mon, 13 Apr 2026 15:42:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B219C104513C6;
	Mon, 13 Apr 2026 17:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776094963; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+wW79L95qSaXziHJ8NHORfpXHqSMBbsiV2y8fNpqFtY=;
	b=qp8ZAsGGsqgBJw1KTp37qWgVxDKqiK+D7wQFm/ehiJmcoS7UcCbtVpkvTTOoFQNmfb9wbY
	6asyNhtb4E0M/yNGeqZsp52IMmSz/OzJM7qkZXpkDnXyULC9x5yLWfgTYW1xJc8ls54vuD
	rkMxqAKAuudKWin6BxN2XuDkfVFnntW5QjWPMPwl4e7LUC8xfPRN4+qkF4Nc3n7gvTOPoR
	orNiFutmTpnSMrApHbzlFzB3Teqoe+dJ6X+UEFOFEFndTyW1cP9O/uuvhFwgVMWmkjZuzm
	sMoseYdWn9yEQGv09VgaEvvcCDMLmjEROW1LxTsoQabl20E1ZunR0YiQP5aSUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 17:42:41 +0200
Message-Id: <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319015431.821325-1-changqing.li@windriver.com>
In-Reply-To: <20260319015431.821325-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 15:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235116

On Thu Mar 19, 2026 at 2:54 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Win=
dowing system found. vulkansink will not work
>
> set ANY_OF_DISTRO_FEATURES to make gstreamer1.0-plugins-bad build only
> when x11 or wayland is enabled.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi Changqing,

Thanks for your patch.

>  .../gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb              | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.=
9.bb
> index 4a9cb37dd8..2cb00f180f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.b=
b
> @@ -19,7 +19,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c"
> =20
>  DEPENDS +=3D "gstreamer1.0-plugins-base"
> =20
> -inherit gobject-introspection
> +inherit gobject-introspection features_check
> +
> +ANY_OF_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'vul=
kan', 'x11 wayland', '', d)}"

So the error we get if we try to build with "vulkan" in DISTRO_FEATURES
but not "x11" not "wayland" is the following:

ERROR: Nothing PROVIDES 'gstreamer1.0-plugins-bad'
gstreamer1.0-plugins-bad was skipped: one of 'wayland x11' needs to be in D=
ISTRO_FEATURES

To be honest, I believe this is a bit misleading, as we are not
mentioning the vulkan DISTRO_FEATURES, while this is the main issue:
gstreamer1.0-plugins-bad can be built without wayland or x11, just not
with vulkan.

I would really prefer a better error message, but otherwise we should at
least add some comment in the recipe explaining why we have this
ANY_OF_DISTRO_FEATURES line.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


