Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.455.1588090421633137516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 09:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jTSra-0003IE-Rv; Tue, 28 Apr 2020 18:13:38 +0200
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jTSrZ-0006DK-Kl; Tue, 28 Apr 2020 18:13:37 +0200
Message-ID: <1ef6f737d5b44b11b409ed459438666b611b7fa9.camel@pengutronix.de>
Subject: Re: [OE-core] [zeus 0/7] Merge request
From: "Jan Luebbe" <jlu@pengutronix.de>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2020 18:13:37 +0200
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-27 at 19:15 -0700, akuster wrote:
> 
> Adrian Bunk (1):
>   openssl: Upgrade 1.1.1d -> 1.1.1e
> 
> Alexander Kanavin (1):
>   openssl: update to 1.1.1f

As 1.1.1g has been released to fix CVE-2020-1967
https://www.openssl.org/news/secadv/20200421.txt
maybe we should just update instead of picking Zhang Xiao's "openssl:
fix CVE-2020-1967" (which would conflict with this PR).

Regards,
Jan

