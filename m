Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA93EDF154
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 11:16:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69478.1770981390937534628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 03:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dKITKxVH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8F06A1A0EA5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 11:16:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 595C6606BE;
	Fri, 13 Feb 2026 11:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2B7510368DA2;
	Fri, 13 Feb 2026 12:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770981387; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tQJoTBfGb+PXqknUS/jfoO9fsH0zDcSbzQp68ln6jAA=;
	b=dKITKxVHdeQxPjNIkAiaIAYifgPcSMGmLO0S17XKaN2DoY/R+DL3Q04F63anrik7R0EZ/E
	beLrMxrup+FQUcBHu3acfXIi2rtpF7eueNNb7VzEw7EvYWhjhKJdF7p6QdjbRWIbNgylaV
	Czd37ojoc9HOfOP7baMRmiQ4zzF+GpBGa3JZLtWeebfTNB1aTcrVTv0P8mmrAV4z2UjXF9
	Q3bWP4pCv+kE6c1RBBBoahaM+t8eKnzIw4ADtGDTjZ2kMkpjJ7OiK+rIRy0y7tPEV7n9vd
	AuI56IHZhusBZpTxaeVLvM/FtTEbcC7UViEaJVHbjx0u1cWJRX3pQlOO74Bjhw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 12:16:25 +0100
Message-Id: <DGDSI94ZCHKX.3OFUZX2YK6DNY@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/6] cmake: use system libuv
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260212164254.1110652-1-ross.burton@arm.com>
 <20260212164254.1110652-4-ross.burton@arm.com>
In-Reply-To: <20260212164254.1110652-4-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 11:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231113

On Thu Feb 12, 2026 at 5:42 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> We have a recipe for libuv in oe-core, so use it in the target recipe to
> avoid vendoring in more code.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Thanks for your patch.

This is failing while building nativesdk-cmake:

ERROR: Nothing PROVIDES 'nativesdk-libuv' (but virtual:nativesdk:/srv/pokyb=
uild/yocto-worker/genericx86-64/build/layers/openembedded-core/meta/recipes=
-devtools/cmake/cmake_4.2.3.bb DEPENDS on or otherwise requires it). Close =
matches:
  nativesdk-libva
  nativesdk-libxau
  nativesdk-zlib
NOTE: Runtime target 'nativesdk-cmake' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-cmake', 'nativesdk=
-libuv']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3188

Missing 'BBCLASSEXTEND =3D "nativesdk"' in libuv recipe?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


