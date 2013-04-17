Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USMeE-0002qN-Pj for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 09:19:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3H723wP003015; Wed, 17 Apr 2013 08:02:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0Ohc7J4iUw3z; Wed, 17 Apr 2013 08:02:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3H71waW003007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 17 Apr 2013 08:02:00 +0100
Message-ID: <1366182087.25282.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 17 Apr 2013 08:01:27 +0100
In-Reply-To: <3552064.n2jxC3Or99@helios>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<1366146366.8670.102.camel@ted>
	<20130416214108.GD29302@jama.dyndns-home.com>
	<3552064.n2jxC3Or99@helios>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Wed, 17 Apr 2013 07:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-17 at 00:25 +0100, Paul Eggleton wrote:
> On Tuesday 16 April 2013 23:41:08 Martin Jansa wrote:
> > On Tue, Apr 16, 2013 at 10:06:06PM +0100, Richard Purdie wrote:
> > > On Tue, 2013-04-16 at 19:09 +0200, Martin Jansa wrote:
> > > > OK, so it's different than hangs I'm seeing here, because I'm still
> > > > seeing them with latest oe-core> 
> > > Yes, that was almost certainly a different issue.
> > > 
> > > > $ . ./oe-init-bitbake-build-env && bitbake my-image
> > > > Altered environment for machine@distro development (this is from
> > > > oe-init-bitbake-build-env) # and nothing else is shown after that
> > > 
> > > So just to ensure I understand this, it never prints any messages at
> > > all?
> > 
> > yes nothing at all from bitbake, only that echo from setup script
> > (oe-init-bitbake-build-env)
> 
> Are you sure it's not getting stuck doing a fetch as a result of a non-fully-
> specified SRCREV?

Its not something like one of the sanity checks testing network access
and hanging is it?

Cheers,

Richard



