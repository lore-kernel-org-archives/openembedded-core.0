Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.24181.1628784455079081870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 09:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 15C711C0003;
	Thu, 12 Aug 2021 16:07:32 +0000 (UTC)
Date: Thu, 12 Aug 2021 18:07:32 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] issues with wic creating "multi-partition" images?
Message-ID: <YRVHRM8cdapyFtm+@piout.net>
References: <9dafcfda-fa85-8a7d-cd7e-6a584ac87c4d@crashcourse.ca>
 <YRTtVche3UXNG7xB@piout.net>
 <ab3934b7-ab59-eef2-e30-e1f45d20cbce@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <ab3934b7-ab59-eef2-e30-e1f45d20cbce@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/08/2021 05:50:53-0400, Robert P. J. Day wrote:
> p.s. as i read it, the only distinction between a "wks" and a "wks.in"
> file is the need to pre-process variable substitution in the latter,
> correct?

It is my understanding, yes.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
