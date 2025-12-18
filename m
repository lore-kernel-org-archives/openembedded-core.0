Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0AED6ACE9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:34:34 +0000 (UTC)
Subject: Re: [PATCH v2] fitimage: Add support for UBOOT_MKIMAGE_EXTRA_OPTS
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.95)
X-Originating-Platform: Windows Edge 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Dec 2025 03:34:31 -0800
References: <20251210110443.3230272-1-kavinaya@qti.qualcomm.com> <57dd38bf-653d-4b74-8de4-d05f4d2b9797@windriver.com> <7a13d7376a83bb7deb6374124bc42669d86803fc.camel@gmail.com>
In-Reply-To: <7a13d7376a83bb7deb6374124bc42669d86803fc.camel@gmail.com>
Message-ID: <248214.1766057671237496490@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228113

On Thu, Dec 18, 2025 at 03:01 AM, Adrian Freihofer wrote:

>
> Defining an UBOOT_ name-spaced variable in image-fitimage.conf looks
> strange. But I see why you ended up with that:
> * All the mkimage related variables start with UBOOT_
> * This variable is used by the kernel-fit-image.bbclass only. Defining
> it in uboot-config.bbclass looks strange as well.
>=20
> But, all UBOOT_ variables are defined in uboot-config.bbclass. Would it
> be more consistent if the variable would be defined in uboot-
> config.bbclass or if the variable would be renamed to
> FIT_MKIMAGE_EXTRA_OPTS?
>

Hi Adrian,

Sure. We can use FIT_MKIMAGE_EXTRA_OPTS. I have uploaded a new patch to add=
ress this.

