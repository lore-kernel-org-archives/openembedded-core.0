Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1hQV-00043j-6o for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 16:54:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LFq0T5024359;
	Mon, 21 Mar 2011 15:52:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23886-09; Mon, 21 Mar 2011 15:51:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LFprKn024353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Mar 2011 15:51:54 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
In-Reply-To: <20110321062422.GB5575@denix.org>
References: <cover.1300355683.git.sgw@linux.intel.com>
	<1300384055.30423.2078.camel@rex>  <20110321062422.GB5575@denix.org>
Date: Mon, 21 Mar 2011 15:51:28 +0000
Message-ID: <1300722688.30423.3745.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/7] Non-GPLv3 Changes & a dependency Fix
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
X-List-Received-Date: Mon, 21 Mar 2011 15:54:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 02:24 -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 17, 2011 at 05:47:35PM +0000, Richard Purdie wrote:
> > On Thu, 2011-03-17 at 02:58 -0700, Saul Wold wrote:
> > > From: Saul Wold <sgw@linux.intel.com>
> > >
> > > This set of changes enables both poky-image-minimal and poky-image-basic
> > > to build non-gplv3 core image. These are bound for bernard
> > > 
> > > There is also a fix for the gnome-vfs dependency on ACL. This is
> > > a potential build stopper and should be considered for bernard
> > > 
> > > Pull URL: git://git.openembedded.org/openembedded-core-contrib
> > >   Branch: sgw/non-gplv3
> > >   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/non-gplv3
> > > 
> > > Thanks,
> > >     Saul Wold <sgw@linux.intel.com>
> > > ---
> > > 
> > > 
> > > Saul Wold (7):
> > >   util-linux: Setup for GPLv2 Recipe
> > 
> > I don't like this patch at all, there are some typos in it and some
> > other issues. Too risky for bernard for sure. I'm leaving it for now.
> 
> FYI, in Arago I had to repackage util-linux-ng source tarball w/o lscpu pieces 
> to completely avoid GPLv3, instead of removing them on the fly... In case when 
> said source tarball needs to be mirrored or distributed with the build.

The main point is to ensure the runtime is GPLv3 free. With those files
removed, that is the case. If you share a mirror with some GPLv3 code in
it, it has a very different effect licensing wise compared to v3
binaries on a system. I'm not a lawyer though and I'd be interested to
know if you've heard a different interpretation of the license?

> And, BTW, there is one more little script under GPLv3 - tests/ts/lscpu/lscpu

As Nitin replied, I thought that was removed already?

Cheers,

Richard





