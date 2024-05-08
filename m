Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FCEC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 12:21:32 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.10807.1715170890313426350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 05:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: r.czerwinski@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <r.czerwinski@pengutronix.de>)
	id 1s4gIa-0000qR-HD
	for openembedded-core@lists.openembedded.org; Wed, 08 May 2024 14:21:28 +0200
Message-ID: <2e8a718dd39f7fc89b34c91e552a6ba1fa658572.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: use IMAGE_NAME_SUFFIX
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 08 May 2024 14:21:27 +0200
In-Reply-To: <20240430102448.1068114-1-r.czerwinski@pengutronix.de>
References: <20240430102448.1068114-1-r.czerwinski@pengutronix.de>
Autocrypt: addr=r.czerwinski@pengutronix.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: r.czerwinski@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 12:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199117

Hi,

please disregard this patch. Apparently the convention is for initramfs
images to set IMAGE_NAME_SUFFIX ?=3D "", which lets kernel-
fitimage.bbclass work as expected.

Best regards,
Rouven

On Tue, 2024-04-30 at 12:24 +0200, Rouven Czerwinski wrote:
> Without taking IMAGE_NAME_SUFFIX into account, the kernel-fitimage
> class
> will always fail to find the initramfs, fix the search path and error
> message to include IMAGE_NAME_SUFFIX.
>=20
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
> =C2=A0meta/classes-recipe/kernel-fitimage.bbclass | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 4b74ddc201..e0a26d26b9 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -683,7 +683,7 @@ fitimage_assemble() {
> =C2=A0		# Find and use the first initramfs image archive
> type we find
> =C2=A0		found=3D
> =C2=A0		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
> -
> 			initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
> +			initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRA
> MFS_IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$img"
> =C2=A0			if [ -e "$initramfs_path" ]; then
> =C2=A0				bbnote "Found initramfs image:
> $initramfs_path"
> =C2=A0				found=3Dtrue
> @@ -695,7 +695,7 @@ fitimage_assemble() {
> =C2=A0		done
> =C2=A0
> =C2=A0		if [ -z "$found" ]; then
> -			bbfatal "Could not find a valid initramfs
> type for ${INITRAMFS_IMAGE_NAME}, the supported types are:
> ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
> +			bbfatal "Could not find a valid initramfs
> type for ${INITRAMFS_IMAGE_NAME}${IMAGE_NAME_SUFFIX}, the supported
> types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
> =C2=A0		fi
> =C2=A0	fi
> =C2=A0
>=20
> base-commit: 7ef767d84d56b25498e45db83bb8f9d9caebeaf9
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198759):
> https://lists.openembedded.org/g/openembedded-core/message/198759
> Mute This Topic: https://lists.openembedded.org/mt/105818094/3620320
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> rcz@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


