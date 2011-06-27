Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbIg7-0003fP-0v for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 22:45:07 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbIca-0000DO-Of
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 22:41:28 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimbUn+g6wsnH6661GWT3kbg_WxTLw@mail.gmail.com>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
	<1309167774.21613.264.camel@phil-desktop>
	<8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
	<1309170035.21613.289.camel@phil-desktop>
	<BANLkTimbUn+g6wsnH6661GWT3kbg_WxTLw@mail.gmail.com>
Date: Mon, 27 Jun 2011 21:41:22 +0100
Message-ID: <1309207282.3035.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 20:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 13:15 -0700, Khem Raj wrote:
> you need to include gcc-package-cross.inc using
> 
> require gcc-package-cross.inc
> 
> in the newly added gcc-cross-kernel_csl-arm-2007q3.bb
> and all should be set.

That'll cause it to install "gcc" into the sysroot though, right?  I
guess you could use a do_install_append to blow it away again, maybe
that wouldn't be so awful.

p.




