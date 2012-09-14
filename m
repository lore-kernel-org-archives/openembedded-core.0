Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TCePV-000658-BS
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:30:53 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TCeDL-0002lH-Iy; Sat, 15 Sep 2012 00:18:19 +0200
Message-ID: <1347660965.4444.17.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 14 Sep 2012 23:16:05 +0100
In-Reply-To: <5053ABF3.8010708@windriver.com>
References: <1347643776-4028-1-git-send-email-paul.eggleton@linux.intel.com>
	<1347659456.4444.1.camel@x121e.pbcl.net>
	<5053A818.4070402@windriver.com>
	<1347660202.4444.10.camel@x121e.pbcl.net>
	<5053ABF3.8010708@windriver.com>
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
X-List-Received-Date: Fri, 14 Sep 2012 22:30:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 17:13 -0500, Mark Hatle wrote:
> Coming from the RPM world, that behavior is entirely unexpected.  There is no 
> way (by design) for an RPM package to be tagged as being allowed to replace 
> files of another package.

How would rpm conventionally deal with the situation at hand here (a
file which was previously in xserver-xorg and is now in
xserver-xorg-module-exa)?

p.



