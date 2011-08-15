Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QszWm-0005AV-Fy
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 17:56:36 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1QszSM-0004x2-9u; Mon, 15 Aug 2011 17:52:02 +0200
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 16:52:01 +0100
In-Reply-To: <201108151649.40904.paul.eggleton@linux.intel.com>
References: <201108142050.37352.paul.eggleton@linux.intel.com>
	<1313420625.6733.182.camel@phil-desktop>
	<201108151649.40904.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313423522.6733.185.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Machine specific sysroot issue
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
X-List-Received-Date: Mon, 15 Aug 2011 15:56:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 16:49 +0100, Paul Eggleton wrote:
> Actually it's just include.pro - everything else gets copied to the sysroot 
> for the new machine just fine.
> 
> I've sort of figured this out. include.pro is getting installed to the sysroot  
> and not ${D} in do_install (and it's the only file handled this way). 

Oh right.  Yeah, libopie2 certainly shouldn't be doing that.  Any sort
of direct poking at the sysroot is basically a bad idea nowadays, and if
include.pro is an important file then presumably you want it in the -dev
package anyway.

p.




