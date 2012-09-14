Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TCe1H-0005UH-E5
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:05:52 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TCdp7-0002d6-Iu; Fri, 14 Sep 2012 23:53:18 +0200
Message-ID: <1347659456.4444.1.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 14 Sep 2012 22:50:56 +0100
In-Reply-To: <1347643776-4028-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1347643776-4028-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: remove broken RREPLACES
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
X-List-Received-Date: Fri, 14 Sep 2012 22:05:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 18:29 +0100, Paul Eggleton wrote:
> Unfortunately with rpm at least, this results in xserver-xorg-module-exa
> being installed in preference to xserver-xorg when constructing the root
> filesystem, which is clearly not desirable.

Surely this is a bug in the rpm packaging backend and ought to be fixed
there.

p.




