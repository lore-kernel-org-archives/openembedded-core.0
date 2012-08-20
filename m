Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T3Sva-0008Tn-NE
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 16:26:02 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T3Sjy-0002jW-6y; Mon, 20 Aug 2012 16:14:02 +0200
Message-ID: <1345471925.24626.109.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Radu Moisan <radu.moisan@intel.com>
Date: Mon, 20 Aug 2012 15:12:05 +0100
In-Reply-To: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
References: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Mon, 20 Aug 2012 14:26:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-20 at 17:07 +0300, Radu Moisan wrote:
> Updated defconfig file from generated .config
> Disabled CONFIG_LSOF for backwards compatibility

There seem to be a lot of other defconfig changes (e.g. enabling RFKILL)
in your patch which aren't described here.

p.




