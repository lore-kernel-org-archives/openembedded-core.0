Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S9oFd-00010K-6E
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 02:52:41 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1500LFBRCYY160@vms173009.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 19:43:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DCB542018B; Mon,
	19 Mar 2012 20:43:45 -0400 (EDT)
Date: Mon, 19 Mar 2012 20:43:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120320004345.GG15554@denix.org>
References: <20120319215934.5336A206060@gemini.denx.de>
MIME-version: 1.0
In-reply-to: <20120319215934.5336A206060@gemini.denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: specific version dependenciews - was: Linking two recipes
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
X-List-Received-Date: Tue, 20 Mar 2012 01:52:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 19, 2012 at 10:59:34PM +0100, Wolfgang Denk wrote:
> Dear Richard,
> 
> In message <1332192150.9740.72.camel@ted> you wrote:
> > On Mon, 2012-03-19 at 13:59 -0700, simran singh wrote:
> > > Hello,
> > > I have recipes for two applications Recipe A and Recipe B. Recipe B
> > > requires a lib.so file and init.h file which are installed by Recipe
> > > A.
> ...
> > recipe B needs to do:
> > 
> > DEPENDS += "recipeA"
> 
> I have a similar, but more complicated requirement which I don;t know
> how to implement (if this is possible at all):
> 
> Some MACHINEs require a package A (some library), but in specific
> versions: say machine X needs version A-1.2, while machine Y needs
> version A-1.5.
> 
> Package A itself depends on another package B (another library).
> 
> The problem is, that different versions of A require specific versions
> of B.  For example, to build A-1.2 we must use B-4.5, but to build
> A-1.5 we must use B-8.2.
> 
> I am aware that I can describe the dependencies at the top leven,
> stating for example that machine X needs A-1.2 and B-4.5, while
> machine Y needs A-1.5 and B-8.2.
> 
> However, this seems clumsy, as the version depency A->B is something
> that is only defined by the implementation of A, and I would like to
> keep it encapsulated at this level.
> 
> 
> Is there a clever way to describe such a multi-level dependency chain?

Will this help? See line #4 in the first example and lines #30-31 in second:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/gnutls/gnutls.inc#n4
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb#n30

There are some caveats with that notation, IIRC...

-- 
Denys


