Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFCEE7C71B
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 11:56:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28255.1769946991100639276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 03:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FINe9Dr8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03459C237D3;
	Sun,  1 Feb 2026 11:56:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93AA760720;
	Sun,  1 Feb 2026 11:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B90BE119A888D;
	Sun,  1 Feb 2026 12:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769946987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CPRCicPp32DR2J8A/M+2FunfGGU9hGk9dVtLfRdu4Ls=;
	b=FINe9Dr8DzTPTvqQv7isss1QarehGmgWBDyvS+a1Cwc+zAfjnaVWMkLWnwSeKdoGbGOHHI
	owXoQTSZOAdf435/0gOcTE1kCVvocL7tzm0oonmsN2L2rrEIylFnwsAr5iFS00etvGRlqg
	AgW0fKzkStT3hQWopXRRObLmV8azfiFbcY8gS0TPJ6sIG3pMiL6IgAtiNQ6SpWDVzo1IwN
	c07gYNHwBdA4+clzIVs/q6iVeckrELp3RPHfNxnzdGPZmLjs7U4N/bawcfLxe3OvOMgCrE
	6hqI9j0MU6B/rOHVqUwaU4wFaKi8zSB0iD1QtrLlQqQ5/PlAFkGM5P0GJfyCug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 12:56:07 +0100
Message-Id: <DG3LU3OJLNSA.DCLWMY29DK8D@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 2/4] cvelistv5: add a new recipe
Cc: <daniel.turull@ericsson.com>, <jerome.oufella@savoirfairelinux.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <valentin.boudevin@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260129211012.623827-1-valentin.boudevin@gmail.com>
 <20260129211012.623827-3-valentin.boudevin@gmail.com>
In-Reply-To: <20260129211012.623827-3-valentin.boudevin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 11:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230257

On Thu Jan 29, 2026 at 10:10 PM CET, vboudevin via lists.openembedded.org w=
rote:
> This recipe is in charge of cloning and setting the cvelistv5
> repository: https://github.com/CVEProject/cvelistV5
>
> The variable CVELISTV5_USE_AUTOREV can be used to use AUTOREV to use the
> latest available commit on the remote repository and stay
> up-to-date with the latest CVE information available.
>
> AUTOREV would make the build non-deterministic, turned off by default.
>
> Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
> ---

Hi Valentin,

As for the other series, you have to add a maintainer entry for the new
recipe.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


