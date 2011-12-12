Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RaAbg-0002si-KV
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 19:28:08 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RaAV2-0000Ew-1n
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 19:21:16 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2011 18:21:15 +0000
In-Reply-To: <CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
References: <1323477267.5309.206.camel@ted>
	<CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323714076.24417.100.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
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
X-List-Received-Date: Mon, 12 Dec 2011 18:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-10 at 15:28 -0800, Khem Raj wrote:
> in base.bbclass oe_runmake says
> 
> ${MAKE} ${EXTRA_OEMAKE} "$@"
> 
> and
> 
> conf/bitbake.conf says
> 
> EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
> 
> hmmm so we dont parallel make if task is not called do_compile ?

Indeed.  It's been that way basically forever; I think this was to avoid
a class of problems caused by trying to run "make install" with -j.  

It's possible that the general situation has improved a bit since that
code was written and it might be interesting to try enabling it for
install as well and see what happens.

p.




