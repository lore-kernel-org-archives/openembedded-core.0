Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EB0B36B8FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:56:37 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VCtj4-0003Iu-Ac; Fri, 23 Aug 2013 17:56:38 +0200
Message-ID: <1377273397.5452.43.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Aug 2013 16:56:37 +0100
In-Reply-To: <1377256631.6762.58.camel@ted>
References: <1377180295.6762.19.camel@ted>
	<1377181123.13664.11.camel@phil-desktop.brightsign>
	<1377256631.6762.58.camel@ted>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Web browsing and HTML in OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 15:56:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-23 at 12:17 +0100, Richard Purdie wrote:
> I think ultimately we need both, a real world user of webkit and also a
> webkit-ptest type package too. They both let us test different things,
> one probably more quickly than the other, with the other being more
> complete.

Well, logically that would mean that we'd need a real-world user of
webkit for every port (or at least, for the three ports that are
currently supportable within oe-core).  It's not obvious that this would
scale very well.

What are the things that you think would be tested better with midori
than with the standalone launcher and test wrappers?

p.



