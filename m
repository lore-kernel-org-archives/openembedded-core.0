Return-Path: <jin@mediatomb.cc>
Received: from static.88-198-224-151.clients.your-server.de
	(static.88-198-224-151.clients.your-server.de [88.198.224.151])
	by mail.openembedded.org (Postfix) with ESMTP id A08BA73695
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:26:51 +0000 (UTC)
Received: by static.88-198-224-151.clients.your-server.de (Postfix,
	from userid 500)
	id A31711A00F0; Mon, 26 Oct 2015 17:26:50 +0100 (CET)
Date: Mon, 26 Oct 2015 17:26:50 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20151026162650.GA16758@deadlock.dhs.org>
References: <20151026151307.GA16394@deadlock.dhs.org>
	<CABcZANn=aL5i2UOVF-p69yBCB2xv_Sn0G_82NetvQa4WXCiKtg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANn=aL5i2UOVF-p69yBCB2xv_Sn0G_82NetvQa4WXCiKtg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with RDEPENDS in multimachine builds for allarch packages
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
X-List-Received-Date: Mon, 26 Oct 2015 16:26:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2015 at 09:13:22AM -0700, Christopher Larson wrote:
> Afaik the most likely cause is your rdepends isn't allarch, so is being rebuilt
> for the new machine, which causes yours to be rebuilt since it depends on it.

So, that means that anything arch specific listed in RDEPENDS will
always cause the package to rebuild even if there were no changes in the
package itself nor in the RDEPENDS packages? Is this really the desired
behaviour?

I'd expect that if nothing has changed, nothing should get rebuild.. I
often saw a huge number of packages being rebuilt and could never
explain why this was happening, now it's becoming clear that probably
some of them had some RDEPENDS set.

If you say it's not a bug - ok, now I at least know what's happening.
Still, imho it would be nice and it would speed up things if only stuff
that has really changed or stuff that depends on other things that have 
really changed gets triggered.

Kind regards,
Sergey


