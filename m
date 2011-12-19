Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RcdJR-0008Uj-Fe
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 14:31:29 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RcdCf-0001np-3v
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 14:24:29 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
	<CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
Date: Mon, 19 Dec 2011 13:24:22 +0000
Message-ID: <1324301062.4492.10.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the compatible host list
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
X-List-Received-Date: Mon, 19 Dec 2011 13:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-19 at 10:32 +0000, Luo Zhenhua-B19537 wrote:
> Sure, if valgrind can work on x86, powerpc, arm, COMPATIBLE_HOST can be removed, I will post a v2 patch. 

That still leaves mips unsupported.  But I don't really have a problem
with removing COMPATIBLE_HOST anyway since it doesn't really add much
value for valgrind. 

p.




