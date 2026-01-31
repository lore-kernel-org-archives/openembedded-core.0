Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B670CD73EB5
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 18:00:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14101.1769882402428769645
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 10:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BRXeN8Dn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C9D54E42380
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 18:00:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 220EA606B6;
	Sat, 31 Jan 2026 18:00:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87B50119A888D;
	Sat, 31 Jan 2026 18:59:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769882399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9oJzqP13cF6dDdx5cDUZzTcdwm8cLyZXYtEbWVZN5M4=;
	b=BRXeN8DnfDQm9iU0OgM3cemHeBiVrzC8du0YIA7vkLzzprwY11awu5tSmn2+ef4dVJYDas
	fIiNVmRSjhoitZ31Uv6ogdtwQPhb3mFIUbyMmUpHYzjmgyQ6n/yODNDo0XC7K1aWG5SEJl
	esaF+m6YbyAz8RnVSbV/JoJTJGDAXeTT4NzUjxQgvMTo/Moao9JbMn/XcRSwVOE4V+aLqL
	s0XZ9PWidNa9xiRx1oryiX5McXxAhG28c7DqKyJCLI74pLvhYXQ0hDZDbs5/VqmG9q/2ZJ
	3z6/YRd4LbYUPfrHF4Sxo0GnMIHdyVIqotqbSpf+VZuNmlwzmQmCFuFPdgsxeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 18:59:54 +0100
Message-Id: <DG2YY3B20CFK.PLH5UNIQQB14@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 1/2] vulns: add a new recipe
Cc: <daniel.turull@ericsson.com>, <jerome.oufella@savoirfairelinux.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <valentin.boudevin@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <188AFD4FCC1313A8.2683732@lists.openembedded.org>
 <20260128163827.386933-1-valentin.boudevin@gmail.com>
 <20260128163827.386933-2-valentin.boudevin@gmail.com>
In-Reply-To: <20260128163827.386933-2-valentin.boudevin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 18:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230246

On Wed Jan 28, 2026 at 5:38 PM CET, vboudevin via lists.openembedded.org wr=
ote:
> This recipe is in charge of cloning and setting the Linux repository:
> https://git.kernel.org/pub/scm/linux/security/vulns.git/
>
> The variable VULNS_USE_AUTOREV can be used to use AUTOREV to use the
> The latest available commit on the remote repository and stay
> up-to-date with the latest information available.
>
> AUTOREV would make the build non-deterministic, turned off by default.
>
> Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
> ---

Hi Valentin,

Thanks for your patch.

Please note you will have to add someone as a maintainer for the new
recipe, in meta/conf/distro/include/maintainers.inc.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


