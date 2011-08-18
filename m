Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QtyUh-0008NU-Cg
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:02:31 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QtyQ6-0000aB-CC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 10:57:46 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2011 09:57:45 +0100
In-Reply-To: <4E4CAE28.8050600@linux.intel.com>
References: <4E4CAE28.8050600@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313657866.6733.237.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH][RFC] cortexa8: use hard floating point
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
X-List-Received-Date: Thu, 18 Aug 2011 09:02:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-17 at 23:16 -0700, Darren Hart wrote:
> From what I could gather, it makes sense to address using mfloat-abi=hard
> for the beagleboard in the cortexa8 tune file. Before I submit this as a pull
> request, I'd appreciate a sanity check from the Beagleboard experts.
> 
>[...]
>
> mfloat-abi is currently set to soft for beagleboard (cortexa8) and needs to be
> set to hard to take advantage of the floating point hardware.

Have you benchmarked this change?  It isn't really true to say that hf
needs to be set to "take advantage" of the FP hardware; you will still
get most of the benefit of the VFP without it.  I would be surprised if
this made much of a difference on any real-world workload.

Changing -mfloat-abi is (obviously) an ABI change and is definitely not
the sort of thing to do capriciously.  If you apply the patch in its
current form then it will make cortexa8 binaries incompatible with
everything else by default, which is probably not going to be a good
thing.  I think this ought to be a DISTRO choice not a machine one.

p.




