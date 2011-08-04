Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qp5sT-0005q1-KU
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:54:53 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qp5oG-0004t2-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:50:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <e4f4b9c5a4b28f252e30c4b92cdfc3c624bc22e5.1312469790.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<e4f4b9c5a4b28f252e30c4b92cdfc3c624bc22e5.1312469790.git.nitin.a.kamble@intel.com>
Date: Thu, 04 Aug 2011 22:50:24 +0100
Message-ID: <1312494624.3169.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 06/10] kernel, module-base.bbclass: fix KERNEL_LD & KERNEL_AR vars
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
X-List-Received-Date: Thu, 04 Aug 2011 21:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> KERNEL_LD was using ${LD} in it's definition, which is not correct for
> different ABIs such as x32 or i386 on x86_64 machine.
> 
> Same with KERNEL_AR var.

Why is ar an issue?  That doesn't have any unusual args, does it?

p.




