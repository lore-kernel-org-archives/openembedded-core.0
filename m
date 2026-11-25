Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36982.1795588848538882712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FBHixxkU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9CE0C2BB3A;
	Wed, 25 Nov 2026 06:40:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E182C60480;
	Wed, 25 Nov 2026 06:40:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66FF211E69C60;
	Wed, 25 Nov 2026 07:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795588845; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5n04SfkcVfl5FeWP6i/hPGfWLMmogiBXW+mwu4xBUYk=;
	b=FBHixxkUP7VlGvdPb3EzpIETNrY6vU0q0x/N/pES7g0k27ARXyKAZ+Iu1XO6A7Dfl45SLo
	t1R+wyGnDHEfXyiu4Wkwivm9UwqN5QSPYNSI3V47GjriKmDLk+1cqkM4UmzPJGbRD7SMk5
	V4Z3c55B/WqRyR5EOnKbJETOTbThk/cQMT401+6VBjNNA5XR9ZH+1s8YnHsFRLsEw/FRCT
	nn1pG7ccwnjkFqGDeA3qjkwBsuCm4DBxb2+ARbKCQaut4Meprk8wspfPnxmfJ6Rn4nsIhC
	IUFJ/WXZkNKew18zfcURioJNnAyHsSH1NAULw8mykJl6dkCNoiveBMaKRLcj8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 07:40:42 +0100
Message-Id: <DN434EI3AZJK.11QM9TZASY1ZG@bootlin.com>
Subject: Re: [OE-core] [PATCH 05/11] zstd: upgrade 1.5.7 -> 1.6.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
 <20261124171807.74394-6-jaipaul.cheernam@est.tech>
In-Reply-To: <20261124171807.74394-6-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251166

On Tue Nov 24, 2026 at 6:18 PM CET, Jaipaul Cheernam wrote:
> v1.6.0 (Nov 2026)
> fix: streaming decompression of malformed data could expose uninitialized=
 memory
>

Hi Jaipaul,

> [Changelog truncated as it exceeds 5000 characters;
> the full changelog can be found in an attachment to the AUH email]
>

The commit message is wrong. Please remove the lines about the truncated
output and make a proper, shorter summary of the changes.

Also, we have a new ptest failure:

Failed ptests:
{'zstd': ['determinism/basic.sh',
          'determinism/basic.sh.check_exit',
          'determinism/basic.sh.check_stderr',
          'determinism/basic.sh.check_stdout',
          'determinism/multithread.sh',
          'determinism/multithread.sh.check_exit',
          'determinism/multithread.sh.check_stderr',
          'determinism/multithread.sh.check_stdout',
          'cli-tests']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4974
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1622
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1641

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

