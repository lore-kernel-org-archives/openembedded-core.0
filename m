Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDCA1-0004hb-Mc for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 12:00:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2T9ppK7029309
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 10:51:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27924-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 10:51:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2T9pfAD029303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 10:51:41 +0100
Message-ID: <1333014700.14983.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 10:51:40 +0100
In-Reply-To: <20120328232908.GA4080@bill-the-cat>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
	<1332753313.28414.91.camel@ted> <20120326162531.GD21518@bill-the-cat>
	<1332780976.28414.130.camel@ted> <20120328185458.GB32193@denix.org>
	<1332969104.28414.206.camel@ted> <20120328232908.GA4080@bill-the-cat>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 10:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-28 at 16:29 -0700, Tom Rini wrote:
> On Wed, Mar 28, 2012 at 10:11:44PM +0100, Richard Purdie wrote:
> > On Wed, 2012-03-28 at 14:54 -0400, Denys Dmytriyenko wrote:
> > > On Mon, Mar 26, 2012 at 05:56:16PM +0100, Richard Purdie wrote:
> > > > On Mon, 2012-03-26 at 09:25 -0700, Tom Rini wrote:
> > > So, what is the subtle difference between += that we started with and =+ that 
> > > you recommended at the end? I realize those are for append and prepend, but 
> > > are they handled any different? Was your recommendation to use =+ at the end, 
> > > instead of += that was used originally, based on some specifics? Thanks.
> > 
> > I'm using += and =+ interchangeably. The contrast was with ?= which I
> > argued against. Order in this case doesn't matter and I have no
> > preference over += or =+, it simply doesn't matter.
> 
> So I guess I'll spin everything one more time and drop the meta-intel
> version and we'll just use += since that's the common one.

Sounds good. Sorry about the churn on this one, I thought it was clear
+= and =+ were equivalent in this context.

Cheers,

Richard




