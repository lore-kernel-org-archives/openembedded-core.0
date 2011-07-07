Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qeu4i-0005on-KN for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 21:17:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qeu11-0005wA-5W
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 21:13:35 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107072108.55974.schnitzeltony@gmx.de>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
	<fb8c0dba84b1b0d8c1ac548e0379f25f6c1439f3.1310059749.git.paul.eggleton@linux.intel.com>
	<201107072108.55974.schnitzeltony@gmx.de>
Date: Thu, 07 Jul 2011 20:13:27 +0100
Message-ID: <1310066007.18564.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/3] kernel.bbclass: prevent QA warning about kernel-module-lirc-dev
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
X-List-Received-Date: Thu, 07 Jul 2011 19:17:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 21:08 +0200, Andreas Mueller wrote:
> So I think a better solution is reworking commit 
> 2e06a1a843756e9d50291c4533b10096af2d852b e.g. by excluding all kernel *modules* 
> from *dev check. 

Yeah, or try to be smarter about determining what exactly is a "dev"
package, e.g. by some sort of flag variable rather than by trying to
guess from the name.

p.




