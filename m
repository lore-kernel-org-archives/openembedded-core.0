Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 12BC160196
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 02:41:55 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8Q00EYRFGVU8C0@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 14 Jul 2014 21:41:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6A81F20086; Mon,
	14 Jul 2014 22:41:19 -0400 (EDT)
Date: Mon, 14 Jul 2014 22:41:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20140715024119.GS1580@denix.org>
References: <1403218403-3303-1-git-send-email-denis@denix.org>
	<20140620171338.GX27324@denix.org> <20140625005255.GB1580@denix.org>
	<2450957.82MqDgnpjo@peggleto-mobl5.ger.corp.intel.com>
	<20140625162209.GC1580@denix.org> <1403736065.2104.287.camel@ted>
	<20140626174353.GE1580@denix.org>
MIME-version: 1.0
In-reply-to: <20140626174353.GE1580@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Tue, 15 Jul 2014 02:41:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 26, 2014 at 01:43:53PM -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 25, 2014 at 11:41:05PM +0100, Richard Purdie wrote:
> > On Wed, 2014-06-25 at 12:22 -0400, Denys Dmytriyenko wrote:
> > > On Wed, Jun 25, 2014 at 05:20:23PM +0100, Paul Eggleton wrote:
> > > > On Tuesday 24 June 2014 20:52:55 Denys Dmytriyenko wrote:
> > > > > Ping? Any comments? Any better suggestions?
> > > > 
> > > > Looks like Richard has merged this, FWIW.
> > > 
> > > Yes, I saw it. Already submitted backport for daisy... :)
> > 
> > I'd like this to see some testing in master for a while before we
> > backport it...
> 
> I'm Ok waiting a bit longer to test it in master. I'll ping on it later...
> 
> But this fixes a very common issue that affects different platforms from 
> different BSP layers, including BeagleBone Black in meta-yocto-bsp. The goal 
> is to be least intrusive and preserve the old udev cache behavior as much as 
> possible. Alternative options were to disable udev cache completely or 
> forcefully load necessary modules when they won't be probed on subsequent 
> boots.

Hi, Richard,

Was it enough wait time to get the change tested in master? Should I re-submit 
the patch for daisy one more time or you have it in the archives? Thanks!

-- 
Denys

