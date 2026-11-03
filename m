Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7314.1793698393800327163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cIo1KYTx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 80CC14E413CA
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 09:33:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53DF76046C;
	Tue,  3 Nov 2026 09:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8777810328C5E;
	Tue,  3 Nov 2026 10:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793698390; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T7PDUOi9VdmBeAFJkjX8HQ/z+ymMHrMaTPv3EKnZLcA=;
	b=cIo1KYTx920cULm1TrPCctUhU8zgtgC0qWhCGbT3SvDyfak3KOzQqFPKZlTCjMitnI1td+
	dsIBPPKpRvPFlD4upt9hvFgrcr4R7sXgqZhS+C3Ug/ep7NZOld95LxEqA/EMmI/zlJml3X
	95E+OYTDZcNknEzR2SAsTYD8h9FZhK47wUYSoF1EpmS8Dd1LYKr0JxdyrmO8zr2+bkH00d
	hBDG6AWKG0xcwzKR3nDcQFB/516gtI4lKehQr1GSKF1Eyp3vHBp30lVXduC2pedhwvK5CK
	LDI7i4IhS2x4/1hGb+zl57yCNcKbLvKxK48wb5jMmR2rCrExE1j8CN3O29LlHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 10:33:08 +0100
Message-Id: <DMLH0G8M3QUA.2V3VRNYNBLTN8@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/4] libarchive: upgrade 3.8.10 -> 3.8.11
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
 <20261102102742.31991-4-jaipaul.cheernam@est.tech>
In-Reply-To: <20261102102742.31991-4-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249266

On Mon Nov 2, 2026 at 11:27 AM CET, Jaipaul Cheernam wrote:
> ReleaseNotes: https://github.com/libarchive/libarchive/releases/tag/v3.8.=
11
>
> Libarchive 3.8.11 is a security and bugfix release.
> Security and Bug Fixes
>
>     see ChangeLog [https://github.com/libarchive/libarchive/compare/v3.8.=
10...v3.8.11]
>
> Thanks to all contributors and bug reporters!
>
> Full Changelog: v3.8.10...v3.8.11 [https://github.com/libarchive/libarchi=
ve/compare/v3.8.10...v3.8.11]
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade.

It looks like some ptest is failing:

Failed ptests:
{'libarchive': ['libarchive_test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4868
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4834

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

