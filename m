Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E2FCD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 11:00:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32470.1778842848638016454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 04:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yHq31qCH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ACE1EC2B9C3
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 11:01:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CB36606FD;
	Fri, 15 May 2026 11:00:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58AC011AF8528;
	Fri, 15 May 2026 13:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778842845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0lzdsKAe1RXjyJw9OYJukWwzeLe+JbkZnOjC4ZQKqq8=;
	b=yHq31qCHXR7dWMJa1dzvGkwyIOMMzivKb5EKu9HEx8n3hbCEPif2qMvpnJqgGbahup2xq4
	bJ0+uV8tV6Lw/3G4qmy6xK2d80tLvNg8ad1pmGYc8zdJBA2g8ilf07EWXE5CizPCKOtLi6
	CVeaLFymEhz/Yg5lRIufax4OZJCr+cQ3j+S7trn1DXiiYxr2VfGjjTwAtl8wPscBcpe4Ka
	b3o++d/cbUEqiLeUNtu9RRAfZbBzjlzK5MVmNmQx8+XvJK3ZVwGr+VEQvzfV9KRzgUjLEo
	e23unpxbJ1GMUYLh9oYdpRtNfTmybUB7AlOUmfk8bpGZF1uo6Au+Et0hS3ph4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 May 2026 13:00:43 +0200
Message-Id: <DIJ75SUU12NB.1RALWVIO1OS58@bootlin.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional
 stable_upgrade parameter to get_recipe_upgrade_status
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com>
 <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 11:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237079

On Fri May 15, 2026 at 11:06 AM CEST, Qi Chen wrote:
> Hi Mathieu,
>
> I can't reproduce this issue.

Hi Chen,

Yes, I confirm I have the same issue on my side: I can't reproduce the
failures locally.

Yet I confirm the issue is linked with this series: dropping the patches
solves the issue, and I have similar issues with the v4. It's not clear
why in only happens on the autobuilder.

If you have ideas you want to test on the autobuilder to debug it, I can
easily schedule some builds. Aside of that, I fear I have no better
solution right now, I'm sorry.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


