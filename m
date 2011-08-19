Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuQ67-000466-7w for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:30:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEQJTh028316
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:26:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26909-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:26:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JEQ7Rp028310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:26:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1313745878.6733.259.camel@phil-desktop>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<5e892786b427b2049ddf0e660d57877e24f89385.1313700595.git.sgw@linux.intel.com>
	<1313745878.6733.259.camel@phil-desktop>
Date: Fri, 19 Aug 2011 09:26:05 -0500
Message-ID: <1313763965.13995.100.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 15/32] conf, recipes: Redefine LINKER_HASH_STYLE
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
X-List-Received-Date: Fri, 19 Aug 2011 14:30:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-19 at 10:24 +0100, Phil Blundell wrote:
> On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> > 
> > LINKER_HASH_STYLE is not set to either sysv or gnu
> > depending upon architecture e.g. mips does not support
> > gnu hash style among the supported architectures so
> > we make sure its set to 'sysv' form mips
> > 
> > Linker flags are munged to adhere to renamed variable
> > 
> > Third option is to set it to 'both' we do
> > not do that by default but user can still set it
> 
> It wasn't totally obvious to me why this patch is a good thing.  Can you
> explain why this change is desirable? 
> 
> Also, I found the first paragraph of the description above quite hard to
> understand.  Do you think you could try to reword it to be a bit
> clearer?

Agreed, I'm also having trouble understanding this change. I guess its
related to the options passed into gcc but I suspect we can just improve
the gcc option handling instead.

What I don't like about this patch is forcing a string into LDFLAGS and
I much prefer the current approach where its either added or its not,
its not just adding a parameter through the variable.

Also, if mips doesn't support this, how is anything at all working at
the moment?

Cheers,

Richard



