Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmNVH-0003yW-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:07:43 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmNRB-00030p-V7
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:03:30 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 11:03:29 +0100
In-Reply-To: <6951D3EE-AC7D-402B-8620-378FC5500651@dominion.thruhere.net>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E30FD0C.7040503@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B1A8AF9A65@shsmsx502.ccr.corp.intel.com>
	<201107280947.42048.paul.eggleton@linux.intel.com>
	<6A2BE4E7-D30E-4BE1-8EAC-4200EC3A48A5@dominion.thruhere.net>
	<1311844802.30326.407.camel@phil-desktop>
	<6951D3EE-AC7D-402B-8620-378FC5500651@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311847409.30326.424.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 10:07:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 12:00 +0200, Koen Kooi wrote:
> Removing the PACKAGE_EXTRA_ARCHS line from bitbake.conf makes it work for me again, is that an acceptable solution?

Sounds about right to me.  If ${TARGET_ARCH} really does need to go into
PACKAGE_EXTRA_ARCHS by default (which sounds implausible to me) then
we'll have to find some other way to achieve that.

p.




