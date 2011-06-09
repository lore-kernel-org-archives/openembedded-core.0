Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUdhF-0000TO-7R for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:46:45 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUddy-0007xd-V1
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:43:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307618944.15712.150.camel@rex>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
	<1307547318.15712.109.camel@rex>
	<1307618044.2529.4810.camel@phil-desktop>
	<1307618944.15712.150.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 09 Jun 2011 12:43:18 +0100
Message-ID: <1307619798.2529.4844.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 09 Jun 2011 11:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 12:29 +0100, Richard Purdie wrote:
> As you can see, eglibc do_package takes about 14 minutes which is about
> 14% of our build time. That is a long time to block pretty much all
> packaging activity, particularly if you have access to something with
> several cores. When it does complete, even on my 4 core system you see a
> "stampeding herd" of packaging happening on the build charts suggesting
> a backlog does build up.

Yeah, I can imagine that a backlog of packaging activity does build up.
The thing I'm not entirely clear on is whether this is actually causing
some threads to get starved of work (and hence the total build time to
be longer than it needs to be) or whether we're really just shifting
things around in the timeline without making much/any difference to the
overall build duration.  (I'm not familiar enough with bitbake's
scheduler to know whether it will schedule tasks as early as possible,
or as late as possible, or something else.)

Just as a matter of interest, are you using qemu-based locale generation
or the cross localedef for your measurement?  14 minutes does sound like
an awfully long time and I wonder whether there is anything we could do
in absolute terms to just speed that process up.

p.




