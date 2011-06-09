Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUfl5-0006VG-U3 for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 15:58:51 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUfhu-00081I-Ic
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 15:55:34 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <76185F2A-C89D-4698-BA21-CC823343B1BE@dominion.thruhere.net>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
	<1307547318.15712.109.camel@rex>
	<1307618044.2529.4810.camel@phil-desktop>
	<1307618944.15712.150.camel@rex>
	<1307619798.2529.4844.camel@phil-desktop>
	<1307625339.15712.155.camel@rex>
	<76185F2A-C89D-4698-BA21-CC823343B1BE@dominion.thruhere.net>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 09 Jun 2011 14:55:31 +0100
Message-ID: <1307627731.2529.4865.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 09 Jun 2011 13:58:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 15:53 +0200, Koen Kooi wrote:
> Does cross localegen obey parallel make or does it only do a single locale at a time?

Just one at a time.  It's run out of Python code in libc-package, not by
make, so there is no completely straightforward way to get it to respect
PARALLEL_MAKE.  I guess you could teach libc-package how to generate a
makefile and then run it; that'd probably be the easiest way to
parallelize that particular process.

p.




