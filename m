Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TPG5D-00025d-HL
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 19:10:03 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MC500H5RGDS1UC1@vms173003.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 11:56:31 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 405F7201BF; Fri,
	19 Oct 2012 12:56:16 -0400 (EDT)
Date: Fri, 19 Oct 2012 12:56:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-id: <20121019165616.GA27336@denix.org>
References: <1350600718-3052-1-git-send-email-denis@denix.org>
	<20121019084432.GH3087@jama.jama.net>
MIME-version: 1.0
In-reply-to: <20121019084432.GH3087@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 17:10:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 19, 2012 at 10:44:32AM +0200, Martin Jansa wrote:
> On Thu, Oct 18, 2012 at 06:51:56PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > The patchset adds 2 more standard tune files for the new ARM MPCore (multicore)
> > processors Cortex-A15 and Cortex-A7, as per:
> > 
> > http://www.arm.com/products/processors/cortex-a/cortex-a15.php
> > http://www.arm.com/products/processors/cortex-a/cortex-a7.php
> 
> Please check this patchset 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030759.html

Yes, I've seen that patchset. Unfortunately it's still in the queue and is 
going through implementation iterations. Once it gets into OE-Core, I'd be 
happy to update my tune files with the corresponding ARMPKGARCH and 
DEFAULTTUNE changes. But I don't think that tune rework patchset should block 
new tune files, as they don't break anything and adhere to the existing 
framework. Thanks.

-- 
Denys


> > Denys Dmytriyenko (2):
> >   tune-cortexa15: add tunes for ARM Cortex-A15
> >   tune-cortexa7: add tunes for ARM Cortex-A7
> > 
> >  meta/conf/machine/include/tune-cortexa15.inc | 24 ++++++++++++++++++++++++
> >  meta/conf/machine/include/tune-cortexa7.inc  | 24 ++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> >  create mode 100644 meta/conf/machine/include/tune-cortexa15.inc
> >  create mode 100644 meta/conf/machine/include/tune-cortexa7.inc
> > 
> > -- 
> > 1.7.12.3
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com




