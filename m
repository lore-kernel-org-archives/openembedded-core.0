Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOwhh-0001UW-DR for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:51:41 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOweo-0002a1-1T
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:48:42 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110524183555.GE18116@sakrah.homelinux.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<20110524172330.GC18086@sakrah.homelinux.org>
	<4DDBF7BA.2000706@linux.intel.com>
	<20110524183555.GE18116@sakrah.homelinux.org>
Date: Tue, 24 May 2011 19:48:32 +0100
Message-ID: <1306262912.3120.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 18:51:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 11:35 -0700, Khem Raj wrote:
> so essentially you are interested in maintaining this board in
> meta-yocto and not use meta-ti as long as you have a process to sync
> your changes in a sane manner between two layers I think it should be
> ok. However we have to make clear if someone uses both meta-ti and meta-yocto
> and he should be absolutely clear about what recipes and configurations
> he/she ends up picking.

That should be fine, it'll be taken care of by the relative layer
priorities.  It doesn't sound as though this is any different to the
current situation with oe-core and meta-ti each having a different
u-boot recipe.

> u-boot and any other bootloader for that matter are machine specific
> and its very hard to have a common recipe serving needs of all machines
> 
> best it could do is abstract out common parts which wont be many in
> u-boot case since it just have many differences so having it in bsp
> layer is probably the best

Well, u-boot does have a unified upstream tree, and presumably that
works for at least some boards without major modification.  I can see
some merit in having that in oe-core for folks to use, either directly
or by patching. 

It is a bit of a shame that the necessary patches for beagleboard
haven't just been landed in u-boot upstream, since it sounds like this
would have avoided the whole issue.

p.




