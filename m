Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F7DC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 15:37:40 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web10.22672.1700667453921299472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 07:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@rpsys.net header.s=default header.b=CdPQFuzH;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1700667450; bh=IAsB9YVA9lgrjes21nel5v/q3o/uRe8o3Fe4jTQZcew=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CdPQFuzHxXZnJCpi/oxfkma+QSKC+DTlzrXOQRfCbTLYr8+2OQZVw75oTX40dLI18
	 cEU8sm+itxNySrElBXh96nAQsz2h/HNV109q9OBSQ4tag6fCxTD1btIoobu6cc9QfP
	 HyzyPmEmDW4SDvyL0A6kJXERJU40K34abON+n9RfbbwJ48obAydjFbHrcBuzwu/wHM
	 COs44ZTctBDkcdEzw+F3ug16QmHY8YkbcUeUB26jYR83KPPJScjzUMqbf/hqKtJUa4
	 Zb4i2gClfIMaB0evqZPSkzlMBpexmRK6NIqOZBLmvu4A+QqG1HveUAbdUXXKOpw+wo
	 mZ/W40vaaT8wg==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 3AMFbSjS3296997
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 15:37:29 GMT
Message-ID: <5528444bae3c60d3541ea04836b764b900c0f123.camel@rpsys.net>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
From: Richard Purdie <rpurdie@rpsys.net>
To: Tobias Jakobi <tobias.jakobi@compleo-cs.com>,
        openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Date: Wed, 22 Nov 2023 15:37:28 +0000
In-Reply-To: <31510.1700666453230126567@lists.openembedded.org>
References: 
	<CANNYZj838MaaBeaxBttEmpiv8-29yXP8BTE4bW5LgL6fmHOBfw@mail.gmail.com>
	 <31510.1700666453230126567@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.9 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 15:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191113

On Wed, 2023-11-22 at 07:20 -0800, Tobias Jakobi wrote:
> OK, that was easier than expected. So I followed the guide, but I
> just build core-image-full-cmdline. I added the meta-oe layer (git
> master) to it and added joe to CORE_IMAGE_EXTRA_INSTALL. Same issue
> with this setup.

Thanks for working through the testing.

It sounds like we as a project need to fix master. Once that happens,
there could be a case for backporting a different version if it fixes
both regressions and security issues.

It does depend on the new version not causing other problems though,
and us being able to be confident of that.

Cheers,

Richard

