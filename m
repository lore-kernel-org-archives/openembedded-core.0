Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38524D6ACED
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
Subject: Re: [PATCH v2] fitimage: Add support for UBOOT_MKIMAGE_EXTRA_OPTS
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.95)
X-Originating-Platform: Windows Edge 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Dec 2025 03:35:15 -0800
References: <20251210110443.3230272-1-kavinaya@qti.qualcomm.com> <57dd38bf-653d-4b74-8de4-d05f4d2b9797@windriver.com> <7a13d7376a83bb7deb6374124bc42669d86803fc.camel@gmail.com>
In-Reply-To: <7a13d7376a83bb7deb6374124bc42669d86803fc.camel@gmail.com>
Message-ID: <248214.1766057715091538098@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228115

On Thu, Dec 18, 2025 at 03:01 AM, Adrian Freihofer wrote:

>
> This would work:
>=20
> self._mkimage_extra_opts =3D shlex.split(mkimage_extra_opts) if
> mkimage_extra_opts else []
>
Sure, I have uploaded the new patch with this modification.
Thanks

