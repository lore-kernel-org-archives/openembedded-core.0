Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJ5s4-0007CN-O4
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 19:03:00 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJ5fY-0004BY-Ba; Tue, 02 Oct 2012 18:50:04 +0200
From: Phil Blundell <philb@gnu.org>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Date: Tue, 02 Oct 2012 17:50:03 +0100
In-Reply-To: <50659938.4060401@intel.com>
References: <1348485983-8294-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1348486253.31293.28.camel@phil-desktop> <506054A0.6090309@intel.com>
	<1348825951.32611.30.camel@phil-desktop> <50659938.4060401@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349196604.32611.95.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Tue, 02 Oct 2012 17:03:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 15:34 +0300, Andrei Dinu wrote:
> > Presumably it does at least pass the eglibc and binutils testsuites,
> > right?
> >
> Can u give me a location where i can find these test suites and how can 
> i run them?

They're included in the eglibc and binutils distributions.  I think Khem
posted a recipe for running the tests under qemu fairly recently, or you
could run them on the target directly.

p.




