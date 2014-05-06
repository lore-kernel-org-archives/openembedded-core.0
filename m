Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id CF56C6017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 21:49:15 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N560000E9Y3Z0I1@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 06 May 2014 16:49:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C5FC2201BF; Tue,
	06 May 2014 17:49:15 -0400 (EDT)
Date: Tue, 06 May 2014 17:49:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mark Hatle <mark.hatle@windriver.com>
Message-id: <20140506214915.GH11339@denix.org>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
	<5369533B.9010209@windriver.com>
	<CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
	<536957A8.90300@windriver.com>
MIME-version: 1.0
In-reply-to: <536957A8.90300@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 21:49:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 06, 2014 at 04:44:08PM -0500, Mark Hatle wrote:
> On 5/6/14, 4:40 PM, Khem Raj wrote:
> >
> >On May 6, 2014 2:25 PM, "Mark Hatle" <mark.hatle@windriver.com
> ><mailto:mark.hatle@windriver.com>> wrote:
> > >
> > > On 5/6/14, 3:56 PM, Khem Raj wrote:
> > >>
> > >> On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org
> ><mailto:denis@denix.org>> wrote:
> > >>>
> > >>> Do you know that OE toolchain is not relocatable?
> > >>
> > >>
> > >> is that true ?
> > >>
> > >
> > > It's the load path of the executables, they use the libc-nativesdk, so they
> >need a hard path to the correct ld.so to get started.
> >
> >isnt this fixed by the installer when it is run
> 
> Yes, it sounds like either he moved the files after the the
> installer ran, or didn't use the installer at all and just tried to
> execute them out of the build system.

Exactly what I said earlier about using relocate_sdk.py in the installer, 
which Khem conveniently ignored and removed when replying... :) Just kidding.


> (If the installer -was- used, then it's definitely a bug.)

There's no bug as far as I know, as SDK/toolchain is a major part of our 
product and we test it actively with every release.

-- 
Denys

