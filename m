Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QrkLk-0007SW-IY
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 07:32:04 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPS00239SDIU9J7@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 23:27:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A979514AF5D; Fri,
	12 Aug 2011 00:27:18 -0400 (EDT)
Date: Fri, 12 Aug 2011 00:27:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20110812042718.GB13857@denix.org>
References: <201108120214.10933.schnitzeltony@gmx.de>
	<4E44877E.9000907@gmail.com>
MIME-version: 1.0
In-reply-to: <4E44877E.9000907@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: gcc-cross-initial fails for maiden build
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
X-List-Received-Date: Fri, 12 Aug 2011 05:32:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 11, 2011 at 06:53:02PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 08/11/2011 05:14 PM, Andreas Mueller wrote:
> > Hi
> > 
> > I just pulled latest metas, deleted all my temp stuff, start build
> > and get
> > 
> > ERROR: Function 'do_headerfix' failed (see
> > /home/Superandy/tmp/oe-core- 
> > eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5- 
> > r40+svnr176640/temp/log.do_headerfix.25304 for further information) 
> > ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core- 
> > eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5- 
> > r40+svnr176640/temp/log.do_headerfix.25304 Log data follows: | +
> > do_headerfix | + sed -i
> > '/home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5/gcc-4_5- 
> > branch/gcc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \(
> >  *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#' | sed: can't read
> > /home/Superandy/tmp/oe-core-eglibc/work- 
> > shared/gcc-4.5/gcc-4_5-branch/gcc/config/*/linux*.h: No such file or
> > directory | ERROR: Function 'do_headerfix' failed (see
> > /home/Superandy/tmp/oe-core- 
> > eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5- 
> > r40+svnr176640/temp/log.do_headerfix.25304 for further information) 
> > NOTE: package gcc-cross-initial-4.5-r40+svnr176640: task
> > do_headerfix: Failed
> > 
> > do_headerfix makes 970af6b09e1d69041b0d82fa56ace19543405eb1
> > suspicious...
> > 
> 
> what does ls /home/Superandy/tmp/oe-core-eglibc/work-
> shared/gcc-4.5/gcc-4_5-branch/gcc/config/*/linux*.h
> show?
> 
> this is meta-oe gcc and it might need some tweak to accommodate the new
> changes from oe-core

The problem is that it's .../work-shared/gcc-4.5-r40+svnr176640/... instead of 
just .../work-shared/gcc-4.5/...

-- 
Denys


