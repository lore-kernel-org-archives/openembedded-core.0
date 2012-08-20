Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T3OXf-0002dJ-Me
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:45:03 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T3OM3-0002VT-J5; Mon, 20 Aug 2012 11:33:03 +0200
Message-ID: <1345455067.24626.85.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Radu Moisan <radu.moisan@intel.com>
Date: Mon, 20 Aug 2012 10:31:07 +0100
In-Reply-To: <50320338.8090203@intel.com>
References: <1345448771-4656-1-git-send-email-radu.moisan@intel.com>
	<8627395.gapg0V4nHB@helios> <1345451321.24626.77.camel@x121e.pbcl.net>
	<1754598.kxQRJyreg5@helios> <50320338.8090203@intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 09:45:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-20 at 12:28 +0300, Radu Moisan wrote:
> Any suggestions on how to do that?

"vi defconfig", then add 

# CONFIG_LSOF is not set

at some appropriate place.

Alternatively, bitbake -c menuconfig busybox, make sure lsof is
disabled, then copy the resulting .config file back into defconfig.

p.




