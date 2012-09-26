Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGpP9-0003BD-MO
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 13:03:47 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGpCl-0006NE-Jw; Wed, 26 Sep 2012 12:50:59 +0200
From: Phil Blundell <philb@gnu.org>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Wed, 26 Sep 2012 11:50:58 +0100
In-Reply-To: <20120926104608.GA23994@mi.fu-berlin.de>
References: <1348652719.31293.90.camel@phil-desktop>
	<20120926104608.GA23994@mi.fu-berlin.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348656659.31293.100.camel@phil-desktop>
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-cross: factor out --enable-threads argument into ${GCCTHREADS}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 11:03:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 12:46 +0200, Henning Heinold wrote:
> should that not be GCCTHREADS ?=
> 
> otherwise I do not see how it could be overwritten from outside.

Well, a .bbappend can do it (since EXTRA_OECONF isn't assigned :=) or
you can use an override GCCTHREADS_pn-gcc-cross = "no" for example.  But
yes, making it be ?= would be fine with me as well.

p.




