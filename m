Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RGoah-00061Q-Vx
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 11:07:08 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RGoV4-00056E-B1
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 11:01:18 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 10:01:17 +0100
In-Reply-To: <4E9FD2B2.5000508@intel.com>
References: <66cdd5054e220fcce980222ed68a2afc37f614af.1318984111.git.nitin.a.kamble@intel.com>
	<35417d38f61615445ed0c4d875e0bd0aa5649af4.1318984111.git.nitin.a.kamble@intel.com>
	<4E9FD2B2.5000508@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1319101278.22985.258.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/6] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Thu, 20 Oct 2011 09:07:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 00:50 -0700, Saul Wold wrote:
> The example case I found was a coreutils package that was built prior to 
> this change failed to fulfill it's dependencies after this change when 
> creating an image.  If I rebuild coreutils with the newer gmp build, 
> then all is well, I think we need to understand this better before 
> making this change.
> 
> Did something else change in the packaging that would cause use to look 
> the mapping above?

If you've now got two DSOs in one output package (which it sounds like
you might have, since libgmpcxx was apparently added) then the autonamer
will be defeated.  They need to go in separate PACKAGES for that to work
out right.

p.




