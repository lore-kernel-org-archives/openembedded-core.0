Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9vSd-00005k-Ua for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:34:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K9PiFj007885
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 09:25:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07784-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 09:25:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K9PbLY007879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 09:25:39 GMT
Message-ID: <1332235538.9740.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Mar 2012 09:25:38 +0000
In-Reply-To: <20120320004345.GG15554@denix.org>
References: <20120319215934.5336A206060@gemini.denx.de>
	<20120320004345.GG15554@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 20 Mar 2012 09:34:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-19 at 20:43 -0400, Denys Dmytriyenko wrote:
> On Mon, Mar 19, 2012 at 10:59:34PM +0100, Wolfgang Denk wrote:
> > Dear Richard,
> > 
> > In message <1332192150.9740.72.camel@ted> you wrote:
> > > On Mon, 2012-03-19 at 13:59 -0700, simran singh wrote:
> > > > Hello,
> > > > I have recipes for two applications Recipe A and Recipe B. Recipe B
> > > > requires a lib.so file and init.h file which are installed by Recipe
> > > > A.
> > ...
> > > recipe B needs to do:
> > > 
> > > DEPENDS += "recipeA"
> > 
> > I have a similar, but more complicated requirement which I don;t know
> > how to implement (if this is possible at all):
> > 
> > Some MACHINEs require a package A (some library), but in specific
> > versions: say machine X needs version A-1.2, while machine Y needs
> > version A-1.5.
> > 
> > Package A itself depends on another package B (another library).
> > 
> > The problem is, that different versions of A require specific versions
> > of B.  For example, to build A-1.2 we must use B-4.5, but to build
> > A-1.5 we must use B-8.2.
> > 
> > I am aware that I can describe the dependencies at the top leven,
> > stating for example that machine X needs A-1.2 and B-4.5, while
> > machine Y needs A-1.5 and B-8.2.
> > 
> > However, this seems clumsy, as the version depency A->B is something
> > that is only defined by the implementation of A, and I would like to
> > keep it encapsulated at this level.
> > 
> > 
> > Is there a clever way to describe such a multi-level dependency chain?
> 
> Will this help? See line #4 in the first example and lines #30-31 in second:
> 
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/gnutls/gnutls.inc#n4
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb#n30
> 
> There are some caveats with that notation, IIRC...

The RDEPENDS version will work. The parser will tolerate the entry in
DEPENDS but as the code stands today, ignore it since the code has never
been implemented.

Cheers,

Richard






