Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sura9-0007AO-R2
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 22:56:21 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1SurP1-0000T9-Em; Fri, 27 Jul 2012 22:44:51 +0200
Message-ID: <1343421786.4470.84.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Date: Fri, 27 Jul 2012 21:43:06 +0100
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C27A73D@DFLE30.ent.ti.com>
References: <1343418723-28606-1-git-send-email-fcooper@ti.com>
	<1343419294.4470.82.camel@x121e.pbcl.net>
	<8F29D6B095ED194EA1980491A5E029710C27A73D@DFLE30.ent.ti.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Add inetd related files
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
X-List-Received-Date: Fri, 27 Jul 2012 20:56:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 20:26 +0000, Cooper Jr., Franklin wrote:
> The section you mentioned is within the file inetd which I am adding to the SRC_URI list in the busybox_1.19.4.bb file. The variable ${sbindir} won't be expanded. 

Right, so you need to arrange for it to get expanded.  If you hardcode
the path, the script will just fail unless ${sbindir} happens to be set
to /usr/sbin.

p.




