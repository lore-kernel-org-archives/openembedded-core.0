Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF86E9DE77
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127631.1775724347469707159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pnRftGfa;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9BE17C5AAB5;
	Thu,  9 Apr 2026 08:46:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 039565FDEB;
	Thu,  9 Apr 2026 08:45:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 711D61045024F;
	Thu,  9 Apr 2026 10:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775724344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pTOVZWzVjEmtGMOA2GCPifdpPQQkMGZ+o5s9D/rOu08=;
	b=pnRftGfaqPPH0rNnJIWdJbEFNTYaadhM9ui3jv/2pMbcDBmvLP5Z0sl0sOYFJ6qJUC6mWK
	946BmT3aGSrCRFdnSvpWTiHTghzB45J4dGbPaLBCHSR1cllwKQQrJXhZCEpUu6M9HnQcW+
	7iutQ9/02g/+rkoCvuY4QFSIA98GRwzi4lvjr4XdP/MGePInituh/IVd4G1imxZMS5Pm0M
	MtA8+Ox1ScscxnFY5/QdK1eYTz4cnA89JTzuWG1SG1I6BVsH7kj2gbKIDzKMyFtY6oL6jv
	jUUY7N+bQkZGu8onomTw/s9aHFHkS6lMfb6q+YZDaBRDMLYVE7aNpvZXU37+jA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 10:45:41 +0200
Message-Id: <DHOHQSRVZXIM.OMD8WLH1AIW@bootlin.com>
Subject: Re: [OE-core] [PATCH 02/10] gstreamer1.0-plugins-base: Upgrade
 1.28.0 -> 1.28.2
Cc: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anuj Mittal" <anuj.mittal@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Koen Kooi"
 <koen.kooi@oss.qualcomm.com>, "Nicolas Dechesne"
 <nicolas.dechesne@oss.qualcomm.com>, "Ricardo Salveti"
 <ricardo.salveti@oss.qualcomm.com>, "Sourabh Banerjee"
 <quic_sbanerje@quicinc.com>, "Viswanath Kraleti"
 <viswanath.kraleti@oss.qualcomm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260408141719.1086823-1-pkj@axis.com>
 <20260408141719.1086823-3-pkj@axis.com>
In-Reply-To: <20260408141719.1086823-3-pkj@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234895

On Wed Apr 8, 2026 at 4:17 PM CEST, Peter Kjellerstedt via lists.openembedd=
ed.org wrote:
> ...
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  ...ugins-base_1.28.0.bb =3D> gstreamer1.0-plugins-base_1.28.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28=
.0.bb =3D> gstreamer1.0-plugins-base_1.28.2.bb} (98%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.28.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
8.2.bb
> similarity index 98%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.28.0.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
8.2.bb
> index f0a3db578a..79cc4f312d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.=
bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-=
plugins-base/gst-plugins-ba
>             file://0003-viv-fb-Make-sure-config.h-is-included.patch \
>             file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
>             "
> -SRC_URI[sha256sum] =3D "eace79d63bd2edeb2048777ea9f432d8b6e7336e656cbc20=
da450f6235758b31"
> +SRC_URI[sha256sum] =3D "4db76b3619280037a4047de7d9dbb38613a4272dcc40efb3=
33257124635a888d"
> =20
>  S =3D "${UNPACKDIR}/gst-plugins-base-${PV}"
> =20

Hi,

Just a note for meta-qcom maintainers: once merged, this will break
meta-qcom builds, as some patches are no longer applying correctly:

ERROR: gstreamer1.0-plugins-base-1.28.2-r0 do_patch: Applying patch '/srv/p=
okybuild/yocto-worker/meta-qcom/build/meta-qcom/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-base/0001-video-Add-support-for-NV12_Q08C-compressed=
-8-bit-for.patch' on target directory '/srv/pokybuild/yocto-worker/meta-qco=
m/build/build/tmp/work/armv8-2a-poky-linux/gstreamer1.0-plugins-base/1.28.2=
/sources/gst-plugins-base-1.28.2'
...
Patch 0001-video-Add-support-for-NV12_Q08C-compressed-8-bit-for.patch does =
not apply (enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/563

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


