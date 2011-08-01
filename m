Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QnvL3-0007Ot-6Z
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:27:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QnvGt-0001yw-2l
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:23:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 17:23:14 +0100
In-Reply-To: <55CEBFCA-8098-4A58-BC84-0C88D2484ED3@kernel.crashing.org>
References: <55CEBFCA-8098-4A58-BC84-0C88D2484ED3@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312215795.30326.533.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: lib64 not getting picked up
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
X-List-Received-Date: Mon, 01 Aug 2011 16:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 11:15 -0500, Kumar Gala wrote:
> I'm trying to build a powerpc 64-bit system and for some reason everything is still in /lib instead of /lib64.
> 
> I'd expect things in /lib64 based on how arch-powerpc64.inc has:
> 
> BASE_LIB_tune-powerpc64 = "lib64"
> 
> any ideas on what to look at for why this isn't happening?

BASE_LIB_tune-... appears only to be used by multilib.conf.  If you're
not doing a multilib build then it doesn't seem as though that variable
will have any useful effect.

From a quick perusal of the conf files it looks as though setting 

baselib = "lib64"

might be the appropriate thing to do if you really want to use /lib64
even though your architecture is natively 64-bit. 

If you _are_ using multilib then I guess you would need to instrument
that class a bit to see why it isn't doing the right thing.

p.




