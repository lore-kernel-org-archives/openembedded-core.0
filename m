Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3038.1620118180220367734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 01:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:57626 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ldqkM-0001aq-2b; Tue, 04 May 2021 04:49:37 -0400
Date: Tue, 4 May 2021 04:49:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Denys Dmytriyenko <denis@denix.org>
cc: Andre McCurdy <armccurdy@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to add a "-dev" package to host SDK?
In-Reply-To: <20210504005746.GL21867@denix.org>
Message-ID: <706f507b-2f1c-6f5c-45b0-ccfe9c15ad18@crashcourse.ca>
References: <14306152-1445-7a44-523-beb73a6dbda@crashcourse.ca> <CAJ86T=WaeNQCJr4ednad1znvq8LV3P6wYvPwrzZh4rHWUDma-A@mail.gmail.com> <35c8bcd5-bc86-1a8a-e0d6-a35ef9bb2d47@crashcourse.ca> <20210504005746.GL21867@denix.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 May 2021, Denys Dmytriyenko wrote:

... snip ...

> By default, ${PN}-dev RDEPENDS on ${PN} automatically, if not changed:
>
> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n321

  yup, that's the line i was looking for, thanks.

rday
