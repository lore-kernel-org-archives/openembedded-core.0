Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qr51E-0000C2-8p
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 11:24:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qr4wu-0004ot-6l
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 11:19:40 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 10:19:39 +0100
In-Reply-To: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
References: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312967980.6733.35.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: finding libgcc.a with meta-toolchain-sdk toolchain
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
X-List-Received-Date: Wed, 10 Aug 2011 09:24:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-09 at 23:20 -0500, Kumar Gala wrote:
> Trying to build something like u-boot w/the toolchain produced by meta-toolchain-sdk and get the following:
> 
> $ powerpc-poky-linux-gnuspe-ld -g -Ttext 0x40000 -o hello_world -e hello_world hello_world.o libstubs.o -L. -lgcc
> powerpc-poky-linux-gnuspe-ld: cannot find -lgcc
> 
>[...]
>
> What do we need to tweak so we can find libgcc.a?

The best/easiest fix is to link with gcc rather than calling ld
directly.  You can use -nostartfiles to suppress crt1.o and the like.
If you must invoke ld manually for whatever reason then you will have to
use something like `$(CC) --print-libgcc-file-name` to obtain the path
to libgcc.

p.




