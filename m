Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SoeB4-0006eY-80
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:24:46 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Soe0H-0004Ou-NF
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:13:37 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 18:13:36 +0100
In-Reply-To: <1341940070-27715-2-git-send-email-raj.khem@gmail.com>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1341940417.20265.92.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Tue, 10 Jul 2012 17:24:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 10:07 -0700, Khem Raj wrote:
> We shave too much from kernel sources for making it work
> for on device external kernel module development that cross
> development of external modules wont work from same tree
> anymore. This patch makes a copy of tree which will eventually
> be staged for building external modules

Why does cross development require more of the kernel tree than
on-device compilation?

p.




