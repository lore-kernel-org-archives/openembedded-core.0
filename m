Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RyUIz-0001bN-Dj
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:21:21 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RyUB3-0000Mh-5Q
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:13:09 +0100
Message-ID: <1329509568.2591.119.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2012 20:12:48 +0000
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F04264D83@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F04264D83@NAEMMAIL01.na.leapfrog.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: Problems with Pseudo
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
X-List-Received-Date: Fri, 17 Feb 2012 20:21:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-17 at 19:50 +0000, Daniel Lazzari wrote:
> A problem just popped up today that I can't seem to fix. When trying to bitbake anything, I first get the following message:
> 
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded: ignored.
> 
> Followed by a bunch of debug output, detailing the configuration files being loaded, then finally I get:

Are you trying to run bitbake from inside a devshell or anything like
that?

p.




