Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmQ77-00078L-EN
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 14:54:57 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmQ32-00035y-2J
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 14:50:44 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
	<e50edfa0e355ecfe38887adace64247e363150a8.1309883050.git.paul.eggleton@linux.intel.com>
	<613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
Date: Thu, 28 Jul 2011 13:50:37 +0100
Message-ID: <1311857437.3398.18.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layers
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
X-List-Received-Date: Thu, 28 Jul 2011 12:54:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 14:11 +0200, Koen Kooi wrote:
> 1) overlapping files like .gitignore breaks the script
> 2) git format-patch | git am is a lossy process, so you can't import oe-core and bitbake from scratch: 

Assuming I understand the intent correctly (which is by no means
certain), it sounds like maybe what you want for (2) is git-subtree.  I
agree that generating patches and piping them into git am sounds a bit
suboptimal for moving changesets from one place to another.

p.




