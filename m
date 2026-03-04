Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FBEEC1425
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:00:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13503.1772611241352056677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 00:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qvyfUFM+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E28CC40FBD;
	Wed,  4 Mar 2026 08:00:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D1785FF87;
	Wed,  4 Mar 2026 08:00:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03D06103696E3;
	Wed,  4 Mar 2026 09:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772611238; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5/57efLdyer+/9fwZ4OLgOE/xhJjPNrqtDEVHvGnc94=;
	b=qvyfUFM+3FQcFzwtN8cCrOUeLtxT4Vy0Dg0bh5uHViNMDrN3Y4BkYprDE8yAOEB0a8IgLK
	/o4FErkQx1fibOoxXzvr8/SUOOFFx625dLICpZd6j8GmvCIOfT8vxOZNKSA+Lqr3apUT7d
	inFSdMcCplBP13hjrr7pfPc9LCUcp2OXfvJn8ORSN9Ckhg8Bg7BkRcWjHl6jirgHJiPbPW
	SA0yCXt188+CKpodbLlilDgC6xh3aO48OK3UxZiXiju0ICxFfP+7GzXWrKBrbgk2hieBUE
	MMvbk8yBZXex7BBTybyrld1YlFJ4NsFonfIOR4o+LiV/zH/86d3Vudw+FiFAMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 09:00:36 +0100
Message-Id: <DGTU8O5LFUJI.34TT9V1SM5Z8U@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 02/19] ncurses: upgrade 6.5 -> 6.6
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-2-hongxu.jia@windriver.com>
In-Reply-To: <20260303065640.2541884-2-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232352

On Tue Mar 3, 2026 at 7:56 AM CET, hongxu via lists.openembedded.org wrote:
> License-Update: copyright years updated
>
> Delete backport patch
> - CVE-2025-6141.patch
>
> Announcing ncurses 6.6:
>   https://lists.gnu.org/archive/html/info-gnu/2025-12/msg00010.html
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Thanks for the upgrade.

We have some QA error about installed files:

ERROR: ncurses-6.6-r0 do_package: QA Issue: ncurses: Files/directories were=
 installed but not shipped in any package:
  /usr/lib

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3269
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3123
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3289

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


