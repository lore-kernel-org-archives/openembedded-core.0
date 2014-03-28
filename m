Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id C00796C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:34:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N35003LLQ5O50A0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 28 Mar 2014 12:34:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 48A1C2036F; Fri,
	28 Mar 2014 13:34:36 -0400 (EDT)
Date: Fri, 28 Mar 2014 13:34:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-id: <20140328173436.GK3370@denix.org>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
	<20140328171338.GI3370@denix.org>
	<CADkTA4MxeTfzCY6YT4657jZy3btMN=wDDcUAaktzE=85SvunOA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CADkTA4MxeTfzCY6YT4657jZy3btMN=wDDcUAaktzE=85SvunOA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Fri, 28 Mar 2014 17:34:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 28, 2014 at 01:18:32PM -0400, Bruce Ashfield wrote:
> On Fri, Mar 28, 2014 at 1:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Wed, Mar 26, 2014 at 11:42:39AM -0300, Otavio Salvador wrote:
> >> Hello Kai,
> >>
> >> On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
> >> > Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.
> >>
> >> Thanks for handling it; I was going to address same issue this week so
> >> we could have it upstreamed and drop the Freescale bbappends for it.
> >
> > So, we also have a recipe of cryptodev for TI builds. But it's not just a
> > header file and we need the actual module to be built and packaged...
> 
> As long as something out of tree can co-exist with in-tree implementations,
> I don't see a problem with an incremental update that builds the module
> as well.

Thanks. So, I already have cryptodev-tests as a separate recipe that builds 
some tests from the same source, as main cryptodev. I guess I can look into 
separating module part into cryptodev-module recipe, which can be optional for 
kernels like linux-yocto that have it already patched in. Will that work?

-- 
Denys

