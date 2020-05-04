Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.6329.1588599751374471310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 06:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jVbMa-0000EW-Ip; Mon, 04 May 2020 15:42:28 +0200
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jVbMa-0001sR-06; Mon, 04 May 2020 15:42:28 +0200
Message-ID: <4c2aebfe371152c24ee60d8201882d70172867ec.camel@pengutronix.de>
Subject: Re: [OE-core] [zeus 0/7] Merge request
From: "Jan Luebbe" <jlu@pengutronix.de>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 04 May 2020 15:42:27 +0200
In-Reply-To: <1339637a-51fc-d092-1c71-903feca9d6c9@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>
	 <1ef6f737d5b44b11b409ed459438666b611b7fa9.camel@pengutronix.de>
	 <1339637a-51fc-d092-1c71-903feca9d6c9@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-04-28 at 10:09 -0700, akuster wrote:
> 
> On 4/28/20 9:13 AM, Jan Lübbe wrote:
> > On Mon, 2020-04-27 at 19:15 -0700, akuster wrote:
> > > Adrian Bunk (1):
> > >   openssl: Upgrade 1.1.1d -> 1.1.1e
> > > 
> > > Alexander Kanavin (1):
> > >   openssl: update to 1.1.1f
> > As 1.1.1g has been released to fix CVE-2020-1967
> > https://www.openssl.org/news/secadv/20200421.txt
> > maybe we should just update instead of picking Zhang Xiao's
> > "openssl:
> > fix CVE-2020-1967" (which would conflict with this PR).
> Thanks for the information.
> 
> Once Master and then Dunfell have this update then Zeus can take it.

It has landed in master as 8e0283e70b9977c9ac14cdab77907301405c3cee.
Richard: Do you want to pick this for dunfell?

Thanks,
Jan

