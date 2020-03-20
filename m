Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9CC619CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:57:34 +0000 (UTC)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
	([174.114.100.179]:42530 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jFGHO-00F9DP-H2; Fri, 20 Mar 2020 07:57:34 -0400
Date: Fri, 20 Mar 2020 07:57:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20200320112807.GB31090@localhost>
Message-ID: <alpine.LFD.2.21.2003200756220.9822@localhost.localdomain>
References: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
	<20200320112807.GB31090@localhost>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: recipe design curiosity: how to best install a package configuration file?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2020 11:57:34 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Mar 2020, Adrian Bunk wrote:

> On Fri, Mar 20, 2020 at 07:04:05AM -0400, Robert P. J. Day wrote:
> >...
> >   in this current situation, it turns out that that sample conf file
> > just happens to be appropriate,
> >...
>
> I'd guess you are wrong on that.
>
>   IPv4_interface 192.168.100.100
>   Interface eth2

  ah, i was just going on the recipe append file as it was, which
simply copied that sample file. now i'm even more curious as to what's
going on in the background, as i did not create that append file.

rday

