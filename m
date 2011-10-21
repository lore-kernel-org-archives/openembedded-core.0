Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RH4Iu-0001HO-CC
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 03:53:48 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTE00FZO4UX5LVA@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:47:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1224D14AF5D; Thu,
	20 Oct 2011 20:47:21 -0400 (EDT)
Date: Thu, 20 Oct 2011 20:47:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20111021004721.GW26170@denix.org>
References: <20111018183520.GB556@jama.jama.net>
	<CAMKF1spkExdtaVSXxhVShSXR-UQUx-JML34tCPa6KaaUQb-2Rw@mail.gmail.com>
	<20111018201708.GC556@jama.jama.net>
MIME-version: 1.0
In-reply-to: <20111018201708.GC556@jama.jama.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Race condition or something when fetching local	files?
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
X-List-Received-Date: Fri, 21 Oct 2011 01:53:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 18, 2011 at 10:17:08PM +0200, Martin Jansa wrote:
> On Tue, Oct 18, 2011 at 01:09:43PM -0700, Khem Raj wrote:
> > On Tue, Oct 18, 2011 at 11:35 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > I have noticed that even local patches are stored in downloads dir,
> > > but today I've noticed that wrong file was used later in do_patch.
> > > I have latest oe-core/meta-oe + latest bitbake.
> > >
> > > Pulseaudio was building here for first time
> > >
> > > downloads/buildfix.patch is from previous build of xf86-video-intel-2.16.0
> > > $ head downloads/buildfix.patch
> > 
> > looking in bitbake lib/bb/fetch2/local.py it seems it searches DL_DIR
> > before other
> 
> Which would be wrong for sure if I have
> foo_1.0.bb with SRC_URI = "file://bar.patch"
> 
> foo-1.0/om-gta02/bar.patch
> foo-1.0/nokia900/bar.patch
> 
> Then I don't want to use bar.patch from downloads/bar.patch where it's
> from om-gta02 build when I'm building nokia900 now.

Was there any resolution on this one?

-- 
Denys


