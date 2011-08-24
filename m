Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QwB9I-0004FL-T5
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 12:57:32 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QwB4i-00061r-LU
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 12:52:49 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2011 11:52:47 +0100
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D724C949@shsmsx501.ccr.corp.intel.com>
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
	<0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C949@shsmsx501.ccr.corp.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314183168.19905.6.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 10:57:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 09:47 +0800, Xu, Dongxiao wrote:
> My understanding is that, if GCC is not configured with the ability of code space optimization, target recipes will not have code size benefit even if adding "-Os" option.

No, that's incorrect.  All that --enable-target-optspace does is change
the definition of CFLAGS_FOR_TARGET, which causes the GCC support
libraries (i.e. libgcc, libstdc++, etc) to be built with -Os rather than
-O2.  It has no effect on the functionality of the compiler itself.

p.




