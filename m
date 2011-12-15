Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RbBCj-0002AE-S6
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 14:18:33 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RbB62-0004WQ-8s
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 14:11:38 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 13:11:37 +0000
In-Reply-To: <1323954515-15604-1-git-send-email-otavio@ossystems.com.br>
References: <1323954515-15604-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323954698.24417.211.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] dropbear: bump epoch to fix upgrade path in meta-oe
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
X-List-Received-Date: Thu, 15 Dec 2011 13:18:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-15 at 13:08 +0000, Otavio Salvador wrote:
> There was a 'dropbear-systemd' binary package on meta-oe versioned as
> 'v1' and it has been merged on dropbear's bbappend; to fix the upgrade
> path for the dropbear-systemd package on meta-oe we need to bump epoch
> and to avoid messing it up this needs to go into OE-Core.

If it's just a single output binary at issue then setting PKGE for that
one package would be less disruptive.  I must admit I don't fully
understand why this needs to be in oe-core at all though: what exactly
is the "messing up" that would happen otherwise?

p.




