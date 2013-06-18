Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 882AE6077E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:54:56 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UoyFE-0005Ms-HX; Tue, 18 Jun 2013 17:54:56 +0200
Message-ID: <1371570895.6580.65.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 18 Jun 2013 16:54:55 +0100
In-Reply-To: <1371570476.20823.121.camel@ted>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
	<CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
	<1371570476.20823.121.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 15:54:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 16:47 +0100, Richard Purdie wrote:
> We might as well throw away libtool

That sounds like an excellent plan to me.  I wonder how hard it would be
to invent a libtool-dummy script which took the same arguments but
basically just invoked the compiler and linker without any of the extra
craziness.

>Yes the .la files are annoying but they're not that much of a problem,
>are they?

I do recall that I was moved to write my original patch because the .la
files were causing me an actual problem rather than just being a
nuisance.  I can't remember the details offhand unfortunately, though I
guess I could try re-enabling them again locally and see what breaks.

Also, the patch that I posted in the first place did use a
DISTRO_FEATURE to control whether you get .la files or not (and the
default was still to have them) so you would be welcome to keep them on
for poky if you wanted.

p.



