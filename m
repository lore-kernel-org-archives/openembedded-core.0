Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5BFC6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 12:08:40 +0000 (UTC)
Subject: Re: [PATCH] linux-firmware: add firmware files for NXP BT chipsets
To: openembedded-core@lists.openembedded.org
From: "Tom Hochstein" <tom.hochstein@nxp.com>
X-Originating-Location: Texas, US (165.225.33.115)
X-Originating-Platform: Windows Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 29 Aug 2023 05:08:32 -0700
References: <DB3PR0402MB38529DF900F5D80085F17E23E2E3A@DB3PR0402MB3852.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB38529DF900F5D80085F17E23E2E3A@DB3PR0402MB3852.eurprd04.prod.outlook.com>
Message-ID: <29102.1693310912640920508@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hx8VfSDkOO6VGDaBo1KB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 12:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186856

--hx8VfSDkOO6VGDaBo1KB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 07:37 AM, Tom Hochstein wrote:

>=20
> Please hold off on this. The -common design is not working correctly and
> is causing those firmware packages to be registered as a runtime
> dependency of the main package.

Actually, the -common design is working fine, there was just a misunderstan=
ding.

Please do consider this patch as-is.

Tom

--hx8VfSDkOO6VGDaBo1KB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 07:37 AM, Tom Hochstein wrote:<br/>
<blockquote>Please hold off on this. The -common design is not working corr=
ectly and is causing those firmware packages to be registered as a runtime =
dependency of the main package.</blockquote>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Actually, the -common =
design is working fine, there was just a misunderstanding.<br/><br/>Please =
do consider this patch as-is.<br/><br/>Tom</p>

--hx8VfSDkOO6VGDaBo1KB--

