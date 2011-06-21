Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ60j-0002aq-Jy for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:49:17 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZ5xJ-0002nK-Um
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:45:46 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4e9efffb9118e29178d087577c0cebb360872ebe.1308680000.git.anders@chargestorm.se>
References: <cover.1308680000.git.anders@chargestorm.se>
	<4e9efffb9118e29178d087577c0cebb360872ebe.1308680000.git.anders@chargestorm.se>
Date: Tue, 21 Jun 2011 19:45:38 +0100
Message-ID: <1308681938.3083.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC PATCH 3/5] linux-kernel-base: add support for Linux 3.x
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
X-List-Received-Date: Tue, 21 Jun 2011 18:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 20:18 +0200, Anders Darander wrote:
> Return 2.X as major version for kernels 2.X, and return
> X for kernels X.Y (X>=3).

I'm not quite sure I understand what this particular logic is useful
for.  If we're removing 2.4 support (which I'm fairly relaxed about)
then it seems as though this whole "kernel_majorversion" thing can and
should just go away.  

Or, alternatively, perhaps it should be mapped into a more abstract kind
of "kernel epoch" thing which treats 2.6 and 3.0 as basically the same.

p.




