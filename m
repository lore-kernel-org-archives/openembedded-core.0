Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Svx6w-0003Uv-EJ
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 23:02:42 +0200
Received: from gandalf.denix.org ([unknown] [96.240.136.247])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M7Z00GGWOGIYKA1@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:50:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0A7F6201B8; Mon,
	30 Jul 2012 15:50:42 -0400 (EDT)
Date: Mon, 30 Jul 2012 15:50:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: ml@communistcode.co.uk,	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120730195041.GB11175@denix.org>
References: <1343307951.29991.27.camel@ted>
	<5013AACF.2010807@communistcode.co.uk>
	<20120728091614.GD3742@jama.jama.net>
	<20120728093746.GE3742@jama.jama.net>
	<5013B7B8.5020908@communistcode.co.uk>
MIME-version: 1.0
In-reply-to: <5013B7B8.5020908@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] lib/oe/lsb: Add basic LSB functions
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
X-List-Received-Date: Mon, 30 Jul 2012 21:02:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jul 28, 2012 at 10:58:16AM +0100, Jack Mitchell wrote:
> On 28/07/2012 10:37, Martin Jansa wrote:
> >On Sat, Jul 28, 2012 at 11:16:14AM +0200, Martin Jansa wrote:
> >>>by installing lsb_release. Archlinux 64.
> >>>
> >>>Should it check to see if it installed first and error otherwise? It
> >>>looks like it tries to do it here:
> >>>
> >>>+    try:
> >>>+        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
> >>>+    except bb.process.CmdError as exc:
> >>>+        return
> >>>
> >>>
> >>>but it must be missing something.
> >>
> >>Same here, interesting is that it failed only during 2nd build, 1st
> >>with this commit applied finished fine.
> >
> >Ah no, it was there also first time I've overlooked it as it's not
> >fatal.
> >
> 
> It was fatal for me as it trashed my sstate folder naming and then
> refused to build some packages. The directory in my sstate was
> created as:
> 
> ${NATIVELSBSTRING}
> 
> Then when Bitbake tried to use shared state it expanded
> NATIVELSBSTRING to nothing and failed.

I have the same issue here - Gentoo/64. Can we get it fixed in the master, 
please? Thanks.

-- 
Denys


