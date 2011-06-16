Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QXDdN-0006bR-OX for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 16:33:25 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QXDa4-0006bT-7c
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 16:30:00 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DFA0824.5030809@gmail.com>
References: <1308219330.25285.4194.camel@phil-desktop>
	<4DFA0824.5030809@gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 16 Jun 2011 15:29:58 +0100
Message-ID: <1308234598.25285.4740.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: eglibc testing?
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
X-List-Received-Date: Thu, 16 Jun 2011 14:33:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-16 at 06:41 -0700, Khem Raj wrote:
> I nfsmount eglibc builddir on target and run the testsuite. I see aroung 
> 10-15 fails. Havent run the testsuite in a while

Maybe the right thing to do with eglibc would be to build a rootfs
containing the testsuite, run it up in qemu-system-arm, and then
engineer some IPC mechanism to get the test results back to the host.
That way you would at least be testing something close to the real
target kernel, rather than the qemu syscall emulation which I suspect is
to blame for some of my failures.

For gcc it'd probably be fine to just run the individual tests under
qemu directly since they don't tend to have a lot of OS dependency.

p.




